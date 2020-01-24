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

	if(sheet.buffs ~= nil) then
		listaBuffs = NDB.getChildNodes(sheet.buffs);
		if(listaBuffs ~= nil) then
			for key, buff in pairs(listaBuffs) do
				if(buff ~= nil and buff.ativo == true) then
					rolagem = rolagem .. "+" .. buff.formula;					
				end
			end
		end
	end

	mesaPrintMessage(rolagem)

	mesa = getMesa(sheet);
	rollTeste2(rolagem, sheet.sorte, sheet.vantagem, sheet.desejo, sheet.falhasOponente, mesa,sheet.objetivo, sheet.nome);	
end