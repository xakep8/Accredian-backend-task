import prisma from "../client";

interface Referral{
    referrerEmail:string,
    referreeEmail:string,
}

/**
 * Create a referral
 * @param {Object} payload
 * @returns {Promise<Referral>}
 */

export async function createReferral(payload:Referral){
    const referreeEmail=payload.referreeEmail,referrerEmail=payload.referrerEmail,status=false;
    return await prisma.referral.create({data:{referreeEmail,referrerEmail,status}});
}

/**
 * Get refer details
 * @param {Object} payload
 * @returns {Promise<Referral>}
 */

export async function getDetails(payload:Referral) {
    return await prisma.referral.findUnique({
        where:{
            referPair:{referreeEmail:payload.referreeEmail,referrerEmail:payload.referrerEmail}
        },
    })
}