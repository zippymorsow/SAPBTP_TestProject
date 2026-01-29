using { sap.cap.productshop as my } from '../db/schema';

service productshop
{
    @odata.draft.enabled
    entity Product as
        projection on my.Product
        actions
        {
            action orderProduct
            (
                @title : 'Product Name'
                name : String,
                @title : 'Stock'
                stock : Integer
            );

            action fingerprint
            (
                name : String
            );

            action createPO
            (
                name : String
            );
        };

    @odata.draft.enabled
    entity Supplier as
        projection on my.Supplier;

    function MyFunction
    (
        name : String
    )
    returns String;

    action MyAction
    (
        name : String
    )
    returns String;
}
