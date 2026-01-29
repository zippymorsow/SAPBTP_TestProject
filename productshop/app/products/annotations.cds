using productshop as service from '../../srv/product-service';
using from '../../db/schema';

annotate service.Product with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'name',
                Value : name,
            },
            {
                $Type : 'UI.DataField',
                Label : 'stock',
                Value : stock,
            },
            {
                $Type : 'UI.DataField',
                Label : 'price',
                Value : price,
            },
            {
                $Type : 'UI.DataField',
                Label : 'criticality',
                Value : criticality,
            },
            {
                $Type : 'UI.DataField',
                Label : 'rating',
                Value : rating,
            },
            {
                $Type : 'UI.DataField',
                Label : 'category',
                Value : category,
            },
            {
                $Type : 'UI.DataField',
                Label : 'emission',
                Value : emission,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : '{i18n>GeneralInformation}',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>Supplier}',
            ID : 'i18nAnotherRowSection',
            Target : '@UI.FieldGroup#i18nAnotherRowSection',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Table sampler',
            ID : 'Tablesampler',
            Target : 'conversation/@UI.LineItem#Tablesampler',
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : '{i18n>IdentificationSection}',
            ID : 'i18nIdentificationSection',
            Target : '@UI.Identification',
        },
        {
            $Type : 'UI.CollectionFacet',
            Label : 'group section',
            ID : 'groupsection',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'form section',
                    ID : 'formsection',
                    Target : '@UI.FieldGroup#formsection',
                },
            ],
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'productshop.fingerprint',
            Label : 'fingerprint',
            Inline : true,
            IconUrl : 'sap-icon://biometric-thumb'
        },
        {
            $Type : 'UI.DataField',
            Label : 'Product',
            Value : name,
        },
        {
            $Type : 'UI.DataField',
            Value : category,
            Label : '{i18n>Category}',
        },
        {
            $Type : 'UI.DataField',
            Label : 'Price',
            Value : price,
        },
        {
            $Type : 'UI.DataField',
            Value : stock,
            Label : 'Stock',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'productshop.orderProduct',
            Label : 'Order Product',
            Inline : true,
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'productshop.createPO',
            Label : 'Purchase Order',
        },
        {
            $Type : 'UI.DataFieldForIntentBasedNavigation',
            SemanticObject : 'ok',
            Action : 'ok',
            Label : 'Ok ok',
            Inline : true,
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@UI.Chart#criticality',
            Label : 'criticality',
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@UI.DataPoint#emission1',
            Label : 'emission',
        },
    ],
    UI.SelectionFields : [
        name,
        category,
        criticality,
    ],
    UI.DataPoint #name : {
        $Type : 'UI.DataPointType',
        Value : name,
        Title : '{i18n>ProductName}',
    },
    UI.HeaderFacets : [
        
    ],
    UI.HeaderInfo : {
        TypeName : 'Name',
        TypeNamePlural : '',
        Title : {
            $Type : 'UI.DataField',
            Value : name,
        },
        Description : {
            $Type : 'UI.DataField',
            Value : stock,
        },
        TypeImageUrl : 'sap-icon://SAP-icons-TNT/ai-1',
    },
    UI.Identification : [
        {
            $Type : 'UI.DataFieldForIntentBasedNavigation',
            SemanticObject : 'Back Object Name',
            Action : 'Back Name',
            Label : 'Back Name Back Object Name',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'productshop.createPO',
            Label : '{i18n>PurchaseOrder}',
        },
        {
            $Type : 'UI.DataField',
            Value : createdBy,
        },
        {
            $Type : 'UI.DataField',
            Value : createdAt,
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@UI.ConnectedFields#connected1',
            Label : 'field connect 1',
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action : 'productshop.orderProduct',
            Label : 'orderProduct',
            Determining : true,
        },
    ],
    UI.FieldGroup #i18nAnotherSampleSection : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    },
    UI.FieldGroup #i18nAnotherRowSection : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : supplier.name,
                Label : 'name',
            },
            {
                $Type : 'UI.DataField',
                Value : supplier.city,
                Label : 'city',
            },
            {
                $Type : 'UI.DataField',
                Value : supplier.ID,
                Label : 'ID',
            },
            {
                $Type : 'UI.DataFieldForAnnotation',
                Target : 'supplier/@Communication.Contact#contact',
                Label : 'Contact Name',
            },
        ],
    },
    UI.ConnectedFields #connected : {
        $Type : 'UI.ConnectedFieldsType',
        Template : '{supplier_ID}6{emission}',
        Data : {
            $Type : 'Core.Dictionary',
            supplier_ID : {
                $Type : 'UI.DataField',
                Value : supplier_ID,
            },
            emission : {
                $Type : 'UI.DataField',
                Value : emission,
            },
        },
    },
    UI.DataPoint #criticality : {
        Value : criticality,
        Visualization : #Rating,
        TargetValue : 5,
    },
    UI.ConnectedFields #connected1 : {
        $Type : 'UI.ConnectedFieldsType',
        Template : '{ID} || {supplier_ID}',
        Data : {
            $Type : 'Core.Dictionary',
            ID : {
                $Type : 'UI.DataField',
                Value : ID,
            },
            supplier_ID : {
                $Type : 'UI.DataField',
                Value : supplier.ID,
            },
        },
    },
    UI.FieldGroup #formsection : {
        $Type : 'UI.FieldGroupType',
        Data : [
        ],
    },
    UI.DataPoint #criticality1 : {
        Value : criticality,
        TargetValue : stock,
        Criticality : stock,
    },
    UI.Chart #criticality : {
        ChartType : #Donut,
        Measures : [
            criticality,
        ],
        MeasureAttributes : [
            {
                DataPoint : '@UI.DataPoint#criticality1',
                Role : #Axis1,
                Measure : criticality,
            },
        ],
    },
    UI.DataPoint #emission : {
        Value : emission,
        Visualization : #Progress,
        TargetValue : 100,
    },
    UI.DataPoint #emission1 : {
        Value : emission,
        Visualization : #Progress,
        TargetValue : 10000,
        Criticality : criticality,
    },
);

annotate service.Product with {
    supplier @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'Supplier',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : supplier_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'city',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'phone',
            },
        ],
    }
};

annotate service.Product with {
    criticality @Common.Label : 'Criticality'
};

annotate service.Product with {
    category @Common.Label : 'Category'
};

annotate service.Product with {
    name @Common.Label : '{i18n>Product}'
};

annotate service.Supplier with @(
    Communication.Contact #contact : {
        $Type : 'Communication.ContactType',
        fn : phone,
    }
);

annotate service.Product.conversation with @(
    UI.LineItem #Tablesampler : [
        {
            $Type : 'UI.DataField',
            Value : message,
            Label : 'message',
        },
        {
            $Type : 'UI.DataField',
            Value : processor,
            Label : 'processor',
        },
        {
            $Type : 'UI.DataField',
            Value : timestamp,
            Label : 'timestamp',
        },
    ]
);

