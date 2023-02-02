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
            self.curFlyupDuration = self.curFlyupDuration + deltaTime
        end
        if self.flydown then
            self.curFlydownDuration = self.curFlydownDuration + deltaTime
        end
        self.curDuration = self.curFlyupDuration + self.curFlydownDuration

        self.curHeight = self:GetYByDuration(self.curDuration)
        self.actor.gameObject.transform.position = Vector3(self.actor.gameObject.transform.position.x, self.curHeight, self.actor.gameObject.transform.position.z)

        self.curDuration = self.curDuration + deltaTime
        if self.curDuration >= self.duration then
            self:ToEnd()
        end
    end
end

function ActorKnockUpComponent:ToStart(height, flyupTime, flydownTime)
    self.height = height
    self.flyupTime = flyupTime
    self.flydownTime = flydownTime
    self.flyupSpeed = self.height / self.flyupTime
    self.flydownSpeed = self.height / self.flydownTime
    
    if self.isStart then
        if self.flyup then
            -- self.flyupTime = (self.height - self.curHeight) / self.flyupSpeed
        end
        if self.flydown then
            self.flyup = true
            self.flydown = false
            self.curFlyupDuration = self.flydownTime - self.curFlydownDuration
            -- self.flyupTime = (self.height - self.curHeight) / self.flyupSpeed
        end
    else
        self.isStart = true
        self.flyup = true
        self.flydown = false
        self.curHeight = 0
        self.curDuration = 0
        self.curFlyupDuration = 0
        self.curFlydownDuration = 0
    end
    self.duration = self.flyupTime + self.flydownTime
end

function ActorKnockUpComponent:GetYByDuration(dur)
    local x = self.curDuration / self.duration * Mathf.PI
    return self.height * Mathf.Sin(x)
end

function ActorKnockUpComponent:ToEnd()
    self.isStart = false
    self.curDuration = 0
end

function ActorKnockUpComponent:Close()
end