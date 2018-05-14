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
public enum EnumRestException {
    
    INTERNAL_SERVER_ERROR("Something went wrong. Please message the administrator later."),
    ;
    
    private String message;
    
    private EnumRestException(String message) {
        this.message = message;
    }
    
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
