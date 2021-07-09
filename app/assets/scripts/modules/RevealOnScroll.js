import $, { each } from "jquery";
import waypoints from "../../../../node_modules/waypoints/lib/noframework.waypoints";

class RevealOnScroll {
    constructor(els,offset){
        this.itemsToReveal = els;
        this.offsetPercentage = offset;
        this.hideInitialy();
        this.createWaypoints();
    }

    hideInitialy(){
        this.itemsToReveal.addClass("reveal-item");
    }

    createWaypoints(){
        let that = this;
        this.itemsToReveal.each(function(){
            let currentItem = this;
            new Waypoint({
                element: currentItem,
                handler: function(){
                    $(currentItem).addClass("reveal-item--is-visible");
                },
                offset: that.offsetPercentage  
            });
        });
    }
}

export default RevealOnScroll;