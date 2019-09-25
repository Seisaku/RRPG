function initializeHotkeys()
	node=ndb.newMemNodeDatabase()
	node.nome = "Rolagem";

	node.dados = 1;
	node.mod = 0;
	node.sorte = 0;
	node.desejoUso = 0;
	node.desejoAtual = 999;
	node.vantagem = 0;
	node.falhasOponente = 0;

	NDB.createChildNode(node, "falhas");
	node.falhas.oponente = 0;

	return node;
end

function customRoll( sheet )
	rolagem = sheet.dados .. "D100+" .. sheet.mod;
	rollTeste(sheet, rolagem, sheet.sorte, sheet.nome)
end