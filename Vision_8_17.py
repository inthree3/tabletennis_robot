import cv2
import numpy as np
import os
import socket


def nothing(x):
    pass


def on_trackbar_0():
    global hmin_0, hmax_0, smin_0, smax_0, vmin_0, vmax_0

    hmin_0 = cv2.getTrackbarPos('H_min_0', 'dst_0')
    hmax_0 = cv2.getTrackbarPos('H_max_0', 'dst_0')
    smin_0 = cv2.getTrackbarPos('S_min_0', 'dst_0')
    smax_0 = cv2.getTrackbarPos('S_max_0', 'dst_0')
    vmin_0 = cv2.getTrackbarPos('V_min_0', 'dst_0')
    vmax_0 = cv2.getTrackbarPos('V_max_0', 'dst_0')


def on_trackbar_1():
    global hmin_1, hmax_1, smin_1, smax_1, vmin_1, vmax_1

    hmin_1 = cv2.getTrackbarPos('H_min_1', 'dst_1')
    hmax_1 = cv2.getTrackbarPos('H_max_1', 'dst_1')
    smin_1 = cv2.getTrackbarPos('S_min_1', 'dst_1')
    smax_1 = cv2.getTrackbarPos('S_max_1', 'dst_1')
    vmin_1 = cv2.getTrackbarPos('V_min_1', 'dst_1')
    vmax_1 = cv2.getTrackbarPos('V_max_1', 'dst_1')


def vision_set():
    # while True:

    global mapx0, mapx1, mapy0, mapy1, mask0, mask1, cap0, cap1
    global ball_3D_temp, ball_3D
    # global ball_cam0, ball_cam1

    ball_cam0 = np.array([0, 0])
    ball_cam1 = np.array([0, 0])

    ret_0, frame_0 = cap0.read()
    ret_1, frame_1 = cap1.read()

    cv2.imshow('src_0', frame_1)
    src_0 = cv2.remap(frame_1, mapx0, mapy0, cv2.INTER_LINEAR)
    src_0 = cv2.copyTo(src_0, mask0)

    cv2.imshow('src_1', frame_0)
    src_1 = cv2.remap(frame_0, mapx1, mapy1, cv2.INTER_LINEAR)
    src_1 = cv2.copyTo(src_1, mask1)

    cv2.imshow('src_0', src_0)
    cv2.imshow('src_1', src_1)

    src_hsv_0 = cv2.cvtColor(src_0, cv2.COLOR_BGR2HSV)
    src_hsv_1 = cv2.cvtColor(src_1, cv2.COLOR_BGR2HSV)

    # Trackbar 불러오기
    on_trackbar_0()
    on_trackbar_1()

    # Detecting Color Setting
    dst_0 = cv2.inRange(src_hsv_0, (hmin_0, smin_0, vmin_0), (hmax_0, smax_0, vmax_0))
    dst_1 = cv2.inRange(src_hsv_1, (hmin_1, smin_1, vmin_1), (hmax_1, smax_1, vmax_1))

    cv2.imshow('dst_0', dst_0)
    cv2.imshow('dst_1', dst_1)

    # MORPH 함수 이용하여 정확도 향상(Value Optimization)
    kernel = np.ones((3, 3), np.uint8)
    dst_0 = cv2.morphologyEx(dst_0, cv2.MORPH_OPEN, kernel)
    dst_0 = cv2.morphologyEx(dst_0, cv2.MORPH_CLOSE, kernel)
    dst_1 = cv2.morphologyEx(dst_1, cv2.MORPH_OPEN, kernel)
    dst_1 = cv2.morphologyEx(dst_1, cv2.MORPH_CLOSE, kernel)

    # 마스크 이미지로 원본 이미지에서 범위값에 해당되는 영상 부분을 획득

    img_result_0 = cv2.bitwise_and(src_0, src_0, mask=dst_0)
    img_result_1 = cv2.bitwise_and(src_1, src_1, mask=dst_1)

    numOfLabels_0, img_label_0, stats_0, centroids_0 = cv2.connectedComponentsWithStats(dst_0)
    numOfLabels_1, img_label_1, stats_1, centroids_1 = cv2.connectedComponentsWithStats(dst_1)

    # centroids==무게중심 좌표(x,y)

    for idx, centroid in enumerate(centroids_0):
        if stats_0[idx][0] == 0 and stats_0[idx][1] == 0:
            continue

        if np.any(np.isnan(centroid)):
            continue

        x, y, width, height, area = stats_0[idx]
        centerX, centerY = int(centroid[0]), int(centroid[1])
        # print(centerX, centerY)

        if 25 < area < 300:
            # 일정 범위 이상 & 이하인 부분에 대해서만 centroids 값 반환

            cv2.circle(src_0, (centerX, centerY), 10, (0, 0, 255), 10)
            cv2.rectangle(src_0, (x, y), (x + width, y + height), (0, 0, 255))
            ball_cam0 = np.array([centroid[0], centroid[1]], dtype=float)

    for idx, centroid in enumerate(centroids_1):

        if stats_1[idx][0] == 0 and stats_1[idx][1] == 0:
            continue

        if np.any(np.isnan(centroid)):
            continue

        x, y, width, height, area = stats_1[idx]
        centerX, centerY = int(centroid[0]), int(centroid[1])

        if 25 < area < 300:
            # 일정 범위 이상 & 이하인 부분에 대해서만 centroids 값 반환
            cv2.circle(src_1, (centerX, centerY), 10, (0, 0, 255), 10)
            cv2.rectangle(src_1, (x, y), (x + width, y + height), (0, 0, 255))
            ball_cam1 = np.array([centroid[0], centroid[1]], dtype=float)

    if ball_cam0[0] != 0 and ball_cam1[0] != 0:

        ball_tri = np.array(cv2.triangulatePoints(P0, P1, ball_cam0, ball_cam1))
        ball_3D = ball_tri[:3] / ball_tri[-1]

    else:

        ball_3D = ball_3D_temp

    # Display

    cv2.imshow('src_0', src_0)
    cv2.imshow('dst_0', dst_0)
    cv2.imshow('img_result_0', img_result_0)

    cv2.imshow('src_1', src_1)
    cv2.imshow('dst_1', dst_1)
    cv2.imshow('img_result_1', img_result_1)

    print('')
    print('-----------------------------------------')
    print(ball_cam0)
    print(ball_cam1)
    print('ball_3D_temp')
    print(ball_3D_temp)
    print('ball_3D')
    print(ball_3D)


def predict():

    global ball_array
    global temp_0
    global ball_3D, ball_3D_temp
    global slope, slope_temp
    global y_p

    if temp_0 == 1 and ball_3D[0] > 400:
        ball_array[:, 0:1] = ball_3D

        slope = (ball_array[1, 0] - 0) / (ball_array[0, 0] - 150)
        y_p = slope * (2500 - 150) + 0

# ---------------------------------------------------y_p calc-----------------------------------------------------------

        if y_p > 470:
            y_p = 470

        elif y_p < -470:
            y_p = -470

# ----------------------------------------------------Step Calc---------------------------------------------------------

        if 0 < abs(slope) < 0.04:
            step = 1

        elif 0.04 < abs(slope) < 0.08:
            step = 2

        elif 0.08 < abs(slope) < 0.12:
            step = 3

        elif 0.12 < abs(slope) < 0.16:
            step = 4

        else:
            step = 5

        if -470 <= y_p < -200:
            y_p = -380

        elif -200 <= y_p < 200:
            y_p = -25

        elif 200 <= y_p <= 470:
            y_p = 380

# -----------------------------------------------------print------------------------------------------------------------

        print(ball_array[:, 0])
        print(ball_array[:, 1])
        print('predict_result')
        print(y_p)
        print(slope)
        print((5000+int(-y_p))*10000+step*1000+0)

# ---------------------------------------------------Data Send----------------------------------------------------------
        data = str((5000 + int(-y_p)) * 10000 + step * 1000 + 0)
        udp_socket.sendto(data.encode(), ('172.25.142.24', 9999))

    if temp_0 == 1 and ball_3D[0] > 150:
        temp_0 = 0


def reset_params():

    global ball_3D, i, ball_3D_temp
    global slope_temp, slope
    global temp_0
    global ball_array

    ball_array = np.zeros((3, 2))
    temp_0 = 1
    ball_3D = np.zeros((3, 1))
    ball_3D_temp = np.zeros((3, 1))
    slope = 0
    slope_temp = 0
    data_reset = str(50000000)
    udp_socket.sendto(data_reset.encode(), ('172.25.142.24', 9999))
    print('reset!')


if __name__ == '__main__':

    udp_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    os.chdir('C:\Example\PingPong_Vision')

# -----------------------------------------------초기값 UDP Send---------------------------------------------------------

    data_zero = str(50000000)
    udp_socket.sendto(data_zero.encode(), ('172.25.142.24', 9999))
    data_impact = str(0)
    udp_socket.sendto(data_impact.encode(), ('172.25.142.24', 3333))

    # Set Global Variables

    global hmin_0, hmax_0, smin_0, smax_0, vmin_0, vmax_0
    global hmin_1, hmax_1, smin_1, smax_1, vmin_1, vmax_1

    temp_0 = 1
    i = 0
    y_p = 0
    slope = 0
    slope_temp = 0
    ball_array = np.zeros((3, 2))

    i_main = 0
    ball_3D_temp = np.zeros((3, 1))
    ball_3D = np.zeros((3, 1))
    h, w = np.array([720, 1280])

    # Set Camera Matrix

    R0 = np.linalg.inv(np.array([[0.9242, -0.2864, 0.2526],
                                 [0.3812, 0.7312, -0.5658],
                                 [-0.0227, 0.6192, 0.7849]]))

    R1 = np.linalg.inv(np.array([[0.6989, -0.3543, 0.6213],
                                 [0.7148, 0.3153, -0.6243],
                                 [0.0253, 0.8804, 0.4736]]))

    T0 = np.array([-1142.2, 183.7513, 1669.1])

    T1 = np.array([-398.5379, 165.7630, 1398.9])

    # Translation Matrix between each cam & World Coord
    # Focal length of each cam

    cam0_f = np.array([766.8537, 769.1458])
    cam1_f = np.array([765.3281, 767.4927])

    # Principle Point of each cam

    cam0_c = np.array([647.6205, 345.3208])
    cam1_c = np.array([641.5385, 366.9369])

    # Distortion

    cam0_dist_r = np.array([0.1313, -0.2132])
    cam0_dist_t = np.array([0, 0])
    cam1_dist_r = np.array([0.1331, -0.2226])
    cam1_dist_t = np.array([0, 0])

    # Intrinsics Matrix

    cam0_int = np.array([[cam0_f[0], 0, cam0_c[0]], [0, cam0_f[1], cam0_c[1]], [0, 0, 1]])
    cam1_int = np.array([[cam1_f[0], 0, cam1_c[0]], [0, cam1_f[1], cam1_c[1]], [0, 0, 1]])

    mtx0 = cam0_int
    mtx1 = cam1_int

    dist0 = np.hstack([cam0_dist_r, cam0_dist_t])
    dist1 = np.hstack([cam1_dist_r, cam1_dist_t])

    print('intrinsics Matrix')
    print('')
    print(mtx0)
    print(dist0)
    print("")
    print(mtx1)
    print(dist1)

    # Calibration for new camera matrix

    newcameraMtx0, roi0 = cv2.getOptimalNewCameraMatrix(cam0_int, dist0, (w, h), 1, (w, h))
    print(newcameraMtx0)
    print("")
    newcameraMtx1, roi1 = cv2.getOptimalNewCameraMatrix(cam1_int, dist1, (w, h), 1, (w, h))
    print(newcameraMtx1)

    print(roi0)
    print(roi1)

    # T0 = np.array([0,0,0]) # Translation vector
    RT0 = np.zeros((3, 4))  # combined Rotation/Translation matrix
    RT0[:3, :3] = R0
    RT0[:3, 3] = T0
    P0 = np.dot(newcameraMtx0, RT0)  # Projection matrix

    # # define pose 1

    # T1 = np.array([0,0,2.])
    RT1 = np.zeros((3, 4))
    RT1[:3, :3] = R1
    RT1[:3, 3] = T1
    P1 = np.dot(newcameraMtx1, RT1)

    print(P0)
    print(P1)

    mapx0, mapy0 = cv2.initUndistortRectifyMap(mtx0, dist0, None, newcameraMtx0, (w, h), 5)
    mapx1, mapy1 = cv2.initUndistortRectifyMap(mtx1, dist1, None, newcameraMtx1, (w, h), 5)

    # CAP_DSHOW 가 그냥 Index Calling에 비해 속도 훨씬 빠름

    # p1 = Process(target=vision_set())
    # p2 = Process(target=predict())

    cap0 = cv2.VideoCapture(cv2.CAP_DSHOW + 0)
    cap1 = cv2.VideoCapture(cv2.CAP_DSHOW + 1)

    cap0.isOpened()
    cap1.isOpened()

    # Camera0_Setting

    cap0.set(cv2.CAP_PROP_FRAME_WIDTH, 1280)
    cap0.set(cv2.CAP_PROP_FRAME_HEIGHT, 720)
    cap0.set(cv2.CAP_PROP_FRAME_COUNT, 60)

    w_0 = int(cap0.get(cv2.CAP_PROP_FRAME_WIDTH))
    h_0 = int(cap0.get(cv2.CAP_PROP_FRAME_HEIGHT))

    print(w_0, h_0)

    # Camera1_Setting

    cap1.set(cv2.CAP_PROP_FRAME_WIDTH, 1280)
    cap1.set(cv2.CAP_PROP_FRAME_HEIGHT, 720)
    cap1.set(cv2.CAP_PROP_FRAME_COUNT, 60)

    w_1 = int(cap0.get(cv2.CAP_PROP_FRAME_WIDTH))
    h_1 = int(cap0.get(cv2.CAP_PROP_FRAME_HEIGHT))

    print(w_1, h_1)

    mask0 = cv2.imread('cam0_mask_cali_v2.jpg', cv2.IMREAD_GRAYSCALE)
    mask1 = cv2.imread('cam1_mask_cali_v2.jpg', cv2.IMREAD_GRAYSCALE)

    # cv2.namedWindow('src')

    cv2.namedWindow('dst_0')
    cv2.namedWindow('dst_1')

    # Set Trackbar

    cv2.createTrackbar('H_min_0', 'dst_0', 0, 255, nothing)
    cv2.setTrackbarPos('H_min_0', 'dst_0', 0)
    cv2.createTrackbar('H_max_0', 'dst_0', 0, 255, nothing)
    cv2.setTrackbarPos('H_max_0', 'dst_0', 255)
    cv2.createTrackbar('S_min_0', 'dst_0', 0, 255, nothing)
    cv2.setTrackbarPos('S_min_0', 'dst_0', 0)
    cv2.createTrackbar('S_max_0', 'dst_0', 0, 255, nothing)
    cv2.setTrackbarPos('S_max_0', 'dst_0', 255)
    cv2.createTrackbar('V_min_0', 'dst_0', 0, 255, nothing)
    cv2.setTrackbarPos('V_min_0', 'dst_0', 0)
    cv2.createTrackbar('V_max_0', 'dst_0', 0, 255, nothing)
    cv2.setTrackbarPos('V_max_0', 'dst_0', 255)

    cv2.createTrackbar('H_min_1', 'dst_1', 0, 255, nothing)
    cv2.setTrackbarPos('H_min_1', 'dst_1', 0)
    cv2.createTrackbar('H_max_1', 'dst_1', 0, 255, nothing)
    cv2.setTrackbarPos('H_max_1', 'dst_1', 255)
    cv2.createTrackbar('S_min_1', 'dst_1', 0, 255, nothing)
    cv2.setTrackbarPos('S_min_1', 'dst_1', 0)
    cv2.createTrackbar('S_max_1', 'dst_1', 0, 255, nothing)
    cv2.setTrackbarPos('S_max_1', 'dst_1', 255)
    cv2.createTrackbar('V_min_1', 'dst_1', 0, 255, nothing)
    cv2.setTrackbarPos('V_min_1', 'dst_1', 0)
    cv2.createTrackbar('V_max_1', 'dst_1', 0, 255, nothing)
    cv2.setTrackbarPos('V_max_1', 'dst_1', 255)

    # 연산 시간 측정
    tm = cv2.TickMeter()

    while True:

        tm.reset()
        tm.start()
        vision_set()

        if (ball_3D[0] - ball_3D_temp[0]) > 0:
            predict()

        if cv2.waitKey(1) & 0xFF == ord('r'):
            reset_params()
        elif cv2.waitKey(1) & 0xFF == 27:
            print('break!')
            break

        if ball_3D[0] >= 1600:
            impact = 1
        else:
            impact = 0

        print('impact')
        print(impact)
        data_impact = str(impact)
        udp_socket.sendto(data_impact.encode(), ('172.25.142.24', 3333))

        ball_3D_temp = ball_3D

        print(temp_0)

        tm.stop()
        print('Calc time : {}ms.'.format(tm.getTimeMilli()))

    cv2.destroyAllWindows()
    cap0.release()
    cap1.release()
