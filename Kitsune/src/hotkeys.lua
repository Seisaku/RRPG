function initializeHotkeys()
	node=NDB.newMemNodeDatabase()
	node.nome = "Rolagem";
	node.dados = 1;
	node.mod = 0;
	node.sorte = 0;
	node.desejo = 0;
	node.vantagem = 0;
	node.falhasOponente = 0;
	return node;
end

function editActionRoll(node, dados, mod, sorte, msg)
	node.nome = msg;
	node.dados = dados;
	node.mod = mod;
	node.sorte = sorte;
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
	mesa = getMesa(sheet);
	rollTeste2(rolagem, sheet.sorte, sheet.vantagem, sheet.desejo, sheet.falhasOponente, mesa,sheet.objetivo, sheet.nome);	
end