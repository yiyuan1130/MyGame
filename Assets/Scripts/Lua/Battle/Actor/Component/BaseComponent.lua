local BaseComponent = Class("BaseComponent")
function BaseComponent:OnCreate(actor)
    self.actor = actor
end

function BaseComponent:Update(deltaTime)
end

function BaseComponent:Close()
    self.actor = nil
end