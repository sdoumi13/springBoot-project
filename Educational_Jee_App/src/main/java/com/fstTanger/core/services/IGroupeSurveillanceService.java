package com.fstTanger.core.services;

import java.util.List;

import com.fstTanger.core.bo.Surveillance;
import com.fstTanger.core.utils.ExcelExporter;

public interface IGroupeSurveillanceService {

    public void addGroupeSurveillance(Surveillance groupeSurveillance);

    public void updateGroupeSurveillance(Surveillance groupeSurveillance);

    public List<Surveillance> getAllGroupesSurveillance();

    public void deleteGroupeSurveillance(Long id);

    public Surveillance getGroupeSurveillanceById(Long id);
    
    public ExcelExporter prepareGroupeSurveillanceExport(List<Surveillance> groupesSurveillance);

   
}
