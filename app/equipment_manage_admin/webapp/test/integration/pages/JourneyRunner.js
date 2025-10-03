sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/fiori/app/equipmentmanageadmin/test/integration/pages/EquipmentsList",
	"com/fiori/app/equipmentmanageadmin/test/integration/pages/EquipmentsObjectPage"
], function (JourneyRunner, EquipmentsList, EquipmentsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/fiori/app/equipmentmanageadmin') + '/test/flpSandbox.html#comfioriappequipmentmanageadmi-tile',
        pages: {
			onTheEquipmentsList: EquipmentsList,
			onTheEquipmentsObjectPage: EquipmentsObjectPage
        },
        async: true
    });

    return runner;
});

