/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.ues.fmocc.ingenieria.tpi135.mantenimiento.mantenimiento.web.boundary;

import java.io.Serializable;
import java.util.List;
import javax.ejb.EJB;
import javax.ws.rs.Consumes;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import sv.edu.ues.fmocc.ingenieria.tpi135.mantenimiento.mantenimientolib.entity.Responsable;
import sv.edu.ues.fmocc.ingenieria.tpi135.mantenimiento.services.dao.ResponsableFacadeLocal;

/**
 *
 * @author ale
 */
@Path("/Responsable")
public class ResponsableResource implements Serializable{
    
    @EJB
    private ResponsableFacadeLocal rfl;

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Responsable> findAll(){
        if (rfl!=null) {
            List<Responsable> res = rfl.findAll();
            return res;
        }else{
          return null;  
        }
    }
    
    @GET
    @Path("/{find}")
    @Consumes({MediaType.APPLICATION_JSON})
    @Produces({MediaType.APPLICATION_JSON})
    public List<Responsable> findNameLike(@PathParam("find") String name){
        List<Responsable> result;
        if (!name.isEmpty() && rfl!=null) {
            result = rfl.findListResponsableLike(name);
        }
        return null;
    }
    

    
}
