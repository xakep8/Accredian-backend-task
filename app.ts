import express,{Express,NextFunction, Request, Response} from "express";
import httpStatus from "http-status";
import ApiError from "./utils/ApiError";
import { createReferral,getDetails } from "./services/referral.service";
import bodyParser from "body-parser";
import { sendMail } from "./services/email.service";

const app:Express=express();
app.use(bodyParser.json());
app.use(express.urlencoded({ extended: false }));

app.post("/refer",async (req,res)=>{
    const referrerEmail=req.body.referrerEmail;
    const referreeEmail=req.body.referreeEmail;
    if(await getDetails({referrerEmail,referreeEmail})!=null){
        res.status(400).send("Already referred");
        return;
    }
    
    if(referreeEmail==referrerEmail){
        res.status(400).send("Referrer and Referree cannot have same email");
        return;
    }
    if(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(referreeEmail)==false){
        res.status(400).send("Referree Email Invalid");
        return;
    }
    if(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(referrerEmail)==false){
        res.status(400).send("Referrer Email Invalid");
        return;
    }
    try{
        const refer=await createReferral({referrerEmail,referreeEmail});
        const from: string = referrerEmail;
        const to: string = referreeEmail;
        const subject: string = '<subject>';
        const mailTemplate: string = '<html string either defined, or loaded from a html file>';
        sendMail( to, subject, mailTemplate);
        res.status(200).send(refer);
    }
    catch(err){
        console.log(err);
        res.status(httpStatus.INTERNAL_SERVER_ERROR).send(err);
    }
});

app.get("*",(req,res)=>{
    res.send(new ApiError(httpStatus.NOT_FOUND, "Not found"));
})

export default app;