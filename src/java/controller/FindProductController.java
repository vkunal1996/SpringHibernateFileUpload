/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.List;
import static javax.security.auth.message.AuthStatus.SUCCESS;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.HibernateUtil;
import model.ProductDetails;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

/**
 *
 * @author vkunal1996
 */
public class FindProductController extends SimpleFormController {
    
    public FindProductController() {
       setCommandClass(ProductDetails.class);
       setCommandName("findProduct");
    }
    
    protected ModelAndView onSubmit(HttpServletRequest request,
          HttpServletResponse response, Object command, BindException errors)	
          throws Exception 
        {
            ProductDetails pd=(ProductDetails)command;
            ModelAndView mvSuccess=new ModelAndView("findSuccess");
            ModelAndView mvFail=new ModelAndView("findFail");
            int productId=Integer.parseInt(request.getParameter("productId"));
            Session session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            
            Query q=session.createQuery("from ProductDetails where productId=:productId");
            q.setParameter("productId",productId);
            List stu=q.list();
            if(stu.isEmpty())
            {
               
                return mvFail;
            }
            else
            {
                mvSuccess.addObject("listDetails",stu);
            mvSuccess.addObject("productId",productId);
            return mvSuccess;
            }
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
