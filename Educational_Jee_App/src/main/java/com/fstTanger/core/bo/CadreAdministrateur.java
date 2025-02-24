package com.fstTanger.core.bo;

import java.util.ArrayList;
import java.util.List;
import jakarta.persistence.*;
@Entity
@PrimaryKeyJoinColumn(name="idCardreAdmin")
public class CadreAdministrateur extends Personne {
   private String grade;

   @OneToMany(mappedBy = "admin", cascade = CascadeType.ALL)
   private List<Surveillance> surveillance = new ArrayList<>();

   
   private boolean disponible;

   public CadreAdministrateur() {
       this.disponible = true;
   }

   public boolean isDisponible() {
       return disponible;
   }
   
   public void setDisponible(boolean disponible) {
       this.disponible = disponible;
   }

public String getGrade() {
	return grade;
}
public void setGrade(String grade) {
	this.grade = grade;
}


    public List<Surveillance> getSurveillance() {
        return surveillance;
    }

    public void setSurveillance(List<Surveillance> surveillance) {
        this.surveillance = surveillance;
    }
}