local Skill, base = Class("Skill")
function Skill:OnCreate(id, data, skillType)
    self.id = id
    self.caster = data.caster
    self.skillType = skillType
    self.startCasted = false
    self.template = data.template
end

function Skill:Cast()
    self.timerList = {}
    for i = 1, #self.template.Timer do
        local timer = self.template.Timer[i]
        local time = timer.Time
        local actions = timer.Actions
        table.insert(self.timerList, {time = time, actions = actions})
    end
    self.curDuration = 0
    self.maxDuration = self.template.Duration
    self.startCasted = true
end

function Skill:Update(deltaTime)
    if self.startCasted then
        self.curDuration = self.curDuration + deltaTime
        if self.curDuration >= self.maxDuration then
            self.startCasted = false
            self:StopCast()
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
end

function Skill:StopCast()
    self.startCasted = false
end

function Skill:Close()
end

------------------------------ Actions ------------------------------
function Skill:ActionAttachEffect(data)
    local effect = ResourcesManager.Load(data.EffectName, ResourceConst.ResType.Effect)
    local pos = data.Position
    effect.transform.position = Vector3(pos[1], pos[2], pos[3])
end
function Skill:ActionApplyModifier(data)
    local modifierTemplate = self.template.Modifiers[data.ModifierName]
    local targets = SkillUtil.GetActionTargets(self.caster, data)
    for i = 1, #targets do
        local target = targets[i]
        local data = {
            template = modifierTemplate,
            preSkill = self,
            preModifier = nil,
            caster = self.caster,
            applyActor = target,
        }
        ModifierManager.CreateModifier(data)
    end
end

