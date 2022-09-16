local Skill, base = Class("Skill", SkillBase)
function Skill:OnCreate(id, skillScript, data)
    base.OnCreate(self, id, skillScript, data)
    self.startCasted = false
    self.curDuration = 0
    self.timerList = {}
    self.maxDuration = skillScript.Duration
    for i = 1, #skillScript.Timer do
        local timer = skillScript.Timer[i]
        local time = timer.Time
        local actions = timer.Actions
        table.insert(self.timerList, {time = time, actions = actions})
    end
end

function Skill:ToCast()
end

function Skill:Update(deltaTime)
    if self.startCasted then
        self.curDuration = self.curDuration + deltaTime
        if self.curDuration >= self.maxDuration then
            self.startCasted = false
            return
        end
        for i = #self.timerList, 1, -1 do
            local timer = self.timerList[i]
            if self.curDuration >= timer.Time then
                SkillUtil.DoActions(timer.actions)
                table.remove(self.timerList, i)
            end
        end
    end
end

function Skill:Close()
end
