#
# Hardware settings for a general VM.
# Works on QEMU Virt-Manager and Virtualbox
#
# flake.nix
#  └─ ./hosts
#      └─ ./vm
#          ├─ default.nix
#          └─ hardware-configuration.nix *
#
# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
#

{ config, lib, host, ... }:

{
  imports = [ ];

  boot.initrd.availableKernelModules = [ "ata_piix" "mptspi" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-label/nixos";
      fsType = "ext4";
    };

  swapDevices = [ ];

  networking = with host; {
    useDHCP = false;
    hostName = hostName;
    interfaces = {
      ens32.useDHCP = true;
    };
  };

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  # virtualisation.virtualbox.guest.enable = true; # currently disabled because package is broken
}
