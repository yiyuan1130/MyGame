local ActorKnockDownComponent, base = Class("ActorKnockDownComponent", BaseComponent)
ActorKnockDownComponent.Name = "ActorKnockDownComponent"


function ActorKnockDownComponent:OnCreate(actor)
    base.OnCreate(self, actor)
    self.actor = actor
end

function ActorKnockDownComponent:Update(deltaTime)
    base.Update(self, deltaTime)
    
end

function ActorKnockDownComponent:ToStart()

end

function ActorKnockDownComponent:Close()
end