function getrunningscripts() : {LuaSourceContainer}
	return game:QueryDescendants("LuaSourceContainer[Enabled=true],ModuleScript")
end
