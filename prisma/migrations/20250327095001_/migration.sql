-- CreateTable
CREATE TABLE "film_post" (
    "post_id" SERIAL NOT NULL,
    "film_id" INTEGER NOT NULL,
    "content" TEXT NOT NULL,
    "created_at" TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(6) NOT NULL,

    CONSTRAINT "film_post_pkey" PRIMARY KEY ("post_id")
);

-- AddForeignKey
ALTER TABLE "film_post" ADD CONSTRAINT "film_post_film_id_fkey" FOREIGN KEY ("film_id") REFERENCES "film"("film_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
