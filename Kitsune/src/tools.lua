function printAllChildren(node)
	message = "printAllChildren: " .. NDB.getNodeName(node) .. "\n";
	listaChilds = NDB.getChildNodes(node);
	for key,child in pairs(listaChilds) do
		message = message .. "\n" .. key .. "=" .. NDB.getNodeName(child);
	end
	showMessage(message);
end

function printAllAttr(node)
	message = "printAllAttr:\n[node=".. NDB.getNodeName(node).."]\n";

	listaAttr = NDB.getAttributes(node);
	for key,Attr in pairs(listaAttr) do
		message = message .. "\n" .. key .. "=" .. tostring(Attr);
	end
	showMessage(message);
end

function printAllAttr(node, msg)
	message = "printAllAttr:\n[".. msg .."=".. NDB.getNodeName(node).."]\n";

	listaAttr = NDB.getAttributes(node);
	for key,Attr in pairs(listaAttr) do
		message = message .. "\n" .. key .. "=" .. tostring(Attr);
	end
	showMessage(message);
end

function printParents(node)
	nodeName = NDB.getNodeName(node);
	message = "printParent: " .. NDB.getNodeName(node) .. "\n";

	parent = NDB.getParent(node);
	message = message .. "\n" .. NDB.getNodeName(parent);

	showMessage(message);
end

function getChildNodeByName(node, name)
	listaChilds = NDB.getChildNodes(node);
	for key,child in pairs(listaChilds) do
		childName = NDB.getNodeName(child)
		if (childName == name) then
			return child;
		end
	end
	return nil;
end

function diplayNodeName(node, varname)
	showMessage("["..varname .."=".. NDB.getNodeName(node).."]");
end

function printMsgChar(char, msg)
	if(char ~= nil) then
   		mesa = getMesa( char );
	end
   	if(mesa ~= nil) then
        mesa.activeChat:enviarMensagem(msg);
   	end
end

function getMesa( sheet )
	mesa =  Firecast.getRoomOf(sheet);
	if(mesa == nil) then
		mesa = Firecast.getMesaDe(sheet);
	end
	if(mesa == nil) then
		jogador = Firecast.getCurrentUser();
		-- showMessage(jogador);
		mesa = Firecast.getMesaDe(jogador);
	end
	if(mesa == nil) then
		jogador = Firecast.getCurrentUser();
		-- showMessage(jogador);
		mesa = Firecast.getRoomOf(jogador);
	end
	if(mesa == nil and sheet.mesa ~= nil) then
		mesa = sheet.mesa;
	end
	if(mesa == nil and globalmesa ~= nil) then
		mesa = globalmesa;
	end
	if(mesa == nil) then
		printAllAttr(sheet, "Erro ao procurar mesa!!")
	end
    return mesa;
end