"use client";

import { Package, ShoppingCart, Users } from "lucide-react";
import Link from "next/link";
import { usePathname } from "next/navigation";

const NavLinks = [
  {
    name: "Products",
    href: "/products",
    icon: Package,
  },
  {
    name: "Orders",
    href: "/orders",
    icon: ShoppingCart,
  },
  {
    name: "Users",
    href: "#",
    icon: Users,
  },
];

export default function Navbar() {
  const pathname = usePathname();
  const isActive = (path: String) => pathname === path;

  return (
    <div className="flex-1">
      <nav className="grid items-start px-2 text-sm font-medium lg:px-4">
        {NavLinks.map((link) => {
          const Icon = link.icon;
          return (
            <Link
              href={link.href}
              key={link.name}
              className={`flex items-center gap-3 rounded-lg px-3 py-2 text-primary transition-all hover:text-primary ${
                isActive(link.href) && "bg-muted"
              }`}
            >
              <Icon className="h-4 w-4" />
              {link.name}{" "}
            </Link>
          );
        })}
      </nav>
    </div>
  );
}
