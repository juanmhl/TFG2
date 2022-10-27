cam = videoinput('winvideo',2);
set(cam, 'ReturnedColorSpace', 'RGB');

while(true)
    waitforbuttonpress;
    im = getsnapshot(cam);
    getToolTips(im);
end