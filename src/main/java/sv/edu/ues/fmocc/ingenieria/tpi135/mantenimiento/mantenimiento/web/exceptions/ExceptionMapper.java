/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.ues.fmocc.ingenieria.tpi135.mantenimiento.mantenimiento.web.exceptions;


import javax.ws.rs.core.Response;
import javax.ws.rs.ext.Provider;



/**
 *
 * @author ale
 * @param <E>
 */
@Provider
public class ExceptionMapper implements javax.ws.rs.ext.ExceptionMapper<Throwable> {


    
    @Override
    public Response toResponse(Throwable exception) {
        return Response.status(Response.Status.INTERNAL_SERVER_ERROR).
                header("server-error", exception.getMessage()).
                build();
    }
    
    
    
}
