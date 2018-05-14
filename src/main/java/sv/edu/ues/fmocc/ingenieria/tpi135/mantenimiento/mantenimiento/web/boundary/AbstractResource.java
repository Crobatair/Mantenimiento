/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.ues.fmocc.ingenieria.tpi135.mantenimiento.mantenimiento.web.boundary;

import java.util.List;
import javax.ejb.EJB;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import sv.edu.ues.fmocc.ingenieria.tpi135.mantenimiento.mantenimiento.web.exceptions.EnumRestException;
import sv.edu.ues.fmocc.ingenieria.tpi135.mantenimiento.mantenimiento.web.exceptions.RestException;
import sv.edu.ues.fmocc.ingenieria.tpi135.mantenimiento.mantenimientolib.entity.Responsable;
import sv.edu.ues.fmocc.ingenieria.tpi135.mantenimiento.services.dao.AbstractFacade;
import sv.edu.ues.fmocc.ingenieria.tpi135.mantenimiento.services.dao.AbstractFacadeInterface;

/**
 *
 * @author ale
 * @param <T>
 */
public abstract class AbstractResource<T> {

    protected T entityClass;
    protected abstract AbstractFacadeInterface getFacade();
    
    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<T> findAll(){
        if (getFacade()!=null) {
            List<T> result = getFacade().findAll();
            if (result != null) {
                return result;
            }else{
                throw new RestException(EnumRestException.INTERNAL_SERVER_ERROR);
            } 
        }else{
          throw new RestException(EnumRestException.INTERNAL_SERVER_ERROR);
        }
    }

    
    
}
