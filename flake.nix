{
  description = "A Collection of Personal Nix Flake Templates";

  outputs = { self, ... }: {
    templates = {
      trivial = {
        path = ./templates/trivial;
        description = "A trivial template that does nothing much.";
      };

      defaultTemplate = self.templates.trivial;
    };
  };
}
