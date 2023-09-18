function getClasses()
	return {"BÁRBARO", "BARDO", "BRUXO", "CLÉRIGO", "DRUIDA","FEITICEIRO","GUARDIÃO","GUERREIRO","LADINO","MAGO","MONGE","PALADINO"}
end

function getVidaTotal(className, vida)
	return getModVida(className) * vida;
end

function getRecursoTotal(className, recurso)
	return getModRecursos(className) * recurso;
end

function getModVida(className)
    if(className == "BÁRBARO") then
       return 75;
   	elseif(className = "BARDO") then
   		return 65;
	elseif(className = "BRUXO") then
   		return 65;
   	elseif(className = "CLÉRIGO") then
   		return 65;
   	elseif(className = "DRUIDA") then
   		return 65;
   	elseif(className = "FEITICEIRO") then
   		return 60;
   	elseif(className = "GUARDIÃO") then
   		return 70;
   	elseif(className = "GUERREIRO") then
   		return 60;
   	elseif(className = "LADINO") then
   		return 65;
   	elseif(className = "MAGO") then
   		return 60;
   	elseif(className = "MONGE") then
   		return 65;
   	elseif(className = "PALADINO") then
   		return 70;
    end
end

function getModRecursos(className)
    if(className == "BÁRBARO") then
       return 5;
   	elseif(className = "BARDO") then
   		return 15;
	elseif(className = "BRUXO") then
   		return 15;
   	elseif(className = "CLÉRIGO") then
   		return 15;
   	elseif(className = "DRUIDA") then
   		return 15;
   	elseif(className = "FEITICEIRO") then
   		return 20;
   	elseif(className = "GUARDIÃO") then
   		return 10;
   	elseif(className = "GUERREIRO") then
   		return 10;
   	elseif(className = "LADINO") then
   		return 15;
   	elseif(className = "MAGO") then
   		return 20;
   	elseif(className = "MONGE") then
   		return 15;
   	elseif(className = "PALADINO") then
   		return 10;
    end
end

