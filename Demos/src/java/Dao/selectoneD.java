
package Dao;

import Modelo.selectoneM;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class selectoneD extends Dao implements selectoneI{
    
    
     @Override
    public ArrayList<selectoneM> listrLenguaje() throws Exception {
        ArrayList<selectoneM> listar = new ArrayList<>();
        ResultSet rs;
        try {
            this.Conexion();
            String sql = "select * from Selectone";
            PreparedStatement ps = getCn().prepareCall(sql);
            rs = ps.executeQuery();
            listar = new ArrayList<>();
            selectoneM select;
            while (rs.next()) {
                select = new selectoneM();
                select.setIdselect(rs.getString("idselect"));
                select.setLenguajes(rs.getString("Lenguajes"));
                listar.add(select);
            }
            return listar;
        } catch (SQLException e) {
            throw e;
        } finally {
            this.Cerrar();
        }
    }
}
