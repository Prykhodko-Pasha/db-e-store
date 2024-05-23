-- CreateTable
CREATE TABLE "Customer" (
    "customer_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "phone" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Order" (
    "order_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "order_date" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "total_amount" DECIMAL NOT NULL,
    "status" TEXT NOT NULL,
    "customer_id" INTEGER NOT NULL,
    "payment_id" INTEGER NOT NULL,
    "shipment_id" INTEGER NOT NULL,
    "promo_id" INTEGER,
    CONSTRAINT "Order_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "Customer" ("customer_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Order_payment_id_fkey" FOREIGN KEY ("payment_id") REFERENCES "Payment" ("payment_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Order_shipment_id_fkey" FOREIGN KEY ("shipment_id") REFERENCES "Shipment" ("shipment_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Order_promo_id_fkey" FOREIGN KEY ("promo_id") REFERENCES "Promo" ("promo_id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Product" (
    "product_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "stock_quantity" INTEGER NOT NULL,
    "category_id" INTEGER NOT NULL,
    CONSTRAINT "Product_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "Category" ("category_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Category" (
    "category_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "description" TEXT
);

-- CreateTable
CREATE TABLE "OrderItem" (
    "order_item_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "order_id" INTEGER NOT NULL,
    "variant_id" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    "unit_price" DECIMAL NOT NULL,
    CONSTRAINT "OrderItem_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "Order" ("order_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "OrderItem_variant_id_fkey" FOREIGN KEY ("variant_id") REFERENCES "Variant" ("variant_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Cart" (
    "cart_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "quantity" INTEGER NOT NULL,
    "customer_id" INTEGER NOT NULL,
    CONSTRAINT "Cart_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "Customer" ("customer_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Wishlist" (
    "wishlist_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "customer_id" INTEGER NOT NULL,
    CONSTRAINT "Wishlist_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "Customer" ("customer_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Variant" (
    "variant_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "key" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "price" DECIMAL NOT NULL,
    "product_id" INTEGER NOT NULL,
    CONSTRAINT "Variant_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "Product" ("product_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Payment" (
    "payment_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "method" TEXT NOT NULL,
    "amount" DECIMAL NOT NULL
);

-- CreateTable
CREATE TABLE "Shipment" (
    "shipment_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "address" TEXT NOT NULL,
    "shipping_date" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Promo" (
    "promo_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "discount" DECIMAL NOT NULL,
    "variantVariant_id" INTEGER,
    CONSTRAINT "Promo_variantVariant_id_fkey" FOREIGN KEY ("variantVariant_id") REFERENCES "Variant" ("variant_id") ON DELETE SET NULL ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Branch" (
    "branch_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "location" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "InventoryItem" (
    "inventory_item_id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "variant_id" INTEGER NOT NULL,
    "branch_id" INTEGER NOT NULL,
    "stock_quantity" INTEGER NOT NULL,
    "last_update" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "InventoryItem_variant_id_fkey" FOREIGN KEY ("variant_id") REFERENCES "Variant" ("variant_id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "InventoryItem_branch_id_fkey" FOREIGN KEY ("branch_id") REFERENCES "Branch" ("branch_id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "_CartToVariant" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_CartToVariant_A_fkey" FOREIGN KEY ("A") REFERENCES "Cart" ("cart_id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_CartToVariant_B_fkey" FOREIGN KEY ("B") REFERENCES "Variant" ("variant_id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "_VariantToWishlist" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_VariantToWishlist_A_fkey" FOREIGN KEY ("A") REFERENCES "Variant" ("variant_id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_VariantToWishlist_B_fkey" FOREIGN KEY ("B") REFERENCES "Wishlist" ("wishlist_id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Customer_email_key" ON "Customer"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Order_promo_id_key" ON "Order"("promo_id");

-- CreateIndex
CREATE UNIQUE INDEX "Cart_customer_id_key" ON "Cart"("customer_id");

-- CreateIndex
CREATE UNIQUE INDEX "Wishlist_customer_id_key" ON "Wishlist"("customer_id");

-- CreateIndex
CREATE UNIQUE INDEX "Promo_variantVariant_id_key" ON "Promo"("variantVariant_id");

-- CreateIndex
CREATE UNIQUE INDEX "_CartToVariant_AB_unique" ON "_CartToVariant"("A", "B");

-- CreateIndex
CREATE INDEX "_CartToVariant_B_index" ON "_CartToVariant"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_VariantToWishlist_AB_unique" ON "_VariantToWishlist"("A", "B");

-- CreateIndex
CREATE INDEX "_VariantToWishlist_B_index" ON "_VariantToWishlist"("B");
