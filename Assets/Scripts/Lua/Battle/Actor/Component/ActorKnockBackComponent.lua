local ActorKnockBackComponent, base = Class("ActorKnockBackComponent", BaseComponent)
ActorKnockBackComponent.Name = "ActorKnockBackComponent"


function ActorKnockBackComponent:OnCreate(actor)
    base.OnCreate(self, actor)
    self.actor = actor
    self.moveCom = self.actor:GetComponent(ActorMoveComponent)
end

function ActorKnockBackComponent:Update(deltaTime)
    base.Update(self, deltaTime)
    if self.isStart then
        -- self.moveCom:AddMove(MathUtil.AngleToVector(self.angle) * self.konckBackSpeed * deltaTime)
        self.moveCom:AddMove(self.dir * self.konckBackSpeed * deltaTime)
        self.curDuration = self.curDuration + deltaTime
        if self.curDuration >= self.duration then
            self:ToEnd()
        end
    end
end

-- function ActorKnockBackComponent:ToStart(angle, distance, time)
--     self.angle = angle
--     self.isStart = true
--     self.curDuration = 0
--     self.duration = time
--     self.distance = distance
--     self.konckBackSpeed = distance / time
-- end

function ActorKnockBackComponent:ToStart(dir, distance, time)
    self.dir = dir
    self.isStart = true
    self.curDuration = 0
    self.duration = time
    self.distance = distance
    self.konckBackSpeed = distance / time
end

function ActorKnockBackComponent:ToEnd()
    self.isStart = false
end

function ActorKnockBackComponent:Close()
end