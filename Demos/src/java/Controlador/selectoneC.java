
package Controlador;

import Dao.selectoneD;
import Modelo.selectoneM;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import lombok.Data;

@Data
@Named(value = "selectoneC")
@SessionScoped
public class selectoneC implements Serializable {

   selectoneM selectone = new selectoneM();
   private List<selectoneM> listlenguaje;
   private List<selectoneM> selctMany;
   selectoneD dao;
   
   @PostConstruct
    public void init() {
        try {
            listLeng();
        } catch (Exception ex) {
        }
    }
   
    public void listLeng() throws Exception {
        try {
            dao = new selectoneD();
            listlenguaje = dao.listrLenguaje();
        } catch (Exception e) {
            throw e;
        }
    }
    
}
