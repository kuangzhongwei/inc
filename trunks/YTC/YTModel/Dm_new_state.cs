﻿using System;
using System.Data;
using System.Text;

public class Dm_new_state
{

    private int state_id;
    public int State_id
    {
        get { return state_id; }
        set { state_id = value; }
    }
    private DateTime last_date;
    public DateTime Last_date
    {
        get { return last_date; }
        set { last_date = value; }
    }
    private string explain;
    public string Explain
    {
        get { return explain; }
        set { explain = value; }
    }
    private string memo;
    public string Memo
    {
        get { return memo; }
        set { memo = value; }
    }
    private string flag;
    public string Flag
    {
        get { return flag; }
        set { flag = value; }
    }
}
