
local meuPersonagem

function initializeActions(sheet)
	local personagemItem = getMyChar(sheet);
	personagemItem:loadSheetNDB(setLocalPersonagem)
end

function setLocalPersonagem( node )
	meuPersonagem = node;
end

function getMyChar(sheet)
	local mesa = rrpg.getMesaDe(sheet);
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


function atalhoAtaque(sheet)
	if(meuPersonagem == nil) then
		initializeActions(sheet);
	else	
		rolarAtaque(meuPersonagem);
	end
end

function atalhoDefesa(sheet)
	if(meuPersonagem == nil) then
		initializeActions(sheet);
	else	
		rolarDefesa(meuPersonagem);
	end
end

function atalhoAgilidade(sheet)
	if(meuPersonagem == nil) then
		initializeActions(sheet);
	else	
		rolarAgilidade(meuPersonagem);
	end
end

function atalhoSorte(sheet)
	if(meuPersonagem == nil) then
		initializeActions(sheet);
	else	
		rolarSorte(meuPersonagem);
	end
end

function atalhoMagia(sheet)
	if(meuPersonagem == nil) then
		initializeActions(sheet);
	else	
		rolarMagia(meuPersonagem);
	end
end

function atalhoRMagia(sheet)
	if(meuPersonagem == nil) then
		initializeActions(sheet);
	else	
		rolarResistenciaMagica(meuPersonagem);
	end
end

function atalhoVida(sheet)
if(meuPersonagem == nil) then
		initializeActions(sheet);
	else	
		rolarVida(meuPersonagem);
	end
end

function atalhoIniciativa(sheet)

if(meuPersonagem == nil) then
		initializeActions(sheet);
	else	
		rolarIniciativa(meuPersonagem);
	end
end