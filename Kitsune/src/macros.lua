function rollTeste2(roll, sorte, vantagem, desejo, falhasOp, mesa, msg)
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



    local rolagem = Firecast.interpretarRolagem(roll); 
    rolagem:rolarLocalmente();
    resultR = printRolagem2(mesa, rolagem, msg, sorte);
    local crit = 0;
    local fail = 0;
    crit, fail = checkCriticalnFail(rolagem, fail, sorte);
    local totalCrit = crit + vantagem + 1;
    local resultados = "" .. resultR;
    
    limit = 0;
    critMsg = "Critico!!! X" .. limit;

    local msgDesejo = "";
    if(desejo > 0) then
        msgDesejo = " [§K9] Desejo ".. desejo .. " ";
    end
    local msgFalhaOp = "";
    local resultF = 0;
    if(falhasOp > 0) then
        opFailRoll = rollCritical(falhasOp, sorte);
        resultF = printRolagem2(mesa, opFailRoll, "Falha Oponente x" .. falhasOp, sorte);
        msgFalhaOp = " [§K2]Falha Oponente x" .. falhasOp .. " = " .. resultF;
        resultados = resultados .. " + " .. resultF;
    end
    local msgVantagem = ""; 
    if(vantagem > 0) then
        msgVantagem = " [§K11] Vantagem ".. vantagem .. " ";
    end
    if(falhasOp > 0 or desejo > 0 or vantagem > 0) then
        mesa.activeChat:enviarMensagem("{" .. resultados .. "} = [§K7]" .. (resultR +  resultF) .. "[§K8] x1 +" .. msgDesejo .. msgFalhaOp .. msgVantagem .. " = [§K12]" .. (resultR+resultF)*(desejo+vantagem+falhasOp+1));
    end

    while( crit > 0 and limit < 10)
    do
        limit = limit + 1;
        critMsg = "Critico!!! x" .. crit;
        critroll = rollCritical(crit, sorte);
        resultC = printRolagem2(mesa, critroll, critMsg, sorte);
        crit, fail = checkCriticalnFail(critroll, fail, sorte);
        resultados = resultados .. " + " .. resultC;
        if(crit > 0) then                
            totalCrit = totalCrit + crit;                
        end
        if(crit == 0 or limit == 10) then
            mesa.activeChat:enviarMensagem("{" .. resultados .. "} = [§K7]" .. (resultR +  resultC +  resultF) .. "[§K8] x " .. totalCrit .. msgDesejo .. msgFalhaOp .. msgVantagem .. " = [§K12]" .. (resultR+resultC+resultF)*(totalCrit+vantagem+desejo+falhasOp));
        end            
        resultR=(resultR+resultC);
    end

    if fail > 0 then
        mesa.activeChat:enviarMensagem("Critical Fail!!! " .. fail);       
    end
end

function getMesa( sheet )
    local mesa = Firecast.getMesaDe(sheet);     

    if(mesa == nil) then
        mesa = rrpg.getMesas()[1];
    end

    return mesa;
end

function rollTeste(sheet, roll, sor, msg)
    local mesa = Firecast.getMesaDe(sheet);     

    if(mesa == nil) then
        mesa = rrpg.getMesas()[1];
    end

    local rolagem = Firecast.interpretarRolagem(roll); 
    rolagem:rolarLocalmente();
    resultR = printRolagem(sheet, rolagem, msg, sor);
    -- local f = 100;
    local sorte = sor;
    if sorte == nil then
        sorte = 0;
    else
        sorte = sorte - 1;
    end
    local crit = 0;
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
        resultF = printRolagem(sheet, opFailRoll, "Falha Oponente x" .. falhasOp, sorte);
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
        resultC = printRolagem(sheet, critroll, critMsg, sorte);
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
            for j = 1, #op.resultados, 1 do
                if op.resultados[j] >= f-sorte then
                    crit = crit + 1;
                end
                if op.resultados[j] == 1 then
                    fail = fail + 1;
                end
            end;
        end;
    end;
    return crit, fail;
end

function printRolagem2(mesa, rolagem, msg, sor)
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
            outputRoll = outputRoll .. "[ ";
            for j = 1, #op.resultados, 1 do
                if j ~= 1 then
                    outputRoll = outputRoll .. " , ";
                end;
                if op.resultados[j] >= f-sorte then
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
    outputRoll = outputRoll .. "[§K1]} = [§K9]" .. r .. "[§K14] << " .. msg .. " >>";      
    mesa.activeChat:enviarMensagem(outputRoll);
    return r;
end

function printRolagem(sheet, rolagem, msg, sor)
    local mesa = Firecast.getMesaDe(sheet);        
    if(mesa == nil) then
        mesa = rrpg.getMesas()[1];
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
                        outputRoll = outputRoll .. "[ ";
                        for j = 1, #op.resultados, 1 do
                                if j ~= 1 then
                                        outputRoll = outputRoll .. " , ";
                                end;
                                if op.resultados[j] >= f-sorte then
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
end