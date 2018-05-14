/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.edu.ues.fmocc.ingenieria.tpi135.mantenimiento.mantenimiento.web.exceptions;

/**
 *
 * @author ale
 */
public class RestException extends RuntimeException{

    public RestException(EnumRestException message) {
        super(message.getMessage());
    }

    
    
}
