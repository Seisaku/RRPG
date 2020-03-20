
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
	NDB.createChildNode(node, "personagemroll");
	return node;
end

function editActionRoll(node, dados, mod, sorte, buffs, personagem, msg)
	node.nome = msg;
	node.dados = dados;
	node.mod = mod;
	node.sorte = sorte;
	NDB.copy(node.personagemroll, personagem)
	localmesa = getMesa(personagem);
	if(localmesa ~= nil) then
		globalmesa = localmesa;
	end
	if(buffs ~= nil) then
		listaBuffs = NDB.getChildNodes(buffs);
		if(listaBuffs ~= nil) then
			for _, buff in pairs(listaBuffs) do
				if(buff ~= nil and buff.ativo == true and (buff.formula ~= nil or buff.vantagem ~= nil) and buff.nome ~= nil) then
					nBuff = NDB.createChildNode(node.buffs, buff.nome);
					nBuff.ativo = buff.ativo
					nBuff.nome = buff.nome
					nBuff.formula = buff.formula
					nBuff.vantagem = buff.vantagem	
				end
			end
		end
	end
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
	nome = sheet.nome;
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
					if(buff.nome ~= nil) then
						nome = nome .. " + " .. buff.nome
					end
				end
			end
		end
	end
	mesa = getMesa(sheet);
	rollTestePersonagem(rolagem, sheet.sorte, vantagem, sheet.desejo, sheet.falhasOponente, mesa,sheet.objetivo, nome, sheet.personagemroll);	
end

