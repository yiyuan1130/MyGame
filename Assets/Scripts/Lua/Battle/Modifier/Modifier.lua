local Modifier = Class("Modifier")

function Modifier:OnCreate(id, data)
    self.id = id
    self.template = data.template
    self.preSkill = data.preSkill
    self.preModifier = data.preModifier
    self.caster = data.caster
    self.applyActor = data.applyActor

    self.isCreated = false

    self:AddEvent()

    self.curDuration = 0
    self.timerList = {}
    self.maxDuration = self.template.Duration or 0
    if self.template.Timer then
        for i = 1, #self.template.Timer do
            local timer = self.template.Timer[i]
            local time = timer.Time
            local actions = timer.Actions
            table.insert(self.timerList, {time = time, actions = actions})
        end
    end
    self:OnCreated()
end

function Modifier:AddEvent()
    -- EventManager.AddListener()
end

function Modifier:RemoveEvent()
end

function Modifier:Update(deltaTime)
    self.curDuration = self.curDuration + deltaTime
    if self.curDuration >= self.maxDuration then
        self.isCreated = false
        self:OnDurationEnd()
        self:OnEnd()
        return
    end
    if #self.timerList > 0 then
        for i = #self.timerList, 1, -1 do
            local timer = self.timerList[i]
            if self.curDuration >= timer.time then
                SkillUtil.DoActions(self, timer.actions)
                table.remove(self.timerList, i)
            end
        end
    end
end

function Modifier:OnEnd()
    ModifierManager.RemoveModifier(self.id)
end

function Modifier:Close()
    self:RemoveEvent()
end

------------------------------ Events ------------------------------
function Modifier:OnCreated(data)
    self.isCreated = true
    SkillUtil.DoActions(self, self.template.OnCreated)
end
function Modifier:OnDurationEnd()
    SkillUtil.DoActions(self, self.template.OnDurationEnd)
end

------------------------------ Actions ------------------------------
function Modifier:ActionAttachEffect(template)
    local data = {
        actor = self.applyActor,
        template = template,
    }
    EffectManager.CreateEffect(data)
    -- local effect = ResourcesManager.Load(data.EffectName, ResourceConst.ResType.Effect)
    -- local pos = data.Position
    -- effect.transform.position = Vector3(pos[1], pos[2], pos[3])
end

function Modifier:ActionKnockUp(data)
    self.applyActor:GetComponent(ActorKnockUpComponent):ToStart(2, 0.2, 0.2)
end

function Modifier:ActionKnockBack(data)
    local angle = MathUtil.AngleOfTwoVector(self.caster:GetPosition(), self.applyActor:GetPosition())
    local dir = self.applyActor:GetPosition() - self.caster:GetPosition()
    -- self.applyActor:GetComponent(ActorKnockBackComponent):ToStart(angle, 2, 0.05)
    self.applyActor:GetComponent(ActorKnockBackComponent):ToStart(dir.normalized, 1, 0.02)
end

function Modifier:ActionKnockDown(data)
    self.applyActor:GetComponent(ActorKnockDownComponent):ToStart()
end