package tipi.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import tipi.dao.FormDAO;


@Service
public class FormSendServiceImpl implements FormSendService {

	@Inject
	private FormDAO formDao;
	
	public FormDAO getFormDao() {
		return formDao;
	}

	public void setFormDao(FormDAO formDao) {
		this.formDao = formDao;
	}
	
	@Override
	public void sendFormToDAO() {
		System.out.println("Terve");		
		formDao.saveOrderFormDAO();
	}
	
}