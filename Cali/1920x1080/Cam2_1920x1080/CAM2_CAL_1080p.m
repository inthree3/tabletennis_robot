% Auto-generated by cameraCalibrator app on 01-Aug-2021
%-------------------------------------------------------


% Define images to process
imageFileNames = {'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_42_18_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_42_21_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_42_23_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_42_25_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_42_26_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_42_28_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_42_29_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_42_32_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_42_34_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_42_38_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_42_40_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_42_42_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_42_46_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_42_48_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_42_51_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_42_54_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_42_57_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_42_59_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_43_02_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_43_04_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_43_09_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_43_10_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_43_13_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_43_15_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_43_18_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_43_20_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_43_22_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_43_24_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_43_26_Pro (2).jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_43_26_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_43_28_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_43_31_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_43_34_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_43_36_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_43_38_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_43_40_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_43_42_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_43_46_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_43_47_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_43_50_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_43_52_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_43_54_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_43_56_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_43_58_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_43_59_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_44_01_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_44_04_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_44_06_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_44_07_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_44_10_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_44_12_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_44_14_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_44_16_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_44_18_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_44_20_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_44_21_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_44_23_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_44_25_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_44_28_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_44_30_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_44_32_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_44_34_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210730_19_44_35_Pro.jpg',...
    'C:\Users\pjiho\PingPong\Vision\Cali\1920x1080\Cam2_1920x1080\WIN_20210801_00_05_36_Pro.jpg',...
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
