// Blurred background
var CanvasImage = function (e, t) {
  this.image = t,
  this.element = e,
  this.element.width = this.image.width,
  this.element.height = this.image.height;
  var n = navigator.userAgent.toLowerCase().indexOf("chrome") > -1,
      r = navigator.appVersion.indexOf("Mac") > -1;
  n && r && (this.element.width = Math.min(this.element.width, 1680), this.element.height = Math.min(this.element.height, 1050)),
  this.context = this.element.getContext("2d"),
  this.context.drawImage(this.image, 0, 0)
};
CanvasImage.prototype = {
  blur: function (e) {
    this.context.globalAlpha = .5;
    for (var t = -e; t <= e; t += 2)
    for (var n = -e; n <= e; n += 2)
    this.context.drawImage(this.element, n, t),
    n >= 0 && t >= 0 && this.context.drawImage(this.element, -(n - 1), -(t - 1));
    this.context.globalAlpha = 1
  }
},

$(function () {
  var image, canvasImage, canvas;
  $(".blur").each(function () {
    canvas = this,
    image = new Image,
    image.onload = function () {
      canvasImage = new CanvasImage(canvas, this),
      canvasImage.blur(4)
    },
    image.src = $(this).attr("src");
  });
});


// Loader
var loader = document.getElementById('loader')
  , border = document.getElementById('border')
  , α = 0
  , π = Math.PI
  , t = 180;

(function draw() {
  α++;
  α %= 360;
  var r = ( α * π / 180 )
    , x = Math.sin( r ) * 125
    , y = Math.cos( r ) * - 125
    , mid = ( α > 180 ) ? 1 : 0
    , anim = 'M 0 0 v -125 A 125 125 1 ' 
           + mid + ' 1 ' 
           +  x  + ' ' 
           +  y  + ' z';
 
  loader.setAttribute( 'd', anim );
  border.setAttribute( 'd', anim );
  
  setTimeout(draw, t); // Redraw
})();
