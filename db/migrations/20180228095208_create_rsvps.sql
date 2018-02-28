-- +micrate Up
CREATE TABLE "public"."rsvps" (
    "account_id" integer,
    "outing_id" integer,
    "notes" text,
    "created_at" timestamp without time zone,
    "updated_at" timestamp without time zone,
    FOREIGN KEY ("account_id") REFERENCES "public"."accounts"("id"),
    FOREIGN KEY ("outing_id") REFERENCES "public"."outings"("id")
);
