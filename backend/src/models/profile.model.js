import mongoose, { Schema } from "mongoose";

const profileSchema = new Schema({
    // = = = = = = = = Personal details fields = = = = = = =
    personalDetails: {
        fullName: { type: String, trim: true, index: true },
        dob: { type: Date },
        age: { type: Number },
        aadharNumber: { type: String },
        aadharCard: { type: String },
        mobile: { type: String },
        gender: { type: String },
        parentMobile: { type: String },
        maritalStatus: { type: String },
        religion: { type: String },
        casteCategory: { type: String },
        email: { type: String, unique: true, lowercase: true, trim: true },
    },
    isPersonalDetailsFilled: { type: Boolean, default: false },

    // = = = = = = = = Income details fields = = = = = = =
    incomeDetails: {
        familyIncome: { type: Number },
        incomeCertificateNumber: { type: String },
        incomeIssuingAuthority: { type: String },
        incomeCertificate: { type: String },
        incomeCertificateIssuedDate: { type: Date },
    },
    isIncomeDetailsFilled: { type: Boolean, default: false },

    // = = = = = = = = Domicile details fields = = = = = = =
    domicileDetails: {
        domicileCertificateNumber: { type: String },
        domicileIssuingAuthority: { type: String },
        domicileIssuingDate: { type: Date },
        domicileCertificate: { type: String },
    },
    isDomicileDetailsFilled: { type: Boolean, default: false },

    // = = = = = = = = Bank details fields = = = = = = =
    bankDetails: {
        accountNumber: { type: String },
        ifsc: { type: String },
        bankName: { type: String },
        branchName: { type: String },
    },
    isBankDetailsFilled: { type: Boolean, default: false },

    // = = = = = = = = Address details fields = = = = = = =
    address: {
        address: { type: String },
        city: { type: String },
        taluka: { type: String },
        district: { type: String },
        state: { type: String },
        pincode: { type: String },
    },
    isAddressFilled: { type: Boolean, default: false },

    // = = = = = = = = Parents details fields = = = = = = =
    parentsDetails: {
        isFatherAlive: { type: Boolean },
        fatherName: { type: String },
        fatherOccupation: { type: String },
        isFatherSalaried: { type: Boolean },
        isMotherAlive: { type: Boolean },
        motherName: { type: String },
        motherOccupation: { type: String },
        isMotherSalaried: { type: Boolean },
    },
    isParentsDetailsFilled: { type: Boolean, default: false },

    // = = = = = = = = Past Qualification details list = = = = = = =
    pastQualifications: [
        {
            qualificationLevel: { type: String },
            stream: { type: String },
            completed: { type: Boolean },
            instituteState: { type: String },
            instituteCity: { type: String },
            instituteDistrict: { type: String },
            instituteTaluka: { type: String },
            instituteName: { type: String },
            course: { type: String },
            boardUniversity: { type: String },
            admissionYear: { type: Date },
            passingYear: { type: Date },
            result: { type: String },
            percentage: { type: Number },
            attempts: { type: Number },
            certificate: { type: String },
            wasAnyGaps: { type: Boolean },
            gapYears: { type: Number },
        },
    ],
    isPastQualificationsFilled: { type: Boolean, default: false },

    // = = = = = = = = Current qualification details list = = = = = = =
    currentQualification: [
        {
            qualificationLevel: { type: String },
            stream: { type: String },
            instituteName: { type: String },
            admissionYear: { type: Date },
            yearOfStudy: { type: Number },
            mode: { type: String },
            meritPercentile: { type: Number },
            capId: { type: String },
            admissionType: { type: String },
            admissionReservation: { type: String },
            result: { type: String },
            percentage: { type: Number },
            certificate: { type: String },
            gapYears: { type: Number },
        },
    ],
    isCurrentQualificationFilled: { type: Boolean, default: false },

    // = = = = = = = = Hostel details fields = = = = = = =
    hostelDetails: {
        hostelCategory: { type: String },
        hostelFees: { type: Number },
        hostelCertificate: { type: String },
        hostelType: { type: String },
        messFees: { type: Number },
    },
    isHostelDetailsFilled: { type: Boolean, default: false },
});

export default mongoose.model("Profile", profileSchema);
