import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.iamservices.User;

public class UserValidator 
{

    private static final Map<String, String> validationPatterns = new HashMap<>();
    private static StringBuilder errorMsg = new StringBuilder();

    static {
        validationPatterns.put("Title", "^(Mr|Mrs|Ms|Dr)$");
        validationPatterns.put("First Name", "^[A-Za-z]+(?:[-' ][A-Za-z]+)*$");
        validationPatterns.put("Gender", "^(Male|Female|Other)$");
        validationPatterns.put("Email", "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$");
        validationPatterns.put("Phone", "^\\d{10}$");
        validationPatterns.put("Aadhar", "^\\d{12}$");
        validationPatterns.put("PAN", "^[A-Z]{5}\\d{4}[A-Z]$");
        validationPatterns.put("Account Type", "^(Savings|Current|Fixed Deposit)$");
        validationPatterns.put("Pincode", "^\\d{6}$");
        validationPatterns.put("Password", "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\\W).{8,20}$");
    }

    public static StringBuilder checkUser(User user) 
    {
        errorMsg.setLength(0);
        
        checkNull(user.getId(), "ID");
        checkField(user.getTitle(), "Title");
        checkField(user.getFirstName(), "First Name");
        checkNull(user.getLastName(), "Last Name");
        checkEmpty(user.getDob(), "Date Of Birth");
        checkField(user.getGender(), "Gender");
        checkField(user.getEmail(), "Email");
        checkField(user.getPhone(), "Phone");
        checkField(user.getAadhar(), "Aadhar");
        checkField(user.getPan(), "PAN");
        checkField(user.getAccountType(), "Account Type");
        checkEmpty(user.getAddress1(), "Address Line1");
        checkNull(user.getAddress2(), "Address Line2");
        checkEmpty(user.getDistrict(), "District");
        checkEmpty(user.getState(), "State");
        checkEmpty(user.getCountry(), "Country");
        checkField(user.getPincode(), "Pincode");
        checkNull(user.getNomineeName(), "Nominee Name");
        checkNull(user.getNomineeContact(), "Nominee Contact");
        checkField(user.getPassword(), "Password");
        
        return errorMsg;
    }

    private static void checkNull(String field, String fieldName) 
    {
        if (field == null) 
        {
            errorMsg.append(fieldName).append(" can't be null. ");
        }
    }

    private static void checkEmpty(String field, String fieldName) 
    {
        checkNull(field, fieldName);
        if (field.trim().isEmpty()) 
        {
            errorMsg.append(fieldName).append(" is a required field and can't be empty. ");
        }
    }

    private static void checkField(String field, String fieldName) 
    {
        checkEmpty(field, fieldName);
        Pattern pattern = Pattern.compile(validationPatterns.get(fieldName));
        Matcher matcher = pattern.matcher(field);
        if (!matcher.matches()) 
        {
            errorMsg.append(fieldName).append(" - invalid input or pattern. ");
        }
    }
}
