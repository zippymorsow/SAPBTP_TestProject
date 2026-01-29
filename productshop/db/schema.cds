namespace sap.cap.productshop;
using { cuid, managed } from '@sap/cds/common';

/**
 * what is aspect?
 */
aspect CarbonEmission {
    emission : Integer;
    rating : String;
}

/**
 * what is type?
 */
type PriceCost
{
    price : Integer;
    stock : Integer;
}

entity Product : CarbonEmission, cuid, managed
{
    name : String;
    category : String;
    price : Integer;
    stock : Integer;
    criticality : Integer;
    supplier : Association to one Supplier;
    conversation: Composition of many { ///sample Composition; "up_ID" will be created as indication that it will contain the parent "ID".
        key ID : UUID;
        timestamp : String;
        processor : String;
        message : String;
    }

}

/***
 * What is Association?
 * Can be parent & child relationship; Ensitites are independent from each other;
 * What is Composition?
 * Strictly a parent & child relationship; One entity is dependent;
 */
entity Supplier
{
    key ID : String;
    name : String(100);
    city : String(100);
    phone : String(100);
    product : Association to many Product on product.supplier = $self;
}
