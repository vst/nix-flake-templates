{
  description = "A Collection of Personal Nix Flake Templates";

  outputs = { self, ... }: {
    templates = {
      trivial = {
        path = ./templates/trivial;
        description = "A trivial template that does nothing much.";
      };

      python-script = {
        path = ./templates/python-script;
        description = "A simple Python program script.";
      };

      defaultTemplate = self.templates.trivial;
    };
  };
}
