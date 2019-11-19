package lp2tecnoquim.model;

import java.util.ArrayList;
import java.util.Date;

public class PlanMaestroProduccion {
    private int id;
    private Date periodo;
    private Estado estado;
    private ArrayList<OrdenProduccion> ordenes;
    private ArrayList<DetalleMaquinaria> detMaquinarias;
    private Trabajador responsable;

    public PlanMaestroProduccion() {
        periodo = new Date();
        ordenes = new ArrayList<OrdenProduccion>();
        detMaquinarias = new ArrayList<DetalleMaquinaria>();
        responsable = new Trabajador();
    }

    public PlanMaestroProduccion(Date periodo, Estado estado, ArrayList<OrdenProduccion> ordenes, ArrayList<DetalleMaquinaria> detMaquinarias, Trabajador responsable) {
        this.periodo = periodo;
        this.estado = estado;
        this.ordenes = ordenes;
        this.detMaquinarias = detMaquinarias;
        this.responsable = responsable;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getPeriodo() {
        return periodo;
    }

    public void setPeriodo(Date periodo) {
        this.periodo = periodo;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    public ArrayList<OrdenProduccion> getOrdenes() {
        return ordenes;
    }

    public void setOrdenes(ArrayList<OrdenProduccion> ordenes) {
        this.ordenes = ordenes;
    }

    public ArrayList<DetalleMaquinaria> getMaquinarias() {
        return detMaquinarias;
    }

    public void setMaquinarias(ArrayList<DetalleMaquinaria> maquinarias) {
        this.detMaquinarias = maquinarias;
    }

    public Trabajador getResponsable() {
        return responsable;
    }

    public void setResponsable(Trabajador responsable) {
        this.responsable = responsable;
    }
    
    
    public void generarReporte(){
        
    }
    

    
}
