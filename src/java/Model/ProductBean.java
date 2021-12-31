/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author KAUSTUBH
 */

public class ProductBean {

  private int pid;
  private String pname;
  private int vid;
  private int quantity;
  private int cprice;
  private int sprice;

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public int getVid() {
        return vid;
    }

    public void setVid(int vid) {
        this.vid = vid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getCprice() {
        return cprice;
    }

    public void setCprice(int cprice) {
        this.cprice = cprice;
    }

    public int getSprice() {
        return sprice;
    }

    public void setSprice(int sprice) {
        this.sprice = sprice;
    }


}
