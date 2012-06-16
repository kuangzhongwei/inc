using System;
using System.Data;
using System.Text;

public class Comment
{

	private string content;
	public string Content
	{
		get { return content; }
		set { content = value; }
	}
	private string comment_date;
	public string Comment_date
	{
		get { return comment_date; }
		set { comment_date = value; }
	}
	private int comment_id;
	public int Comment_id
	{
		get { return comment_id; }
		set { comment_id = value; }
	}
	private int content_type;
	public int Content_type
	{
		get { return content_type; }
		set { content_type = value; }
	}
	private int content_id;
	public int Content_id
	{
		get { return content_id; }
		set { content_id = value; }
	}
	private int f_id;
	public int F_id
	{
		get { return f_id; }
		set { f_id = value; }
	}
	private int user_id;
	public int User_id
	{
		get { return user_id; }
		set { user_id = value; }
	}
	private string flag;
	public string Flag
	{
		get { return flag; }
		set { flag = value; }
	}
}
	