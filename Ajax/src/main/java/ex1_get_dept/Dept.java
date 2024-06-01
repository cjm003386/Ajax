package ex1_get_dept;
/*
 * �ڹٺ�(JavaBean)�� �ڹٺ� �Ծ࿡ ���� �ۼ��� �ڹ� Ŭ�����Դϴ�.
 * ���� ��� ȸ�� ����, �Խ��� �� ���� ������ ����� �� ������ �����ϰ� �ִ� �ڹٺ� ��ü�� ����ϰ� �˴ϴ�.
 * 
 * ������ �ڹٺ��� �Ծ��Դϴ�.
 * 1.�ʵ� ���� ������ get/set �޼��尡 �����ؾ� �Ѵ�.
 * 2.get �޼���� �Ķ���Ͱ� �������� �ʾƾ� �Ѵ�.
 * 3.set �޼ҵ�� �ݵ�� �ϳ� �̻��� �Ķ���Ͱ� �����ؾ� �Ѵ�.
 * 4.���� ������Ʈ�� �Ӽ��� �ݵ�� �б� �Ǵ� ���Ⱑ �����ؾ� �Ѵ�.
 *   ��, �б� ������ ��� get �Ǵ� is �޼��常 ������ �� �ִ�.
 * 5.�����ڴ� �Ķ���Ͱ� ���� �⺻ �����ڸ� �ݵ�� �ۼ��� �־�� �Ѵ�.
 * 6.�ʵ��� ���� �����ڴ� private�̰� �� set/get �޼����� ���� �����ڴ�
 *    public���� ���ǵǾ�� �ϸ� Ŭ������ ���� �����ڴ� public���� �����Ѵ�.
 *    
 *  �ڹٺ� Ŭ������ �����͸� �����ϴ� �ʵ�, �����͸� �о�� �� ���Ǵ�
 *  �޼���(getter�޼���), ���� ������ �� ���Ǵ� �޼���(settrer�޼���)�� �����˴ϴ�.
 *  
 *  �޼��� �̸��� ����ؼ� ������Ƽ(property)�� �̸��� �����ϰ� �˴ϴ�.
 *  ���� ��� ������Ƽ �̸��� name�̰� ���� Ÿ���� int�� ��� ������Ƽ�� ���õ� �޼����� �̸��� ������ ���� �����˴ϴ�.
 *  public void setName(int value){};
 *  public int getName(){};
 *  
 *  setName()�� getName()�� ���ؼ� �����Ǵ� �����͸� ������Ƽ(property)��� �θ��ϴ�.
 *  
 *  ������Ƽ�� Ÿ���� boolean�� ��� get��� is�� ���� �� �ֽ��ϴ�.
 * 
 *  ��, ������Ƽ�� ���� �����ϴ� �޼����� ��� ������Ƽ�� �̸� �� ù ���ڸ� �빮�ڷ� ��ȯ�� ���ڿ� �տ� set�� ���̰�
 *  ������Ƽ�� ���� �о���� �޼����� ��� ������Ƽ�� �̸� �� ù ���ڸ� �빮�ڷ� ��ȯ�� ���ڿ� �տ� get�� ���Դϴ�.
 *  ������Ƽ�� �̸��� �ʵ��� �̸��� ���� �ʾƵ� �˴ϴ�.
 *  
 *  ���� ��� name ������Ƽ�� ���� ������ �����ϴ� �ʵ尡 _name�� ���
 *  	private String_name;
 *  
 *  	public String getName() {
 *   		 return _name;
 *   }
 *   
 *   	public void setName(String name) {
 *   		 _name = name;
 *   }
 *   
 *   *** ������ ��(DataBean) Ŭ���� �ۼ�  ***
 *   �������� �������� ������ ���̶�� �ϳ��� ��ü�� �����ϰ� �ǰ�
 *   �� ��ü�� �����ϸ� �� ������ �ϳ��� ������ �ʿ䰡 ������
 *   �Ѳ����� ��� ������ ���޵˴ϴ�.
 *   �̷� Ŭ������ DTO(Data Transfer Object), VO(value Object)��� �մϴ�.
 *   DB���� ������� �÷���� �����ϰ� ������Ƽ���� �����մϴ�.
 *   
*/

public class Dept {
	private int deptno;
	private String dname;
	private String loc;
	
	public Dept() {
		
	}

	public int getDeptno() {
		return deptno;
	}

	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getLoc() {
		return loc;
	}

	public void setLoc(String loc) {
		this.loc = loc;
	}
	


}
