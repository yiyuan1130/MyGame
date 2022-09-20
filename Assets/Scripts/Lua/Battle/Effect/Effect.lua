local Effect = Class("Effect")

function Effect:OnCreate(id, data)
    self.id = id
    self.data = data
    self.template = data.template
    self.actor = data.actor

    self.curDuration = 0
    self.maxDuration = self.template.Duration

    self.gameObject = ResourcesManager.Load(self.template.EffectName, ResourceConst.ResType.Effect)
    local pos = self.template.Position
    self.gameObject.transform.position = Vector3(pos[1], pos[2], pos[3])
end

function Effect:Update(deltaTime)
    self.curDuration = self.curDuration + deltaTime
    if self.curDuration >= self.maxDuration then
        self:OnEnd()
    end
end

function Effect:OnEnd()
    EffectManager.RemoveEffect(self.id)
end

function Effect:Close()
    ResourcesManager.Catch(self.gameObject, ResourceConst.ResType.Effect)
end