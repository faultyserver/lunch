-- +micrate Up
CREATE TABLE "public"."locations" (
    "id" serial,
    "street_address" text,
    "dine_in" boolean,
    "average_wait" integer,
    "website" text,
    "name" text,
    "brianable" boolean,
    "alexable" boolean,
    "price_level" integer,
    "group_size" integer,
    "created_at" timestamp without time zone,
    "updated_at" timestamp without time zone,
    PRIMARY KEY ("id")
);
