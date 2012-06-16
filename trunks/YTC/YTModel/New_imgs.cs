using System;
using System.Data;
using System.Text;

public class New_imgs
{

    private int img_id;
    public int Img_id
    {
        get { return img_id; }
        set { img_id = value; }
    }
    private int new_id;
    public int New_id
    {
        get { return new_id; }
        set { new_id = value; }
    }
    private DateTime last_date;
    public DateTime Last_date
    {
        get { return last_date; }
        set { last_date = value; }
    }
    private string url;
    public string Url
    {
        get { return url; }
        set { url = value; }
    }
    private string link_url;
    public string Link_url
    {
        get { return link_url; }
        set { link_url = value; }
    }
    private string title;
    public string Title
    {
        get { return title; }
        set { title = value; }
    }
    private string intro;
    public string Intro
    {
        get { return intro; }
        set { intro = value; }
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
