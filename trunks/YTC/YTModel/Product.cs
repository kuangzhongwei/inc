using System;
using System.Data;
using System.Text;

public class Product
{

	private string last_date;
	public string Last_date
	{
		get { return last_date; }
		set { last_date = value; }
	}
	private string shelves_date;
	public string Shelves_date
	{
		get { return shelves_date; }
		set { shelves_date = value; }
	}
	private int pro_id;
	public int Pro_id
	{
		get { return pro_id; }
		set { pro_id = value; }
	}
	private int log_count;
	public int Log_count
	{
		get { return log_count; }
		set { log_count = value; }
	}
	private int desc_code;
	public int Desc_code
	{
		get { return desc_code; }
		set { desc_code = value; }
	}
	private int state;
	public int State
	{
		get { return state; }
		set { state = value; }
	}
	private int unit_id;
	public int Unit_id
	{
		get { return unit_id; }
		set { unit_id = value; }
	}
	private int type_id;
	public int Type_id
	{
		get { return type_id; }
		set { type_id = value; }
	}
	private int product_imgs_id;
	public int Product_imgs_id
	{
		get { return product_imgs_id; }
		set { product_imgs_id = value; }
	}
	private Double price;
	public Double Price
	{
		get { return price; }
		set { price = value; }
	}
	private Double market_price;
	public Double Market_price
	{
		get { return market_price; }
		set { market_price = value; }
	}
	private Double base_price;
	public Double Base_price
	{
		get { return base_price; }
		set { base_price = value; }
	}
	private string name;
	public string Name
	{
		get { return name; }
		set { name = value; }
	}
	private string memo;
	public string Memo
	{
		get { return memo; }
		set { memo = value; }
	}
	private string oper_man;
	public string Oper_man
	{
		get { return oper_man; }
		set { oper_man = value; }
	}
	private string flag;
	public string Flag
	{
		get { return flag; }
		set { flag = value; }
	}
	private string conver_img;
	public string Conver_img
	{
		get { return conver_img; }
		set { conver_img = value; }
	}
}
	