let min = 0;
let sec = 0;
let hr = 0;
let timeisStopped = true;
let lapcounter = 0;

function doLap(){
    lapcounter += 1;
    let a = display.innerHTML;
    let li = document.createElement('li');
    li.innerHTML = 'Lap : ' + lapcounter + " " + a;  
    ol.appendChild(li);
}

function incrementTime(){
    if(!timeisStopped){    
        sec += 1;
        if(sec==60){
            min += 1;
            sec = Math.floor(sec/60);
        }
        if(min==60){
            hr += 1;
            min = Math.floor(min/60);
        }
        if(hr==24){
            hr = 0;
        }
        let printtime = [hr,min,sec]
        if(sec<10){
            printtime[2] = '0' + sec; 
        }
        if(min<10){
            printtime[1] = '0' + min; 
        }
        if(hr<10){
            printtime[0] = '0' + hr;
        }
        display.innerHTML = printtime[0] + ":" + printtime[1] + ":" + printtime[2];
        setTimeout(incrementTime,1000);
    }
}

function startTime(){
    timeisStopped = false;
    incrementTime();
}

function stopTime(){
    timeisStopped = true;
    startbutton.innerHTML = "Continue";
}

function resetTime(){
    sec = 0;
    min = 0;
    hr = 0;
    lapcounter = 0;
    ol.innerHTML = "";
    display.innerHTML="00:00:00";
    timeisStopped=true;
    startbutton.innerHTML = "Start";
}

let display = document.getElementById("time");
let startbutton = document.getElementById("start");
let stopbutton = document.getElementById("stop");
let lapbutton = document.getElementById("lap");
let reset = document.getElementById("reset");
let ol = document.getElementById("logholder"); 
startbutton.addEventListener('click',startTime);
stopbutton.addEventListener('click',stopTime);
reset.addEventListener('click',resetTime);
lapbutton.addEventListener('click',doLap);
