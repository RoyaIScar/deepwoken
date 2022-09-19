-- old ship ban script by scartesu
-- doesnt work anymore

local runservice = game:GetService("RunService")
local super_stepped = Instance.new("BindableEvent") do
	local events = {
		runservice.RenderStepped,
		runservice.Heartbeat,
		runservice.Stepped,
		runservice.PreSimulation,
		runservice.PostSimulation
	}
	for i, v in pairs(events) do
		v:Connect(function()
			super_stepped.Fire(super_stepped, tick())
		end)
	end
end
function getboat()
	for _, v in pairs(game.workspace:GetDescendants()) do
		if v.Name == "Hull" and v.Parent.Name == "Dinghy" then
			local lolboat = (v.Position - game.Players.LocalPlayer.Character.Torso.Position).magnitude
			if lolboat < 10 then
				return v.Parent
			end
		end
	end
	return nil
end

local boat = getboat()

if boat ~= nil then
printconsole("wegottaboat")

local body_angular_velocity = Instance.new("BodyAngularVelocity")
body_angular_velocity.AngularVelocity = Vector3.new(8000, 8000, 8000)
body_angular_velocity.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
body_angular_velocity.P = 50000
body_angular_velocity.Parent = boat.Hull
local niga
niga = super_stepped.Event:Connect(function()
boat:SetPrimaryPartCFrame(game.Players["Scartesu"].Character.Torso.CFrame) 
boat.Hull.Velocity = Vector3.new(14.46262424,14.46262424,14.46262424)
for _,v in pairs(boat:GetChildren()) do
    if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("UnionOperation") then
        v.CanCollide = false
     end
 end
for _,v in pairs(boat:GetDescendants()) do
if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("UnionOperation") then
v.CanCollide = false
       end
    end
if boat == nil then
niga:Disconnect()
       end
   end)
end

