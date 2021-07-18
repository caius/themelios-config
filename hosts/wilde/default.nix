{ config, pkgs, ... }:
{
imports = [];

  boot.kernelParams = [ "elevator=none" ];

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  networking.hostName = "wilde";

  programs.mtr.enable = true;

  services.openssh.enable = true;

  system.autoUpgrade.enable = true;

  systemd.services.nix-config-update = {
    enable = true;
    description = "Update contents of /nix-config"
    serviceConfig.Type = "oneshot";
    path = with pkgs; [ "git" ];
    startAt = "06:03"
    script = "git -C /nix-config pull --rebase";
  };

  time.timeZone = "UTC";

  users.users.caius = {
    isNormalUser = true;
    home = "/home/caius";
    description = "Caius Durling";
    extraGroups = [ "wheel" "networkmanager" ];
    hashedPassword = "$6$NG7FtPB3PX4Xe$jruQNfJhlL65jYBWaV2K70hMMVDRMHZLGl6EUoopfN/GGzY.J.41X7EP3MTPk18hZvU6BCg5qcKpXHT2CWcMa0";
    openssh.authorizedKeys.keys = [
      "ecdsa-sha2-nistp256 AAAAE2VjZHNhLXNoYTItbmlzdHAyNTYAAAAIbmlzdHAyNTYAAABBBDpBTlFRgaUitUv9tay7blPJ1pg4Ap1EJMudzgfZp+kT5U1ISumsy2/2Wz1CCHYDSkqoYHyr8j3q1El8DCMMKiA= 2021-07-08-caius-vulcan"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCoihjFZOiiqQMzBZ7KQ6DSePM7YdtKwq8u6ZmZNR126I95TQ15B5cUedEcIWBEVbuGIQxkRH3yKicTjr8n9lW2qxGXvSDD2xIxBFRyeluVUtiYQTpCHFUeDMyrRr9jPSBXCghkgGOw6cEX59ia06PP1UV80V4oVINDHYlc4gJZyJwQ1LXfPvXaYUBLbWfm0f2cLOaUb+NqK8b175BHsLP+plUKBAZtAMJRtd4ydCnxYTDQOD9PExOL2bOpTShyy3QjhSGfIDKXxQGKr66efhrdQwli7KEPq2QsFeerRhtMScI9RHlwBdZpxHB5GtmkNaqhlCMJ8JRgxpN6YEejcsMqkdJ0sVGnVJhYlI2McbsOMwh5F5vCBz7YGS8vEtdCKRr7c2QRtRBkQk14klKD5vldGjjujOJjRZ+fjcT/dAop8XLeV7vmmkvnTMg1L3GIlYrDpKUa2HS5hSVH6cDuO1PU9EiNvQZAY4HY1hW8c9VQ007FogsHA7bnZkVtrAfyHLc= 2021-07-11-network"
    ];
  };
}
