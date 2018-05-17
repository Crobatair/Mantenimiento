/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.ues.fmocc.ingenieria.tpi135.mantenimiento.mantenimiento.web.boundary;

import java.util.List;
import javax.ejb.EJB;
import javax.ws.rs.DefaultValue;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
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
    public List<T> findAll(@QueryParam("first") @DefaultValue("0") int first,
            @QueryParam("pagesize") @DefaultValue("5") int pagesize) {
        if (getFacade() != null) {
            List<T> resultado = null;
            if (pagesize == 0) {
                resultado = getFacade().findAll();
            } else if (first > 0 && pagesize >= 0) {
                resultado = getFacade().findRango(first, pagesize);

            } else {
                throw new RestException(EnumRestException.WRONG_PARAMS);
            }

            if (resultado != null) {
                return resultado;
            } else {
                throw new RestException(EnumRestException.INTERNAL_SERVER_ERROR);
            }
        } else {
            throw new RestException(EnumRestException.INTERNAL_SERVER_ERROR);
        }
    }


}
