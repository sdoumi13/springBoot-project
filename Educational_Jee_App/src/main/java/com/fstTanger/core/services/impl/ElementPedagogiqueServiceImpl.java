package com.fstTanger.core.services.impl;

import com.fstTanger.core.bo.ElementPedag;
import com.fstTanger.core.dao.ElementPedagogiqueRepository;
import com.fstTanger.core.services.IElementPedagogiqueService;
import com.fstTanger.core.utils.ExcelExporter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ElementPedagogiqueServiceImpl implements IElementPedagogiqueService {

    @Autowired
    private ElementPedagogiqueRepository elementPedagogiqueRepository;

    @Override
    public void addElementPedagogique(ElementPedag element) {
        elementPedagogiqueRepository.save(element);
    }

    @Override
    public void updateElementPedagogique(ElementPedag element) {
        elementPedagogiqueRepository.save(element);
    }

    @Override
    public void deleteElementPedagogique(Long id) {
        elementPedagogiqueRepository.deleteById(id);
    }

    @Override
    public List<ElementPedag> getAllElementsPedagogiques1() {
        return elementPedagogiqueRepository.findAll();
    }

    @Override
    public ElementPedag getElementPedagogiqueById(Long id) {
        return elementPedagogiqueRepository.findById(id).get();
        
    }
    
    @Override
    public ExcelExporter prepareElementExport(List<ElementPedag> elements) {
		String[] columnNames = new String[] { "Niveau", "Type Element", "Titre"};
		String[][] data = new String[elements.size()][3];

		int i = 0;
		for (ElementPedag u : elements) {
			data[i][0] = u.getNiveau();
			data[i][1] = u.getTypeElement();
			data[i][2] = u.getTitre();
			i++;
		}

		return new ExcelExporter(columnNames, data, "elemens");

	}

}
