local function logValue(object, prefix)
	if object:IsA("IntValue") or object:IsA("BoolValue") or object:IsA("StringValue") then
		print(("%s%s : %s | Value = %s"):format(prefix, object.Name, object.ClassName, object.Value))
	else
		print(("%s%s : %s"):format(prefix, object.Name, object.ClassName))
	end
end

local function logChildren(parent, prefix)
	for _, child in ipairs(parent:GetChildren()) do
		logValue(child, prefix)
		if #child:GetChildren() > 0 then
			logChildren(child, prefix .. child.Name .. " | ")
		end
	end
end

local function InspectGame()
	local player = game:GetService("Players").LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	character:WaitForChild("Humanoid")
	character:WaitForChild("HumanoidRootPart")

	print("=== Player Properties ===")
	logChildren(player, "Player : ")

	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	print("=== ReplicatedStorage Contents ===")
	for _, item in ipairs(ReplicatedStorage:GetChildren()) do
		logValue(item, "ReplicatedStorage : ")

		if item:IsA("Folder") then
			logChildren(item, "ReplicatedStorage : Folder : " .. item.Name .. " | ")
		end
	end

	print("=== Workspace Contents ===")
	for _, item in ipairs(workspace:GetChildren()) do
		if item:IsA("Folder") then
			logChildren(item, "Workspace : Folder : " .. item.Name .. " | ")
		else
			print(("Workspace : %s | Type : %s"):format(item.Name, item.ClassName))
		end
	end
end
InspectGame()

