using System;
using System.Data;
using System.Text;

public class Product_imgs
{

	private int img_id;
	public int Img_id
	{
		get { return img_id; }
		set { img_id = value; }
	}
	private int pro_id;
	public int Pro_id
	{
		get { return pro_id; }
		set { pro_id = value; }
	}
	private int desc_code;
	public int Desc_code
	{
		get { return desc_code; }
		set { desc_code = value; }
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
	