local LogService = game:GetService("LogService")
local HttpService = game:GetService("HttpService")

function getthreadidentity() : number
	local bindableEvent = Instance.new("BindableEvent")
	local prefix = HttpService:GenerateGUID(false)
	local messageOut
	messageOut = LogService.MessageOut:Connect(function(message)
		local _, prefixEnd = message:find(prefix, 1, true)

		if prefixEnd then
			messageOut:Disconnect()
			local threadidentity = tonumber(message:match("%d+", prefixEnd + 1))
			bindableEvent:Fire(threadidentity)
			return
		end
	end)

	printidentity(prefix)
	local threadidentity = bindableEvent.Event:Wait()
	bindableEvent:Destroy()
	return threadidentity
end
