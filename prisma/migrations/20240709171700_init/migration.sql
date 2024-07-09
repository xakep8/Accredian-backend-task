/*
  Warnings:

  - You are about to drop the column `referrerCode` on the `referral` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[referreeEmail,referrerEmail]` on the table `Referral` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `referrerEmail` to the `Referral` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `Referral_referreeEmail_referrerCode_key` ON `referral`;

-- AlterTable
ALTER TABLE `referral` DROP COLUMN `referrerCode`,
    ADD COLUMN `referrerEmail` VARCHAR(191) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Referral_referreeEmail_referrerEmail_key` ON `Referral`(`referreeEmail`, `referrerEmail`);
