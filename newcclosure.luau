-- Thanks for https://devforum.roblox.com/t/3560554/91

function newcclosure<A..., R...>(closure: (A...) -> (R...)): (A...) -> (R...)
	return coroutine.wrap(@native function(...)
		local func

		func = function(...)
			return func(coroutine.yield(closure(...)))
		end

		func(...)
	end)
end
