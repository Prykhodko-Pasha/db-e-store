import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import { TableCell, TableRow } from "@/components/ui/table";
import { MoreHorizontal } from "lucide-react";
import { VariantsWithProduct } from "@/types/complexTypes";

export default function ProductItem({ ...product }: VariantsWithProduct) {
  console.log("product :>> ", product);
  return (
    <TableRow>
      <TableCell className="font-medium">{product.variant_id}</TableCell>
      <TableCell className="font-medium">
        {product.product.name} {product.value}
      </TableCell>
      <TableCell>
        <Badge variant="outline">{product.product.name}</Badge>
      </TableCell>
      <TableCell className="hidden md:table-cell">
        ${Number(product.price)}
      </TableCell>
      <TableCell className="hidden md:table-cell">
        {product.stock_quantity}
      </TableCell>
      <TableCell className="hidden md:table-cell">
        <Badge variant="secondary">{product.product.category.name}</Badge>
      </TableCell>
      <TableCell>
        <DropdownMenu>
          <DropdownMenuTrigger asChild>
            <Button aria-haspopup="true" size="icon" variant="ghost">
              <MoreHorizontal className="h-4 w-4" />
              <span className="sr-only">Toggle menu</span>
            </Button>
          </DropdownMenuTrigger>
          <DropdownMenuContent align="end">
            <DropdownMenuItem>Edit</DropdownMenuItem>
            <DropdownMenuItem>Delete</DropdownMenuItem>
          </DropdownMenuContent>
        </DropdownMenu>
      </TableCell>
    </TableRow>
  );
}
