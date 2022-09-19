-- PATCHED






-- auto sacrifice for deepwoken, very bad coded and scuffed overall but simple demonstration, this would be a problem if people used it as the sacrifice command gives tons of hp instantly which is unfair

-- HOW TO USE: execute on both the master and the slave client, if the master gets lower then the value in the config it will teleport the slave and run the sacrifice command on it from the master automatically
-- REQUIREMENTS: vow of mastery (obviously), an alt account, the rare sacrifice card in vow of mastery, and you also need to perform vow of mastery on your alt account

local users = {
master = {"Scartesu"}, -- the vow of mastery owner
slave = {"leeooy"}, -- the sacrifice

mastername = "Scartesu", -- dont ask its 6am my brain is fried
niganame = "leeooy" -- dont ask its 6am my brain is fried

}


local minhealth = 230 -- if the master has this amount of health or lower the sacrifice will teleport
local slavehealth = 50 -- if the slave has this amount of health or lower the sacrifice will not bother teleporting as its too low
local slavename = "winter" -- put the slaves name here (lowercase)

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


local chat = require(game.Players.LocalPlayer.PlayerScripts.ChatScript.ChatMain).MessagePosted
local masta = false
local niga = false

if table.find(users.master,game.Players.LocalPlayer.Name) then
masta = true
elseif table.find(users.slave,game.Players.LocalPlayer.Name) then
niga = true
end


if masta == true then
printconsole("masta is true")
elseif niga == true then
printconsole("niga is true")
end


runservice.Stepped:connect(function()
pcall(function()
if masta == true then
    local niggmag = (game.Players[users.niganame].Character.Torso.Position - game.Players.LocalPlayer.Character.Torso.Position).magnitude
    if niggmag < 150  then
        
        chat:fire(""..slavename.." sacrifice")
        end
        if game.Players.LocalPlayer.Character.Humanoid.Health < minhealth then
            chat:fire(""..slavename.. " sleep")
        end
    end
if niga == true then
if game.Players[users.mastername].Character.Humanoid.Health < minhealth and game.Players.LocalPlayer.Character.Humanoid.Health > slavehealth then
for _,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
 if v:IsA("Part") or v:IsA("MeshPart") then
v.CanCollide = false
    end
end
    for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
       if v:IsA("Part") or v:IsA("MeshPart") then
        v.CanCollide = false
    end
 end



    for i = 1,50 do
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[users.mastername].Character.Torso.CFrame + Vector3.new(0,1,0)
            game.Players.LocalPlayer.Character.Torso.CFrame = game.Players[users.mastername].Character.Torso.CFrame + Vector3.new(0,1,0)
            game.Players.LocalPlayer.Character.Head.CFrame = game.Players[users.mastername].Character.Torso.CFrame + Vector3.new(0,1,0)
            game.Players.LocalPlayer.Character["Left Arm"].CFrame = game.Players[users.mastername].Character.Torso.CFrame  + Vector3.new(0,1,0)
            game.Players.LocalPlayer.Character["Right Arm"].CFrame = game.Players[users.mastername].Character.Torso.CFrame + Vector3.new(0,1,0)
            game.Players.LocalPlayer.Character["Left Leg"].CFrame = game.Players[users.mastername].Character.Torso.CFrame + Vector3.new(0,1,0)
            game.Players.LocalPlayer.Character["Right Leg"].CFrame = game.Players[users.mastername].Character.Torso.CFrame + Vector3.new(0,1,0)
            game.Players.LocalPlayer.Character.Head:Destroy() -- attempt to not get banned lol
            end
        end
      end
   end)
end)
