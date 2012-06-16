using System;
using System.Data;
using System.Text;

public class Comment_user
{

	private string reg_date;
	public string Reg_date
	{
		get { return reg_date; }
		set { reg_date = value; }
	}
	private int user_id;
	public int User_id
	{
		get { return user_id; }
		set { user_id = value; }
	}
	private int user_type;
	public int User_type
	{
		get { return user_type; }
		set { user_type = value; }
	}
	private DateTime last_date;
	public DateTime Last_date
	{
		get { return last_date; }
		set { last_date = value; }
	}
	private string name;
	public string Name
	{
		get { return name; }
		set { name = value; }
	}
	private string mobile;
	public string Mobile
	{
		get { return mobile; }
		set { mobile = value; }
	}
	private string email;
	public string Email
	{
		get { return email; }
		set { email = value; }
	}
	private string reg_src;
	public string Reg_src
	{
		get { return reg_src; }
		set { reg_src = value; }
	}
	private string flag;
	public string Flag
	{
		get { return flag; }
		set { flag = value; }
	}
}
	