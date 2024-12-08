local function InspectGame()
	local player = game:GetService("Players").LocalPlayer
	local character = player.Character or player.CharacterAdded:Wait()
	local humuanoid = character:WaitForChild("Humanoid")
	local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
	
	local Replic = game:GetService("ReplicatedStorage")
	
	
	for i,v in ipairs(player:GetChildren()) do
		if v:IsA("IntValue") then
			print("Player : ".. tostring(v) .." : IntValue | Value = ".. tostring(v.Value))
		
		elseif v:IsA("BoolValue") then
			print("Player : ".. tostring(v) .." : BoolValue | Value = ".. tostring(v.Value))
		
		elseif v:IsA("StringValue") then
			print("Player : ".. tostring(v) .." : StringValue | Value = ".. tostring(v.Value))
			
		else
			print("Player : ".. tostring(v) ..)
		end
	
		for a,b in ipairs(v:GetChildren()) do
			if b:IsA("IntValue") then
				print("Player : ".. tostring(v) .. " | Child : ".. tostring(b) .." : IntValue | Value = ".. tostring(b.Value))
				
			elseif b:IsA("BoolValue") then
				print("Player : ".. tostring(v) .. " | Child : ".. tostring(b) .." : BoolValue | Value = ".. tostring(b.Value))
				
			elseif b:IsA("StringValue") then
				print("Player : ".. tostring(v) .. " | Child : ".. tostring(b) .." : StringValue | Value = ".. tostring(b.Value))
				
			else
				print("Player : ".. tostring(v) .. " | Child : ".. tostring(b))
			end
		end
	end
	
	for i,v in ipairs(Replic:GetChildren()) do
		if v:IsA("RemoteEvent") then
			print("ReplicatedStorage : RemoteEvent : ".. tostring(v))
			
		elseif v:IsA("RemoteFunction") then
			print("ReplicatedStorage : RemoteFunction : ".. tostring(v))
		
		elseif v:IsA("ModuleScript") then
			print("ReplicatedStorage : ModuleScript : ".. tostring(v))

		elseif v:IsA("Folder") then
			print("ReplicatedStorage : Folder : ".. tostring(v))
			
			for a,b in ipairs(v:GetChildren()) do
				print("ReplicatedStorage : Folder : ".. tostring(v.Name) .." | Type : "..  tostring(type(b) .." | Name : ".. tostring(v.Name)))
			end
			
		end
	end
	
	for i,v in ipairs(workspace:GetChildren()) do
		if v:IsA("Folder") then
			for a,b in ipairs(v:GetChildren()) do
				print("Workspace : Folder : ".. tostring(v) .." | Child : ".. tostring(b))
			end
			
		else
			print("Workspace : ".. tostring(v) .." | Type : ".. tostring(type(v)))
			
		end
	end
end
InspectGame()
