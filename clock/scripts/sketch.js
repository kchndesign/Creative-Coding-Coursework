var c;
var d;

function setup() {
    createCanvas(800, 720);
    
    c = color('#ED9E00');
    d = color('#6A5735')
}

function draw() {
    background(100);
    for (let a=0; a<36; a++) {
        let boxY = 1+a*20;
        for (let b=0; b<40; b++) {
            let boxX = 1+b*20;
            let boxIndex = a*40 + b;
            rectangleBox = new Box(boxX, boxY, boxIndex);
            rectangleBox.show();
        }
    }
    
}

class Box {
    
    constructor(x, y, index) {
        this.x = x;
        this.y = y;
        this.index = index;
    }
    
    show() {
        let minuteIndex = hour()*60+minute();
        
        if (minuteIndex > this.index) { fill(c);
        } else { fill(50); 
               }
        
        noStroke();
        
        //rect(this.x, this.y, 18, 18);
        ellipse(this.x+10, this.y+10, 20, 20);
    }
}