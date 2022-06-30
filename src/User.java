
public class User {
String uname;
String email;
String code;
public User()
{
	
}
public User(String name, String email, String code) {
    this.uname = name;
    this.email = email;
    this.code = code;
}

public String getUname() {
	return uname;
}
public void setUname(String uname) {
	this.uname = uname;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getCode() {
	return code;
}
public void setCode(String code) {
	this.code = code;
}
@Override
public String toString() {
	return "User [uname=" + uname + ", email=" + email + ", code=" + code + "]";
}

}
