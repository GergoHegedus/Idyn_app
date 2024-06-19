codeunit 50100 "HG API Functions"
{

    trigger OnRun()
    begin
        GetItemsFromProductsAPI('https://dummyjson.com/products/search?q=phone');
    end;

    local procedure GetItemsFromProductsAPI(url: text[100])
    var
        HttpClient: HttpClient;
        HttpRequest: HttpRequestMessage;
        HttpResponse: HttpResponseMessage;
        ResponseText: Text;
        HttpContent: HttpContent;
        HttpHeader: HttpHeaders;
    begin
        if not HttpClient.Get(url, HttpResponse) then
            if HttpResponse.IsBlockedByEnvironment then
                Error('The request is blocked by the environment!')
            else
                Error('No response from %1', url);

        HttpContent.GetHeaders(HttpHeader);
        HttpHeader.Clear();
        HttpHeader.Add('Content-Type', 'application/json');
        HttpRequest.SetRequestUri(url);
        HttpRequest.Method := 'GET';
        if not HttpClient.Send(HttpRequest, HttpResponse) then
            Error('No response from %1', url);

        if not HttpResponse.IsSuccessStatusCode then
            Error('An error occured with status code: %1 \ %2', HttpResponse.HttpStatusCode, HttpResponse.ReasonPhrase);

        if HttpResponse.Content().ReadAs(ResponseText) then
            ReadProductsJSON(ResponseText)
        else
            Error('Error reading JSON');
    end;

    local procedure ReadProductsJSON(JsonObjectText: Text)
    var
        ArrayJSONManagement: Codeunit "JSON Management";
        PictureArrayJSONManagement: Codeunit "JSON Management";
        JSONManagement: Codeunit "JSON Management";
        ObjectJSONManagement: Codeunit "JSON Management";
        i: Integer;
        CodeText: Text;
        ProductsJsonArrayText: Text;
        ProductObject: Text;
        Item: Record Item;
        ProductPicArray: Text;
        ProductPicObject: Text;
        ItemPrice: Decimal;
        ItemDiscount: Decimal;
        MinOrderQty: Decimal;
    begin

        JSONManagement.InitializeObject(JsonObjectText);
        if JSONManagement.GetArrayPropertyValueAsStringByName('products', ProductsJsonArrayText) then begin
            ArrayJSONManagement.InitializeCollection(ProductsJsonArrayText);

            for i := 0 to ArrayJSONManagement.GetCollectionCount() - 1 do begin
                ArrayJSONManagement.GetObjectFromCollectionByIndex(ProductObject, i);
                ObjectJSONManagement.InitializeObject(ProductObject);
                ObjectJSONManagement.GetStringPropertyValueByName('id', CodeText);

                if not Item.get(CodeText) then begin


                    CreateItem(Item, CodeText);

                    if ObjectJSONManagement.GetStringPropertyValueByName('title', CodeText) then
                        Item.Validate("Description", CopyStr(CodeText.ToUpper(), 1, MaxStrLen(Item.Description)));

                    if ObjectJSONManagement.GetStringPropertyValueByName('category', CodeText) then
                        SetItemCategory(Item, CodeText);

                    if ObjectJSONManagement.GetStringPropertyValueByName('minimumOrderQuantity', CodeText) then begin
                        if Evaluate(MinOrderQty, CodeText) then begin
                            Item."Minimum Order Quantity" := MinOrderQty;
                        end;
                    end;

                    if ObjectJSONManagement.GetStringPropertyValueByName('price', CodeText) then begin
                        if Evaluate(ItemPrice, CodeText) then begin
                            Item.Validate("Unit Price", ItemPrice);
                            InsertItemPrice(Item, ItemPrice);
                        end;
                    end;

                    if ObjectJSONManagement.GetStringPropertyValueByName('discountPercentage', CodeText) then begin
                        if Evaluate(ItemDiscount, CodeText) then begin
                            InsertItemPriceDiscount(Item, ItemDiscount);
                        end;
                    end;


                    if ObjectJSONManagement.GetArrayPropertyValueAsStringByName('images', ProductPicArray) then begin
                        PictureArrayJSONManagement.InitializeCollection(ProductPicArray);
                        if PictureArrayJSONManagement.GetObjectFromCollectionByIndex(ProductPicObject, 0) then begin
                            ImportItemPictureFromURL(ProductPicObject, Item);
                        end;
                    end;
                    Item.Modify();
                end else begin
                    Item.Delete(true);
                end;
            end;
        end;
    end;


    local procedure CreateItem(var pItem: Record Item; pItemNoFromJson: Text)
    begin
        pItem.Init();
        pItem.Validate("No.", CopyStr(pItemNoFromJson.ToUpper(), 1, MaxStrLen(pItem."No.")));
        pItem.Insert();
        pItem.Validate("Base Unit of Measure", 'pcs');
        pItem.Modify();
    end;

    local procedure SetItemCategory(var pItem: Record Item; pItemCategoryFromJson: Text)
    var
        ItemCategory: Record "Item Category";
    begin
        if not ItemCategory.Get(pItemCategoryFromJson) then begin
            pItem.Validate("Item Category Code", CreateItemCategory(pItemCategoryFromJson));
        end else begin
            pItem.Validate("Item Category Code", ItemCategory.Code);
        end;
    end;

    local procedure CreateItemCategory(pItemCategoryFromJson: Text): Code[20]
    var
        ItemCategory: Record "Item Category";
    begin
        ItemCategory.Init();
        ItemCategory.Validate("Code", CopyStr(pItemCategoryFromJson.ToUpper(), 1, MaxStrLen(ItemCategory.Code)));
        ItemCategory.Insert();
        ItemCategory.Validate("Description", CopyStr(pItemCategoryFromJson, 1, MaxStrLen(ItemCategory.Description)));
        ItemCategory.Modify();
        exit(ItemCategory.Code);
    end;

    local procedure InsertItemPrice(pItem: Record Item; pItemPrice: Decimal)
    var
        SalesPrice: Record "Sales Price";
    begin

        SalesPrice.Init();
        SalesPrice.Validate("Item No.", pItem."No.");
        SalesPrice."Sales Type" := SalesPrice."Sales Type"::"All Customers";
        SalesPrice."Starting Date" := TODAY;
        SalesPrice.Validate("Unit Price", pItemPrice);
        SalesPrice.Validate("Minimum Quantity", pItem."Minimum Order Quantity");
        SalesPrice.Insert();
    end;

    local procedure InsertItemPriceDiscount(pItem: Record Item; pItemDiscount: Decimal)
    var
        SalesLineDiscount: Record "Sales Line Discount";
    begin
        SalesLineDiscount.Init();
        SalesLineDiscount.Validate(Type, SalesLineDiscount.Type::Item);
        SalesLineDiscount.Validate(Code, pItem."No.");
        SalesLineDiscount.Validate("Sales Type", SalesLineDiscount."Sales Type"::"All Customers");
        SalesLineDiscount.Validate("Starting Date", TODAY);
        SalesLineDiscount.Validate("Minimum Quantity", pItem."Minimum Order Quantity");
        SalesLineDiscount.Insert();
        SalesLineDiscount.Validate("Line Discount %", pItemDiscount);
        SalesLineDiscount.Modify();
    end;

    procedure ImportItemPictureFromURL(pPictureURL: Text; var pItem: Record Item)
    var
        Client: HttpClient;
        Content: HttpContent;
        Response: HttpResponseMessage;
        InStr: InStream;
    begin
        if Client.Get(pPictureURL, Response) then begin
            Response.Content.ReadAs(InStr);
            pItem.Picture.ImportStream(InStr, Format(pItem."No."));
        end;
    end;

}
