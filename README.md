RailsDevVagrant
===============

You will need to edit Vagrantfile and update the line:
    config.vm.synced_folder "C:/src", "/src",

To map your local source directory instead. Example:
    config.vm.synced_folder "C:/Source/", "/src",