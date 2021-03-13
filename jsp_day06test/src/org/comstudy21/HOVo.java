package org.comstudy21;

public class HOVo {
   private String no;
   private String name;
   private String email;
   private String phone;
   
   public HOVo() {
      this("","","","");
   }
   public HOVo(String no) {
	   this(no,"","","");
   }
   public HOVo(String no, String name, String email, String phone) {
      this.no = no;
      this.name = name;
      this.email = email;
      this.phone = phone;
   }
   public String getNo() {
      return no;
   }
   public void setNo(String no) {
      this.no = no;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getEmail() {
      return email;
   }
   public void setEmail(String email) {
      this.email = email;
   }
   public String getPhone() {
      return phone;
   }
   public void setPhone(String phone) {
      this.phone = phone;
   }
   @Override
   public String toString() {
      return "HOVo [no=" + no + ", name=" + name + ", email=" + email + ", phone=" + phone + "]";
   }
   @Override
   public int hashCode() {
      final int prime = 31;
      int result = 1;
      result = prime * result + ((no == null) ? 0 : no.hashCode());
      return result;
   }
   @Override
   public boolean equals(Object obj) {
      if (this == obj)
         return true;
      if (obj == null)
         return false;
      if (getClass() != obj.getClass())
         return false;
      HOVo other = (HOVo) obj;
      if (no == null) {
         if (other.no != null)
            return false;
      } else if (!no.equals(other.no))
         return false;
      return true;
   }
   
}