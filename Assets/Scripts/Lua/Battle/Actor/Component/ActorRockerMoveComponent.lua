local ActorRockerMoveComponent, base = Class("ActorRockerMoveComponent", BaseComponent)
ActorRockerMoveComponent.Name = "ActorRockerMoveComponent"

function ActorRockerMoveComponent:OnCreate(actor)
    base.OnCreate(self, actor)
    self.actor = actor
    self.moveSpeed = self.actor.speed
    self.moveCom = self.actor:GetComponent(ActorMoveComponent)
end

function ActorRockerMoveComponent:Update(deltaTime)
    base.Update(self, deltaTime)
end

function ActorRockerMoveComponent:AddMove(rockerVec)
    local moveVec = Vector3(rockerVec.x, 0, rockerVec.y) * self.moveSpeed * Time.deltaTime
    self.moveCom:AddMove(moveVec)
    self.moveCom:ChangeAngle(MathUtil.VectorToAngle(moveVec))
end

function ActorRockerMoveComponent:Close()
    
end