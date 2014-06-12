package pojo;

public class Login
{
	String studentid;
	String password;
	int type;//身份
	
	public String getStudentid()
	{
		return studentid;
	}
	public void setStudentid(String studentid)
	{
		this.studentid = studentid;
	}
	public String getPassword()
	{
		return password;
	}
	public void setPassword(String password)
	{
		this.password = password;
	}
	public int getType()
	{
		return type;
	}
	public void setType(int type)
	{
		this.type = type;
	}
}
