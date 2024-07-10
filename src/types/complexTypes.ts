import { Category, Prisma, Product, Variant } from "@prisma/client";

export type VariantsWithProduct = Prisma.VariantGetPayload<{
  include: { product: { include: { category: true } } };
}>;
// export type ProductWithCategory = Product & {
//   category: Category;
// };
// export type VariantsWithProduct = Variant & {
//   product: Product;
// };

// export type VariantItem = VariantsWithProduct["product"] & Variant;
