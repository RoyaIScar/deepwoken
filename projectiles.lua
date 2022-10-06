-- patched

-- fuck you skidnik and aztup for stealing this you dirty monkeys

local range = 130 -- radius of the aimbot

local projectiles = { -- add more to this if find more projectile names
"FireRing",
"SpearPart",
"WindProjectile"

}


function getnearestplayer()
for _,v in pairs(game.workspace.Live:GetChildren()) do
if v:FindFirstChild("Torso") and v:FindFirstChild("Humanoid") and v.Name ~= game.Players.LocalPlayer.Name then
    local playermag = (game.Players.LocalPlayer.Character.Torso.Position - v.Torso.Position).magnitude
    if playermag < range then
        return v.Torso
            end
        end
    end
end



game.workspace.Thrown.ChildAdded:connect(function(fire)
if table.find(projectiles,fire.Name) and fire:IsA("MeshPart") then
local target = getnearestplayer()
if target == nil then
else
while fire do task.wait()
fire.Position = target.Position
fire.Velocity = Vector3.new(00000000000000.5,00000000000000.5,00000000000000.5)

            end
        end
    end
end)
