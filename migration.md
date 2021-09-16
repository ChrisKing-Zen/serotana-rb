generator client {
provider = "prisma-client-js"
previewFeatures = ["selectRelationCount"]
}

datasource db {
provider = "postgresql"
url = env("DATABASE_URL")
}

model User {
id integer @id @default(autoincrement())
createdAt DateTime @default(now())
updatedAt DateTime @updatedAt
email string @unique
hashedPassword string
role string @default("CLIENT")
verified Boolean @default(false)
verificationToken string @unique @default(uuid())
anonymized Boolean @default(false)
anonymousToken string @unique @default(uuid())
Client Client?
sessions Session[]
Therapist Therapist?
tokens Token[]
createdLanguages Language[]
Credential Credential[]
License License[]
Report Report[]
Alliance Alliance[]
}

model Session {
id integer @id @default(autoincrement())
createdAt DateTime @default(now())
updatedAt DateTime @updatedAt
expiresAt DateTime?
handle string @unique
hashedSessionToken string
antiCSRFToken string
publicData string
privateData string
userId integer?
user User? @relation(fields: [userId], references: [id])
}

model Token {
id integer @id @default(autoincrement())
createdAt DateTime @default(now())
updatedAt DateTime @updatedAt
hashedToken string
type string
expiresAt DateTime
sentTo string
userId integer
user User @relation(fields: [userId], references: [id])

@@unique([hashedToken, type], name: "Token_hashedToken_type_unique")
}

model Post {
id integer @id @default(autoincrement())
createdAt DateTime @default(now())
updatedAt DateTime @updatedAt
problems string
expectations string
furtherInfo string
settingPreference string
minBudget integer
maxBudget integer
isInsured Boolean @default(true)
outOfPocketOnly Boolean @default(false)
active Boolean @default(true)
acquiredTherapistHere Boolean?
anonymize Boolean @default(false)
anonymizationDate DateTime?
clientId integer
client Client @relation(fields: [clientId], references: [id])
proposals Proposal[]
specializedIssues SpecializedIssue[]
}

model Proposal {
id integer @id @default(autoincrement())
createdAt DateTime @default(now())
updatedAt DateTime @updatedAt
message string
postId integer
therapistId integer
status string @default("active")
post Post @relation(fields: [postId], references: [id])
therapist Therapist @relation(fields: [therapistId], references: [id])

Report Report[]
@@unique([therapistId, postId])
}

model Therapist {
id integer @id @default(autoincrement())
createdAt DateTime @default(now())
updatedAt DateTime @updatedAt
firstName string
lastName string
description string
profileImageUrl string
therapyProcess string
websiteUrl string
phone string
country string
birthDate string
settingPreference string @default("online")
showAge Boolean @default(true)
onboardingStep integer @default(0)
userId integer @unique
user User @relation(fields: [userId], references: [id])
demographics Demographic[]
languages TherapistLanguage[]
modalities Modality[]
proposals Proposal[]
specializedIssues SpecializedIssue[]
faithId integer?
faith Faith? @relation(fields: [faithId], references: [id])
alliances Alliance[]
addresses Address[]
insurances Insurance[]
contactInfo ContactInfo[]
credentials Credential[]
paymentOptions PaymentOption[]
licenses License[]
reports Report[]

@@index([id, country])
@@index([id, birthDate])
@@index([id, settingPreference])
}

model Client {
id integer @id @default(autoincrement())
createdAt DateTime @default(now())
updatedAt DateTime @updatedAt
hadSeenTherapist Boolean?
isTakingMeds Boolean?
country string
city string
state string
birthDate string
onboardingStep integer @default(0)
userId integer @unique
user User @relation(fields: [userId], references: [id])
languages ClientLanguage[]
posts Post[]
faithId integer?
faith Faith? @relation(fields: [faithId], references: [id])
insuranceId integer?
insurance Insurance? @relation(fields: [insuranceId], references: [id])
reports Report[]
}

model Modality {
id integer @id @default(autoincrement())
createdAt DateTime @default(now())
updatedAt DateTime @updatedAt
name string
therapists Therapist[]
}

model Demographic {
id integer @id @default(autoincrement())
createdAt DateTime @default(now())
updatedAt DateTime @updatedAt
name string
therapists Therapist[]

}

model SpecializedIssue {
id integer @id @default(autoincrement())
createdAt DateTime @default(now())
updatedAt DateTime @updatedAt
name string
post Post[]
therapists Therapist[]
}

model Credential {
id integer @id @default(autoincrement())
major string
level string
type string
//This should be arts or science only
description string
location string
yearAchieved integer
display Boolean @default(true)
createdAt DateTime @default(now())
updatedAt DateTime @updatedAt
photoUrl string
verified Boolean @default(false)
verifierId integer?
verifier User? @relation(fields: [verifierId], references: [id])
therapistId integer
therapist Therapist @relation(fields: [therapistId], references: [id])

@@unique([location, yearAchieved, major, level, type])
}

model Faith {
id integer @id @default(autoincrement())
name string
createdAt DateTime @default(now())
updatedAt DateTime @updatedAt
clients Client[]
therapists Therapist[]
}

model Alliance {
id integer @id @default(autoincrement())
name string @unique
description string
url string
createdAt DateTime @default(now())
updatedAt DateTime @updatedAt
ownerId integer?
owner User? @relation(fields: [ownerId], references: [id])
therapists Therapist[]
}

model PaymentOption {
id integer @id @default(autoincrement())
settingType string
slidingScale Boolean
minRate integer
maxRate integer?
category string
createdAt DateTime @default(now())
updatedAt DateTime @updatedAt
therapistId integer
therapist Therapist @relation(fields: [therapistId], references: [id])
paymentMethods PaymentMethod[]
}

model PaymentMethod {
id integer @id @default(autoincrement())
name string
icon string
createdAt DateTime @default(now())
updatedAt DateTime @updatedAt
paymentOptions PaymentOption[]
}

model Insurance {
id integer @id @default(autoincrement())
name string
state string @default("")
country string
createdAt DateTime @default(now())
updatedAt DateTime @updatedAt
clients Client[]
therapists Therapist[]

@@unique([country, state, name])
}

model Address {
id integer @id @default(autoincrement())
street string
city string
state string
postalCode string
createdAt DateTime @default(now())
updatedAt DateTime @updatedAt
therapistId integer
therapist Therapist @relation(fields: [therapistId], references: [id])

@@index([therapistId, city, state])
}

model ContactInfo {
id integer @id @default(autoincrement())
name string
url string
therapistId integer
therapist Therapist @relation(fields: [therapistId], references: [id])
createdAt DateTime @default(now())
updatedAt DateTime @updatedAt

}

model TherapistLanguage {
languageId integer
language Language @relation(fields: [languageId], references: [id])
therapistId integer
therapist Therapist @relation(fields: [therapistId], references: [id])
createdAt DateTime @default(now())

@@unique([therapistId, languageId])
}

model ClientLanguage {
languageId integer
language Language @relation(fields: [languageId], references: [id])
clientId integer
client Client @relation(fields: [clientId], references: [id])
createdAt DateTime @default(now())

@@unique([clientId, languageId])
}

model Language {
id integer @id @default(autoincrement())
name string @unique
clients ClientLanguage[]
therapists TherapistLanguage[]
userId integer?
createdBy User? @relation(fields: [userId], references: [id])

createdAt DateTime @default(now())
}

model License {
id integer @id @default(autoincrement())
name string
state string
country string
photoUrl string
verifierId integer?
verifier User? @relation(fields: [verifierId], references: [id])
therapistId integer
therapist Therapist @relation(fields: [therapistId], references: [id])
createdAt DateTime @default(now())
updatedAt DateTime @updatedAt
}

model Report {
id integer @id @default(autoincrement())
message string
reporterEmail string
resolved Boolean @default(false)
adminComments string
clientId integer?
client Client? @relation(fields: [clientId], references: [id])
verifierId integer?
verifier User? @relation(fields: [verifierId], references: [id])
therapistId integer?
therapist Therapist? @relation(fields: [therapistId], references: [id])
proposalId integer?
proposal Proposal? @relation(fields: [proposalId], references: [id])
createdAt DateTime @default(now())
updatedAt DateTime @updatedAt
}
