package tipi.bean;

public class OrderFormBeanImpl implements OrderFormBean {
	
	private String carBrand;
	private String carModel;
	private String carRegister;
	private String carColor;
	
	public String getCarBrand() {
		return carBrand;
	}

	public void setCarBrand(String carBrand) {
		this.carBrand = carBrand;
	}

	public String getCarModel() {
		return carModel;
	}

	public void setCarModel(String carModel) {
		this.carModel = carModel;
	}
	
	public String getCarRegister() {
		return carRegister;
	}

	public void setCarRegister(String carRegister) {
		this.carRegister = carRegister;
	}
	
	public String getCarColor() {
		return carColor;
	}

	public void setCarColor(String carColor) {
		this.carColor = carColor;
	}
	
	
}
