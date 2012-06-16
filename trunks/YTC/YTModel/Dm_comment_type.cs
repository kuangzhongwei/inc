using System;
using System.Data;
using System.Text;

public class Dm_comment_type
{

	private int type_id;
	public int Type_id
	{
		get { return type_id; }
		set { type_id = value; }
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
	private string table_name;
	public string Table_name
	{
		get { return table_name; }
		set { table_name = value; }
	}
	private string table_pk_name;
	public string Table_pk_name
	{
		get { return table_pk_name; }
		set { table_pk_name = value; }
	}
}
	