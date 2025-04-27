{
  description = "Personal configuration files for fire-flake";

  outputs = { self, ... }: {
    fireFlakeConfig = {
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
