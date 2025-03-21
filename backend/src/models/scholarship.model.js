import mongoose, { Schema } from 'mongoose';

const scholarshipSchema = new Schema({
    title: {
        type: String,
        required: true,
        trim: true,
        index: true,
    },
    description: {
        type: String,
        required: true,
        trim: true,
    },
    scholarshipType: {
        type: String,
        enum: ['Tuition Fee Waiver', 'Maintenance Allowance', 'Both'],
        required: true,
    },
    
    deadline: {
        type: Date,
        required: true,
    },
    eligibility: {
        casteCategory: {
            type: String,
            required: true,
            enum: ['SC', 'ST', 'OBC', 'VJNT', 'EWS', 'OPEN'], 
        },
        incomeLimit: {
            type: Number, 
            required: true,
        },
        academicCriteria: {
            minPercentage: {
                type: Number, 
                default: 0,
            },
            applicableCourses: [String], // List of applicable courses (e.g., 'BTech', 'MBBS')
        },
    },
    provider: {
        name: {
            type: String,
            required: true,
        },
        department: {
            type: String,
            required: true, 
        },
    },
    documentsRequired: [String], // e.g., ['Income Certificate', 'Domicile Certificate']

    status: {
        type: String,
        enum: ['Open', 'Closed', 'Upcoming'],
        default: 'Open',
    },
    
}, { timestamps: true });

export default mongoose.model('Scholarship', scholarshipSchema);
