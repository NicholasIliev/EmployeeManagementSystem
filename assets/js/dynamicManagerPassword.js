document.addEventListener('DOMContentLoaded', function () {
    var departmentDropdown = document.getElementById('department');
    var managerPasswordGroup = document.getElementById('managerPasswordGroup');
    var passwordInput = document.getElementById('manager_password');

    departmentDropdown.addEventListener('change', function () {
        if (departmentDropdown.value == 2) {
            managerPasswordGroup.style.display = 'block';
        } else {
            managerPasswordGroup.style.display = 'none';
        }
    });

    // Password strength check
    passwordInput.addEventListener('input', function () {
        checkPasswordStrength(this.value);
    });

    // Generate random password
    var randomPasswordButton = document.getElementById('generateRandomPassword');
    if (randomPasswordButton) {
        randomPasswordButton.addEventListener('click', function () {
            passwordInput.value = generateRandomPassword();
            checkPasswordStrength(passwordInput.value);
        });
    }

    function generateRandomPassword(length = 8) {
        var characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        var password = '';
        for (var i = 0; i < length; i++) {
            password += characters.charAt(Math.floor(Math.random() * characters.length));
        }
        return password;
    }

    function checkPasswordStrength(password) {
        var strengthIndicator = document.getElementById('password-strength');

        // Min length
        var lengthValid = password.length >= 8;

        // Uppercase letter
        var uppercaseValid = /[A-Z]/.test(password);

        // Lowercase letter
        var lowercaseValid = /[a-z]/.test(password);

        // Number
        var numberValid = /[0-9]/.test(password);

        // Special character
        var specialCharValid = /[^A-Za-z0-9]/.test(password);

        // Calculate strength score (you can adjust the scoring logic based on your requirements)
        var score = (lengthValid + uppercaseValid + lowercaseValid + numberValid + specialCharValid) * 20;

        // Display strength
        if (score >= 80) {
            strengthIndicator.innerHTML = 'Strong';
            strengthIndicator.style.color = 'green';
        } else if (score >= 40) {
            strengthIndicator.innerHTML = 'Moderate';
            strengthIndicator.style.color = 'orange';
        } else {
            strengthIndicator.innerHTML = 'Weak';
            strengthIndicator.style.color = 'red';
        }
    }
});
