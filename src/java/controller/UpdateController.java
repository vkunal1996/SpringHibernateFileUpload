/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.HibernateUtil;
import model.ProductDetails;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FilenameUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

/**
 *
 * @author vkunal1996
 */
public class UpdateController extends SimpleFormController {
    PrintWriter pw;
    String Photo[]=new String[20];
    List <FileItem> items=null;
    private String fileName;
    public UpdateController() {
        //Initialize controller properties here or 
        //in the Web Application Context

        //setCommandClass(MyCommand.class);
        //setCommandName("MyCommandName");
        //setSuccessView("successView");
        //setFormView("formView");
        setCommandClass(ProductDetails.class);
        setCommandName("changeDetails");
        System.out.print("hellopaaji");
    }
    
     protected ModelAndView onSubmit(HttpServletRequest request,
          HttpServletResponse response, Object command, BindException errors)	
          throws Exception 
{
            System.out.print("hello");
            ProductDetails pd=(ProductDetails)command;
            response.setContentType("text/html;charset=UTF-8");
            try
            {
                items=new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                
            }catch(FileUploadException e){throw new ServletException("cannot parsemultipart request");}
            int i=0;
            for(FileItem item:items)
            {
                if(item.isFormField())
                {
                    String fieldName=item.getString();
                    Photo[i]=fieldName;
                    i++;
                }
                else
                {
                    fileName=FilenameUtils.getName(item.getName());
                    String nm=request.getContextPath()+"/Web/images";
                    System.out.print(Photo[0]);
                    System.out.print(Photo[1]);
                    System.out.print(Photo[2]);
                    System.out.print(Photo[3]);
                    System.out.print(nm);
                    System.out.print(fileName);
                    File file=new File(nm,fileName);
                    try
                    {
                        item.write(file);
                        Session session = HibernateUtil.getSessionFactory().openSession();
                        session.beginTransaction();
                        String hql="Update ProductDetails Set productId=:productId , productName=:productName ,productRate=:productRate , productCompany=:productCompany ,productPicture=:productPicture";
                       Query q=session.createQuery(hql);
                       q.setParameter("productId",Photo[0]);
                       q.setParameter("productName",Photo[1]);
                       q.setParameter("productRate",Photo[2]);
                       q.setParameter("productCompany",Photo[3]);
                       q.setParameter("productPicture",fileName);
                       int rl=q.executeUpdate();
                        /* pd.setProductId(Integer.parseInt(Photo[0]));
                        pd.setProductName(Photo[1]);
                        pd.setProductRate(Photo[2]);
                        pd.setProductCompany(Photo[3]);
                        pd.setProductPicture(fileName);*/
                       // session.save(pd);
                        session.getTransaction().commit();
                        session.close();
                    }catch(Exception e)
                    {
                        System.out.print(e);
                    }
                }
            }
            return new ModelAndView("udpateSuccess","pd",pd);
}

    //Use onSubmit instead of doSubmitAction 
    //when you need access to the Request, Response, or BindException objects
    /*
    @Override
    protected ModelAndView onSubmit(
            HttpServletRequest request, 
            HttpServletResponse response, 
            Object command, 
            BindException errors) throws Exception {
        ModelAndView mv = new ModelAndView(getSuccessView());
        //Do something...
        return mv;
    }
     */
}
