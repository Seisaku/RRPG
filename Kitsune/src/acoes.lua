local meuPersonagem;

function initializeActions(sheet)
	if(sheet.atalhos == nil) then
		local tr1 = NDB.newTransaction(sheet);
		NDB.createChildNode(sheet, "atalhos");
		NDB.pushTransaction(sheet, tr1);
	end
end

function loadMyChar(sheet)
	local personagemItem = getMyChar(sheet);
	if(personagemItem ~= nil) then
		personagemItem:loadSheetNDB(setLocalPersonagem)
	end
end

function setLocalPersonagem( node )
	meuPersonagem = node;
end

function getMyChar(sheet)
	local mesa = Firecast.getMesaDe(sheet);
	local jogador = mesa.meuJogador;
	local personagem;
	if(jogador ~= nil) then
		local codigoPersonagem = jogador.personagemPrincipal
		personagem = mesa:findBibliotecaItem(codigoPersonagem);		
		return personagem;
	else
		return nil;
	end;
end

function setAtalhoDesejoFalhas(sheet, personagem)

	if(sheet.atalhos == nil) then
		local tr1 = NDB.newTransaction(sheet);
		NDB.createChildNode(sheet, "atalhos");
		NDB.pushTransaction(sheet, tr1);
	end

	personagem.desejoUso = sheet.atalhos.desejoUso;
	sheet.atalhos.desejoUso = 0;
	personagem.falhas.oponente = sheet.atalhos.falhasOponente;
	sheet.atalhos.falhasOponente = 0;
end


function atalhoAtaque(sheet)
	if(meuPersonagem == nil) then
		loadMyChar(sheet);
	else	
		setAtalhoDesejoFalhas(sheet,meuPersonagem);
		rolarAtaque(meuPersonagem);
	end
end

function atalhoDefesa(sheet)
	if(meuPersonagem == nil) then
		loadMyChar(sheet);
	else	
		setAtalhoDesejoFalhas(sheet,meuPersonagem);
		rolarDefesa(meuPersonagem);
	end
end

function atalhoAgilidade(sheet)
	if(meuPersonagem == nil) then
		loadMyChar(sheet);
	else	
		setAtalhoDesejoFalhas(sheet,meuPersonagem);
		rolarAgilidade(meuPersonagem);
	end
end

function atalhoSorte(sheet)
	if(meuPersonagem == nil) then
		loadMyChar(sheet);
	else	
		setAtalhoDesejoFalhas(sheet,meuPersonagem);
		rolarSorte(meuPersonagem);
	end
end

function atalhoMagia(sheet)
	if(meuPersonagem == nil) then
		loadMyChar(sheet);
	else
		setAtalhoDesejoFalhas(sheet,meuPersonagem);	
		rolarMagia(meuPersonagem);
	end
end

function atalhoRMagia(sheet)
	if(meuPersonagem == nil) then
		loadMyChar(sheet);
	else	
		setAtalhoDesejoFalhas(sheet,meuPersonagem);
		rolarResistenciaMagica(meuPersonagem);
	end
end

function atalhoVida(sheet)
	if(meuPersonagem == nil) then
		loadMyChar(sheet);
	else	
		setAtalhoDesejoFalhas(sheet,meuPersonagem);
		rolarVida(meuPersonagem);
	end
end

function atalhoIniciativa(sheet)
	if(meuPersonagem == nil) then
		loadMyChar(sheet);
	else	
		setAtalhoDesejoFalhas(sheet,meuPersonagem);
		rolarIniciativa(meuPersonagem);
	end
end