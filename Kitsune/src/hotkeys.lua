function initializeHotkeys()
	node=NDB.newMemNodeDatabase()
	node.nome = "Rolagem";
	node.dados = 1;
	node.mod = 0;
	node.sorte = 0;
	node.desejo = 0;
	node.vantagem = 0;
	node.falhasOponente = 0;
	NDB.createChildNode(node, "buffs");
	return node;
end

function editActionRoll(node, dados, mod, sorte, buffs, msg)
	node.nome = msg;
	node.dados = dados;
	node.mod = mod;
	node.sorte = sorte;
	node.buffs = buffs;
end

function customRoll( sheet )

	if(sheet == nil) then
		sheet = initializeHotkeys();
	end

	if(sheet.dados == nil)then
		sheet.dados = 1;
	end

	local modNumber = tonumber(sheet.mod);
	if(modNumber ~= nil)then		
		if(modNumber > 0)then
			mod = "+"..modNumber;
		elseif(modNumber < 0)then
			mod = modNumber;
		else
			mod = "";
		end
	end

	rolagem = sheet.dados .. "D100" .. mod;

	vantagem = sheet.vantagem;
	if(sheet.buffs ~= nil) then
		listaBuffs = NDB.getChildNodes(sheet.buffs);
		if(listaBuffs ~= nil) then
			for key, buff in pairs(listaBuffs) do
				if(buff ~= nil and buff.ativo == true) then
					if(buff.formula ~= nil) then
						rolagem = concatanateRollsToText(rolagem, buff.formula)				
					end
					if(buff.vantagem ~= nil and buff.vantagem > 0) then
						vantagem = vantagem + buff.vantagem;					
					end
				end
			end
		end
	end
	mesa = getMesa(sheet);
	rollTeste2(rolagem, sheet.sorte, vantagem, sheet.desejo, sheet.falhasOponente, mesa,sheet.objetivo, sheet.nome);	
end

function isValidRoll( rolagem )
	local rolagemCheck = Firecast.interpretarRolagem(rolagem);
	return #rolagemCheck.ops > 0;
end

function concatanateRollsToText( rolagem1, rolagem2 )
	local roll1 = Firecast.interpretarRolagem(rolagem1);
	local roll2 = Firecast.interpretarRolagem(rolagem2);

	msg = ""
	if(#roll1.ops > 0) then
		msg = getRollText(roll1)
	end
	if(#roll2.ops > 0) then
		if (#roll1.ops > 0) then
			msg = msg .. " ";
			if (roll2.ops[1].tipo == "dado") then
				msg = msg .. "+"
			end
		end
		msg = msg .. getRollText(roll2)
	end
	return msg;
end

function getRollText( rolagem )
	local msg = "";
	for i = 1, #rolagem.ops, 1 do  
        local operacao = rolagem.ops[i];      
        -- Vamos verificar que tipo de operação é esta.      
        if operacao.tipo == "dado" then        
            msg = msg .. operacao.quantidade .. "d" .. operacao.face; 
        elseif operacao.tipo == "imediato" and i == 1 then
        	msg = msg .. "+" .. operacao.valor;
        elseif operacao.tipo == "imediato" then
        	msg = msg .. operacao.valor;
        elseif operacao.tipo == "subtracao" then
            msg = msg .. "-";
         elseif operacao.tipo == "soma" then
            msg = msg .. "+";
        end;
	end; 
	return msg;
end