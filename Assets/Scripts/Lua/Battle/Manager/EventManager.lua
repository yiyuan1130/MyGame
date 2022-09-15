local EventManager = ClassStatic("EventManager")
local this = EventManager
function EventManager.Init()
    this.eventDict = {}
end

function EventManager.AddListener(eventType, onwer, func)
    if not this.eventDict[eventType] then
        this.eventDict[eventType] = {}
    end
    if not this.eventDict[eventType][onwer] then
        this.eventDict[eventType][onwer] = {}
    end
    table.insert(this.eventDict[eventType][onwer], func)
end

function EventManager.RemoveListener(eventType, onwer, func)
    if this.eventDict[eventType] then
        if this.eventDict[eventType][onwer] then
            for i = #this.eventDict[eventType][onwer], 1, -1 do
                if func == this.eventDict[eventType][onwer] then
                    table.remove(this.eventDict[eventType][onwer], i)
                end
            end
        end
    end
end

function EventManager.SendEvent(eventType, ...)
    local eventDic = this.eventDict[eventType]
    if eventDic then
        for onwer, funcList in pairs(eventDic) do
            for i = 1, #funcList do
                local func = funcList[i]
                func(onwer, ...)
            end
        end
    end
end

function EventManager.Close()
    this.eventDict = nil
end