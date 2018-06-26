function printAllChildren(node)
	message = "printAllChildren: " .. ndb.getNodeName(node) .. "\n";
	listaChilds = ndb.getChildNodes(node);
	for key,child in pairs(listaChilds) do
		message = message .. "\n" .. key .. "=" .. ndb.getNodeName(child);
	end
	showMessage(message);
end

function printAllAttr(node)
	message = "printAllAttr:\n";
	
	listaAttr = ndb.getAttributes(node);
	for key,Attr in pairs(listaAttr) do
		message = message .. "\n" .. key .. "=" .. tostring(Attr);
	end
	showMessage(message);
end

function printParents(node)
	nodeName = ndb.getNodeName(node);
	message = "printParent: " .. ndb.getNodeName(node) .. "\n";

	parent = ndb.getParent(node);
	message = message .. "\n" .. ndb.getNodeName(parent);

	showMessage(message);
end

function getChildNodeByName(node, name)
	listaChilds = ndb.getChildNodes(node);
	for key,child in pairs(listaChilds) do
		childName = ndb.getNodeName(child)
		if (childName == name) then
			return child;
		end
	end
	return nil;
end