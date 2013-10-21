package tipi.bean.validation;

import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.PARAMETER;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

@Documented
@Constraint(validatedBy = CollectionDestinationTimeValidator.class)
@Target( {FIELD, PARAMETER})
@Retention(RetentionPolicy.RUNTIME)
public @interface CollectionDestinationTime {
	
	
	Class<?>[] groups() default {};

	Class<? extends Payload>[] payload() default{};
	
	String message() default "The check-out date must be after the check-in date.";
	
	String first();
	
    String second();
}
