class apt_packages_profile(
	$packages=[]
) {
	 each($packages) |$package,$version| {
        package { "$package": ensure=>$version} 
    }
}