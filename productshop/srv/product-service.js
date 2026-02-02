const cds = require('@sap/cds');
const { message } = require('@sap/cds/lib/log/cds-error');
const { SELECT, UPDATE } = cds.ql;

module.exports = cds.service.impl(async function (srv) {
    const { Product } = srv.entities;
    let origstock = 0;

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

    srv.before('orderProduct', async(req) => {
        const result = await SELECT .from(Product) .columns('stock') .where({ID:req.params[0].ID});
        let stock = result[0].stock;
        origstock = stock;
        if ( stock > 500) {
            return req.error({
                code: '400',
                message : 'Stock should not be greater than 500.'
                // message : stock+' more items has been purchased. You\'ll get notified, once items are for shipping. Thank you!'
            });
            
        }
    });

    srv.on('orderProduct', async(req) => {
        let inputstock = req.data.stock;
        let newstock = origstock+inputstock;
        const result = await UPDATE(Product) .with({stock : newstock}) .where({ID : req.params[0].ID});

        return req.notify(`Order placed! Updated stock is ${newstock}`);
    });

});