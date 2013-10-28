package tipi.util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.util.Date;

public class PasswordRecoverHashGenerator {

	/**
	 * Generates hash from user's id, email and timestamp created in method. This should be enough hard to quess.
	 * @param userId
	 * @param email
	 * @return
	 */
	public static String generate(String userId, String email) {
		
		Date date = new Date();
		String timestamp = new Timestamp(date.getTime()).toString();
		
		String plaintext = userId + email + timestamp;
		String hash = new String();
		
		try {
			MessageDigest crypter = MessageDigest.getInstance("SHA-1");
			crypter.reset();
			crypter.update(plaintext.getBytes());
			byte[] digest = crypter.digest();
			BigInteger bigInt = new BigInteger(1, digest);
			hash = bigInt.toString(16);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		
		return hash;
	}
	
}
