sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'com.fiori.app.equipmentmanageadmin',
            componentId: 'EquipmentsList',
            contextPath: '/Equipments'
        },
        CustomPageDefinitions
    );
});