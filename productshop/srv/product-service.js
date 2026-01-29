const cds = require('@sap/cds');

module.exports = cds.service.impl(async function (srv) {

    // srv.on('READ','Product', async(req) =>{
    //     console.log("I am ON handler.");
    // });
    
    // srv.after('READ','Product', async(req) =>{
    //     console.log("I am AFTER handler.");
    // });

    // srv.before('READ','Product', async(req) =>{
    //     console.log("I am BEFORE handler.");
    // });


    srv.on('MyFunction', async(req) => {
        let result = `Super cool ${req.data.name}`;
        return result
    });

    srv.on('MyAction', async(req) => {
        let result = `Super cool ${req.data.name}`;
        return result
    });
});