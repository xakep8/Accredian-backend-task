/*
  Warnings:

  - You are about to drop the column `refereeEmail` on the `referral` table. All the data in the column will be lost.
  - You are about to drop the column `refererCode` on the `referral` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[referreeEmail,referrerCode]` on the table `Referral` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `referreeEmail` to the `Referral` table without a default value. This is not possible if the table is not empty.
  - Added the required column `referrerCode` to the `Referral` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `Referral_refereeEmail_refererCode_key` ON `referral`;

-- AlterTable
ALTER TABLE `referral` DROP COLUMN `refereeEmail`,
    DROP COLUMN `refererCode`,
    ADD COLUMN `referreeEmail` VARCHAR(191) NOT NULL,
    ADD COLUMN `referrerCode` VARCHAR(191) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Referral_referreeEmail_referrerCode_key` ON `Referral`(`referreeEmail`, `referrerCode`);
