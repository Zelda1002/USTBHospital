/*
 Navicat Premium Data Transfer

 Source Server         : hospital
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : hospital

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 09/12/2024 21:43:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins`  (
  `admin_id` int(11) NOT NULL COMMENT '管理员的唯一标识符',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员的用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员的密码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员的真实姓名',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员的头像路径或图片名',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员的电话号码',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '管理员的电子邮箱',
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '这是管理员信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES (1, 'liulei07', 'Liu12345', '刘磊', 'avatar_admin1.jpg', '13512345678', 'liulei@example.com');
INSERT INTO `admins` VALUES (2, 'chenmei12', 'Chen7890', '陈梅', 'avatar_admin2.jpg', '13623456789', 'chenmei@example.com');
INSERT INTO `admins` VALUES (3, 'wangyang23', 'Wang5678', '王洋', 'avatar_admin3.jpg', '13734567890', 'wangyang@example.com');

-- ----------------------------
-- Table structure for announcement
-- ----------------------------
DROP TABLE IF EXISTS `announcement`;
CREATE TABLE `announcement`  (
  `announcement_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告的唯一编号',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '公告内容',
  `creation_time` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '公告创建时间',
  `creator` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '公告创建人',
  PRIMARY KEY (`announcement_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '公告信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of announcement
-- ----------------------------
INSERT INTO `announcement` VALUES (2, '健康讲座通知', '本周五有健康讲座，请提前预约', '2024-07-06 10:26:46', '健康促进部');
INSERT INTO `announcement` VALUES (3, '急诊部门调整', '急诊部门本周六临时调整开放时间', '2024-07-09 10:26:46', '行政部');
INSERT INTO `announcement` VALUES (4, '新药上市', '新型抗生素下周开始提供，详情咨询药房', '2024-07-16 10:26:46', '药房管理');
INSERT INTO `announcement` VALUES (5, '停电通知', '医院将于下周三进行电力系统维护，部分区域将暂停供电', '2024-07-18 10:26:46', '设施管理');
INSERT INTO `announcement` VALUES (6, '疫苗接种', '流感疫苗接种服务现已开始，欢迎咨询登记', '2024-07-18 10:26:46', '预防保健部');
INSERT INTO `announcement` VALUES (7, '体检套餐更新', '体检中心更新了套餐内容，新增多项检查', '2024-07-18 10:26:46', '体检中心');
INSERT INTO `announcement` VALUES (8, '医保政策变更', '最新医保政策将于下月起实施，详情请访问官网或咨询前台', '2024-07-18 10:26:46', '医保咨询部');
INSERT INTO `announcement` VALUES (9, '儿科门诊调整', '儿科门诊时间调整为每周一至周五上午9点至下午5点', '2024-07-18 10:26:46', '儿科部门');
INSERT INTO `announcement` VALUES (10, '急诊演练通知', '本月底将举行急诊应急演练，期间请配合工作人员指引', '2024-07-18 10:26:46', '安全管理部');
INSERT INTO `announcement` VALUES (11, '季节性流感预防', '进入流感季节，请大家注意个人卫生，必要时可来院接种疫苗', '2024-07-18 10:26:46', '公共卫生部');
INSERT INTO `announcement` VALUES (12, '赵勇大夫患者再次注意', '赵勇大夫本月底前将不接受新的预约，已预约者请留意短信通知', '2024-07-18 10:26:46', '管理员');
INSERT INTO `announcement` VALUES (13, '11', '11', '2024-07-01 00:00:00', '11');

-- ----------------------------
-- Table structure for appointments
-- ----------------------------
DROP TABLE IF EXISTS `appointments`;
CREATE TABLE `appointments`  (
  `appointment_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '预约编号',
  `patient_id` int(11) NULL DEFAULT NULL COMMENT '患者编号',
  `doctor_id` int(11) NULL DEFAULT NULL COMMENT '医生编号',
  `appointment_date` date NULL DEFAULT NULL COMMENT '预约的日期',
  `appointment_time` int(11) NULL DEFAULT NULL COMMENT '预约的具体时间',
  `status` int(11) NULL DEFAULT NULL COMMENT '已预订、已完成或已取消',
  PRIMARY KEY (`appointment_id`) USING BTREE,
  INDEX `patient_id`(`patient_id`) USING BTREE,
  INDEX `doctor_id`(`doctor_id`) USING BTREE,
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of appointments
-- ----------------------------
INSERT INTO `appointments` VALUES (1, 3, 4, '2024-07-20', 0, 0);
INSERT INTO `appointments` VALUES (2, 2, 7, '2024-07-16', 1, 0);
INSERT INTO `appointments` VALUES (3, 6, 1, '2024-07-20', 0, 2);
INSERT INTO `appointments` VALUES (4, 4, 3, '2024-07-18', 1, 0);
INSERT INTO `appointments` VALUES (5, 1, 11, '2024-07-21', 0, 2);
INSERT INTO `appointments` VALUES (6, 3, 11, '2024-07-21', 0, 2);
INSERT INTO `appointments` VALUES (7, 1, 3, '2024-07-18', 0, 2);
INSERT INTO `appointments` VALUES (8, 1, 3, '2024-07-19', 0, 0);
INSERT INTO `appointments` VALUES (9, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `appointments` VALUES (10, 1, 3, '2024-07-19', 0, 2);
INSERT INTO `appointments` VALUES (11, 1, 3, '2024-07-19', 0, 0);
INSERT INTO `appointments` VALUES (12, 1, 3, '2024-07-19', 0, 0);
INSERT INTO `appointments` VALUES (13, 1, 3, '2024-07-19', 0, 0);
INSERT INTO `appointments` VALUES (14, 1, 3, '2024-07-19', 0, 2);
INSERT INTO `appointments` VALUES (15, 1, 3, '2024-07-19', 0, 0);
INSERT INTO `appointments` VALUES (16, 1, 3, '2024-07-19', 0, 0);
INSERT INTO `appointments` VALUES (17, 1, 3, '2024-07-19', 0, 0);
INSERT INTO `appointments` VALUES (18, 1, 3, '2024-07-19', 0, 0);
INSERT INTO `appointments` VALUES (19, 1, 3, '2024-07-18', 0, 0);
INSERT INTO `appointments` VALUES (20, 1, 1, '2024-07-19', 0, 0);
INSERT INTO `appointments` VALUES (21, 1, 1, '2024-07-19', 0, 0);
INSERT INTO `appointments` VALUES (22, 1, 2, '2024-07-19', 0, 0);
INSERT INTO `appointments` VALUES (23, 2, 7, '2024-07-20', 0, 0);
INSERT INTO `appointments` VALUES (24, 2, 10, '2024-07-18', 0, 2);
INSERT INTO `appointments` VALUES (25, 2, 10, '2024-07-18', 0, 2);
INSERT INTO `appointments` VALUES (26, 2, 7, '2024-07-19', 0, 2);
INSERT INTO `appointments` VALUES (27, 2, 7, '2024-07-20', 0, 0);
INSERT INTO `appointments` VALUES (28, 1, 1, '2024-07-18', 1, 0);
INSERT INTO `appointments` VALUES (29, 3, 1, '2024-07-19', 0, 0);
INSERT INTO `appointments` VALUES (30, 3, 2, '2024-07-19', 0, 2);
INSERT INTO `appointments` VALUES (31, 2, 2, '2024-07-24', 0, 0);
INSERT INTO `appointments` VALUES (32, 2, 9, '2024-07-24', 1, 0);

-- ----------------------------
-- Table structure for consultation
-- ----------------------------
DROP TABLE IF EXISTS `consultation`;
CREATE TABLE `consultation`  (
  `consultation_id` int(11) NOT NULL COMMENT '就诊编号，自增主键',
  `patient_id` int(11) NULL DEFAULT NULL COMMENT '患者编号',
  `doctor_id` int(11) NULL DEFAULT NULL COMMENT '医生编号',
  `consultation_time` timestamp(0) NULL DEFAULT NULL COMMENT '就诊时间',
  `is_hospital_registered` tinyint(1) NULL DEFAULT NULL COMMENT '是否住院登记',
  `is_hospitalized` tinyint(1) NULL DEFAULT NULL COMMENT '是否住院',
  `medical_advice_case` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '医嘱病例',
  PRIMARY KEY (`consultation_id`) USING BTREE,
  INDEX `patient_id`(`patient_id`) USING BTREE,
  INDEX `doctor_id`(`doctor_id`) USING BTREE,
  CONSTRAINT `consultation_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `consultation_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments`  (
  `department_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '科室编号',
  `department_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '科室名称',
  `department_pid` int(11) NULL DEFAULT NULL COMMENT '上级科室编号',
  `department_level` int(11) NULL DEFAULT NULL COMMENT '科室级别',
  `department_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '科室路径',
  `department_description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '科室描述',
  PRIMARY KEY (`department_id`) USING BTREE,
  INDEX `department_pid`(`department_pid`) USING BTREE,
  CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`department_pid`) REFERENCES `departments` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departments
-- ----------------------------
INSERT INTO `departments` VALUES (1, '内科', NULL, 1, '|1|', '内科主要负责诊治内科系统的各种疾病。');
INSERT INTO `departments` VALUES (2, '外科', NULL, 1, '|2|', '外科专注于通过手术等方式治疗各种外科病症。');
INSERT INTO `departments` VALUES (3, '儿科', NULL, 1, '|3|', '儿科专门为儿童提供医疗服务。');
INSERT INTO `departments` VALUES (4, '妇产科', NULL, 1, '|4|', '妇产科负责女性生殖系统的医疗和生育相关事务。');
INSERT INTO `departments` VALUES (5, '眼科', NULL, 1, '|5|', '眼科专注于眼部疾病的诊断和治疗。');
INSERT INTO `departments` VALUES (6, '心内科', 1, 2, '|1||6|', '专注于心脏疾病的诊断与治疗');
INSERT INTO `departments` VALUES (7, '呼吸内科', 1, 2, '|1||7|', '诊治呼吸系统相关疾病');
INSERT INTO `departments` VALUES (8, '消化内科', 1, 2, '|1||8|', '处理消化系统疾病');
INSERT INTO `departments` VALUES (9, '神经内科', 1, 2, '|1||9|', '专注神经系统病症');
INSERT INTO `departments` VALUES (10, '内分泌科', 1, 2, '|1||10|', '处理内分泌相关问题');
INSERT INTO `departments` VALUES (11, '普外科', 2, 2, '|2||11|', '普通外科相关疾病诊治');
INSERT INTO `departments` VALUES (12, '骨科', 2, 2, '|2||12|', '骨骼相关疾病的治疗');
INSERT INTO `departments` VALUES (13, '泌尿外科', 2, 2, '|2||13|', '泌尿系统疾病的诊疗');
INSERT INTO `departments` VALUES (14, '神经外科', 2, 2, '|2||14|', '神经系统外科疾病');
INSERT INTO `departments` VALUES (15, '儿科呼吸科', 3, 2, '|3||15|', '儿童呼吸系统疾病。');
INSERT INTO `departments` VALUES (16, '儿科消化科', 3, 2, '|3||16|', '儿童消化系统疾病');
INSERT INTO `departments` VALUES (17, '妇产科产科', 4, 2, '|4||17|', '产科相关事务');
INSERT INTO `departments` VALUES (18, '妇产科妇科', 4, 2, '|4||18|', '妇科相关疾病');
INSERT INTO `departments` VALUES (19, '眼光屈光科', 5, 2, '|5||19|', '眼光屈光相关疾病。');

-- ----------------------------
-- Table structure for doctor_schedule
-- ----------------------------
DROP TABLE IF EXISTS `doctor_schedule`;
CREATE TABLE `doctor_schedule`  (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '排班记录的唯一标识符',
  `doctor_id` int(11) NULL DEFAULT NULL COMMENT '医生的唯一标识符',
  `date` date NULL DEFAULT NULL COMMENT '排班的日期',
  `shift_time` time(0) NULL DEFAULT NULL COMMENT '具体的排班时间',
  `department_id` int(11) NULL DEFAULT NULL COMMENT '所属科室的标识符',
  `is_available` tinyint(1) NULL DEFAULT NULL COMMENT '是否可排班',
  `visit_count` int(11) NULL DEFAULT 0 COMMENT '就诊数量',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  PRIMARY KEY (`schedule_id`) USING BTREE,
  INDEX `doctor_id`(`doctor_id`) USING BTREE,
  INDEX `department_id`(`department_id`) USING BTREE,
  CONSTRAINT `doctor_schedule_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`doctor_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `doctor_schedule_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '医院医生多天排班表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for doctors
-- ----------------------------
DROP TABLE IF EXISTS `doctors`;
CREATE TABLE `doctors`  (
  `doctor_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '医生的唯一标识符',
  `job_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生的工号',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生的密码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生的姓名',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生的头像路径或图片名',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生的电话号码',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '医生的电子邮箱',
  `introduction` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '医生的简介',
  `registration_fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '挂号费',
  `entry_date` date NULL DEFAULT NULL COMMENT '入职日期',
  `department_id` int(11) NULL DEFAULT NULL COMMENT '所属科室的标识符',
  `professional_title_id` int(11) NULL DEFAULT NULL COMMENT '职称的标识符',
  PRIMARY KEY (`doctor_id`) USING BTREE,
  INDEX `department_id`(`department_id`) USING BTREE,
  INDEX `professional_title_id`(`professional_title_id`) USING BTREE,
  CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `doctors_ibfk_2` FOREIGN KEY (`professional_title_id`) REFERENCES `professional_titles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '医生信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of doctors
-- ----------------------------
INSERT INTO `doctors` VALUES (1, '10001', '123456', '李华', 'avatar1.jpg', '123456', 'lihua@example.com', '李华医生毕业于知名医科大学，从事心内科临床工作多年。擅长各类心脏疾病的诊断与治疗，如冠心病、心肌病等。在治疗过程中，注重与患者的沟通和心理疏导，深受患者信赖。', 50.00, '2020-05-01', 6, 1);
INSERT INTO `doctors` VALUES (2, '10002', '234567', '张华', 'avatar2.jpg', '13900002222', 'zhanghua@example.com', '张华医生在呼吸内科领域积累了丰富的经验，熟练掌握各种呼吸系统疾病的诊断和治疗方法，如肺炎、哮喘等。多次参与疑难病症的会诊，以精准的诊断和有效的治疗方案赢得了同行和患者的赞誉。', 80.00, '2019-03-15', 7, 2);
INSERT INTO `doctors` VALUES (3, '10003', '345678', '王强', 'avatar3.jpg', '15800003333', 'wangqiang@example.com', '王强医生专注于消化内科，对胃肠道疾病的诊断和治疗有着深入的研究。擅长运用先进的医疗技术和个性化的治疗方案，为患者解决病痛。在学术方面也积极参与科研项目，为消化内科的发展做出了贡献。', 60.00, '2021-07-20', 8, 3);
INSERT INTO `doctors` VALUES (4, '10004', '456789', '赵刚', 'avatar4.jpg', '18700004444', 'zhaogang@example.com', '赵刚医生在神经内科领域造诣深厚，能够准确诊断和治疗各种神经系统疾病，如帕金森病、癫痫等。以其严谨的医疗态度和关怀备至的服务，赢得了患者的良好口碑。', 70.00, '2018-11-05', 9, 1);
INSERT INTO `doctors` VALUES (5, '10005', '567890', '孙敏', 'avatar5.jpg', '17600005556', 'unmin@example.com', '孙敏医生在内分泌科工作多年，对糖尿病、甲状腺疾病等内分泌疾病的诊治有着丰富的临床经验。注重患者的健康教育和生活方式指导，帮助患者更好地控制病情。', 90.00, '2017-09-12', 10, 2);
INSERT INTO `doctors` VALUES (6, '10006', '678901', '周婷', 'avatar6.jpg', '16700006666', 'zhouting@example.com', '周婷医生在普外科有着出色的表现，熟练操作各种普通外科手术，如阑尾切除术、胆囊切除术等。对待患者耐心细致，术后护理指导到位，促进了患者的快速康复。', 100.00, '2022-02-28', 11, 3);
INSERT INTO `doctors` VALUES (7, '10007', '789012', '吴勇', 'avatar7.jpg', '15600007777', 'wuyong@example.com', '吴勇医生在骨科领域深耕细作，擅长骨折的治疗和关节疾病的诊治。积极引进新技术、新方法，为患者提供优质的医疗服务，在同行中具有较高的声誉。', 75.00, '2023-01-05', 12, 1);
INSERT INTO `doctors` VALUES (8, '10008', '890123', '郑丽', 'avatar8.jpg', '14500008888', 'zhengli@example.com', '郑丽医生专注于泌尿外科，对泌尿系统结石、肿瘤等疾病的诊断和治疗有着丰富的经验。注重患者的隐私保护和心理支持，让患者在治疗过程中感受到温暖和关怀。', 85.00, '2020-11-18', 13, 2);
INSERT INTO `doctors` VALUES (9, '10009', '901234', '王霞', 'avatar9.jpg', '13400009999', 'wangxia@example.com', '王霞医生在神经外科方面表现出色，参与了众多复杂神经外科手术，具备精湛的手术技巧和丰富的临床经验。同时，注重术后患者的康复指导和跟踪治疗。', 65.00, '2019-08-05', 14, 3);
INSERT INTO `doctors` VALUES (10, '10010', '012345', '李娜', 'avatar10.jpg', '12300000000', 'lina@example.com', '李娜医生在儿科呼吸科工作，对儿童呼吸道感染、哮喘等疾病的诊治有着独特的见解和方法。善于与患儿及其家属沟通，以亲切和蔼的态度受到患儿和家长的喜爱。', 70.00, '2021-06-30', 15, 1);
INSERT INTO `doctors` VALUES (11, '10011', '0123456', '刘庆', 'avatar11.jpg', '18244448888', 'liuqing@example.com', '刘庆医生在神经内科领域造诣深厚，能够准确诊断和治疗各种神经系统疾病，如帕金森病、癫痫等。以其严谨的医疗态度和关怀备至的服务，赢得了患者的良好口碑。经内科', 99.00, '2024-07-11', 9, 2);
INSERT INTO `doctors` VALUES (12, '10012', '56789', '王奇', 'avatar12.jpg', '13400009999', 'wangqi@example.com', '王奇医生在神经内科领域造诣深厚，能够准确诊断和治疗各种神经系统疾病，如帕金森病、癫痫等。以其严谨的医疗态度和关怀备至的服务，赢得了患者的良好口碑。经内科', 80.00, '2024-07-12', 9, 3);
INSERT INTO `doctors` VALUES (14, '100490', '444444444443421', '25', NULL, '12411111111', '24@12', '3243125', 2.00, NULL, 4, 1);
INSERT INTO `doctors` VALUES (15, '123456789077', 'vwrtbet', 'xdgfdxgfdgf', NULL, '2345678955555', '14565@uu.com', 'fdghjk', 23.00, NULL, 1, 2);

-- ----------------------------
-- Table structure for holidays
-- ----------------------------
DROP TABLE IF EXISTS `holidays`;
CREATE TABLE `holidays`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_id` int(11) NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  `time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of holidays
-- ----------------------------
INSERT INTO `holidays` VALUES (4, 3, '2024-07-18', 0);
INSERT INTO `holidays` VALUES (6, 3, '2024-07-19', 1);
INSERT INTO `holidays` VALUES (7, 1, '2024-07-19', 1);
INSERT INTO `holidays` VALUES (9, 5, '2024-07-19', 0);
INSERT INTO `holidays` VALUES (12, 1, '2024-07-20', 0);
INSERT INTO `holidays` VALUES (13, 1, '2024-07-13', 0);

-- ----------------------------
-- Table structure for hospitalization
-- ----------------------------
DROP TABLE IF EXISTS `hospitalization`;
CREATE TABLE `hospitalization`  (
  `hospitalization_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '住院记录的唯一标识符',
  `patient_id` int(11) NULL DEFAULT NULL COMMENT '患者的标识符',
  `room_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '病房号',
  `cost` decimal(10, 2) NULL DEFAULT NULL COMMENT '住院费用',
  `payment_status` enum('paid','unpaid','partially_paid') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付状态（已支付、未支付、部分支付）',
  `is_insured` tinyint(1) NULL DEFAULT NULL COMMENT '是否有保险',
  `hospitalization_status` enum('admitted','discharged','in_progress') CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '住院状态（已入院、已出院、进行中）',
  PRIMARY KEY (`hospitalization_id`) USING BTREE,
  INDEX `patient_id`(`patient_id`) USING BTREE,
  CONSTRAINT `hospitalization_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '住院信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for patients
-- ----------------------------
DROP TABLE IF EXISTS `patients`;
CREATE TABLE `patients`  (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '患者的唯一标识符',
  `id_card_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号码',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像路径或图片名',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话号码',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `balance` decimal(10, 2) NULL DEFAULT NULL COMMENT '账户余额',
  PRIMARY KEY (`patient_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '患者信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of patients
-- ----------------------------
INSERT INTO `patients` VALUES (1, '110103199208082345', 'pass123', '王一', 'avatar1.jpg', '13234567890', 'wangyi@example.com', 211.00);
INSERT INTO `patients` VALUES (2, '110102198505052346', '111', '钱二', 'avatar2.jpg', '13123456', 'qianer@example.com', 708.00);
INSERT INTO `patients` VALUES (3, '110103199208083456', 'pass111', '孙', 'avatar3.jpg', '13234567890', 'unsan@example.com', 831.00);
INSERT INTO `patients` VALUES (4, '110104198811114567', 'pass012', '李四', 'avatar4.jpg', '13345678901', 'lisi@example.com', 1100.00);
INSERT INTO `patients` VALUES (6, '110106198207076789', 'pass678', '吴六', 'avatar6.jpg', '13567890123', 'wuliu@example.com', 1200.00);
INSERT INTO `patients` VALUES (7, '110107199809097890', 'pass901', '郑七', 'avatar7.jpg', '13678901234', 'zhengqi@example.com', 700.00);
INSERT INTO `patients` VALUES (8, '110108198612128901', 'pass234', '王八', 'avatar8.jpg', '13789012345', 'wangba@example.com', 1400.00);
INSERT INTO `patients` VALUES (9, '110109199304049012', 'pass567', '冯九', 'avatar9.jpg', '13890123456', 'fengjiu@example.com', 850.00);
INSERT INTO `patients` VALUES (10, '110110198906060123', 'pass890', '陈十', 'avatar10.jpg', '13901234567', 'chenshi@example.com', 1050.00);
INSERT INTO `patients` VALUES (12, '111111111111111111', '1324123541234', '123', NULL, '11111111111', '231@12.com', 12.00);
INSERT INTO `patients` VALUES (13, '111111111111111115', '23123131313', 'zz', NULL, '22222222222', '123@3', 23.00);
INSERT INTO `patients` VALUES (14, '110103928275648374', NULL, '刘月', NULL, '13892837462', 'liuyue@example.com', 60.00);
INSERT INTO `patients` VALUES (15, '1212233434', '123456', 'ssdds', NULL, '445', '1222@qq.cp', 123.00);
INSERT INTO `patients` VALUES (16, 'aaaaaa', NULL, 'huan', NULL, '12312312312312', '123123', 123.00);
INSERT INTO `patients` VALUES (17, '111111111111111110', 'abc123', '李', NULL, '13788888888', 'ydzhang2005@126.com', 50.00);

-- ----------------------------
-- Table structure for professional_titles
-- ----------------------------
DROP TABLE IF EXISTS `professional_titles`;
CREATE TABLE `professional_titles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of professional_titles
-- ----------------------------
INSERT INTO `professional_titles` VALUES (1, '主任医师', '医院中最高级别的医师职称');
INSERT INTO `professional_titles` VALUES (2, '副主任医师', '仅次于主任医师的职称');
INSERT INTO `professional_titles` VALUES (3, '主治医师', '具有一定独立诊疗能力的中级职称');
INSERT INTO `professional_titles` VALUES (4, '住院医师', '处于初级阶段的医师');
INSERT INTO `professional_titles` VALUES (5, '实习医师', '处于实习阶段，尚未获得正式职称');
INSERT INTO `professional_titles` VALUES (6, '规培生', '实习的大学生');

SET FOREIGN_KEY_CHECKS = 1;
