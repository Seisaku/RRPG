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
	local mesa = getMesa(sheet);
	if (sheet.atributos.ataqueFormula ~= nil) then
		personagem = getPersonagemWithBuffs(sheet, "ATQ")
		rolagem, vantagem, nome = applyBuffs(sheet.atributos.ataqueFormula, 0, "Ataque")
		rollTestePersonagem(rolagem, sheet.atributos.sorte, 0, 0, 0, mesa, nil, nome, personagem);
	end
end

function rolarDefesa(sheet)
	local mesa = getMesa(sheet);
	if (sheet.atributos.defesaFormula ~= nil) then
		personagem = getPersonagemWithBuffs(sheet, "DEF")
		rolagem, vantagem, nome = applyBuffs(sheet.atributos.defesaFormula, 0, "Defesa")
		rollTestePersonagem(rolagem, sheet.atributos.sorte, 0, 0, 0, mesa, nil, nome, personagem);
	end
end

function rolarIniciativa(sheet)
	local mesa = getMesa(sheet);
	rollTeste2("1d100", 0, 0, 0, 0, mesa, nil, "Iniciativa");	
end

function rolarAgilidade(sheet)
	local mesa = getMesa(sheet);
	if (sheet.atributos.iniciativaFormula ~= nil) then
		personagem = getPersonagemWithBuffs(sheet, "AGI")
		rolagem, vantagem, nome = applyBuffs(sheet.atributos.iniciativaFormula, 0, "Agilidade")
		rollTestePersonagem(rolagem, sheet.atributos.sorte, 0, 0, 0, mesa, nil, nome, personagem);
	end
end

function rolarSorte(sheet)
	local mesa = getMesa(sheet);
	if (sheet.atributos.Sorte ~= nil) then
		sorteFormula =  sheet.atributos.Sorte .. "D100"
		if(sheet.atributos.sorteMod == nil) then
			sheet.atributos.sorteMod = 0
		end
		if(sheet.atributos.sorteMod > 0) then
			sorteFormula = sorteFormula .. "+" .. sheet.atributos.sorteMod;
		elseif(sheet.atributos.sorteMod < 0) then
			sorteFormula = sorteFormula .. sheet.atributos.sorteMod;
		end	
		personagem = getPersonagemWithBuffs(sheet, "SOR")
		rolagem, vantagem, nome = applyBuffs(sorteFormula, 0, "Sorte")
		rollTestePersonagem(rolagem, sheet.atributos.sorte, 0, 0, 0, mesa, nil, nome, personagem);
	end
end

function rolarMagia(sheet)
	local mesa = getMesa(sheet);
	if (sheet.atributos.magiaFormula ~= nil) then
		personagem = getPersonagemWithBuffs(sheet, "MAG")
		rolagem, vantagem, nome = applyBuffs(sheet.atributos.magiaFormula, 0, "Magia")
		rollTestePersonagem(rolagem, sheet.atributos.sorte, 0, 0, 0, mesa, nil, nome, personagem);
	end
end

function rolarVida(sheet)
	local mesa = getMesa(sheet);
	if (sheet.atributos.vidaFormula ~= nil) then
		personagem = getPersonagemWithBuffs(sheet, "VIDA")
		rolagem, vantagem, nome = applyBuffs(sheet.atributos.vidaFormula, 0, "Vida")
		rollTestePersonagem(rolagem, sheet.atributos.sorte, 0, 0, 0, mesa, nil, nome, personagem);
	end
end

function rolarResistenciaMagica(sheet)
	local mesa = getMesa(sheet);
	if (sheet.atributos.resistenciaMagicaFormula ~= nil) then
		personagem = getPersonagemWithBuffs(sheet, "RMAG")
		rolagem, vantagem, nome = applyBuffs(sheet.atributos.resistenciaMagicaFormula, 0, "Defesa Mágica")
		rollTestePersonagem(rolagem, sheet.atributos.sorte, 0, 0, 0, mesa, nil, nome, personagem);
	end
end

function ataqueComArma(arma)
	atq, bonus = getAtaqueComArmaFormula(arma);
	formula = getFormulaFromDiceBonus(atq, bonus);

	msg = "Ataque";
	if(arma.nome ~= nil) then
		msg = msg .. ": " .. arma.nome;
	end	

	personagem = getPersonagemFromArma(arma);
	local mesa = getMesa(personagem);
	personagem = getPersonagemWithBuffs(personagem, "ATQ")
	rolagem, vantagem, msg = applyBuffs(formula, 0, msg)
	rollTestePersonagem(rolagem, personagem.atributos.sorte, vantagem, 0, 0, mesa, nil, nome, personagem);
end

function getAtaqueComArmaFormula(arma)
	personagem = getPersonagemFromArma(arma);
	
	if(personagem.atributos.ataque == nil) then
		personagem.atributos.ataque = 1;
	end
	formula = personagem.atributos.ataque .. "D100";
	if(personagem.atributos.ataqueMod == nil) then
		personagem.atributos.ataqueMod = 0;
	end
	bonus = personagem.atributos.ataqueMod;
	bonus = bonus + getWeaponTotalBonus(arma, personagem);
	return personagem.atributos.ataque, bonus;					
end

function getPersonagemFromArma(arma)
	armas = NDB.getParent(arma);
	equipamento = NDB.getParent(armas);
	personagem = NDB.getParent(equipamento);
	return personagem;
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

				if(sheet.atributos.vidaTempAtual > 0 and sheet.atributos.vidaTempAtual > HPdown) then
					-- showMessage("Only temp" .. sheet.atributos.vidaTempAtual .. " " .. HPdown .. "PV" .. sheet.atributos.vidaAtual);
					sheet.atributos.vidaTempAtual = sheet.atributos.vidaTempAtual - HPdown;
					HPdown = 0;
				elseif (sheet.atributos.vidaTempAtual > 0) then
					-- showMessage("Temp and Normal" .. sheet.atributos.vidaTempAtual .. " " .. HPdown .. "PV" .. sheet.atributos.vidaAtual);
					HPdown = HPdown - sheet.atributos.vidaTempAtual;
					sheet.atributos.vidaTempAtual = 0;
					sheet.atributos.vidaAtual = sheet.atributos.vidaAtual - HPdown;
				else
					sheet.atributos.vidaAtual = sheet.atributos.vidaAtual - HPdown;
				end
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
	local vida = 1;	
	if(sheet.atributos~=nil) then
		if(sheet.atributos.vida==nil) then
			sheet.atributos.vida=1;
		end
		vida = sheet.atributos.vida;
		if(sheet.atributos.vidaMod==nil) then
			sheet.atributos.vidaMod=200;
		end
		
		tempPVCheck = false;
		if(sheet.buffs ~= nil) then
			listaBuffs = NDB.getChildNodes(sheet.buffs);
			if(listaBuffs ~= nil) then
				for _, buff in pairs(listaBuffs) do
					if(buff ~= nil and buff.ativo == true and buff.acao == 'PV' and buff.formula ~= nil) then
						if(buff.aplicado == nil) then
							buff.aplicado = false;
						end
						pformula = parseFormula(buff.formula, personagem);
						local rolagem = Firecast.interpretarRolagem(pformula);
						rolagem:rolarLocalmente();
						if(not buff.aplicado and sheet.atributos.vidaTempMax ~= nil) then
							sheet.atributos.vidaTempMax = sheet.atributos.vidaTempMax + rolagem.resultado;
							-- showMessage("Adding temp" .. sheet.atributos.vidaTempMax .. "<-" .. rolagem.resultado);
						elseif(not buff.aplicado ~= nil and sheet.atributos.vidaTempMax == nil) then
							sheet.atributos.vidaTempMax = rolagem.resultado;
						end
						if(not buff.aplicado and sheet.atributos.vidaTempAtual == nil) then
							sheet.atributos.vidaTempAtual = sheet.atributos.vidaTempMax;
						elseif(not buff.aplicado and sheet.atributos.vidaTempAtual ~= nil) then
							sheet.atributos.vidaTempAtual = sheet.atributos.vidaTempAtual + rolagem.resultado;
							-- showMessage("Adding current temp" .. sheet.atributos.vidaTempAtual .. " " .. rolagem.resultado)
						end
						-- if(buff.aplicado) then
						-- 	aplicado = "Aplicado";
						-- else
						-- 	aplicado = "Novo";
						-- end
						buff.aplicado = true;
						tempPVCheck = true;
						-- showMessage(aplicado .. " >>> " .. rolagem.asString .. "=" .. rolagem.resultado .. "=>" .. sheet.atributos.vidaTempAtual .. "/" .. sheet.atributos.vidaTempMax);
					end
				end
			end
		end

		if(not tempPVCheck) then
			sheet.atributos.vidaTempMax = 0; 
			sheet.atributos.vidaTempAtual = 0;

			if(sheet.atributos.vidaAtual ~= nil and sheet.atributos.vidaMax ~= nil and sheet.atributos.vidaAtual > sheet.atributos.vidaMax) then
				sheet.atributos.vidaAtual = sheet.atributos.vidaMax;
			end
		end

		sheet.atributos.vidaMax=sheet.atributos.vidaMod*sheet.atributos.vida;
		-- showMessage(sheet.atributos.vidaMax .. "=" .. sheet.atributos.vidaMod .. "*" .. sheet.atributos.vida);
		if(sheet.atributos.vidaAtual==nil) then
			sheet.atributos.vidaAtual=sheet.atributos.vidaMax;
		end

		if(sheet.atributos.vidaTempMax ~= nil and sheet.atributos.vidaTempAtual ~= nil and sheet.atributos.vidaTempMax > 0 and sheet.atributos.vidaTempAtual > 0) then
			sheet.atributos.vidaAtualxTotal=(sheet.atributos.vidaAtual+sheet.atributos.vidaTempAtual) .. "(" .. sheet.atributos.vidaTempAtual ..")|" .. (sheet.atributos.vidaMax+sheet.atributos.vidaTempMax) .. "(" .. sheet.atributos.vidaTempMax ..")";
			sheet.atributos.vidaMsg= sheet.atributos.vidaMax .. "+" .. sheet.atributos.vidaTempMax
		else
			sheet.atributos.vidaAtualxTotal=sheet.atributos.vidaAtual .. "|" .. sheet.atributos.vidaMax;
			sheet.atributos.vidaMsg= sheet.atributos.vidaMax
		end
		sheet.atributos.vidaFormula = sheet.atributos.vida .. "D100";
		syncVidaToBar(sheet);
	end
	return vida;
end

function syncVidaToBar( sheet )
	jogador, personagem = getJogadorfromSheet(sheet);
	if(jogador~=nil) then
		if(sheet.atributos.vidaTempMax ~= nil and sheet.atributos.vidaTempAtual ~= nil and sheet.atributos.vidaTempMax > 0 and sheet.atributos.vidaTempAtual > 0) then
			-- showMessage(sheet.atributos.vidaAtual .. "/" .. sheet.atributos.vidaMax .. "TEMP" .. sheet.atributos.vidaTempAtual .. "/" .. sheet.atributos.vidaTempMax);
			jogador:requestSetBarValue(1, (sheet.atributos.vidaAtual + sheet.atributos.vidaTempAtual), (sheet.atributos.vidaMax + sheet.atributos.vidaTempMax));
		else
			-- showMessage(sheet.atributos.vidaAtual .. "/" .. sheet.atributos.vidaMax);
			jogador:requestSetBarValue(1, sheet.atributos.vidaAtual, sheet.atributos.vidaMax);
		end
	end
end

function syncVida( sheet )
	jogador, personagem = getJogadorfromSheet(sheet);
	if(jogador~=nil) then
		local atual, _, _ = jogador:getBarValue(1);
		if(sheet.atributos.vidaTempAtual > 0) then
			atual = atual - sheet.atributos.vidaTempAtual;
		end
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
			if(MPnew ~= nil) then
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
		local atual, _, _ = jogador:getBarValue(2);
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
		local atual, _, _ = jogador:getBarValue(3);
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
		armas = NDB.getParent(sheet);
		equipamento = NDB.getParent(armas);
		personagem = NDB.getParent(equipamento);
		-- sheet.proficiencia = getProficienceForType(sheet.tipo, personagem);

		listaArmas = NDB.getChildNodes(armas);
		totalBonus = 0;
		for key, arma in pairs(listaArmas) do		
			if (arma.equipado) then
				totalArma = getWeaponTotalBonus(arma, personagem);
				totalBonus = totalBonus + totalArma;
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

function getWeaponTotalBonus( weapon, personagem )
	if(weapon==nil) then
		return 0;
	end
	proficiencia = 0;
	if(weapon.tipo~=nil)then
		proficiencia = getProficienceForType(weapon.tipo, personagem);
	end

	bonus = 0;
	if(weapon.bonus~=nil)then
		bonus = weapon.bonus;
	end
	total = math.floor(bonus+proficiencia)
	return total; 
end

function getProficienceForType(type, char)
	if(type~=nil and char~=nil) then
		pericias = getChildNodeByName(char, "pericias");
		if(pericias == nil)then
			return 0;
		end
		combate = getChildNodeByName(pericias, "Combate");
		if(combate == nil)then
			return 0;
		end
		editaveis = getChildNodeByName(combate, "editaveis");
		if(editaveis == nil)then
			return 0;
		end
		
		listaArmas = NDB.getChildNodes(editaveis);
		if(listaArmas == nil)then
			return 0;
		end
		for _, arma in pairs(listaArmas) do
			if (arma ~= nil and arma.nome ~= nil and arma.nome == type and arma.valor ~= nil) then
				valor = tonumber(arma.valor);
				if(valor == nil) then
					valor = 0;
				end
				-- printMsgChar(char, type .. "=" .. valor .. " proficiencia personagem=" .. char.proficiencia);
				return valor * char.proficiencia;
			end
		end
	end
	-- if(type~=nil) then
		-- printMsgChar(char,"pericia " .. type .. " não encontrada");
	-- end
	return 0;	
end

function updateAtaque(sheet)
	local ataque = 1;
	local bonus = 0;
	if(sheet.atributos ~= nil) then
		ataque = tonumber(sheet.atributos.ataque);
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
				sheet.atributos.ataqueFormula = ataqueBase .. bonus;
			end
		else
			sheet.atributos.ataqueFormula = ataqueBase;		
		end
	end
	return ataque, bonus; 
end

function updateDefesa(sheet)
	local defesa = 1;
	local bonus = 0;
	if(sheet.atributos ~= nil) then
		defesa = tonumber(sheet.atributos.defesa);
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
	return defesa, bonus;
end

function updateSorte(sheet)
	local sorte = 1;
	if(sheet.atributos ~= nil) then
		sorte = sheet.atributos.sorte;
		if (sorte<=1) then
			sheet.atributos.critRange="100";
		else
			sheet.atributos.critRange=(101-sorte) .. " - 100";
		end
	end
	return sorte;
end

function updateAgilidade(sheet)
	local agilidade = 1;
	local bonus = 0;
	if(sheet.atributos ~= nil) then
		agilidade = sheet.atributos.agilidade;
		agiFormula = agilidade .. "d100";
		if(sheet.atributos.agilidadeMod == nil) then
			sheet.atributos.agilidadeMod = 0;
		end
		if (sheet.atributos.agilidadeMod ~= 0) then			
			if (sheet.atributos.agilidadeMod) > 0 then
				bonus = " +" .. sheet.atributos.agilidadeMod;
			else 
				bonus = " -" .. sheet.atributos.agilidadeMod;
			end
		agiFormula = agiFormula .. bonus;
		end
		sheet.atributos.iniciativaFormula=agiFormula;
	end
	return agilidade, bonus;
end


function updateMagia(sheet)
	local magia = 1;
	local bonus = 0; 
	if(sheet.atributos ~= nil) then
		magia = sheet.atributos.magia
		magFormula = sheet.atributos.magia .. "d100";
		if(sheet.atributos.magiaMod == nil) then
			sheet.atributos.magiaMod = 0;
		end
		if (sheet.atributos.magiaMod ~= 0) then
			if (sheet.atributos.magiaMod) > 0 then
				bonus = " +" .. sheet.atributos.magiaMod;
			else 
				bonus = " -" .. sheet.atributos.magiaMod;
			end
		magFormula = magFormula .. bonus;
		end
		sheet.atributos.magiaFormula=magFormula;
	end
	return magia, bonus
end

function updateResistenciaMagica(sheet)	
	local rmag = 1;
	local bonus = 0;
	if(sheet.atributos ~= nil) then
		rmag = sheet.atributos.resistenciaMagica;
		resistMagFormula = rmag .. "d100";
		if(sheet.atributos.resistenciaMagicaMod == nil) then
			sheet.atributos.resistenciaMagicaMod = 0;
		end
		if (sheet.atributos.resistenciaMagicaMod ~= 0) then			
			if (sheet.atributos.resistenciaMagicaMod) > 0 then
				bonus = " +" .. sheet.atributos.resistenciaMagicaMod;
			else 
				bonus = " -" .. sheet.atributos.resistenciaMagicaMod;
			end
		resistMagFormula = resistMagFormula .. bonus;
		end
		sheet.atributos.resistenciaMagicaFormula=resistMagFormula;
	end
	return rmag, bonus;
end

function deleteEquip(sheet)
	NDB.deleteNode(sheet);
	updateBonus(sheet);
end

function deleteIdioma(sheet)
	NDB.deleteNode(sheet);
	updateBonus(sheet);
end

function getRolagemPericia(pericia)
	if(pericia.valor == nil) then
		pericia.valor = 0;
	end
	return 1 , pericia.valor;
end

function getPersonagemFromPericia( pericia )
	item = NDB.getParent(pericia);
	editaveis = NDB.getParent(item);
	pericias = NDB.getParent(editaveis);
	personagem = NDB.getParent(pericias);
	return personagem;
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
	if(personagem.falhas.oponente == nil) then
		local tr1 = NDB.newTransaction(personagem);
		NDB.createChildNode(personagem, "falhas");
		NDB.pushTransaction(personagem, tr1);
	end
	personagem = getPersonagemWithBuffs(personagem, "PERI")
	rolagem, vantagem, nome = applyBuffs(jogada, 0, nome)
	rollTestePersonagem(rolagem, sorte, vantagem, 0, 0, mesa, nil, nome, personagem);
end

function deletePericia(sheet)
	NDB.deleteNode(sheet);	
end

function updateSkill(sheet)

end

function getPersonagemFromHabilidade(habilidade)
	habilidades = NDB.getParent(habilidade);
	personagem = NDB.getParent(habilidades);
	return personagem;
end



function getRollFromHabilidade( habilidade )
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
	return dado, mod, formula;
end

function usarHabilidade(habilidade)
	mesa = getMesa(habilidade);
	habilidades = NDB.getParent(habilidade);
	personagem = NDB.getParent(habilidades);

	if (habilidade.nome == nil) then
		habilidade.nome = "Habilidade";
	end
	nome = habilidade.nome;
	_,_,formula = getRollFromHabilidade(habilidade);
	if (habilidade.custo == nil) then
		habilidade.custo = 0;
	end
	custo = tonumber(habilidade.custo);

	if(personagem.atributos.recursoAtual >= custo) then
		personagem.atributos.recursoAtual = personagem.atributos.recursoAtual - custo;
		if(personagem.atributos.sorte == nil) then
			personagem.atributos.sorte = 0;
		end
		sorte = personagem.atributos.sorte;

		personagem = getPersonagemWithBuffs(personagem, "HABI")
		rolagem, vantagem, nome = applyBuffs(formula, 0, nome)
		rollTestePersonagem(rolagem, personagem.atributos.sorte, vantagem, 0, 0, mesa, nil, nome, personagem);
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
	rollTeste2(jogada, sorte, 0, 0, 0, mesa, nil, nome);
end

function consumeTurn( sheet )
	if(sheet ~= nil and sheet.buffs ~= nil) then
		listaBuffs = NDB.getChildNodes(sheet.buffs);
		if(listaBuffs ~= nil) then
			for key, buff in pairs(listaBuffs) do
				if(buff ~= nil and buff.turnos ~= nil) then
					local turnNumber = tonumber(buff.turnos);
					result = turnNumber - 1
					if(result >= 0)then
						buff.turnos = result;
					end
				end
			end
		end
	end
end

function deleteBuff( sheet )
	NDB.deleteNode(sheet);
end

function updateBuff( buff )
	buffs = NDB.getParent(buff);
	personagem = NDB.getParent(buffs);
	if(buff ~= nil and buff.formula ~= nil and buff.acao ~= nil and buff.acao == "PV" and (buff.aplicado == nil or (buff.ativo and buff.aplicado))) then
		buff.aplicado = false;
	end
	updateVida(personagem);
end