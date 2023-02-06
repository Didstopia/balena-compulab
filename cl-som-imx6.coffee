deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

CL_SOM_MX6_FLASH = 'Insert SD CARD. Press SW5 followed by SW6. Release SW5 then release SW6.'

postProvisioningInstructions = [
        instructions.BOARD_SHUTDOWN
        instructions.REMOVE_INSTALL_MEDIA
        instructions.BOARD_REPOWER
]

module.exports =
        version: 1
        slug: 'cl-som-imx6'
        name: 'Compulab i.MX6'
        arch: 'armv7hf'
        state: 'released'
        private: false
 
        stateInstructions:
                postProvisioning: postProvisioningInstructions

        instructions: [
                instructions.ETCHER_SD
                instructions.EJECT_SD
                instructions.FLASHER_WARNING
                CL_SOM_MX8_FLASH
        ].concat(postProvisioningInstructions)

        gettingStartedLink:
                windows: 'https://github.com/Didstopia/balena-compulab'
                osx: 'https://github.com/Didstopia/balena-compulab'
                linux: 'https://github.com/Didstopia/balena-compulab'

        supportsBlink: false

        yocto:
                machine: 'cl-som-imx6'
                image: 'balena-image-flasher'
                fstype: 'balenaos-img'
                # version: 'yocto-sumo'
                version: 'yocto-warrior'
                deployArtifact: 'balena-image-flasher-cl-som-imx6.balenaos-img'
                compressed: true

        options: [ networkOptions.group ]

        configuration:
                config:
                        partition:
                                primary: 1
                        path: '/config.json'

        initialization: commonImg.initialization
