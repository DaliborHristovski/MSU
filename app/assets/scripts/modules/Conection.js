
//this does not work as it should and shoudl be removed, there is a script block doing this allready in the index.html
class Conection{
    constructor(){
        this.eye = document.getElementById("eye-icon")
        this.x = document.getElementById("myInput");
        this.y = document.getElementById("hide1");
        this.z = document.getElementById("hide2");
        this.event(this.eye);
        this.dumy();
    }
    dumy(){
        console.log('we are in the dumy method');
    }
    isHidden(){

    }
    event(x){    
        console.log('we are in the isHidden method');
        x.addEventListener("click", function() {
        if(this.login-pass.type === 'password'){
            this.x.type = "text";
            this.y.display = block;
            this.z.display = none;  
        }
        else{
            this.x.type = "password";
            this.y.display = none;
            this.z.display = block;  
        }
        });
    }

}

export default Conection;