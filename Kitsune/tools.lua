function printAllChildren(node)
	message = "printAllChildren\n";
	listaChilds = ndb.getChildNodes(node);
	for key,child in pairs(listaChilds) do
		message = message .. "\n" .. key .. "=" .. ndb.getNodeName(child);
	end
	showMessage(message);
end

function printAllAttr(node)
	message = "printAllAttr\n";
	showMessage("printAllAttr");
	listaAttr = ndb.getAttributes(node);
	for key,Attr in pairs(listaAttr) do
		message = message .. "\n" .. key .. "=" .. tostring(Attr);
	end
	showMessage(message);
end