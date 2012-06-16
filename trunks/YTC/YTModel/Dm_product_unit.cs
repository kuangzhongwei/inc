using System;
using System.Data;
using System.Text;

public class Dm_product_unit
{

	private string last_date;
	public string Last_date
	{
		get { return last_date; }
		set { last_date = value; }
	}
	private int unit_id;
	public int Unit_id
	{
		get { return unit_id; }
		set { unit_id = value; }
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
	