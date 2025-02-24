package com.fstTanger.core.services;

import java.util.List;
import com.fstTanger.core.bo.ElementPedag;
import com.fstTanger.core.utils.ExcelExporter;

public interface IElementPedagogiqueService {
    void addElementPedagogique(ElementPedag elementPedagogique);
    void updateElementPedagogique(ElementPedag elementPedagogique);
    void deleteElementPedagogique(Long id);
    ElementPedag getElementPedagogiqueById(Long id);
    List<ElementPedag> getAllElementsPedagogiques1();
	ExcelExporter prepareElementExport(List<ElementPedag> elements);
	
}
