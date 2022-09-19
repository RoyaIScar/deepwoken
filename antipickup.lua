local runservice = game:GetService("RunService")

runservice.RenderStepped:connect(function()
pcall(function() -- this is faster then checking for it then destroying it so i picked this method instead because why not
game.Players.LocalPlayer.Character.HumanoidRootPart.CarryJoint:Destroy()
    end)
end)
