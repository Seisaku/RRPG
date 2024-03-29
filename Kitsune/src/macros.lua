function rollTeste2(roll, sorte, vantagem, desejo, falhasOp, mesa, msg)
    rollTeste2(roll, sorte, vantagem, desejo, falhasOp, mesa, nil, msg);
end

function getFormulaFromDiceBonus( dice, bonus )
    if(bonus > 0) then
        return dice .. "D100 +" .. bonus;
    elseif(bonus < 0) then
        return dice .. "D100 " .. bonus;
    else
        return dice .. "D100";
    end
end

-- roll + parse + char
function rollTestePersonagem(roll, sorte, vantagem, desejo, falhasOp, mesa, objetivo, msg, personagem)
    -- init
    if(sorte == nil) then
        sorte = 1;
    end

    if(desejo == nil) then
        desejo = 0;
    end

    if(falhasOp == nil) then
        falhasOp = 0;
    end

    if(roll == nil) then
        roll = "1D100";
    end
    if(msg == nil) then
        msg = roll;
    end

    -- Colors 
    baseColor = "[§K7]";
    wishColor = "[§K2]";
    critColor = "[§K8]";
    advColor = "[§K11]";
    disColor = "[§K4]";
    opFailColor = "[§K6]";
    failColor = "[§K4]";
    totalColor = "[§K9]";
    bracketColor = "[§K1]";
    msgColor = "[§K14]";
    rollColor = "[§K2]";

    local msgVantagem = ""; 
    if(vantagem == nil) then
        vantagem = 0
    end  
    local rollWithAdv = roll;
    if vantagem > 0 then
        local adv = (vantagem*25)
        rollWithAdv = roll .. "+" .. adv
        msgVantagem = advColor .. "+" .. adv .. " Vantagem x" .. vantagem;
    elseif vantagem < 0 then
        local dis = math.abs(vantagem)
        rollWithAdv = roll .. "-" .. (dis*25)
        msgVantagem = disColor .. "-" .. (dis*25) .. " Desvantagem x" .. dis;
    end

    rollP = parseFormula(rollWithAdv, personagem);
    local rolagem = Firecast.interpretarRolagem(rollP); 
    rolagem:rolarLocalmente();

    if(mesa == nil) then
        mesa = getMesa(personagem);
    end

    resultR = printRolagem3(mesa, rolagem, msg, sorte, roll, msgVantagem);
    local crit;
    local fail = 0;
    crit, fail = checkCriticalnFail(rolagem, fail, sorte);
    local totalCrit = crit;
    local resultados = "" .. baseColor .. resultR;
    
    limit = 0;
    critMsg = critColor .. "Critico! x" .. limit;

    local msgDesejo = "";
    local resultD = 0;
    if(desejo > 0) then
        local desejoFormula = desejo .. "D100"
        local rolagemDesejo = Firecast.interpretarRolagem(desejoFormula);
        rolagemDesejo:rolarLocalmente();
        critD, fail = checkCriticalnFail(rolagemDesejo, fail, sorte);
        if(critD > 0)then
            crit = crit + critD;
            totalCrit = totalCrit + critD;
        end
        msgDesejo = wishColor .. " Desejo x".. desejo;
        resultD = printRolagem3(mesa, rolagemDesejo, msgDesejo, sorte, nil, nil);
        resultados = resultados .. wishColor .. " + " .. resultD;
    end
    local msgFalhaOp = "";
    local resultF = 0;
    if(falhasOp > 0) then
        opFailRoll = rollCritical(falhasOp, sorte);
        critF, fail = checkCriticalnFail(opFailRoll, fail, sorte);
        if(critF > 0)then
            crit = crit + critF;
            totalCrit = totalCrit + critF;
        end
        msgFalhaOp = opFailColor .." Falha Oponente x" .. falhasOp;
        resultF = printRolagem3(mesa, opFailRoll, msgFalhaOp, sorte, nil, nil);
        resultados = resultados .. opFailColor .. " + " .. resultF;
    end

    baseSoma = resultR;
    resultadoFinal = baseSoma;
    totalMult = 1;    

    if((crit == 0) and (falhasOp > 0 or desejo > 0)) then
        totalMult = 1+desejo+falhasOp;
        baseSoma = resultR+resultF+resultD;
        resultadoFinal = baseSoma*totalMult;        
    end

    local msgCrit = "";
    local resultC;
    while( crit > 0 and limit < 10)
    do
        limit = limit + 1;
        critMsg = critColor .. "Critico! x" .. crit;
        critroll = rollCritical(crit, sorte);
        resultC = printRolagem3(mesa, critroll, critMsg, sorte, nil, nil);
        crit, fail = checkCriticalnFail(critroll, fail, sorte);
        resultados = resultados .. critColor .. " + " .. resultC;        
        if(crit > 0) then                
            totalCrit = totalCrit + crit;                            
        end
         
        if(crit == 0 or limit == 10) then
            msgCrit = critColor .. " Critico x" .. totalCrit;
            totalMult = 1+totalCrit+desejo+falhasOp;
            baseSoma = resultR+resultC+resultF+resultD;
            resultadoFinal = baseSoma*totalMult;            
        else        
            resultR=(resultR+resultC);
        end            
    end
    local msgMulti;
    local msgMultiTotal;
    local msgTotal = baseColor .. " = " .. totalColor .. resultadoFinal;
    if(totalMult>1)then
        msgMulti = " x {Base x1" .. msgCrit .. msgDesejo .. msgFalhaOp .. baseColor .. "}";
        msgMultiTotal = baseColor .. " = " .. baseSoma .. " x " .. totalMult;
        mesa.activeChat:enviarMensagem(baseColor .. "{" .. resultados .. baseColor .. "}" .. msgMulti .. msgMultiTotal .. msgTotal);
    end

    if(objetivo ~= nil)then
        local objNumber = tonumber(objetivo);
        if(objNumber ~= nil and resultadoFinal > objNumber)then
            mesa.activeChat:enviarMensagem("Sucesso => " .. resultadoFinal .. " - " .. objNumber .. " = " .. (resultadoFinal-objNumber));
        elseif(objNumber ~= nil)then
            mesa.activeChat:enviarMensagem(failColor .. "Falha => " .. resultadoFinal .. " < " .. objNumber);
        end
    end

    if fail > 0 then
        mesa.activeChat:enviarMensagem(failColor .. "Critical Fail! x" .. fail);       
    end
end
-- roll + parse + char

function rollTeste2(roll, sorte, vantagem, desejo, falhasOp, mesa, objetivo, msg)
    -- init
    if(sorte == nil) then
        sorte = 1;
    end

    if(vantagem == nil) then
        vantagem = 0;
    end

    if(desejo == nil) then
        desejo = 0;
    end

    if(falhasOp == nil) then
        falhasOp = 0;
    end

    if(roll == nil) then
        roll = "1D100";
    end
    if(msg == nil) then
        msg = roll;
    end

    -- Colors 
    baseColor = "[§K7]";
    wishColor = "[§K2]";
    critColor = "[§K8]";
    advColor = "[§K11]";
    opFailColor = "[§K6]";
    failColor = "[§K4]";
    totalColor = "[§K9]";
    bracketColor = "[§K1]";
    msgColor = "[§K14]";
    rollColor = "[§K2]";

    local rolagem = Firecast.interpretarRolagem(roll); 
    rolagem:rolarLocalmente();
    resultR = printRolagem3(mesa, rolagem, msg, sorte, nil, nil);
    local crit;
    local fail = 0;
    crit, fail = checkCriticalnFail(rolagem, fail, sorte);
    local totalCrit = crit;
    local resultados = "" .. baseColor .. resultR;
    
    limit = 0;
    critMsg = critColor .. "Critico! x" .. limit;

    local msgDesejo = "";
    local resultD = 0;
    if(desejo > 0) then
        local rolagemDesejo = Firecast.interpretarRolagem(desejo .. "D100");
        rolagemDesejo:rolarLocalmente();
        critD, fail = checkCriticalnFail(rolagemDesejo, fail, sorte);
        if(critD > 0)then
            crit = crit + critD;
            totalCrit = totalCrit + critD;
        end
        msgDesejo = wishColor .. " Desejo x".. desejo;
        resultD = printRolagem3(mesa, rolagemDesejo, msgDesejo, sorte, nil, nil);
        resultados = resultados .. wishColor .. " + " .. resultD;
    end
    local msgFalhaOp = "";
    local resultF = 0;
    if(falhasOp > 0) then
        opFailRoll = rollCritical(falhasOp, sorte);
        critF, fail = checkCriticalnFail(opFailRoll, fail, sorte);
        if(critF > 0)then
            crit = crit + critF;
            totalCrit = totalCrit + critF;
        end
        msgFalhaOp = opFailColor .." Falha Oponente x" .. falhasOp;
        resultF = printRolagem3(mesa, opFailRoll, msgFalhaOp, sorte, nil, nil);
        resultados = resultados .. opFailColor .. " + " .. resultF;
    end
    local msgVantagem = ""; 
    if(vantagem > 0) then
        msgVantagem = advColor .. " Vantagem x" .. vantagem;
    end

    baseSoma = resultR;
    resultadoFinal = baseSoma;
    totalMult = 1;    

    if((crit == 0) and (falhasOp > 0 or desejo > 0 or vantagem > 0)) then
        totalMult = 1+desejo+falhasOp;
        baseSoma = resultR+resultF+resultD+(vantagem * 25);
        resultadoFinal = baseSoma*totalMult;        
    end

    local msgCrit = "";
    local resultC;
    while( crit > 0 and limit < 10)
    do
        limit = limit + 1;
        critMsg = critColor .. "Critico! x" .. crit;
        critroll = rollCritical(crit, sorte);
        resultC = printRolagem3(mesa, critroll, critMsg, sorte, nil, nil);
        crit, fail = checkCriticalnFail(critroll, fail, sorte);
        resultados = resultados .. critColor .. " + " .. resultC;        
        if(crit > 0) then                
            totalCrit = totalCrit + crit;                            
        end
         
        if(crit == 0 or limit == 10) then
            msgCrit = critColor .. " Critico x" .. totalCrit;
            totalMult = 1+totalCrit+desejo+falhasOp;
            baseSoma = resultR+resultC+resultF+resultD+(vantagem * 25);
            resultadoFinal = baseSoma*totalMult;            
        else        
            resultR=(resultR+resultC);
        end            
    end
    local msgMulti;
    local msgMultiTotal;
    local msgTotal = baseColor .. " = " .. totalColor .. resultadoFinal;
    if(totalMult>1)then
        msgMulti = " x {Base x1" .. msgCrit .. msgDesejo .. msgFalhaOp .. msgVantagem .. baseColor .. "}";
        msgMultiTotal = baseColor .. " = " .. baseSoma .. " x " .. totalMult;
        mesa.activeChat:enviarMensagem(baseColor .. "{" .. resultados .. baseColor .. "}" .. msgMulti .. msgMultiTotal .. msgTotal);
    end

    if(objetivo ~= nil)then
        local objNumber = tonumber(objetivo);
        if(objNumber ~= nil and resultadoFinal > objNumber)then
            mesa.activeChat:enviarMensagem("Sucesso => " .. resultadoFinal .. " - " .. objNumber .. " = " .. (resultadoFinal-objNumber));
        elseif(objNumber ~= nil)then
            mesa.activeChat:enviarMensagem(failColor .. "Falha => " .. resultadoFinal .. " < " .. objNumber);
        end
    end

    if fail > 0 then
        mesa.activeChat:enviarMensagem(failColor .. "Critical Fail! x" .. fail);       
    end
end

function getFormula(dados, mod)
    local d = tonumber(dados);
    local formula;
    if(d~=nil)then
        formula = d .. "D100";
    else    
        formula = "1D100";
    end

    local m = tonumber(mod);
    if(m~=nil)then
        if(mod>0) then
            formula = formula .. "+" .. mod;
        elseif(mod<0) then
            formula = formula .. mod;
        end
    end
    return formula;
end


function rollTeste(sheet, roll, sor, msg)
    local mesa = Firecast.getMesaDe(sheet);     

    if(mesa == nil) then
        mesa = Firecast.getMesas()[1];
    end

    local rolagem = Firecast.interpretarRolagem(roll); 
    rolagem:rolarLocalmente();
    resultR = printRolagem3(sheet, rolagem, msg, sor, nil, nil);
    -- local f = 100;
    local sorte = sor;
    if sorte == nil then
        sorte = 0;
    else
        sorte = sorte - 1;
    end
    local crit;
    local fail = 0;        
    
    local desejoUso = getDesejoEmUso(sheet);       
    local falhasOp = getFalhasDoOponente(sheet);

    crit, fail = checkCriticalnFail(rolagem, fail, sorte);
    local totalCrit = crit + 1;
    local resultados = "" .. resultR;
    
    limit = 0;
    critMsg = "Critico!!! X" .. limit;

    local msgDesejo = "";
    if(desejoUso > 0 and sheet.desejoAtual ~= nil and sheet.desejoAtual >= desejoUso) then
        msgDesejo = " [§K9] Desejo ".. desejoUso .. " ";
        sheet.desejoAtual = sheet.desejoAtual - desejoUso;
        updateDesejo(sheet);
    end
    sheet.desejoUso = 0;

    local msgFalhaOp = "";
    local resultF = 0;

    if(falhasOp > 0) then
        opFailRoll = rollCritical(falhasOp, sorte);
        resultF = printRolagem3(sheet, opFailRoll, "Falha Oponente x" .. falhasOp, sorte, nil, nil);
        msgFalhaOp = " [§K2]Falha Oponente x" .. falhasOp .. " = " .. resultF;
        resultados = resultados .. " + " .. resultF;
    end

    if sheet.falhas == nil then
        local tr1 = NDB.newTransaction(sheet);
        NDB.createChildNode(sheet, "falhas");
        NDB.pushTransaction(sheet, tr1);
    end        

    sheet.falhas.oponente = 0;

    if(falhasOp > 0 or desejoUso > 0) then
        mesa.activeChat:enviarMensagem("{" .. resultados .. "} = [§K7]" .. (resultR +  resultF) .. "[§K8] x1 +" .. msgDesejo .. msgFalhaOp .. " = [§K12]" .. (resultR+resultF)*(desejoUso+falhasOp+1));
    end

    while( crit > 0 and limit < 10)
    do
        limit = limit + 1;
        critMsg = "Critico!!! x" .. crit;
        critroll = rollCritical(crit, sorte);
        resultC = printRolagem3(sheet, critroll, critMsg, sorte, nil, nil);
        crit, fail = checkCriticalnFail(critroll, fail, sorte);
        resultados = resultados .. " + " .. resultC;
        if(crit > 0) then                
            totalCrit = totalCrit + crit;                
        end
        if(crit == 0 or limit == 10) then
            mesa.activeChat:enviarMensagem("{" .. resultados .. "} = [§K7]" .. (resultR +  resultC +  resultF) .. "[§K8] x " .. totalCrit .. msgDesejo .. msgFalhaOp .. " = [§K12]" .. (resultR+resultC+resultF)*(totalCrit+desejoUso+falhasOp));
        end            
        resultR=(resultR+resultC);
    end

    if fail > 0 then
        mesa.activeChat:enviarMensagem("Critical Fail!!! " .. fail);       
    end
end

function getDesejoEmUso(sheet)
    if(sheet == nil) then
        sheet.desejoUso = 0;
        return 0;
    elseif(sheet.desejo == nil) then
        sheet.desejoUso = 0;
        return 0;
    elseif(sheet.desejoUso == nil) then
        sheet.desejoUso = 0;
        return 0;
    else
       return sheet.desejoUso;
    end
end

function getFalhasDoOponente(sheet)
    if(sheet == nil or sheet.falhas == nil or sheet.falhas.oponente == nil) then
        return 0;
    else
       return sheet.falhas.oponente;
    end
end

function rollCritical(crit, sorte)
    local f = 100;
    critroll = Firecast.interpretarRolagem(crit .. "d" .. f);
    critroll:rolarLocalmente();    
    return critroll;
end

function checkCriticalnFail(rolagem, fa, sorte)
    local crit = 0;
    local fail = 0;
    if(fa ~= nil) then
        fail = fa;
    end
    for i = 1, #rolagem.ops, 1 do
        local op = rolagem.ops[i];       
        if op.tipo == "dado" then
            f = op.face;
                if f == 100 then
                for j = 1, #op.resultados, 1 do
                    if op.resultados[j] >= (f+1-sorte) then
                        crit = crit + 1;
                    end
                    if op.resultados[j] == 1 then
                        fail = fail + 1;
                    end
                end;
            end;

        end;
    end;
    return crit, fail;
end

function printRolagem3(mesa, rolagem, msg, sor, originalRoll, msgVantagem)

    baseColor = "[§K7]";
    wishColor = "[§K2]";
    critColor = "[§K8]";
    advColor = "[§K11]";
    opFailColor = "[§K6]";
    failColor = "[§K4]";
    totalColor = "[§K9]";
    bracketColor = "[§K1]";
    msgColor = "[§K14]";
    rollColor = "[§K2]";

    local resultado = rolagem.resultado;
    if(originalRoll == nil) then
        originalRoll = rolagem.asString
    end

    local sorte = sor;
    if sorte == nil then
        sorte = 0;          
    else
        sorte = sorte - 1;
    end
    -- rollColor .. originalRoll .. " = "..
    if(msgVantagem == nil) then
        msgVantagem = ""
    end
    outputRoll = originalRoll .. msgVantagem .. bracketColor .." {" .. baseColor;
    for i = 1, #rolagem.ops, 1 do
        local op = rolagem.ops[i];       
        if op.tipo == "dado" then
            f = op.face;
            local targetCrit;
            if f == 100 then
                targetCrit = 100 - sorte
            else
                targetCrit = f
            end  
            outputRoll = outputRoll .. " [ ";
            for j = 1, #op.resultados, 1 do
                if j ~= 1 then
                    outputRoll = outputRoll .. " , ";
                end;
                if op.resultados[j] >= targetCrit then
                    outputRoll = outputRoll .. critColor;
                elseif op.resultados[j] == 1 then
                    outputRoll = outputRoll .. failColor;
                else
                    outputRoll = outputRoll .. baseColor;
                end
                outputRoll = outputRoll .. math.floor(op.resultados[j]) .. baseColor;
            end;
            outputRoll = outputRoll .. " ] ";
            elseif op.tipo == "soma" then
                outputRoll = outputRoll .. "+ ";
            elseif op.tipo == "subtracao" then
                outputRoll = outputRoll .. "- ";
            elseif op.tipo == "imediato" then
                outputRoll = outputRoll .. op.valor;
            end;                
    end
    outputRoll = outputRoll .. bracketColor .. "} = " .. totalColor .. resultado .. msgColor .. " << " .. msg .. " >>";      
    if(mesa ~= nil) then
        mesa.activeChat:enviarMensagem(outputRoll); 
    end
    return resultado;
end

--[[function printRolagem2(mesa, rolagem, msg, sor)

    baseColor = "[§K7]";
    wishColor = "[§K2]";
    critColor = "[§K8]";
    advColor = "[§K11]";
    opFailColor = "[§K6]";
    failColor = "[§K4]";
    totalColor = "[§K9]";
    bracketColor = "[§K1]";
    msgColor = "[§K14]";
    rollColor = "[§K2]";

    local r = rolagem.resultado;
    local sorte = sor;
    if sorte == nil then
        sorte = 0;          
    else
        sorte = sorte - 1;
    end
    outputRoll =  rollColor .. rolagem.asString .. bracketColor .." {" .. baseColor;
    for i = 1, #rolagem.ops, 1 do
        local op = rolagem.ops[i];       
        if op.tipo == "dado" then
            f = op.face;
            local targetCrit;
            if f == 100 then
                targetCrit = 100 - sorte
            else
                targetCrit = f
            end        
            outputRoll = outputRoll .. " [ ";
            for j = 1, #op.resultados, 1 do
                if j ~= 1 then
                    outputRoll = outputRoll .. " , ";
                end;
                if op.resultados[j] >= targetCrit then
                    outputRoll = outputRoll .. critColor;
                elseif op.resultados[j] == 1 then
                    outputRoll = outputRoll .. failColor;
                else
                    outputRoll = outputRoll .. baseColor;
                end
                outputRoll = outputRoll .. math.floor(op.resultados[j]) .. baseColor;
            end;
            outputRoll = outputRoll .. " ] ";
            elseif op.tipo == "soma" then
                outputRoll = outputRoll .. "+ ";
            elseif op.tipo == "subtracao" then
                outputRoll = outputRoll .. "- ";
            elseif op.tipo == "imediato" then
                outputRoll = outputRoll .. op.valor;
            end;                
    end
    outputRoll = outputRoll .. bracketColor .. "} = " .. totalColor .. r .. msgColor .. " << " .. msg .. " >>";      
    mesa.activeChat:enviarMensagem(outputRoll); 
    return r;
end

function printRolagem(sheet, rolagem, msg, sor)
    local mesa = Firecast.getMesaDe(sheet);        
    if(mesa == nil) then
        mesa = Firecast.getMesas()[1];
    end
        local r = rolagem.resultado;
        local sorte = sor;
        if sorte == nil then
                sorte = 0;
        else
                sorte = sorte - 1;
        end
        outputRoll =  "[§K2]" .. rolagem.asString .. " [§K1] { [§K7] ";

        for i = 1, #rolagem.ops, 1 do
                local op = rolagem.ops[i];       
                if op.tipo == "dado" then
                        f = op.face;
                        local targetCrit;
                        if f == 100 then
                            targetCrit = 100 - sorte
                        else
                            targetCrit = f
                        end
                        outputRoll = outputRoll .. "[ ";
                        for j = 1, #op.resultados, 1 do
                                if j ~= 1 then
                                        outputRoll = outputRoll .. " , ";
                                end;
                                if op.resultados[j] >= targetCrit then
                                        outputRoll = outputRoll .. "[§K8]";
                                elseif op.resultados[j] == 1 then
                                        outputRoll = outputRoll .. "[§K4]";
                                else
                                    outputRoll = outputRoll .. "[§K7]";
                                end
                                outputRoll = outputRoll .. math.floor(op.resultados[j]) .. "[§K7]";
                        end;
                        outputRoll = outputRoll .. " ] ";
                elseif op.tipo == "soma" then
                        outputRoll = outputRoll .. "+";
                elseif op.tipo == "subtracao" then
                        outputRoll = outputRoll .. "-";
                elseif op.tipo == "imediato" then
                        outputRoll = outputRoll .. op.valor;
                end;                
        end
        outputRoll = outputRoll .. "[§K1]} = [§K9]" .. r .. "[§K14]<< " .. msg .. " >>";      

        mesa.activeChat:enviarMensagem(outputRoll);

        return r;
end--]]



function parseFormula(formula, personagem)
    result = formula
    for s in formula:gsub('%[[^%]]+%]','\0%0\0'):gsub('%z%z',''):gmatch'%z(.-)%z' do
        attribute = string.sub(s, 2, string.len(s) - 1)
        escapedS = "%[" .. attribute .. "%]"
        attrValueForChat = getAttribute(personagem ,attribute)
        result = string.gsub(result, escapedS, attrValueForChat) 
    end
    return result
end

function getAttribute(personagem, attribute)

    if (personagem ~= nil and personagem.atributos ~= nil) then
        if(attribute == "PV" and personagem.atributos.vidaAtual) then
            return personagem.atributos.vidaAtual;
        elseif(attribute == "PM" and personagem.atributos.recursoAtual) then
            return personagem.atributos.recursoAtual;
        elseif(attribute == "REC" and personagem.atributos.recurso) then
            return personagem.atributos.recurso;
        elseif(attribute == "VID" and personagem.atributos.vida) then
            return personagem.atributos.vida;
        elseif(attribute == "RMAG" and personagem.atributos.resistenciaMagica) then
            return personagem.atributos.resistenciaMagica;
        elseif(attribute == "MAG" and personagem.atributos.magia) then
            return personagem.atributos.magia;
        elseif(attribute == "SOR" and personagem.atributos.sorte) then
            return personagem.atributos.sorte;
        elseif(attribute == "AGI" and personagem.atributos.agilidade) then
            return personagem.atributos.agilidade;
        elseif(attribute == "DEF" and personagem.atributos.defesa) then
            return personagem.atributos.defesa;
        elseif(attribute == "ATQ" and personagem.atributos.ataque) then
            return personagem.atributos.ataque;
        elseif(attribute == "NV" and personagem.nivel) then
            return personagem.nivel;
        elseif(attribute == "PROF" and personagem.proficiencia) then
            return personagem.proficiencia;
        end
    end
    return 0            
end

function isValidRoll( rolagem )
    local rolagemCheck = Firecast.interpretarRolagem(rolagem);
    return #rolagemCheck.ops > 0;
end

function concatanateRollsToText( rolagem1, rolagem2)

    proll1 = parseFormula(rolagem1)
    proll2 = parseFormula(rolagem2)

    local roll1 = Firecast.interpretarRolagem(proll1);
    local roll2 = Firecast.interpretarRolagem(proll2);

    msg = ""
    if(#roll1.ops > 0) then
        msg = rolagem1
    end
    if(#roll2.ops > 0) then
        if (#roll1.ops > 0) then
            msg = msg .. " ";
            if (roll2.ops[1].tipo == "dado" or roll2.ops[1].tipo == "imediato") then
                msg = msg .. "+ "
            end
        end
        msg = msg .. rolagem2
    end
    return msg;
end

function getRollText( rolagem )
    local msg = "";
    for i = 1, #rolagem.ops, 1 do  
        local operacao = rolagem.ops[i];      
        -- Vamos verificar que tipo de operação é esta.      
        if operacao.tipo == "dado" then        
            msg = msg .. operacao.quantidade .. "d" .. operacao.face; 
        elseif operacao.tipo == "imediato" and i == 1 then
            msg = msg .. "+" .. operacao.valor;
        elseif operacao.tipo == "imediato" then
            msg = msg .. operacao.valor;
        elseif operacao.tipo == "subtracao" then
            msg = msg .. "-";
         elseif operacao.tipo == "soma" then
            msg = msg .. "+";
        end;
    end; 
    return msg;
end

function getBuffsForAction(personagem, action)
   if(personagem ~= nil and personagem.buffs ~= nil) then
        listaBuffs = NDB.getChildNodes(personagem.buffs);
        if(listaBuffs ~= nil) then
            for _, buff in pairs(listaBuffs) do
                if(buff ~= nil and buff.ativo == true and (buff.formula ~= nil or buff.vantagem ~= nil) and buff.nome ~= nil and buff.nome == action) then
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

function getPersonagemWithBuffs( personagem, action )
    local tempPersonagem = NDB.newMemNodeDatabase()
    NDB.copy(tempPersonagem, personagem)
    if(personagem.buffs ~= nil) then
        NDB.clearNode(tempPersonagem.buffs)
        listaBuffs = NDB.getChildNodes(personagem.buffs);
        if(listaBuffs ~= nil) then
            for _, buff in pairs(listaBuffs) do
                if(buff ~= nil and buff.ativo == true and buff.acao == action and (buff.formula ~= nil or buff.vantagem ~= nil) and buff.nome ~= nil) then
                    nBuff = NDB.createChildNode(tempPersonagem.buffs, buff.nome);
                    nBuff.ativo = buff.ativo
                    nBuff.nome = buff.nome
                    nBuff.formula = buff.formula
                    nBuff.vantagem = buff.vantagem
                end
            end
        end
    end
    return tempPersonagem;
end

function applyBuffs( rolagem, vantagem, nome)
    if(personagem.buffs ~= nil) then
        listaBuffs = NDB.getChildNodes(personagem.buffs);
        if(listaBuffs ~= nil) then
            for key, buff in pairs(listaBuffs) do
                if(buff ~= nil) then
                    if(buff.formula ~= nil) then
                        rolagem = concatanateRollsToText(rolagem, buff.formula)             
                    end
                    if(buff.vantagem ~= nil) then
                        vantagem = vantagem + buff.vantagem;                    
                    end
                    if(buff.nome ~= nil) then
                        nome = nome .. " + " .. buff.nome
                    end
                end
            end
        end
    end
    return rolagem, vantagem, nome;
end