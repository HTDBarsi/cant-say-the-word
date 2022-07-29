if game.PlaceId == 10175705301 then
    local chr = game.Players.LocalPlayer.Character
    getgenv().cmds = {
        ["Word bypass"] = function() for _,v in next, getconnections(game.Players.LocalPlayer.Chatted) do v:Disable() end end,
        ["Stairs-begone"] = function()
            for _,stair in next, workspace.Stairs:GetChildren() do
                for _,v in next, stair:GetChildren() do
                    firetouchinterest(v,game.Players.LocalPlayer.Character.HumanoidRootPart,0)
                    firetouchinterest(v,game.Players.LocalPlayer.Character.HumanoidRootPart,1)
                end
             end
        end,
        ["spleef-begone"] = function()
            for _,v in next, game:GetService("Workspace").Spleef:GetChildren() do
                firetouchinterest(v,game.Players.LocalPlayer.Character.HumanoidRootPart,0)
                firetouchinterest(v,game.Players.LocalPlayer.Character.HumanoidRootPart,1)
             end
        end,
        ["get achievements"] = function()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-13.5907, -85.979, 81.7724)
            task.wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-53.5907, -85.979, 112.272)
            task.wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-93.1237, -84.0611, 227.357)
            task.wait()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-121.004, 184.079, 4.55967)
        end,
        ["remove the spinning thing"] = function()
            local shit
            for _,v in next,game:GetService("Workspace").HardObby.Rotating:GetDescendants() do
            if v.Name == "HingeConstraint" then
                shit = v
            end
            end
            task.wait()
            for _ = 1,25 do task.wait()
                chr.HumanoidRootPart.CFrame = CFrame.new(workspace.HardObby.Rotating.Part.Position+Vector3.new(0,2,0))
                shit.AngularVelocity = 9e9
            end
            task.wait()
            chr.Humanoid.Health = 0
        end,
        ["change text of stands"] = function()
            for i = 1,6 do
                game:GetService("Workspace")["Booth"..i].ClaimBooth.ChangeText.UpdateSign:FireServer("silverware winning 💀");
            end
        end,
        ["inf time"] = function()
            while task.wait() do    
                game:GetService("Players").LocalPlayer.PlayerGui.LocalScript.RemoteEvent:FireServer()
            end
        end
    }
end

local on = true
local parts = {}
local wowza = Instance.new("Folder")

function gen(cmd,code)
	local a = Instance.new("Part",workspace)
	a.Size = Vector3.new(4,2,1)
	a.Anchored = true
	a.CanCollide = false
	a.BrickColor = BrickColor.new("Really blue")
	a.Transparency = 0.25
	a.Material = Enum.Material.Neon
	a.Name = "cmd"
	local b = Instance.new("BillboardGui",a)
	b.AlwaysOnTop = true
	b.Size = UDim2.new(5,0,5,0)
	local c = Instance.new("TextLabel",b)
	c.BackgroundTransparency = 1 
	c.Text = cmd 
	c.TextScaled = true 
    c.TextWrapped = true
	c.Size = UDim2.new(1,0,1,0)
    c.TextColor3 = Color3.new(1,1,1)
	local d = Instance.new("ClickDetector",a)
	d.MouseClick:Connect(code)
	return a 
end

for i,v in pairs(cmds) do 
	table.insert(parts,gen(i,v))
end

function getpos(ang)
	return math.cos(ang) * #parts*1.25, math.sin(ang) * #parts*1.25
end

game:GetService("UserInputService").InputBegan:Connect(function(k,t)
	if not t then
		if k.KeyCode == Enum.KeyCode.RightAlt then
			on = not on
			if on then
				for i,v in next, parts do 
					v.Parent = workspace
				end
			else
				for i,v in next, parts do 
					v.Parent = wowza
				end
			end
		end
	end
end)

local x,z
while task.wait() do 
	if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
		if on and game.Players.LocalPlayer.Character.Humanoid.Health ~= 0 then
			for i,v in pairs(parts) do 
				x,z = getpos(i*(2*math.pi/#parts))	
				v.CFrame = CFrame.new((CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position) * CFrame.new(x,1,z)).Position,game.Players.LocalPlayer.Character.HumanoidRootPart.Position)
			end
		end	
	end	
end
