function rollTeste(sheet, roll, sor, msg)
        local mesa = Firecast.getMesaDe(sheet);     
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
  
        crit, fail = checkCriticalnFail(rolagem, fail, sorte);

        limit = 0;
        critMsg = "Critico!!!";

        while( crit > 0 and limit < 10)
        do
            limit = limit + 1;
            critMsg = "Critico!!! " .. limit;
            critroll = rollCritical(crit, sorte);
            resultC = printRolagem(sheet, critroll, critMsg, sorte);
            mesa.activeChat:enviarMensagem(" [§K7]" .. resultR .. " + [§K8]" .. resultC .. "[§K1] = [§K12]" .. resultR+resultC);
            crit, fail = checkCriticalnFail(critroll, fail, sorte);
            resultR=resultR+resultC;
        end

        if fail > 0 then
            mesa.activeChat:enviarMensagem("Critical Fail!!! " .. fail);       
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

function printRolagem(sheet, rolagem, msg, sor)
        local mesa = Firecast.getMesaDe(sheet);
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


