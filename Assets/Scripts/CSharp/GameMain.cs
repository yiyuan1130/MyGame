using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using XLua;
using System;
using System.IO;

public class GameMain : MonoBehaviour
{
    LuaEnv env;

    [CSharpCallLua]
    public interface LuaMain{
        void Init();
        void Update(float deltaTime);
    }
    LuaMain luaMain;

    private void Awake()
    {
        env = new LuaEnv();
        env.AddLoader(MyLoader);
        env.DoString("require ('main')");
        luaMain = env.Global.Get<LuaMain>("Main");
        luaMain.Init();
        BattleCommondManager.Init();
        BattleRendererManager.Init();
    }

    byte[] MyLoader(ref string filePath) {
        string path = Application.dataPath + "/Scripts/Lua/" + filePath + ".lua";
        return File.ReadAllBytes(path);
    }

    void Start()
    {
        //GameObject go = Resources.Load<GameObject>("players/playerPrefab");
        //GameObject player = Instantiate(go);
        //player.name = "player11111";
    }

    // Update is called once per frame
    void Update()
    {
        luaMain.Update(Time.deltaTime);
        BattleCommondManager.Update();
        BattleRendererManager.Update();
    }
}
