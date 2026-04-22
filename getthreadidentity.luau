local LogService = game:GetService("LogService")
local HttpService = game:GetService("HttpService")

function getthreadidentity(): number
	local prefix = HttpService:GenerateGUID(false)
	local runningCoroutine = coroutine.running() -- Capture the current thread
	local connection

	connection = LogService.MessageOut:Connect(function(message)
		local _, prefixEnd = message:find(prefix, 1, true)
		if not prefixEnd then return end

		connection:Disconnect()
		local threadidentity = tonumber(message:match("%d+", prefixEnd + 1))

		task.spawn(runningCoroutine, threadidentity) 
	end)

	task.defer(printidentity, prefix)

	return coroutine.yield()
end
