/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.ues.fmocc.ingenieria.tpi135.mantenimiento.mantenimiento.web.boundary;

import java.io.Serializable;
import javax.ejb.EJB;
import javax.ws.rs.Path;
import sv.edu.ues.fmocc.ingenieria.tpi135.mantenimiento.mantenimientolib.entity.Responsable;
import sv.edu.ues.fmocc.ingenieria.tpi135.mantenimiento.services.dao.AbstractFacadeInterface;
import sv.edu.ues.fmocc.ingenieria.tpi135.mantenimiento.services.dao.ResponsableFacadeLocal;

/**
 *
 * @author ale
 */
@Path("responsable")
public class ResponsableResource extends AbstractResource<Responsable> implements Serializable{
    
    @EJB
    private ResponsableFacadeLocal rfl;

    @Override
    protected AbstractFacadeInterface getFacade() {
        return rfl;
    }
    
    // Implement rest of code here
    
    
    
}
