package tipi.bean.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class CollectionDestinationTimeValidator implements ConstraintValidator<CollectionDestinationTime, Object>  {
	
    private String firstFieldName;
    private String secondFieldName;
	
	@Override
	public void initialize(final CollectionDestinationTime constraintAnnotation) {
        firstFieldName = constraintAnnotation.first();
        secondFieldName = constraintAnnotation.second();
	}
	
	@Override
	public boolean isValid( final Object value, final ConstraintValidatorContext context ) {
		try
        {
		System.out.println(firstFieldName);
		System.out.println(secondFieldName);
        }
        catch (final Exception ignore)
        {
            // ignore
        }
		return true;
	}

}
