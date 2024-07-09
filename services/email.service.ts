import nodemailer from "nodemailer";
import winston from 'winston';
import dotenv from "dotenv";
dotenv.config();

const logger = winston.createLogger({
    level: 'debug',
    format: winston.format.json(),
    transports: [new winston.transports.Console()]
});

export async function sendMail( to: string, subject: string, html: string) {
    const transporter = nodemailer.createTransport({
        service: process.env.MAIL_HOST,
        auth: {
            user: process.env.MAIL_USERNAME,
            pass: process.env.MAIL_PASSWORD
        }
    });

    const mailOptions = {
        to: to,
        subject: subject,
        html: html
    };

    logger.info(`Sending mail to - ${to}`);
    transporter.sendMail(mailOptions, (error, info)=> {
        if (error) {
            logger.error(error);
        } else {
            logger.info('Email sent: ' + info.response);
        }
    });
}

