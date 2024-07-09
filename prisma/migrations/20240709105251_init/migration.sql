/*
  Warnings:

  - You are about to drop the column `refererEmail` on the `referral` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[refereeEmail,refererCode]` on the table `Referral` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `refererCode` to the `Referral` table without a default value. This is not possible if the table is not empty.
  - Added the required column `status` to the `Referral` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `Referral_refereeEmail_key` ON `referral`;

-- DropIndex
DROP INDEX `Referral_refererEmail_key` ON `referral`;

-- AlterTable
ALTER TABLE `referral` DROP COLUMN `refererEmail`,
    ADD COLUMN `refererCode` VARCHAR(191) NOT NULL,
    ADD COLUMN `status` BOOLEAN NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Referral_refereeEmail_refererCode_key` ON `Referral`(`refereeEmail`, `refererCode`);
