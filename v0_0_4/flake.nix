{
  description = ''Nim wrapper for libbacktrace'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-libbacktrace-v0_0_4.flake = false;
  inputs.src-libbacktrace-v0_0_4.owner = "status-im";
  inputs.src-libbacktrace-v0_0_4.ref   = "v0_0_4";
  inputs.src-libbacktrace-v0_0_4.repo  = "nim-libbacktrace";
  inputs.src-libbacktrace-v0_0_4.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-libbacktrace-v0_0_4"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-libbacktrace-v0_0_4";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}