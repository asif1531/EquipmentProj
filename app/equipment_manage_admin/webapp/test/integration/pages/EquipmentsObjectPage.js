sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'com.fiori.app.equipmentmanageadmin',
            componentId: 'EquipmentsObjectPage',
            contextPath: '/Equipments'
        },
        CustomPageDefinitions
    );
});