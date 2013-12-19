package tipi.util;

/**
 * @author Jaakko Leikko
 * Translated in English by Samuel Kontiomaa
 * 
 * An independent java application to hash and salt a password
 */

import java.util.Scanner;

import org.springframework.security.crypto.password.StandardPasswordEncoder;

//passwordEncryptorCommandlineClient
public class SalasanaKryptaajaKomentoriviClient {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		Scanner reader = new Scanner(System.in);
		StandardPasswordEncoder spe = new StandardPasswordEncoder();
		System.out.print("Provide a password: ");
		String password = reader.nextLine();
		String encrypted = spe.encode(password);
		System.out.println("Your encrypted password (with random salt): " +encrypted);
		// added reader close because of a resource leak
		reader.close();
	}

}
