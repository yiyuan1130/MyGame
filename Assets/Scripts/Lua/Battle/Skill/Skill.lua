local Skill, base = Class("Skill")
function Skill:OnCreate(id, skillTemplate, data)
    self.id = id
    self.startCasted = false
    self.curDuration = 0
    self.timerList = {}
    self.maxDuration = skillTemplate.Duration
    for i = 1, #skillTemplate.Timer do
        local timer = skillTemplate.Timer[i]
        local time = timer.Time
        local actions = timer.Actions
        table.insert(self.timerList, {time = time, actions = actions})
    end
end

function Skill:Cast()
    self.startCasted = true
end

function Skill:Update(deltaTime)
    if self.startCasted then
        self.curDuration = self.curDuration + deltaTime
        if self.curDuration >= self.maxDuration then
            self.startCasted = false
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

function Skill:ActionCreateEffect(data)
    local effect = ResourcesManager.Load(data.EffectName, ResourceConst.ResType.Effect)
    local pos = data.Position
    effect.transform.position = Vector3(pos[1], pos[2], pos[3])
end

function Skill:Close()
end
