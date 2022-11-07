-- CreateTable
CREATE TABLE `Tutor` (
    `id` VARCHAR(191) NOT NULL,
    `nameTutor` VARCHAR(191) NOT NULL,
    `rgId` VARCHAR(191) NOT NULL,
    `cpfId` VARCHAR(191) NOT NULL,
    `ocupation` VARCHAR(191) NOT NULL,
    `phone` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `observations` VARCHAR(191) NOT NULL,
    `fileRg` VARCHAR(191) NULL,
    `fileResidence` VARCHAR(191) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Address` (
    `id` VARCHAR(191) NOT NULL,
    `street` VARCHAR(191) NOT NULL,
    `number` VARCHAR(191) NOT NULL,
    `complement` VARCHAR(191) NOT NULL,
    `district` VARCHAR(191) NOT NULL,
    `city` VARCHAR(191) NOT NULL,
    `tutorId` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Address_tutorId_key`(`tutorId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Pet` (
    `id` VARCHAR(191) NOT NULL,
    `petType` VARCHAR(191) NOT NULL,
    `age` INTEGER NOT NULL,
    `castrated` BOOLEAN NOT NULL,
    `wormed` BOOLEAN NOT NULL,
    `vac` BOOLEAN NOT NULL,
    `latestVacDate` VARCHAR(191) NOT NULL,
    `tutorId` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `VacsName` (
    `id` VARCHAR(191) NOT NULL,
    `rabica` BOOLEAN NOT NULL,
    `raiva` BOOLEAN NOT NULL,
    `petId` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `VacsName_petId_key`(`petId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Address` ADD CONSTRAINT `Address_tutorId_fkey` FOREIGN KEY (`tutorId`) REFERENCES `Tutor`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Pet` ADD CONSTRAINT `Pet_tutorId_fkey` FOREIGN KEY (`tutorId`) REFERENCES `Tutor`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `VacsName` ADD CONSTRAINT `VacsName_petId_fkey` FOREIGN KEY (`petId`) REFERENCES `Pet`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
