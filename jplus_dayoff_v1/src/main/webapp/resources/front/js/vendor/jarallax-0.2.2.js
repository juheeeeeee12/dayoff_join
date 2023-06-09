/*!
 * do not redistribute
 * jaralax library
 * version: 0.2.2c patched version
 * http://jarallax.com/
 *
 * Copyright 2012, Jacko Hoogeveen
 * Dual licensed under the MIT or GPL Version 3 licenses.
 * http://jarallax.com/license.html
 *
 * Date: 6/26/2012
 */

function hasNumbers(t) {
    return /\d/.test(t);
}

////////////////////////////////////////////////////////////////////////////////
// jarallax class //////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
var Jarallax = function (controller) {
    this.jarallaxObject = [];
    this.animations = [];
    this.defaultValues = [];
    this.progress = 0.0;
    this.controllers = [];
    this.maxProgress = 1;
    this.targetProgress = 0.0;
    this.timer;
    this.allowWeakProgress = true;

    if (controller === undefined) {
        this.controllers.push(new ControllerScroll());
    } else {
        if (controller.length) {
            this.controllers = controller;
        } else if (typeof (controller) === 'object') {
            this.controllers.push(controller);
        } else {
            throw new Error('wrong controller data type: "' + typeof (controller) + '". Expected "object" or "array"');
        }
    }

    for (var i = 0; i < this.controllers.length; i++){
        this.controllers[i].activate(this);
    }
};

////////////////////////////////////////////////////////////////////////////////
// Jarallax methods ////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
Jarallax.prototype.setProgress = function (progress, weak) {
    weak = weak | false;
    if(progress > 1) {
        progress = 1;
    }else if(progress < 0) {
        progress = 0;
    }
    this.progress = progress;

    if(this.allowWeakProgress || !weak) {
        for(j = 0; j < this.defaultValues.length; j++){
            this.defaultValues[j].activate(this.progress);
        }

        for(k = 0; k < this.animations.length; k++){
            this.animations[k].activate(this.progress);
        }

        for(l = 0; l < this.controllers.length; l++){
            this.controllers[l].update(this.progress);
        };
    };
};



Jarallax.prototype.jumpToProgress = function (progress, time, fps) {
    if(!progress.indexOf) {
        progress = progress / this.maxProgress;
    } else if(progress.indexOf('%') != -1) {
        progress = parseFloat(progress) / 100;
    }

    if(progress > 1) {
        progress = 1;
    }else if(progress < 0) {
        progress = 0;
    }

    this.smoothProperties = {};
    this.smoothProperties.timeStep = 1000 / fps;
    this.smoothProperties.steps = time / this.smoothProperties.timeStep;
    this.smoothProperties.currentStep = 0;

    this.smoothProperties.startProgress = this.progress;
    this.smoothProperties.diffProgress = progress - this.progress;
    this.smoothProperties.previousValue = this.progress;
    this.smooth();
    this.allowWeakProgress = false;

    return false;
}

Jarallax.prototype.smooth = function (scope) {
    if (!scope) {
        var scope = this;
    } else {
        var scope = scope;
    }

    scope.smoothProperties.currentStep++;
    clearTimeout(scope.timer);
    if(scope.smoothProperties.currentStep < scope.smoothProperties.steps) {
        var position = scope.smoothProperties.currentStep / scope.smoothProperties.steps;
        var newProgress = Jarallax.EASING['easeOut'](position,
            scope.smoothProperties.startProgress,
            scope.smoothProperties.diffProgress,
            1,
            5);

        scope.setProgress(newProgress);
        var temp = scope.smoothProperties.timeStep;
        var temp2 = scope.smooth;
        scope.timer = window.setTimeout(function(){scope.smooth(scope)}, 10);
        scope.smoothProperties.previousValue = newProgress;
        scope.allowWeakProgress = false;
    } else {
        scope.allowWeakProgress = true;
        scope.setProgress(scope.smoothProperties.startProgress + scope.smoothProperties.diffProgress);
        delete scope.smoothProperties;
    }
};

//'easeOut':function (currentTime, beginningValue, changeInValue, duration, power) {

Jarallax.prototype.setDefault = function (selector, values) {
    if(!selector){
        throw new Error('no selector defined.');
    }

    if(Jarallax.isValues(values))
    {
        var newDefault = new JarallaxDefault(selector, values);
        newDefault.activate();
        this.defaultValues.push(newDefault);
    }
};

Jarallax.prototype.addStatic = function (selector, values) {
    if(!selector){
        throw new Error('no selector defined.');
    }

    if(Jarallax.isValues(values))
    {
        var newDefault = new JarallaxStatic(selector, values[0], values[1]);
        this.defaultValues.push(newDefault);
    }
};

Jarallax.prototype.addAnimation = function (selector, values) {
    if(!selector) {
        throw new Error('no selector defined.');
    }
    var returnValue = [];
    if(Jarallax.isValues(values)) {
        for(var i = 0; i < values.length - 1; i++){
            if(values[i] && values[i + 1])
            {
                if(values[i]['progress'] && values[i + 1]['progress']) {
                    if(values[i + 1]['progress'].indexOf('%') == -1) {
                        if(this.maxProgress < values[i + 1]['progress']){
                            this.maxProgress = values[i + 1]['progress'];
                        }
                    }
                    var newAnimation = new JarallaxAnimation(selector, values[i], values[i + 1], this)
                    this.animations.push(newAnimation);
                    returnValue.push(newAnimation);
                }
                else
                {
                    throw new Error('no animation boundry found.');
                }
            }
            else
            {
                throw new Error('bad animation data.');
            }
        }
    }
    return returnValue;
};

Jarallax.prototype.cloneAnimation = function (selector, adittionalValues, animations) {
    if(!selector) {
        throw new Error('no selector defined.');
    }

    var newAnimations = [];
    var adittionalValuesArray = [];

    for(var i = 0; i < animations.length + 1; i++) {
        if(adittionalValues instanceof Array){
            adittionalValuesArray.push(adittionalValues[i]);
        } else {
            adittionalValuesArray.push(adittionalValues);
        }
    }

    for(i = 0; i < animations.length; i++) {
        var currentAnimation = animations[i];
        var newStart = Jarallax.clone(currentAnimation.startValues);
        var newEnd = Jarallax.clone(currentAnimation.endValues);

        var adittionalValueStart = adittionalValuesArray[i];
        var adittionalValueEnd = adittionalValuesArray[i + 1];

        for(var j in newStart) {
            if(adittionalValueStart[j]){
                newStart[j] = Jarallax.calculateNewValue(adittionalValueStart[j], newStart[j]);
            }
        }

        for(var k in newEnd) {
            if(adittionalValueEnd[k]){
                newEnd[k] = Jarallax.calculateNewValue(adittionalValueEnd[k], newEnd[k]);
            }
        }

        newAnimations.push(this.addAnimation(selector, [newStart, newEnd])[0]);

    }
    return newAnimations;
}

Jarallax.calculateNewValue = function (modefier, original) {
    var result;
    if (modefier.indexOf('+') == 0) {
        result = String(parseFloat(original) + parseFloat(modefier));
    } else if (modefier.indexOf('-') == 0) {
        result = String(parseFloat(original) + parseFloat(modefier));
    } else if (modefier.indexOf('*') == 0) {
        result = String(parseFloat(original) * parseFloat(modefier));
    } else if (modefier.indexOf('/') == 0) {
        result = String(parseFloat(original) / parseFloat(modefier));
    } else {
        result = modefier;
    }

    if(original.indexOf){
        if(original.indexOf('%') > 0){
            return result + '%';
        }
    }
    return result;
}

/*JarallaxAnimation = function (selector, startValues, endValues, jarallax) {
  this.progress = 0;
  this.selector = selector;
  this.startValues = startValues;
  this.endValues = endValues;
  this.jarallax = jarallax;
};*/

////////////////////////////////////////////////////////////////////////////////
// Jarallax static methods /////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
Jarallax.isValues = function(object) {
    if(!object) {
        throw new Error('no values set.');
    }

    if(typeof object != 'object') {
        throw new Error('wrong data type values. expected: "object", got: "' + typeof object + '"');
    }

    if(object.size === 0) {
        throw new Error('Got an empty values object');
    }

    return true;
};

Jarallax.getUnits = function (string) {
    return string.replace(/\d+/g, '');
};

Jarallax.clone = function (obj) {
    var newObj = {};
    for(var i in obj){
        newObj[i] = obj[i];
    }

    return newObj;
}


Jarallax.EASING = {
    'linear':function (currentTime, beginningValue, changeInValue, duration, power) {
        return currentTime / duration * changeInValue + beginningValue;
    },

    'easeOut':function (currentTime, beginningValue, changeInValue, duration, power) {
        if(power == undefined){
            power = 2;
        }
        return ((Math.pow((duration - currentTime) / duration, power) * -1) + 1) * changeInValue + beginningValue;
    },
    'easeIn':function (currentTime, beginningValue, changeInValue, duration, power) {
        if(power == undefined){
            power = 2;
        }
        return Math.pow(currentTime / duration, power) * changeInValue + beginningValue;
    },
    'easeInOut':function (currentTime, beginningValue, changeInValue, duration, power) {
        if(power == undefined){
            power = 2;
        }
        changeInValue /= 2;
        currentTime *= 2;
        if(currentTime < duration){
            return Math.pow(currentTime / duration, power) * changeInValue + beginningValue;
        }else{
            currentTime = currentTime - duration;
            return ((Math.pow((duration - currentTime) / duration, power) * -1) + 1) * changeInValue + beginningValue + changeInValue;
        }

        return Math.pow(currentTime / duration, power) * changeInValue + beginningValue;
    }
};

Jarallax.EASING['none'] = Jarallax.EASING['linear'];


////////////////////////////////////////////////////////////////////////////////
// Jarallax animation class ////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
JarallaxAnimation = function (selector, startValues, endValues, jarallax) {
    this.progress = 0;
    this.selector = selector;
    this.startValues = startValues;
    this.endValues = endValues;
    this.jarallax = jarallax;
};

JarallaxAnimation.prototype.activate = function (progress) {
    if(this.progress != progress){
        var start;
        var end;
        var style;

        if (this.startValues['style'] == undefined){
            style = {easing:'linear',};
        }else{
            style = this.startValues['style'];
        }

        if(this.startValues['progress'].indexOf('%') >= 0) {
            start = parseInt(this.startValues['progress'],10) / 100;
        }else if(hasNumbers(this.startValues['progress'])){
            start = parseInt(this.startValues['progress'],10) / this.jarallax.maxProgress;
        }

        if(this.endValues['progress'].indexOf('%') >= 0)
        {
            end = parseInt(this.endValues['progress'],10) / 100;
        }else if(hasNumbers(this.endValues['progress'])){
            end = parseInt(this.endValues['progress'],10) / this.jarallax.maxProgress;
        }

        if(this.startValues['event']){
            this.dispatchEvent(this.progress, progress, start, end);
        }

        if(progress >= start && progress <= end ){
            for(i in this.startValues){
                if(i != 'progress' && i != 'style' && i != 'event')
                {
                    if(undefined!=this.endValues[i] && i != 'display'){
                        var units = Jarallax.getUnits(this.startValues[i]+'');
                        units = units.replace('-','');
                        var startValue = parseFloat(this.startValues[i]);
                        var endValue = parseFloat(this.endValues[i]);

                        var duration = end - start;
                        var currentTime = (progress-start);
                        var changeInValue = endValue - startValue ;
                        var result =  Jarallax.EASING[style['easing']](currentTime, startValue , changeInValue, duration, style['power']);
                        result+= units;
                        $(this.selector).css(i,result);
                    }
                    else
                    {
                        $(this.selector).css(i,this.startValues[i]);
                    }
                }
            }
        }
        this.progress = progress;
    }
};

JarallaxAnimation.prototype.dispatchEvent = function(progress_old, progress_new, start, end){
    var events = this.startValues['event'];
    var event_data = {};
    event_data.animation = this;
    event_data.selector = this.selector;

    if(progress_new >= start && progress_new <= end ) {
        if(events.start && progress_old < start) {
            event_data.type = 'start';
            events.start(event_data);
        }

        if(events.start && progress_old > end) {
            event_data.type = 'rewind';
            events.start(event_data);
        }

        if(events.animating){
            event_data.type = 'animating';
            events.animating(event_data);
        }

        if(events.forward && progress_old < progress_new) {
            event_data.type = 'forward';
            events.forward(event_data);
        }

        if(events.reverse && progress_old > progress_new) {
            event_data.type = 'reverse';
            events.reverse(event_data);
        }

    } else {
        if(events.complete && progress_old < end && progress_new > end) {
            event_data.type = 'complete';
            events.complete(event_data);
        }

        if(events.rewinded && progress_old > start && progress_new < start) {
            event_data.type = 'rewind';
            events.rewinded(event_data);
        }
    }
}

////////////////////////////////////////////////////////////////////////////////
// Jarallax default class //////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

JarallaxDefault = function (selector, values) {
    this.selector = selector;
    this.values = values;
};

JarallaxDefault.prototype.activate = function (position) {
    for(i in this.values){
        $(this.selector).css(i,this.values[i]);
    }
};

////////////////////////////////////////////////////////////////////////////////
// Jarallax static class ///////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////

JarallaxStatic = function (selector, startValues, endValues) {
    this.selector = selector;
    this.values = values;
};

JarallaxStatic.prototype.activate = function(position) {
    var start;
    var end;
    if(this.startValues['progress'].indexOf('%') >= 0) {
        start = parseInt(this.startValues['progress'],10) / 100;
    }else if(hasNumbers(this.startValues['progress'])){
        start = this.maxProgress / parseInt(this.startValues['progress'],10);
    }

    if(this.endValues['progress'].indexOf('%') >= 0)
    {
        end = parseInt(this.endValues['progress'],10) / 100;
    }else if(hasNumbers(this.endValues['progress'])){
        end = this.maxProgress /  parseInt(this.endValues['progress'],10);
    }

    if(progress > start && progress < end ) {
        for(i in this.startValues){
            if(i != 'progress')
            {
                $(this.selector).css(i, this.startValues[i]);
            }
        }
    }
};

////////////////////////////////////////////////////////////////////////////////
// Scroll controller ///////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
ControllerScroll = function(smoothing){
    this.height = parseInt($("body").css('height'),10);
    this.target = $(window);
    this.scrollSpace = this.height - this.target.height();
    this.smoothing = smoothing | false;
    this.timer;
    this.targetProgress = 0;
};

ControllerScroll.prototype.activate = function(jarallax){
    this.jarallax = jarallax;
    this.target.bind('scroll', {me: this} , this.onScroll);
};

ControllerScroll.prototype.deactivate = function(jarallax){
    //TODO
};

ControllerScroll.prototype.onScroll = function(event){
    var controller = event.data.me;

    var y = controller.target.scrollTop();
    var progress = y/controller.scrollSpace;


    if(!controller.smoothing){
        controller.jarallax.setProgress(progress, true);
    }else{
        controller.targetProgress = progress;
        controller.smooth();
    }
};

ControllerScroll.prototype.smooth = function(scope){
    if(!scope){
        var scope = this;
    }
    var oldProgress = scope.jarallax.progress;

    var animationSpace =  scope.targetProgress - oldProgress;
    clearTimeout(scope.timer);

    if(animationSpace > 0.0001 || animationSpace < -0.0001){
        var newProgress = oldProgress + animationSpace / 5;

        scope.timer = window.setTimeout(function(){scope.smooth(scope)}, 30);
        scope.jarallax.setProgress(newProgress, true);
    }else{
        scope.jarallax.setProgress(scope.targetProgress, true);
    }
}

ControllerScroll.prototype.update = function(progress){
    var scrollPosition = progress * this.scrollSpace;

    if(!this.jarallax.allowWeakProgress) {
        $('html').scrollTop(scrollPosition);
        $('body').scrollTop(scrollPosition);
    }
};

////////////////////////////////////////////////////////////////////////////////
// Time controller /////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
ControllerTime = function(speed, interval){
    this.interval = interval;
    this.speed = speed;
    this.forward = true;
};

ControllerTime.prototype.onInterval = function(){
    this.jarallax.setProgress(this.progress);
    $('body').scrollTop(parseInt(jQuery("body").css("height"), 10) * this.progress);

    if(this.progress >= 1){
        this.progress = 1;
        this.forward = false;
    }else if(this.progress <= 0){
        this.progress = 0;
        this.forward = true;
    }

    if(this.forward){
        this.progress+= this.speed;
    }else{
        this.progress-= this.speed;
    }
};

ControllerTime.prototype.activate = function(jarallax){
    this.jarallax = jarallax;
    this.progress = 0;
    this.interval = $.interval(this.onInterval.bind(this), this.interval);
};

ControllerTime.prototype.deactivate = function(jarallax){
    //TODO
};

ControllerTime.prototype.update = function(progress){
    //empty
};

////////////////////////////////////////////////////////////////////////////////
// onDrag controller /////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
ControllerDrag = function(selector, start, end){
    this.object = $(selector);
    this.start = start;
    this.end = end;
    this.container = "";
    this.width;

    this.startX = 0;
    this.startY = 0;
};

ControllerDrag.prototype.activate = function(jarallax){
    this.jarallax = jarallax;
    this.container = "#scrollbar";
    this.object.draggable({containment:this.container, axis: 'x'});
    this.object.bind("drag", {me: this}, this.onDrag);
    this.container = $(this.container);
    this.width = $(this.container).innerWidth() - this.object.outerWidth();
};


ControllerDrag.prototype.onDrag = function(event){
    var x = parseInt($(this).css('left'), 10);
    var position = (x / event.data.me.width);
    event.data.me.jarallax.setProgress(position);
};

ControllerDrag.prototype.deactivate = function(jarallax){
    //TODO
};

ControllerDrag.prototype.update = function(progress){
    this.object.css('left', progress * this.width);
};

////////////////////////////////////////////////////////////////////////////////
// Keyboard controller /////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
ControllerKeyboard = function(keys, preventDefault, repetitiveInput){
    this.repetitiveInput = repetitiveInput;
    this.preventDefault = preventDefault || false;
    this.keys = keys || {38:-0.01, 40:0.01};
    this.keysState = new Object();
};

ControllerKeyboard.prototype.activate = function(jarallax){
    this.jarallax = jarallax;
    $(document.documentElement).keydown({me: this}, this.keyDown);
    $(document.documentElement).keyup({me: this}, this.keyUp);

    for(key in this.keys){
        this.keysState[key] = false;
    }
};

ControllerKeyboard.prototype.deactivate = function(jarallax){
    //TODO
};

ControllerKeyboard.prototype.keyDown = function(event){
    var controller = event.data.me;
    for(key in controller.keys){
        if(key == event.keyCode){
            if(controller.keysState[key] !== true || controller.repetitiveInput){
                controller.jarallax.setProgress(controller.jarallax.progress + controller.keys[key]);
            }
            controller.keysState[key] = true;
            if(controller.preventDefault){
                event.preventDefault();
            }
        }
    }
};

ControllerKeyboard.prototype.keyUp = function(event){
    var controller = event.data.me;
    for(key in controller.keys){
        if(key == event.keyCode){
            controller.keysState[key] = false;
        }
    }
};

ControllerKeyboard.prototype.update = function(progress){
    //empty
};

////////////////////////////////////////////////////////////////////////////////
// Mousewheel controller ///////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
ControllerMousewheel = function(sensitivity, preventDefault){
    this.sensitivity = -sensitivity;
    this.preventDefault = preventDefault || false;
};

ControllerMousewheel.prototype.activate = function(jarallax){
    this.jarallax = jarallax;
    $('body').bind('mousewheel', {me: this} , this.onScroll);
};

ControllerMousewheel.prototype.deactivate = function(jarallax){
    this.jarallax = jarallax;
};

ControllerMousewheel.prototype.onScroll = function(event, delta){
    controller = event.data.me;
    controller.jarallax.setProgress(controller.jarallax.progress + controller.sensitivity * delta);
    if(controller.preventDefault){
        event.preventDefault();
    }
};

ControllerMousewheel.prototype.update = function(progress){
    //empty
};

////////////////////////////////////////////////////////////////////////////////
// IPAD controller /////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
ControllerIpadScroll = function(){
    this.x = 0;
    this.previousX = -1;
    this.top = 700;
    this.moveRight = false;
};

ControllerIpadScroll.prototype.activate = function(jarallax, values){
    this.jarallax = jarallax;
    this.values = values;
    $('body').bind('touchmove', {me: this}, this.onScroll);
    //TODO:
    //horizontal scrolling
    //flip_direction
};

ControllerIpadScroll.prototype.onScroll = function(event){
    event.preventDefault();
    var me = event.data.me;
    var targetEvent = event.originalEvent.touches.item(0);

    if(me.previousX == -1) {
        me.previousX = targetEvent.clientX;
    }
    else
    {
        if(targetEvent.clientX - me.previousX < 100 && targetEvent.clientX - me.previousX > -100)
        {
            if(me.moveRight)
            {
                me.x -= (targetEvent.clientX - me.previousX);
            }
            else
            {
                me.x += (targetEvent.clientX - me.previousX);
            }
            me.x = me.x < 1000 ? me.x : 1000;
            me.x = me.x > 0 ? me.x : 0;

        }

        me.previousX = targetEvent.clientX;
        me.jarallax.setProgress(me.x/me.top);
    }
};

ControllerIpadScroll.prototype.deactivate = function(jarallax){
    //TODO
};

ControllerIpadScroll.prototype.update = function(progress){
    //empty
};
