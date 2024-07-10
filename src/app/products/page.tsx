import { Plus } from "lucide-react";

import { Button } from "@/components/ui/button";
import {
  Card,
  CardContent,
  CardDescription,
  CardFooter,
  CardHeader,
  CardTitle,
} from "@/components/ui/card";
import {
  Table,
  TableBody,
  TableHead,
  TableHeader,
  TableRow,
} from "@/components/ui/table";
import { getAllProducts } from "@/db/products";
import ProductItem from "./_components/ProductItem";
import { VariantsWithProduct } from "@/types/complexTypes";
import Link from "next/link";

export default async function Products() {
  const products: VariantsWithProduct[] = await getAllProducts();
  console.log("products :>> ", products);

  return (
    <>
      <Card>
        <CardHeader>
          <CardTitle>Products</CardTitle>
          <CardDescription>
            Manage your products and view their sales performance.
          </CardDescription>
        </CardHeader>
        <CardContent>
          <Table>
            <TableHeader>
              <TableRow>
                <TableHead className="w-[100px] md:table-cell">Id</TableHead>
                <TableHead>Name</TableHead>
                <TableHead>Product</TableHead>
                <TableHead className="hidden md:table-cell">Price</TableHead>
                <TableHead className="hidden md:table-cell">
                  Stock quantity
                </TableHead>
                <TableHead className="hidden md:table-cell">Category</TableHead>
                <TableHead>
                  <span className="sr-only">Actions</span>
                </TableHead>
              </TableRow>
            </TableHeader>
            <TableBody>
              {products.map((product) => (
                <ProductItem {...product} key={String(product.variant_id)} />
              ))}
            </TableBody>
          </Table>
        </CardContent>
        <CardFooter>
          <div className="text-xs text-muted-foreground">
            Showing <strong>1-10</strong> of <strong>32</strong> products
          </div>
        </CardFooter>
      </Card>

      <Link href="/products/edit" className="mx-auto mt-6">
        <Button>
          <Plus className="mr-2 h-4 w-4" />
          Add Product
        </Button>
      </Link>
    </>
  );
}
