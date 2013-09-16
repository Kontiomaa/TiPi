package tipi.service;

import org.springframework.stereotype.Service;

@Service
public class MiscServiceImpl implements MiscService {
	
	@Override
	public void palveluAdmineille() {
		System.out.println("misc admineille");
	}
	
	@Override
	public void palveluSisaankirjautuneille() {
		System.out.println("misc sisaankirjautuneille");
	}
	
	@Override
	public void palveluKaikille() {
		System.out.println("misc kaikille");
	}

}
