import prisma from "./db";

// READ
export const getAllProducts = async () => {
  // console.log("params getAllProducts:>> ", params);
  //   const { page, sortKey, sortValue, search, categories } = params;
  // console.log("categories :>> ", categories);
  //   const filteredCategories = categories
  //     ? JSON.parse(categories)
  //     : categoriesList;

  const allProducts = await prisma.variant.findMany({
    include: {
      product: {
        include: {
          category: true,
        },
      },
    },
  });
  console.log("allProducts :>> ", allProducts);
  //   const ProductsCount = allProducts.length;

  //   const takenProducts = await prisma.bill.findMany({
  //     where: {
  //       OR: [
  //         {
  //           title: {
  //             contains: search,
  //             mode: "insensitive",
  //           },
  //         },
  //         {
  //           text: {
  //             contains: search,
  //             mode: "insensitive",
  //           },
  //         },
  //       ],
  //       category: { in: filteredCategories },
  //     },
  //     orderBy: {
  //       [sortKey]: sortValue,
  //     },
  //     skip: 9 * (page - 1),
  //     take: 9,
  //     select: {
  //       id: true,
  //       title: true,
  //       text: true,
  //       category: true,
  //       rating: true,
  //       author: { select: { id: true, email: true } },
  //       createdAt: true,
  //     },
  //   });
  //   return { Products: takenProducts, count: ProductsCount };
  return allProducts;
};
