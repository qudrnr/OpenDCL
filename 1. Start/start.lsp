(defun c:star ()

	(if (not dcl-project-import)

		(if (vl-catch-all-apply 'vl-cmdf (list "OPENDCL"))	t
			
			(alert "Shut down the 'Autocad' and install 'OpenDCL'\n\nhttp://opendcl.com")
		)
		
		(progn
			
			(dcl-project-import 
		
				'("YWt6A3wFAACF/6DYBuLz7UUxaz9m+KF7sR982V5aWq5ubE8mDmwQDM5L+jy7dYx5iA6vDjOapC8s"
	"piUvjn1qS3+X18qNea6u51aurw5HwqHiG5mS5e7O5eeD4IeYxbASDZvE/Bqa6M/8ZmFHOX6ASn7z"
	"guTU1fo/Qj93w+a6avgvOkGnKPSqct/y2eq06hzBSPJAFPnWZd5qDfCD9HErT/H998ln8H8kaDet"
	"gujDuSDAA+oclLMB78VZR1K8aimziUod6C75/Bs12Wvec1CcNIwmM90mHDt1CpgA35so7RIPnQb+"
	"5LkThLSDjelwo0iMdzjox8VsIG0Qd4gT6qLvlqn7cbwAYQEhhtmO4I77hqVusDknwHKL5F3J+/jK"
	"JyiRvRKNvPsO+barZrxHj4JFHXeJRhrENdcuMd+3HfHgL6168Qz9P+Af6410MRKP8I3U/TUVAWNc"
	"CmaZkZtKWQdp2h2hmziCboBYhQn7wXQBbxDqbSayGiNmvUUKDAIeiI0CRU+8h0OiEhQpk4Hsjjyk"
	"85aiMAwwio28BOBLScmjhs2ap2SKJbgRfAmlM4FaC8Drg6lfwIkJVIfi2gPWpIHthQpolI2FgdlJ"
	"ybQjHIFWukFIg9W+W51pjFnDamBtAFDyVqVhw4GjrMHkgR9Zh6B++jbBTg==")

			)

			(dcl-Form-Show start/Form1)
		)		
	)
)