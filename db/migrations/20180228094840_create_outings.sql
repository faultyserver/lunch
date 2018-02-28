-- +micrate Up
CREATE TABLE "public"."outings" (
    "id" serial,
    "name" text,
    "location_id" integer,
    "owner_id" integer,
    "time" timestamp,
    "created_at" timestamp without time zone,
    "updated_at" timestamp without time zone,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("location_id") REFERENCES "public"."locations"("id"),
    FOREIGN KEY ("owner_id") REFERENCES "public"."accounts"("id")
);
