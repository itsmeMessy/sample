const { generateUsername } = require('../helper/random');
const userModel = require('../model/user');
const bcrypt = require('bcrypt');

exports.register = async (req, res) => {
    try {
        const { username, strand, school, email, password } = req.body;
        let newUsername = username;

        console.log(username, strand, school, email, password)

        if (!strand || !school || !email || !password) {
            return res.status(400).json({ error: "Fill up all fields!" });
        }

        if (!username) {
            newUsername = generateUsername();
        }

        const isEmailUsed = await userModel.isValidEmail(email);
        if (isEmailUsed) {
            return res.status(400).json({ error: "Email is already used!" });
        }


        const hashedPassword = await bcrypt.hash(password, 10);


        const newUser = new userModel({
            username: newUsername,
            strand,
            school,
            email,
            password: hashedPassword
        });

        await newUser.save();

        return res.status(200).json({ message: "User registered successfully!" });
    } catch (error) {
        console.error(error);
        return res.sendStatus(500);
    }
};

exports.login = async(req,res)=>{
    try {
        const {email, password} = req.body
        console.log(email, password)

        if(!email || !password){
            return res.status(400).json({error:"Fill up all fields"})
        }
    
        const isEmailUsed = await userModel.isValidEmail(email).select("+password")
        if(!isEmailUsed){
            return res.status(400).json({error:"No email Found!"})
        }
    
       const isPasswordMatch = await bcrypt.compare(password, isEmailUsed.password);
       if(!isPasswordMatch){
        return res.status(400).json({error:"Password didn't match!"})
       }
      
       return res.status(200).json({valid:true})
    } catch (error) {
        return res.sendStatus(500);
    }

}
