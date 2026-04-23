local UserInputService = game:GetService("UserInputService")
local isFocused = true

function setFocusTrue()
    isFocused = true
end

function setFocusFalse()
    isFocused = false
end

UserInputService.InputBegan:Connect(setFocusTrue)
UserInputService.WindowFocused:Connect(setFocusTrue)
UserInputService.WindowFocusReleased:Connect(setFocusFalse)

function isrbxactive(): boolean
	return isFocused
end
