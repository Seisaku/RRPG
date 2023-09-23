local Classe = {
	 descricao = nil,
    nome = nil,  
    vida = nil,
    mana = nil,
    atributoPrincipal = nil,
    recurso = nil,
    proficiente = nil,
    pericias = nil
}

function Classe:new(descricao, nome, vida, mana, atributoPrincipal, recurso, proficiente, pericias)
    local obj = {
    	  descricao = descricao,
        nome = nome,
        vida = vida,
        mana = mana,
        atributoPrincipal = atributoPrincipal,
        recurso = recurso,
        proficiente = proficiente,
        pericias = pericias
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

-- Define a list to store instances of Classe
local classList = {}

-- Define a function to add a Classe instance to the list
function addClass(descricao, nome, vida, mana, atributoPrincipal, recurso, proficiente, pericias)
    local classInstance = Classe:new(descricao, nome, vida, mana, atributoPrincipal, recurso, proficiente, pericias)
    classList[nome] = classInstance
end


function initClasses()	
    				 			  -- (descricao, nome, vida, mana, atributoPrincipal, recurso, proficiente, pericias)
	addClass("Um lutador feroz, de origem primitiva que pode entrar em fúria durante um combate.","BARBARO", 75, 5,"Ataque", "Fúria", 7, 2)
	addClass("Um inspirador mágico cujo poder ecoa a música da própria criação.","BARDO", 65, 15, "Sorte", "Mana", 9, 3)
	addClass("Um usuário de magia, cujo poder deriva de um acordo com uma entidade extraplanar.","BRUXO", 65, 15, "Sorte", "Mana", 4, 1)
	addClass("Um campeão sacerdotal que exerce magia divina a serviço de um poder superior.","CLERIGO", 65,15,"Defesa Mágica", "Mana", 6, 2)
	addClass("Um sacerdote da Velha Fé, que comanda os poderes da natureza - o luar e o crescimento das plantas, o fogo e raio - e adota formas animais.","DRUIDA", 65,15,"Defesa Mágica", "Mana", 6, 2)
	addClass("Um conjurador que extrai magia inerente de um dom ou linhagem.","FEITICEIRO", 60,20,"Sorte", "Mana", 3, 1)
	addClass("Um combatente que usa habilidades marciais e magia da natureza para caçar ameaças nos limites da civilização.","GUARDIAO", 70,10,"Agilidade", "Concentração", 8, 2)	
	addClass("Um mestre do combate, habilidoso com uma variedade de armas e armaduras.","GUERREIRO", 60,10,"Ataque", "Mana", 8, 2)
	addClass("Um trapaceiro que usa furtividade e truques para superar obstáculos e inimigos.","LADINO", 65,13,"Agilidade", "Combo", 10, 3)
	addClass("Um usuário de magia erudito, capaz de manipular as estruturas da realidade.","MAGO", 60,20, "Magia","Mana", 3, 1)
	addClass("Um mestre das artes marciais que utiliza o poder do corpo na busca pela perfeição física e espiritual.","MONGE", 65,15,"Agilidade", "Chi", 4, 1)
	addClass("Um guerreiro santo ligado a um juramento sagrado.","PALADINO", 70,10,"Ataque", "Mana", 8, 2)
	
end

-- Define a function to get a Classe instance by name
function getClasseByName(nome)
	if classList[nome] == nil then
        -- Lazy-load the class if it's not already in the map
        initClasses()
   end

   return classList[nome]
end

function getClassNames()    
    -- Lazy-load the class if it's not already in the map
    initClasses()
    local names = {}
    for nome, _ in pairs(classList) do
        table.insert(names, nome)
    end
    return names
end

function getVidaTotal(className, vida)
	return getModVida(className) * vida;
end

function getRecursoTotal(className, recurso)
	return getModRecursos(className) * recurso;
end

function getModVida(className)
    classe = getClasseByName(className)
    return classe.vida
end

function getModRecursos(className)
    classe = getClasseByName(className)
    return classe.mana
end

