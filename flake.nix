{
  description = "Personal configuration flakes for fire-flakes";

  outputs = { self, ... }: {
    fireFlakesConfig = {
      paths = {
        vars = ./vars;
        secrets = ./secrets;
      };

      meta = {
        owner = "adhityaravi";
        version = "0.0.1-beta";
      };
    };
  };
}
