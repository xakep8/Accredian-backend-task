-- CreateTable
CREATE TABLE `Referral` (
    `id` VARCHAR(191) NOT NULL,
    `refereeEmail` VARCHAR(191) NOT NULL,
    `refererEmail` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Referral_refereeEmail_key`(`refereeEmail`),
    UNIQUE INDEX `Referral_refererEmail_key`(`refererEmail`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
