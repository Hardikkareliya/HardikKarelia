class Lang {
  Map<int, String> langEng = {
    0: "Flutter Test",
    1: "Log In",
    2: "Enter valid email id as abc@gmail.com",
    3: "Email",
    4: "* Required",
    5: "Enter valid email id",
    6: "Enter secure password",
    7: "Password",
    8: "* Required",
    9: "Password should be atleast 6 characters",
    10: "Password should not be greater than 15 characters",
    11: "Submit",
    12: "Ok",
    13: "associatedDrug",
    14: "Name : ",
    15: "Dose : ",
    16: "Strength : ",
    17: "associatedDrug #2",

  };

  String get(int id) {
    var str = langEng[id];
    if (str == null) str = "";
    return str;
  }

}


