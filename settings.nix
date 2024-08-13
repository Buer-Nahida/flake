rec {
  username = "nahida";
  homeDirectory = "/home/${username}";
  name = "纳西妲 · Nahida";
  email = "yanwenz551@gmail.com";
  ageKeyFile = "${./.}/keys";
  signing = {
    signByDefault = true;
    key = "F6A3F09956C9F243";
  };
}
