% Auto-generated by cameraCalibrator app on 31-Jul-2021
%-------------------------------------------------------


% Define images to process
imageFileNames = {'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_35_06_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_35_09_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_35_11_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_35_13_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_35_15_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_35_18_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_35_21_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_35_24_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_35_26_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_35_30_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_35_34_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_35_38_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_35_40_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_35_43_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_35_45_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_35_47_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_35_48_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_35_53_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_35_55_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_35_57_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_35_59_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_36_02_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_36_05_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_36_08_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_36_10_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_36_12_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_36_16_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_36_18_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_36_20_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_36_24_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_36_28_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_36_29_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_36_31_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_36_33_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_36_36_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_36_38_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_36_40_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210730_19_36_43_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1280x720\Cam1_1280x720\WIN_20210731_19_44_11_Pro.jpg',...
    };
% Detect checkerboards in images
[imagePoints, boardSize, imagesUsed] = detectCheckerboardPoints(imageFileNames);
imageFileNames = imageFileNames(imagesUsed);

% Read the first image to obtain image size
originalImage = imread(imageFileNames{1});
[mrows, ncols, ~] = size(originalImage);

% Generate world coordinates of the corners of the squares
squareSize = 25;  % in units of 'millimeters'
worldPoints = generateCheckerboardPoints(boardSize, squareSize);

% Calibrate the camera
[cameraParams, imagesUsed, estimationErrors] = estimateCameraParameters(imagePoints, worldPoints, ...
    'EstimateSkew', false, 'EstimateTangentialDistortion', false, ...
    'NumRadialDistortionCoefficients', 3, 'WorldUnits', 'millimeters', ...
    'InitialIntrinsicMatrix', [], 'InitialRadialDistortion', [], ...
    'ImageSize', [mrows, ncols]);

% View reprojection errors
h1=figure; showReprojectionErrors(cameraParams);

% Visualize pattern locations
h2=figure; showExtrinsics(cameraParams, 'CameraCentric');

% Display parameter estimation errors
displayErrors(estimationErrors, cameraParams);

% For example, you can use the calibration data to remove effects of lens distortion.
undistortedImage = undistortImage(originalImage, cameraParams);

% See additional examples of how to use the calibration data.  At the prompt type:
% showdemo('MeasuringPlanarObjectsExample')
% showdemo('StructureFromMotionExample')
