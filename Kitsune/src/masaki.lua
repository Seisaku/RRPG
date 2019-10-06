require("ndb.lua");

function initialize( sheet )
	if(sheet.atributos==nil) then
		local tr1 = NDB.newTransaction(sheet);
		NDB.createChildNode(sheet, "atributos");
		sheet.atributos.ataque=1;
		sheet.atributos.ataqueMod=0;
		sheet.atributos.defesa=1;
		sheet.atributos.defesaMod=0;
		sheet.atributos.agilidade=1;
		sheet.atributos.agilidadeMod=0;
		sheet.atributos.sorte=1;
		sheet.atributos.sorteMod=0;
		sheet.atributos.magia=1;
		sheet.atributos.magiaMod=0;
		sheet.atributos.resistenciaMagica=1;
		sheet.atributos.recurso=1;
		sheet.atributos.recursoMod=20;
		sheet.atributos.vida=1;
		sheet.atributos.vidaMod=200;
		sheet.nivel=1;
		sheet.raca = 'Hu';
		sheet.classe = 'Barbaro';		
		sheet.experienciaAtual = 1;
		sheet.proximoNivel = 10;
		sheet.PercepcaoPassiva = 50;
		sheet.Deslocamento  = 9;

		NDB.createChildNode(sheet, "pericias");
		sheet.pericias.Atletismo=0;
		sheet.pericias.Acrobacia=0;
		sheet.pericias.Arcanismo=0;
		sheet.pericias.Historia=0;
		sheet.pericias.Investigacao=0;
		sheet.pericias.Natureza=0;
		sheet.pericias.Religiao=0;
		sheet.pericias.AdestrarAnimais=0;
		sheet.pericias.Medicina=0;
		sheet.pericias.Atuacao=0;
		sheet.pericias.Sobrevivencia=0;
		sheet.pericias.Percepcao=0;
		sheet.pericias.Furtividade=0;
		sheet.pericias.Prestidigitacao=0;
		sheet.pericias.Intuicao=0;
		sheet.pericias.Intimidacao=0;
		sheet.pericias.Persuasao=0;
		sheet.pericias.Enganacao=0;

		NDB.createChildNode(sheet.pericias, "Combate");
		
		sheet.pericias.Combate.Armaduras=0;
		sheet.pericias.Combate.Escudos=0;
		sheet.pericias.Combate.Desarmado=0;
		sheet.pericias.Combate.Espadas=0;
		sheet.pericias.Combate.Adagas=0;
		sheet.pericias.Combate.Machados=0;
		sheet.pericias.Combate.Martelos=0;
		sheet.pericias.Combate.Macas=0;
		sheet.pericias.Combate.Compassos=0;
		sheet.pericias.Combate.EspadasGrandes=0;
		sheet.pericias.Combate.Katanas=0;
		sheet.pericias.Combate.EspadasNinja=0;
		sheet.pericias.Combate.Lancas=0;
		sheet.pericias.Combate.Postes=0;
		sheet.pericias.Combate.Cajados=0;
		sheet.pericias.Combate.Bordoes=0;
		sheet.pericias.Combate.Arcos=0;
		sheet.pericias.Combate.Bestas=0;
		sheet.pericias.Combate.Rifles=0;
		sheet.pericias.Combate.Explosivos=0;

		NDB.createChildNode(sheet.pericias, "Ferramentas");
		sheet.pericias.Ferramentas.Navegacao=0;
		sheet.pericias.Ferramentas.Ladrao=0;
		sheet.pericias.Ferramentas.Instrumentos=0;
		sheet.pericias.Ferramentas.Disfarce=0;
		sheet.pericias.Ferramentas.Falsificacao=0;
		sheet.pericias.Ferramentas.Jogos=0;
		sheet.pericias.Ferramentas.Venenos=0;
		sheet.pericias.Ferramentas.Montarias=0;

		NDB.createChildNode(sheet.pericias, "Resistencias");
		sheet.pericias.Resistencias.Tudo=0;

		NDB.createChildNode(sheet, "equipamento");
		sheet.equipamento.ataqueEquipBonus = 0;
		sheet.equipamento.defesaEquipBonus = 0;

		NDB.createChildNode(sheet, "tendencia");
		sheet.tendencia.moralidade = 0;
		sheet.tendencia.lealdade = 0;


		sheet.desejoUso = 0;
		sheet.desejoAtual = 0;
		sheet.desejoMax = 0;

		NDB.createChildNode(sheet, "falhas");
		sheet.falhas.oponente = 0;

		NDB.pushTransaction(sheet, tr1);
	end
end

function getNodeFromPath(path, sheet)
	
	if(NDB.isNodeObject(sheet)) then
		local mesa = Firecast.getMesaDe(sheet);
		local campoP = string.gmatch(path ,"[%a,%d]+");
		countC = 0;
		listaC = {}
		for c in campoP do
			countC = countC +1;
			table.insert(listaC,countC,c);
		end
		nodeIndex = 1;
		field = listaC["nodeIndex"];
		local activeNode = NDB.getRoot(sheet);
		while (nodeIndex < countC) do
			activeNode = nodeContainsField(activeNode, field)
			if(activeNode == nil) then
				return
			end
			nodeIndex = nodeIndex+1;
			field = listaC["nodeIndex"];
		end
		atributos = NDB.getAttributes(activeNode)
		mesa.activeChat:enviarMensagem(field.."="..atributos["field"]);
		atributos["field"] = "testFind";
	else
		return nil;
	end
end

function nodeContainsField(node, field)
	if(NDB.isNodeObject(node)) then
		local mesa = Firecast.getMesaDe(node);
		childrenNodes = NDB.getChildNodes(node);
		for key, child in pairs(childrenNodes) do
			if(NDB.getNodeName(child) == field) then
				return child
			end			
		end
	end
end

function getProficiencia(sheet)
	updateBase(sheet);
	return sheet.proficiencia;
end

function rolarAtaque(sheet)
	local mesa = Firecast.getMesaDe(sheet);	
	if (sheet.atributos.ataqueFormula ~= nil) then
		rollTeste(sheet, sheet.atributos.ataqueFormula, sheet.atributos.sorte, "Ataque");
	end
end

function rolarDefesa(sheet)
	local mesa = Firecast.getMesaDe(sheet);	
	if (sheet.atributos.defesaFormula ~= nil) then
		rollTeste(sheet, sheet.atributos.defesaFormula, sheet.atributos.sorte, "Defesa");
	end
end

function rolarIniciativa(sheet)
	local mesa = Firecast.getMesaDe(sheet);	
	rollTeste(sheet, "1d100", 0, "Iniciativa");
end

function rolarAgilidade(sheet)
	local mesa = Firecast.getMesaDe(sheet);	
	if (sheet.atributos.iniciativaFormula ~= nil) then
		rollTeste(sheet, sheet.atributos.iniciativaFormula, sheet.atributos.sorte, "Agilidade");
	end
end

function rolarSorte(sheet)
	local mesa = Firecast.getMesaDe(sheet);	
	if (sheet.atributos.iniciativaFormula ~= nil) then
		sorteFormula =  sheet.atributos.Sorte .. "D100"
		if(sheet.atributos.sorteMod == nil) then
			sheet.atributos.sorteMod = 0
		end
		if(sheet.atributos.sorteMod > 0) then
			sorteFormula = sorteFormula .. "+" .. sheet.atributos.sorteMod;
		elseif(sheet.atributos.sorteMod < 0) then
			sorteFormula = sorteFormula .. sheet.atributos.sorteMod;
		end
		rollTeste(sheet, sorteFormula , sheet.atributos.sorte, "Sorte");
	end
end

function rolarMagia(sheet)
	local mesa = Firecast.getMesaDe(sheet);	
	if (sheet.atributos.ataqueFormula ~= nil) then
		rollTeste(sheet, sheet.atributos.magiaFormula, sheet.atributos.sorte, "Magia");
	end
end

function rolarVida(sheet)
	local mesa = Firecast.getMesaDe(sheet);	
	if (sheet.atributos.ataqueFormula ~= nil) then
		rollTeste(sheet, sheet.atributos.vidaFormula, sheet.atributos.sorte, "Vida");
	end
end

function rolarResistenciaMagica(sheet)
	local mesa = Firecast.getMesaDe(sheet);	
	if (sheet.atributos.resistenciaMagicaFormula ~= nil) then
		rollTeste(sheet, sheet.atributos.resistenciaMagicaFormula, sheet.atributos.sorte, "Resistência Mágica");		
	end
end



function ataqueComArma(arma)
	armas = NDB.getParent(arma);
	equipamento = NDB.getParent(armas);
	personagem = NDB.getParent(equipamento);
	if(personagem.atributos.ataque == nil) then
		personagem.atributos.ataque = 1;
	end
	formula = personagem.atributos.ataque .. "D100";
	if(personagem.atributos.ataqueMod == nil) then
		personagem.atributos.ataqueMod = 0;
	end
	bonus = personagem.atributos.ataqueMod;
	if(arma.bonus == nil) then
		arma.bonus = 0;
	end
	bonus = bonus + arma.bonus;
	if(arma.proficiente == nil) then
		arma.proficiente = false;
	end
	if(arma.proficiente) then
		 bonus = bonus + personagem.proficiencia;					
	end
	if(bonus > 0) then
		formula = formula .. " +" .. bonus;
	end
	msg = "Ataque";
	if(arma.nome ~= nil) then
		msg = msg .. ": " .. arma.nome;
	end

	rollTeste(personagem, formula, personagem.atributos.sorte, msg);
end

function expTable(nivel)
	if nivel <= 1 then
		return 0;
	else
		return expTable(nivel-1) + ((nivel-1) * 10);
	end
end

function updateBase(sheet)
	updateNivel(sheet);
	updateProficiencia(sheet);
	updateDesejo(sheet);
	updateExperiencia(sheet);
end

function updateNivel(sheet)
	if (sheet.nivel == nil) then
		sheet.nivel = 1;
	end	
end

function updateProficiencia(sheet)
	sheet.proficiencia = sheet.nivel;
end



function updateExperiencia(sheet)
	if(sheet.experienciaAtual==nil) then
		sheet.experienciaAtual = 0;
	end
	sheet.proximoNivel = expTable(sheet.nivel+1);
	sheet.experienciaAtualxProx = sheet.experienciaAtual .. "|" .. sheet.proximoNivel
end

function setExpPopup(sheet)
	sheet.experienciaOp =  sheet.experienciaAtual;
end

function expChange(sheet)
	if(sheet.experienciaOp~=nil) then
		if (string.find(sheet.experienciaOp, "+")==1) then
			gainedExp = string.gsub(sheet.experienciaOp, "%+", "");				
			op = tonumber(gainedExp);
			if(op ~= nil) then
				sheet.experienciaAtual = sheet.experienciaAtual + op;
			end
		else
			op = tonumber(sheet.experienciaOp);
			if(op ~= nil) then
				sheet.experienciaAtual = op;
			end
		end		
		if(sheet.experienciaAtual >= sheet.proximoNivel) then
			sheet.nivel=sheet.nivel+1;
			showMessage("Você subui para o nível " .. sheet.nivel);
			updateBase(sheet);
		end
	end	
end

function setVidaPopup(sheet)
	sheet.vidaOp =  sheet.atributos.vidaAtual;
end

function changeBarraVida(sheet)
	jogador = Firecast.getCurrentUser();
	if(jogador~=nil) then
		errorMsg = "Operação Barra Vida Inválida (tonumber)";
		if(string.find(sheet.vidaOp, "+")==1) then
			gainedLife = string.gsub(sheet.vidaOp, "%+", "");
			HPup = tonumber(gainedLife);
			if(HPup ~= nil) then
				sheet.atributos.vidaAtual = sheet.atributos.vidaAtual + HPup;			
			else
				showMessage(errorMsg);
			end
		elseif(string.find(sheet.vidaOp, "-")==1) then
			lostLife = string.gsub(sheet.vidaOp, "%-", "");
			HPdown = tonumber(lostLife);
			if(HPdown ~= nil) then
				sheet.atributos.vidaAtual = sheet.atributos.vidaAtual - HPdown;
			else
				showMessage(errorMsg);
			end
		else
			HPnew = tonumber(sheet.vidaOp);
			if(HPnew ~= nil) then
				sheet.atributos.vidaAtual = HPnew;
			else
				showMessage(errorMsg);
			end
		end
		
		updateVida(sheet);
	end
end

function updateVida(sheet)
	if(sheet.atributos~=nil) then
		if(sheet.atributos.vida==nil) then
			sheet.atributos.vida=1;
		end
		if(sheet.atributos.vidaMod==nil) then
			sheet.atributos.vidaMod=200;
		end
		sheet.atributos.vidaMax=sheet.atributos.vidaMod*sheet.atributos.vida
		if(sheet.atributos.vidaAtual==nil) then
			sheet.atributos.vidaAtual=sheet.atributos.vidaMax;
		end
		sheet.atributos.vidaAtualxTotal=sheet.atributos.vidaAtual .. "|" .. sheet.atributos.vidaMax;
		sheet.atributos.vidaFormula = sheet.atributos.vida .. "D100";
		syncVidaToBar(sheet);
	end
end

function syncVidaToBar( sheet )
	jogador, personagem = getJogadorfromSheet(sheet);
	if(jogador~=nil) then
		jogador:requestSetBarValue(1, sheet.atributos.vidaAtual, sheet.atributos.vidaMax);
	end
end

function syncVida( sheet )
	jogador, personagem = getJogadorfromSheet(sheet);
	if(jogador~=nil) then
		local atual, maximo, percent = jogador:getBarValue(1);
		sheet.atributos.vidaAtual = atual;
	end
end

function setRecursoPopup(sheet)
	sheet.recursoOp =  sheet.atributos.recursoAtual;
end

function changeBarraRecurso(sheet)
	jogador = Firecast.getCurrentUser();
	if(jogador~=nil) then
		errorMsg = "Operação Barra Recurso Inválida (tonumber)";
		if(string.find(sheet.recursoOp, "+")==1) then
			gainedMP = string.gsub(sheet.recursoOp, "%+", "");
			MPup = tonumber(gainedMP);
			if(MPup ~= nil) then
				sheet.atributos.recursoAtual = sheet.atributos.recursoAtual + MPup;			
			else
				showMessage(errorMsg);
			end
		elseif(string.find(sheet.recursoOp, "-")==1) then
			lostMP = string.gsub(sheet.recursoOp, "%-", "");
			MPdown = tonumber(lostMP);
			if(MPdown ~= nil) then
				sheet.atributos.recursoAtual = sheet.atributos.recursoAtual - MPdown;
			else
				showMessage(errorMsg);
			end
		else
			MPnew = tonumber(sheet.recursoOp);
			if(HPnew ~= nil) then
				sheet.atributos.recursoAtual = MPnew;
			else
				showMessage(errorMsg);
			end
		end
		updateRecurso(sheet);
	end
end

function updateRecurso(sheet)
	if(sheet.atributos~=nil) then
		if(sheet.atributos.recurso==nil) then
			sheet.atributos.recurso=1;
		end
		if(sheet.atributos.recursoMod==nil) then
			sheet.atributos.recursoMod=20;
		end
		sheet.atributos.recursoMax=sheet.atributos.recursoMod*sheet.atributos.recurso;
		if(sheet.atributos.recursoAtual==nil) then
			sheet.atributos.recursoAtual=sheet.atributos.recursoMax;
		end
		sheet.atributos.recursoAtualxTotal=sheet.atributos.recursoAtual .. "|" .. sheet.atributos.recursoMax;
		syncRecursoToBar(sheet);
	end
end

function syncRecursoToBar( sheet )
	jogador, personagem = getJogadorfromSheet(sheet);
	if(jogador~=nil) then
		jogador:requestSetBarValue(2, sheet.atributos.recursoAtual, sheet.atributos.recursoMax);
	end
end

function syncRecurso( sheet )
	jogador, personagem = getJogadorfromSheet(sheet);
	if(jogador~=nil) then
		local atual, maximo, percent = jogador:getBarValue(2);
		sheet.atributos.recursoAtual = atual;
	end
end

function setDesejoPopup(sheet)
	sheet.desejoOp =  sheet.desejoAtual;
end

function changeBarraDesejo(sheet)
	jogador = Firecast.getCurrentUser();
	if(jogador~=nil) then
		errorMsg = "Operação Barra Desejo Inválida (tonumber)";
		if(string.find(sheet.desejoOp, "+")==1) then
			gainedWish = string.gsub(sheet.desejoOp, "%+", "");
			Wishup = tonumber(gainedWish);
			if(Wishup ~= nil) then
				sheet.desejoAtual = sheet.desejoAtual + Wishup;
			else
				showMessage(errorMsg);
			end
		elseif(string.find(sheet.desejoOp, "-")==1) then
			lostWish = string.gsub(sheet.desejoOp, "%-", "");
			Wishdown = tonumber(lostWish);
			if(Wishdown ~= nil) then
				sheet.desejoAtual = sheet.desejoAtual - Wishdown;
			else
				showMessage(errorMsg);
			end
		else
			Wishnew = tonumber(sheet.desejoOp);
			if(Wishnew ~= nil) then
				sheet.desejoAtual = Wishnew;
			else
				showMessage(errorMsg);
			end
		end
		updateDesejo(sheet);
	end
end

function updateDesejo(sheet)
	sheet.desejoMax = sheet.nivel;
	if(sheet.desejoAtual==nil) then
		sheet.desejoAtual=sheet.desejoMax;
	end	
	sheet.desejoMsg=sheet.desejoAtual .. "|" .. sheet.desejoMax
	syncDesejoToBar(sheet);
end

function syncDesejo( sheet )
	jogador, personagem = getJogadorfromSheet(sheet);
	if(jogador~=nil) then
		local atual, maximo, percent = jogador:getBarValue(3);
		sheet.desejoAtual = atual;
	end
end

function syncDesejoToBar( sheet )
	jogador, personagem = getJogadorfromSheet(sheet);
	if(jogador~=nil) then
		jogador:requestSetBarValue(3, sheet.desejoAtual, sheet.desejoMax);	
	end
end

function getJogadorfromSheet( sheet )
	personagem = Firecast.getBibliotecaItemDe(sheet);
	if(personagem~=nil) then
		jogador = personagem.dono;
		return jogador, personagem;
	else
		return nil, nil;
	end
end




function updateBonus(sheet)
	if(sheet~=nil) then
		local mesa = Firecast.getMesaDe(sheet);	
		
		armas = NDB.getParent(sheet);
		equipamento = NDB.getParent(armas);
		personagem = NDB.getParent(equipamento);
		
		listaArmas = NDB.getChildNodes(armas);
		totalBonus = 0;
		for key, arma in pairs(listaArmas) do		
			if (arma.equipado) then
				if(arma.bonus == nil) then
					arma.bonus = 0;
				end
				if(arma.proficiente == nil) then
					arma.proficiente = false;
				end
				if(arma.proficiente) then
					totalBonus = totalBonus + arma.bonus + personagem.proficiencia;				
				else
					totalBonus = totalBonus + arma.bonus;
				end
			end		
		end
		if (NDB.getNodeName(armas) == "armas") then
			equipamento.ataqueEquipBonus = totalBonus;		
			updateAtaque(personagem);
		else
			equipamento.defesaEquipBonus = totalBonus;			
			updateDefesa(personagem);
		end
	end
end

function updateAtaque(sheet)
	if(sheet.atributos ~= nil) then
		local ataque = tonumber(sheet.atributos.ataque);
		local ataqueBase = "0D100";
		if (ataque ~= nil) then
			ataqueBase = ataque .. "D100";
		end
		if(sheet.atributos.ataqueMod == nil) then 
			sheet.atributos.ataqueMod = 0;
		end
		bonus = sheet.atributos.ataqueMod;
		if(sheet.equipamento==nil) then
			NDB.createChildNode(sheet, "equipamento");
		end
		if(sheet.equipamento.ataqueEquipBonus==nil) then
			sheet.equipamento.ataqueEquipBonus = 0;
		end
		bonus = bonus + sheet.equipamento.ataqueEquipBonus;
		if(bonus ~= 0) then
			if(bonus>=0) then
				sheet.atributos.ataqueFormula = ataqueBase .. "+" .. bonus;
			else
				sheet.atributos.ataqueFormula = ataqueBase .. "-" .. bonus;
			end
		else
			sheet.atributos.ataqueFormula = ataqueBase;		
		end
	end
end

function updateDefesa(sheet)
	if(sheet.atributos ~= nil) then
		local defesa = tonumber(sheet.atributos.defesa);
		local defesaBase = "0D100";
		if (defesa ~= nil) then
			defesaBase = defesa .. "D100";
		end
		if(sheet.atributos.defesaMod == nil) then 
			sheet.atributos.defesaMod = 0;
		end
		bonus = sheet.atributos.defesaMod;
		if(sheet.equipamento==nil) then
			NDB.createChildNode(sheet, "equipamento");
		end
		if(sheet.equipamento.defesaEquipBonus==nil) then
			sheet.equipamento.defesaEquipBonus = 0;
		end
		bonus = bonus + sheet.equipamento.defesaEquipBonus;
		if(bonus ~= 0) then
			if(bonus>=0) then
				sheet.atributos.defesaFormula = defesaBase .. "+" .. bonus;
			else
				sheet.atributos.defesaFormula = defesaBase .. "-" .. bonus;
			end
		else
			sheet.atributos.defesaFormula = defesaBase;		
		end
	end
end



function updateSorte(sheet)
	if(sheet.atributos ~= nil) then
		if (sheet.atributos.sorte<=1) then
			sheet.atributos.critRange="100";
		else
			sheet.atributos.critRange=(101-sheet.atributos.sorte) .. " - 100";
		end
	end
end

function updateAgilidade(sheet)
	if(sheet.atributos ~= nil) then
		agiFormula = sheet.atributos.agilidade .. "d100";
		if(sheet.atributos.agilidadeMod == nil) then
			sheet.atributos.agilidadeMod = 0;
		end
		if (sheet.atributos.agilidadeMod ~= 0) then
			local bonus = 0;
			if (sheet.atributos.agilidadeMod) > 0 then
				bonus = " +" .. sheet.atributos.agilidadeMod;
			else 
				bonus = " -" .. sheet.atributos.agilidadeMod;
			end
		agiFormula = agiFormula .. bonus;
		end
		sheet.atributos.iniciativaFormula=agiFormula;
	end
end


function updateMagia(sheet)
	if(sheet.atributos ~= nil) then
		magFormula = sheet.atributos.magia .. "d100";
		if(sheet.atributos.magiaMod == nil) then
			sheet.atributos.magiaMod = 0;
		end
		if (sheet.atributos.magiaMod ~= 0) then
			local bonus = 0;
			if (sheet.atributos.magiaMod) > 0 then
				bonus = " +" .. sheet.atributos.magiaMod;
			else 
				bonus = " -" .. sheet.atributos.magiaMod;
			end
		magFormula = magFormula .. bonus;
		end
		sheet.atributos.magiaFormula=magFormula;
	end
end

function updateResistenciaMagica(sheet)	
	if(sheet.atributos ~= nil) then
		resistMagFormula = sheet.atributos.resistenciaMagica .. "d100";
		if(sheet.atributos.resistenciaMagicaMod == nil) then
			sheet.atributos.resistenciaMagicaMod = 0;
		end
		if (sheet.atributos.resistenciaMagicaMod ~= 0) then
			local bonus = 0;
			if (sheet.atributos.resistenciaMagicaMod) > 0 then
				bonus = " +" .. sheet.atributos.resistenciaMagicaMod;
			else 
				bonus = " -" .. sheet.atributos.resistenciaMagicaMod;
			end
		resistMagFormula = resistMagFormula .. bonus;
		end
		sheet.atributos.resistenciaMagicaFormula=resistMagFormula;
	end
end



function deleteEquip(sheet)
	NDB.deleteNode(sheet);
	updateBonus(sheet);
end

function deleteIdioma(sheet)
	NDB.deleteNode(sheet);
	updateBonus(sheet);
end

function rolarPericia2(pericia)

	local mesa = getMesa(pericia);	

	if(pericia.nome == nil) then
		pericia.nome = "pericia"
	end
	nome = pericia.nome;
	
	if(pericia.valor == nil) then
		pericia.valor = 0;
	end
	valor = pericia.valor;

	item = NDB.getParent(pericia);
	editaveis = NDB.getParent(item);
	pericias = NDB.getParent(editaveis);
	personagem = NDB.getParent(pericias);
	
	atributos = getChildNodeByName(personagem, "atributos");
	proficiencia = getProficiencia(personagem);
	
	item = NDB.getParent(pericia);
	editaveis = NDB.getParent(item);
	pericias = NDB.getParent(editaveis);
	personagem = NDB.getParent(pericias);

	if(valor > 0) then
		treinamento = (valor*proficiencia);
		jogada = "1D100+" .. treinamento;
	else
		jogada = "1D100";
	end
	
	if(atributos ~= nil) then
		sorte = atributos.sorte;
	else
		sorte = 1;
	end
	if(personagem.vantagem == nil) then
		personagem.vantagem = 0;
	end
	vantagem = personagem.vantagem
	if(personagem.desejoUso == nil) then
		personagem.desejoUso = 0;
	end
	desejoUso = personagem.desejoUso

	if(personagem.falhas.oponente == nil) then
		local tr1 = NDB.newTransaction(personagem);
		NDB.createChildNode(personagem, "falhas");
		NDB.pushTransaction(personagem, tr1);
	end

	if(personagem.falhas.oponente == nil) then
		personagem.falhas.oponente = 0;
	end
	falhasOp = personagem.falhas.oponente;

	rollTeste2(jogada, sorte, vantagem, desejoUso, falhasOp, mesa, nome);
	personagem.falhas.oponente = 0;
	personagem.desejoUso = 0;
	personagem.vantagem = 0;
end

function deletePericia(sheet)
	NDB.deleteNode(sheet);	
end

function updateSkill(sheet)

end

function usarHabilidade(habilidade)

habilidades = NDB.getParent(habilidade);
personagem = NDB.getParent(habilidades);

if (habilidade.nome == nil) then
	habilidade.nome = "Habilidade";
end
nome = habilidade.nome;

if (habilidade.formulaDado == nil) then
	habilidade.formulaDado = 1;
end
dado = habilidade.formulaDado;

if (habilidade.formulaMod == nil) then
	habilidade.formulaMod = 0;
end
mod = tonumber(habilidade.formulaMod);
formula = dado .. "D100";

if(mod>0) then
	formula = formula .. "+" .. mod;
elseif(mod<0) then
	formula = formula .. "-" .. mod;
end
if (habilidade.custo == nil) then
	habilidade.custo = 0;
end
custo = tonumber(habilidade.custo);

if(personagem.atributos.recursoAtual >= custo) then
	personagem.atributos.recursoAtual = personagem.atributos.recursoAtual - custo;
	if(personagem.atributos.sorte == nil) then
		personagem.atributos.sorte = 0;
	end
	sorte = personagem.atributos.sorte
	rollTeste(personagem, formula, sorte, nome);
else
	showMessage("Recurso insuficiente!");
end


end

function deleteHabilidade(sheet)
	NDB.deleteNode(sheet);
end


function updateLealdade(sheet)
	if (sheet.tendencia.lealdade == nil) then	
		sheet.tendencia.lealdade = 0;
	end
	l = sheet.tendencia.lealdade;
	if(l<-50) then
		sheet.lealdade = "Caótico";
	elseif(l>50) then
		sheet.lealdade = "Leal";
	else
		sheet.lealdade = "Neutro";
	end
	-- -51 Caotico
	-- 0 Neutro
	-- 51+ Leal
end

function updateMoralidade(sheet)
	if (sheet.tendencia.moralidade == nil) then	
		sheet.tendencia.moralidade = 0;
	end
	m = sheet.tendencia.moralidade;
	if(m<-50) then
		sheet.moralidade = "Mau";
	elseif(m>50) then
		sheet.moralidade = "Bom";
	else
		sheet.moralidade = "Neutro";
	end
	-- -51 Mau
	-- 0 Neutro
	-- 51+ Bom
end

function getNewActionSkill( sheet )
	return sheet.pericias.acoes.novas;
end

function getNewknowledgeSkill( sheet )
	return sheet.pericias.conhecimento.novas;
end

function getNewPerceptionSkill( sheet )
	return sheet.pericias.percepcao.novas;
end

function getNewCombatSkill( sheet )
	return sheet.pericias.combate.novas;
end

function getNewCreationSkill( sheet )
	return sheet.pericias.producao.novas;
end

function getNewSocialSkill( sheet )
	return sheet.pericias.sociais.novas;
end

function getNewToolSkill( sheet )
	return sheet.pericias.ferramentas.novas;
end

function getNewResistSkill( sheet )
	return sheet.pericias.resistencias.novas;
end

function updateNovaPericia(novaPericia, nova)
	novaPericia.nome = nova;
end

function rolarPericiaSemTreinamento(sheet, nome)
	local mesa = getMesa(sheet);	
	if(nome == nil) then
		nome = "pericia"
	end
	atributos = getChildNodeByName(sheet, "atributos");
	proficiencia = getProficiencia(sheet);
	jogada = "1D100";
	if(atributos ~= nil) then
		sorte = atributos.sorte;
	else
		sorte = 1;
	end
	rollTeste(sheet, jogada, sorte, nome);
end