local ActorKnockUpComponent, base = Class("ActorKnockUpComponent", BaseComponent)
ActorKnockUpComponent.Name = "ActorKnockUpComponent"


function ActorKnockUpComponent:OnCreate(actor)
    base.OnCreate(self, actor)
    self.actor = actor
    self.moveCom = self.actor:GetComponent(ActorMoveComponent)
end

function ActorKnockUpComponent:Update(deltaTime)
    base.Update(self, deltaTime)
    if self.isStart then

        self.flyup = self.curDuration < self.flyupTime
        self.flydown = self.curDuration >= self.flyupTime and self.curDuration <= self.duration

        if self.flyup then
            self.moveCom:AddMove(Vector3.up * self.flyupSpeed * deltaTime)
        end

        if self.flydown then
            self.moveCom:AddMove(Vector3.down * self.flydownSpeed * deltaTime)
        end

        self.curDuration = self.curDuration + deltaTime
        if self.curDuration >= self.duration then
            self:ToEnd()
        end
    end
end

function ActorKnockUpComponent:ToStart(height, flyupTime, flydownTime)
    self.isStart = true
    self.height = height
    self.curDuration = 0
    self.duration = flyupTime + flydownTime
    self.flyupTime = flyupTime
    self.flydownTime = flydownTime
    self.flyupSpeed = self.height / self.flyupTime
    self.flydownSpeed = self.height / self.flydownTime
    self.flyup = true
    self.flydown = false
end

function ActorKnockUpComponent:ToEnd()
    self.isStart = false
end

function ActorKnockUpComponent:Close()
end