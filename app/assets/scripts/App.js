import MobileMenu from "./modules/MobileMenu";
import RevealOnScroll from  "./modules/RevealOnScroll";
import $ from "jquery";
import StickyHeader from "./modules/StickyHeader";
import Modal from "./modules/Modal";




let mobileMenu = new MobileMenu();
new RevealOnScroll($(".feature-item"),"85%");
new RevealOnScroll($(".testimonial"), "60%");

let stickyHeader = new StickyHeader();
let modal = new Modal();



//limiting the ammount of new subjects picked 

let checked = 0;
$('.subject-checkbox').on('change', function() {
  let limit = 5 - document.getElementById("count-picked").getAttribute("data-value");
  if($(this).is(':checked'))
    checked = checked+1;

  if($(this).is(':checked') == false)
    checked = checked-1;

  if(checked > limit) {
    this.checked = false;
    checked = limit;
  }
});



let btns = document.getElementsByName("myEventBlock");
for (var i = 0; i < btns.length; i++) {
        btns[i].addEventListener("click", function (evt) {
            var url = "/event/"+evt.currentTarget.getAttribute('data-value');
            // alert( url);

            if(true){
              //new way of handling redirect with AJAX
              fetch(url, {
                redirect: "manual"
            }).then((res) => {
                if (res.type === "opaqueredirect") {
                    // redirect to login page
                    window.location.href = response.url;
                } else {
                    // handle normally / pass on to next handler
                    window.location.assign(url)
                }
            }).catch( function(e){
              console.log("There was a problem with the redirect : " + e);
            });
            }else{
              //Old way of handling redirect with hxrHttpRequest
              var xhr = new XMLHttpRequest();
            xhr.open("GET", url);
            //alert("the xlr.open got called");

            xhr.setRequestHeader("Accept", "*/*");
            //xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

            //var win = window.open(url, '_self');

            xhr.onreadystatechange = function () {
              if (xhr.readyState === 4) {

                console.log(xhr.status);
                //alert( "before the writeln");
                
                //win.document.writeln(xhr.responseText);

                //alert( "after the writeln");
                document.write(xhr.responseText);
                
                
              }
            };
            var data = `{`.concat(`idEvent:`, evt.currentTarget.getAttribute('data-value'),`}`);
            
            //alert( "before the send data");
            xhr.send(data);
            //alert("after the send data");
            }
        }
        );

}


