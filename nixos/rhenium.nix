# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ /etc/nixos/hardware-configuration.nix ./system.nix ./collectd.nix ];

  networking.hostId = "80fd9d3a";

  boot.zfs.enableUnstable = true;
  services.zfs.autoScrub.enable = true;
  services.znapzend.enable = true;
  services.znapzend.zetup = {
    "tank/home" = {
      plan = "1d=>1h,1m=>1d,1y=>1m";
      recursive = true;
    };
  };

  boot.initrd.luks.devices = {
    root = {
      device = "/dev/disk/by-uuid/e5f879ff-cc1e-448f-a5c6-73327b7631a3";
      allowDiscards = true;
    };
  };

  programs.light.enable = true;

  networking.hostName = "rhenium"; # Define your hostname.
  hardware.pulseaudio.package = pkgs.pulseaudioFull;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;

  services.xserver.libinput.enable = true;
  services.xserver.libinput.disableWhileTyping = true;
  services.xserver.libinput.tapping = false;

  services.tlp.enable = true;

  services.redis.enable = true;

  # hardware video decoding
  hardware.opengl.enable = true;
  hardware.opengl.extraPackages = with pkgs; [ intel-media-driver ];

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "18.09"; # Did you read the comment?
}
