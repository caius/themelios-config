{ config, pkgs, ... }:
{
imports = [];

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "UTC";

  programs.mtr.enable = true;

  networking.hostName = "wilde.sr.int.durling.name";
}
