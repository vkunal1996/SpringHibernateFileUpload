/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author vkunal1996
 */
public class ProductDetails implements java.io.Serializable
{
        private int productId;
        private String productName;
        private String productRate;
        private String productCompany;
        private String productPicture;

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductRate() {
        return productRate;
    }

    public void setProductRate(String productRate) {
        this.productRate = productRate;
    }

    public String getProductCompany() {
        return productCompany;
    }

    public void setProductCompany(String productCompany) {
        this.productCompany = productCompany;
    }

    public String getProductPicture() {
        return productPicture;
    }

    public void setProductPicture(String productPicture) {
        this.productPicture = productPicture;
    }
    public ProductDetails(){}
    public ProductDetails(int productId)
    {
        this.productId=productId;
    }
    public ProductDetails(int productId,String productName,String productRate,String productCompany,String productPicture)
    {
        this.productId=productId;
        this.productName=productName;
        this.productRate=productRate;
        this.productCompany=productCompany;
        this.productPicture=productPicture;
    }
}
