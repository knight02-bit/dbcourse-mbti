/*
 Navicat Premium Data Transfer

 Source Server         : postgres
 Source Server Type    : PostgreSQL
 Source Server Version : 140003
 Source Host           : localhost:5432
 Source Catalog        : MBTIDB
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140003
 File Encoding         : 65001

 Date: 14/06/2022 16:41:01
*/


-- ----------------------------
-- Sequence structure for question_Qid_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."question_Qid_seq";
CREATE SEQUENCE "public"."question_Qid_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for table_question_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."table_question_id_seq";
CREATE SEQUENCE "public"."table_question_id_seq" 
INCREMENT 1
MAXVALUE 99999999
CACHE 1;

-- ----------------------------
-- Table structure for a_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."a_user";
CREATE TABLE "public"."a_user" (
  "username" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of a_user
-- ----------------------------
INSERT INTO "public"."a_user" VALUES ('admin1', '12344321');
INSERT INTO "public"."a_user" VALUES ('admin2', '23455432');

-- ----------------------------
-- Table structure for character
-- ----------------------------
DROP TABLE IF EXISTS "public"."character";
CREATE TABLE "public"."character" (
  "Ctype" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "Ctext" text COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "public"."character"."Ctype" IS '长度限制为4';
COMMENT ON COLUMN "public"."character"."Ctext" IS '性格描述';

-- ----------------------------
-- Records of character
-- ----------------------------
INSERT INTO "public"."character" VALUES ('ISTJ', '1.严肃、安静、藉由集中心 志与全力投入、及可被信赖获致成功。
2.行事务实、有序、实际 、 逻辑、真实及可信赖
3.十分留意且乐于任何事（工作、居家、生活）均有良好组织及有序。
4.负责任。
5.照设定成效来作出决策且不畏阻挠与闲言会坚定为之。
6.重视传统与忠诚。
7.传统性的思考者或经理。
(1）领导模式：以事实和经验做决定 
建立可靠、稳定、持续的工作绩效 尊重传统和等级制度 奖励遵循规则完成任务的员工 关注组织的即时性和实际性需要 倾向性顺序：①感觉 ②思维 ③情感 ④直觉 
（2） 解决问题模式：喜欢完全依据事实在逻辑框架里进行分析，为获得理 
想结果，需考虑对人们的影响，然后寻找更多的可能性和其它含义。 
工作环境倾向性：
①喜欢与现实、工作努力、关注事实和结果的人共事 
②能长期提供安全性的环境 
③ 奖励稳步发展和按期完成任务的环境
④使用系统性工作方法的环境 
⑤任务型定向和鼓励坚定意志的环境 
⑥提供安静、整齐设施的环境 
⑦环境中允许有不被打扰工作的个人空间 
潜在的缺点：
①因受惠于日常工作而忽视具有长远意义的目标 
②可能忽视人际交往的细节 
③工作方法刻板、不灵活，对变革较少开放态度 
④期望他人和自己一样，同样注意细节和服从管理程序 
发展建议：
①除了关注现实问题，需关注更深远的、定向于未来的问题 
②需考虑人的因素，向他人表达其应得的赞赏 
③为避免陈规，尝试寻找新的选择 
④需培养耐心，应付那些需要用不同方式沟通或忽视规则和程 序的人 
适合领域：工商业领域、政府机构 金融银行业、政府机构 技术领域 医务领域 
适合职业：审计师、会计、财务经理、办公室行政管理、后勤和供应管理、中层经理、公务（法律、税务）执行人员等银行信贷员、成本估价师、保险精算师、税务经纪人、税务检查员等；机械、电气工程师、计算机程序员、数据库管理员、地质、气象学家、法律研究者、律师等；外科医生、药剂师、实验室技术人员、牙科医生、医学研究员等 ');
INSERT INTO "public"."character" VALUES ('INFJ', '1.因为坚忍、创意及必须达成的意图而能成功。
2.会在工作中投注最大的努力。
3.默默强力的、诚挚的及用心的关切他人。
4.因坚守原则而受敬重。
5.提出造福大众利益的明确远景而为人所尊敬与追随。
6.追求创见、关系及物质财物的意义及关联。
7.想了解什么能激励别人及对他人具洞察力。
8.光明正大且坚信其价值观。
9.有组织且果断地履行其愿景。 
（1）领导模式： 
①以使个体和组织获得最大利益的远见从事领导工作 
②从合作中获益而非需要合作的形式 
③采取平稳、认真、持续性的行为过程实现战略目标 
④通过工作实现自己的理想和抱负 
⑤意志坚定地激发他人实现他们的理想 
（2）学习模式： 
①极具个体化和思考式的学习方式 
②强调复杂、结构性的概念和关系的学习 倾向性顺序： ①直觉 ②情感 ③思考 ④感觉 
（3）解决问题模式：
①喜欢识别自己内在观点的可能性，尤其是与人和社会准则有关的问题 
②为成功实现目标，对定向未来的远见卓识的客观性和现实的细枝末节的问题同样重视 
工作环境倾向性：
①工作中有致力于把为人类创造未来作为理想的人 
②有表现创造性和展示自我价值机会的环境
③环境中鼓励营造和谐气氛和体谅他人 
④有尊重他人需要的顺畅的管理机制 
⑤奖励个体的远见卓识 
⑥提供进行安静思考的时间和空间的工作环境 
⑦有组织有计划的工作环境 
潜在的缺点： 
①发现自己的远见被忽视和低估 
②面对批评不太坦率 
③因不太愿强迫别人而过度保守 
④仅从单一维度考虑他们认为对将来最有益的事 
发展建议： 
①在提出自己的观点时，需发展政治领悟力和自主性的技策 
②需学会及时给他人建设性的反馈 
③需要不断征求他人的建议和获得他人反馈 
④需要以更放松和开放的态度面对现状 
适合领域：咨询、教育、科研等领域；文化、艺术、设计等领域 
适合职业：心理咨询工作者、心理诊疗师、职业指导顾问、大学教师（人文学科、艺术类）、心理');
INSERT INTO "public"."character" VALUES ('INTJ', '1.具强大动力与本意来达成目的与创意—固执顽固者。
2.有宏大的愿景且能快速在众多外界事件中找出有意义的模范。
3.对所承负职务，具良好能力于策划工作并完成。
4.具怀疑心、挑剔性、独立性、果决，对专业水准及绩效要求高。 
（1）领导模式：
①促使自己和他人完成组织目标 
②坚定有力地贯彻执行组织的理念 
③要求自己和他人具有顽强意志 
④构思、创造新的模型 
⑤必要时，意志坚定地重建整个组织系统 
（2）学习模式：
①个性化、思考式学习方式，深入其感兴趣的领域 
②智慧型、理论型学习方式，首先要提供一个宏伟蓝图 倾向性顺序：①直觉 ②思维 ③情感 ④感觉 
（3）解决问题模式： 
①喜欢以其内在的认识制定战略、系统和结构，然后客观地做出决定 
②为获得最佳结果，会接纳他人和那些使自己的认识更加接近现实的细节资料 
工作环境倾向性： 
①喜欢工作中有果断、理智接受挑战、致力于完成远期理念的人 
②工作环境允许思考的独立性和个体性 ③强调效率的环境 
④环境里有具有竞争力和创造性的人 
⑤鼓励和支持自主性的环境 
⑥提供创造机会的环境 
⑦任务定向型和重视详尽思考的环境 
潜在的缺点：
①可能显得强硬，他人不敢接近 
②长时间不告诉他人自己的想法，因为认为他人也和自己一样认同自己的想法 
③可能很难实际操作理想化的想法 
④过度关注任务而忽视他人的贡献 
发展建议： 
①自己的个性化方式和想法可以征求他人的反馈和建议 
②与参与任务的人早一些沟通和讨论自己的想法和战略计划 
③当事实资料不支持自己的想法时，应面对现实
④明确他人的贡献应受到鼓励和承认的 
适合领域：科研、科技应用 技术咨询、管理咨询 金融、投资领域 创造性行业 
适合职业：各类科学家、研究所研究人员、设计工程师、系统分析员、计算机程序师、研究开发部经理等 各类技术顾问、技术专家、企业管理顾问、投资专家、法律顾问、医学专家、精神分析学家等 经济学家、投资银行研究员、证券投资和金融分析员、投资银行家、财务计划人、企业并购专家等；各类发明家、建筑师、社论作家、设计师、艺术家等。 ');
INSERT INTO "public"."character" VALUES ('ISTP', '1.冷静旁观者—安静、预留余地、弹性及会以无偏见的好奇心与未预期原始的幽默观察与分析。
2.有兴趣于探索原因及效果，技术事件是为何及如何运作且使用逻辑的原理组构事实、重视效能。
3.擅长于掌握问题核心及找出解决方式。
4.分析成事的缘由且能实时由大量资料中找出实际问题的核心。
(1）领导模式： 
①以身作则 
②一视同仁，尊重每个人的价值 
③面临麻烦时，采用最有利的方法做出快速反应 
④宽松管理员工，喜欢最少监督自己 
⑤采用明晰、理性的管理原则 
(2）学习模式： 
①生动性、娱乐性的学习模式 
②对有用的内容和有实际应用的学习内容感兴趣 倾向性顺序： ①思维 ②感觉 ③直觉 ④情感 
（3）问题解决模式： 
①喜欢依据具体事实以自身具有的内部逻辑构建问题 和解决问题 
②为获得理想结果，需要考虑其它可能性和对人们的影响 
工作环境倾向性：
①喜欢与行为定向、关注即时情境的人共事 
②计划定向和任务定向的环境 
③重视理性分析的环境 
④奖励对问题做出快速反应的环境 
⑤允许间接经验的环境 
⑥提供合适的工作自由度的环境 
⑦培养独立性和自主性的环境 
潜在的缺点： 
①只关注对自身重要的事而对其它事漠不关心 
②在先前的努力获得成果前，缺少坚持性 
③努力不足，过度注重有利性而走捷径 
④犹豫不决，欠缺兴趣、活力、坚持性 
发展建议： 
①需要增强开放性，关心他人，与他人共享信息 
②需发展坚持性，改变沟通模式 
③加强计划性，付出更多努力获取想要的成功 
④需发展设置和保持目标的方法 
适合领域：技术领域 证券、金融业 贸易、商业领域 户外、运动、艺术等领域 
适合职业：机械、电气、电子工程师、各类技术专家和技师、计算机硬件、系统集成专业人员等；证券分析师、金融、财务顾问、经济学研究者等；贸易商、商品经销商、产品代理商（有形产品为主）等；警察、侦探、体育工作者、赛车手、飞行员、雕塑家、手工制作、画家等。');
INSERT INTO "public"."character" VALUES ('ISFP', '1.羞怯的、安宁和善地、敏感的、亲切的、且行事谦虚。
2.喜于避开争论，不对他人强加已见或价值观。
3.无意于领导却常是忠诚的追随者。
4.办事不急躁，安于现状无意于以过度的急切或努力破坏现况，且非成果导向。
5.喜欢有自有的空间及照自订的时程办事。
（1）领导模式：
①不喜欢担任领导，喜欢在团队中担任协调者的角色 
②用自己个人的忠诚激发他人工作的积极性 
③常常更多地采用表扬和支持的方式，较少批评他人 
④随环境所需而做调适 
⑤通过了解他人良好的意图温和地说服他人 
（2）学习模式： 
①安静地学习直接经验 
②学习实际的、能帮助他人的内容 倾向性顺序： ①情感 ②感觉 ③直觉 ④思维 
（3）问题解决模式： 
①喜欢从实用的角度考虑对自己和他人真正重要的事物 
②为获得理想结果，需考虑其他人际关系和其它可能性， 然后更客观地决定事情 
工作环境倾向性： 
①喜欢与合作的、安静地享受工作愉悦感的人共事 
②允许有个人空间的工作环境 
③与致力于和谐相处的人共事 
④能提供灵活性和安全感的环境 
⑤有艺术感染力的环境 
⑥讲究礼貌的同事 
⑦追求实际效果的环境 
潜在的缺点： 
①可能太信任他人，不愿持怀疑态度 
②为避免冲突而不批评他人 
③只关注眼前的损失 
④过度自我批评，容易受伤害 
发展建议： 
①需发展以怀疑的态度分析他人提供的信息 
②需学会给他人负面反馈，处理好冲突 
③需发展更广阔、更朝向未来定向的观念 
④需对他人更果断，对自己有更多赞赏 
适合领域：手工艺、艺术领域 医护领域 商业、服务业领域 
适合职业：时装、首饰设计师、装潢、园艺设计师、陶器、乐器、卡通、漫画制作者、素描画家、舞蹈演员、画家等；出诊医生、出诊护士、理疗师、牙科医生、个人健康和运动教练等；餐饮业、娱乐业业主、旅行社销售人员、体育用品、个人理疗用品销售员等。 ');
INSERT INTO "public"."character" VALUES ('INFP', '1安静观察者，具理想性与对其价值观及重要之人具忠诚心。
2.希外在生活形态与内在价值观相吻合。
3.具好奇心且很快能看出机会所在。常担负开发创意的触媒者　。
4.除非价值观受侵犯，行事会具弹性、适应力高且承受力强。
5.具想了解及发展他人潜能的企图。想作太多且作事全神贯注　。
6.对所处境遇及拥有不太在意。
7.具适应力、有弹性除非价值观受到威胁。 
（1）领导模式： 
①采用便利的领导方式 
②倾向发挥独特的领导能力而不是担当传统性的领导角色 
③独立工作 
④更可能表扬而不是批评他人 
⑤鼓励员工以行动实现理想 
（2）学习模式： 
①安静地专注于自己的兴趣，展示出丰富的想象力 
②灵活，专注自己和他人的发展 倾向性顺序： ①情感 ②直觉 ③感觉 ④思考 
（3）解决问题模式 ：
①思考真正对他人和自己重要的问题，找出具有创造性的可能性 
②为获得最佳结果注意搜集事实资料客观地做出决策 
工作环境倾向性：
①喜欢处在有重要价值观、令人愉悦、效忠组织的人们中 
②处在合作、轻松氛围的环境里 
③允许个体性，也提供共同参与的环境 
④环境中提供灵活、有弹性的工作程序，最少的常规 
⑤非官僚主义的环境 
⑥安静的环境 
⑦有时间和空间进行思考的工作环境 
潜在的缺点： 
①因完美倾向而延误完成任务 
②一次行为想令太多人满意 
③没有调整理想适合客观现实 
④思考多于行动 
发展建议： 
①需要学会怎样工作而不是只注意寻求理想的反应 
②需要发展更坚强的意志，并愿意说“不” 
③需要用自己的准则分清事实和逻辑 
④需要建立和执行行动计划 
适合领域：创作性、艺术类 教育、研究、咨询类 
适合职业：各类艺术家、插图画家、诗人、小说家、建筑师、设计师、文学编辑、艺术指导、记者等；大学老师（人文类）、心理学工作者、心理辅导和咨询人员、社科类研究人员、社会工作者、教育顾问、图书管理者、翻译家等。 ');
INSERT INTO "public"."character" VALUES ('INTP', '1.安静、自持、弹性及具适应力。
2.特别喜爱追求理论与科学事理。
3.习于以逻辑及分析来解决问题—问题解决者。
4.最有兴趣于创意事务及特定工作，对聚会与闲聊无　大兴趣。
5.追求可发挥个人强烈兴趣的生涯。
6.追求发展对有兴趣事务之逻辑解释。
（1）领导模式: 
①在概念上分析问题和目标 
②提供逻辑思维模式 
③追求自主性的同时，也关注他人独立的领导模式 
④依据他人的专业知识而非职位与其交往 
⑤追求与他人智慧上的交流而非情感交流 
（2）学习模式:
①个体化学习方式，不设置开始与结束，只根据自己感兴趣的深度进行学习 
②广泛的、概念性的、能挑战智慧的学习方式 倾向性顺序:①思维 ②直觉 ③感觉 ④情感 
（3）解决问题模式: 
①在寻求各种可能的选择时，喜欢以自身内部的逻辑建构问题和解决问题 
②为获取最佳结果，需同时关注现实状况和他人需求 
工作环境倾向性:
①喜欢与独立思考者、关注解决复杂问题的人共事 
②环境中允许个体有充足的时间和空间进行思考 
③能培养思维独立性和创造性的环境 
④能提供灵活的政策和程序的环境 
⑤安静、尽可能少地开会的环境 
⑥非结构化和非官僚作风的环境 
⑦奖励自我决定的环境 
潜在的缺点: 
①过于抽象，因而坚持下去不太符合现实需要 
②过于理性化，解释起来太理论化 
③过多注意团队中一些小的不一致的地方 
④可能以批评式分析方式待人，行动不考虑个体感受 
发展建议: 
①需要关注现实中的细节，确立完成任务的具体步骤 
②需要简单地陈述事实 
③为获得他人的合作，需要放弃细小的问题 
④需要更好地认识他人，更多地表达对他人的赞赏 
适合领域：计算机技术 理论研究、学术领域 专业领域 创造性领域 
适合职业：软件设计员、系统分析师、计算机程序员、数据库管理、故障排除专家等 大学教授、科研机构研究人员、数学家、物理学家、经济学家、考古学家、历史学家等 证券分析师、金融投资顾问、律师、法律顾问、财务专家、侦探等；各类发明家、作家、设计师、音乐家、艺术家、艺术鉴赏家等。 ');
INSERT INTO "public"."character" VALUES ('ESTP', '1.擅长现场实时解决问题—解决问题者。
2.喜欢办事并乐于其中及过程。
3.倾向于喜好技术事务及运动，交结同好友人。
4.具适应性、容忍度、务实性；投注心力于会很快具　成效工作。
5.不喜欢冗长概念的解释及理论。
6.最专精于可操作、处理、分解或组合的真实事务。 
（1）领导模式： 
①对危机中的管理有充分准备 
②说服他人接受自己的观点 
③直率、自信的领导方式 
④按最有利的路径进行组织工作 
⑤重视行动和即时结果 
（2）学习模式： 
①主动型、间接经验型、尝试错误型的学习方式 
②实际型，注意力集中在即刻能应用的学习内容 倾向性顺序： ①感觉 ②思维 ③情感 ④直觉 
（3）问题解决模式： 
①喜欢现实、具体地评估环境，然后用逻辑分析以后采 取的步骤 
②为获得理想结果，会考虑对人们的影响，寻找其它可选择的可能性 
工作环境倾向性：
①喜欢与活泼、结果定向型、重视直接经验的人共事 
②有规则，但承认差异性的环境 
③环境中允许有开玩笑的时间 
④能提供工作灵活性的环境 
⑤技术型定向的环境，有最新的设备 
⑥身体感到舒适的环境 
⑦对即刻的需求能做出反应的环境 
潜在的缺点： 
①当快速行为时，显得苛求、强硬、感觉迟钝 
②过分集中于即时行为，而失去行为的更广阔、深远的意义
③转移到下一个待解决问题而不能坚持解决目前的问题 
④会被工作以外的活动吸引，如体育运动和其它娱乐活动。 
发展建议： 
①需抑制自己的任务型定向，分析他人的情绪感受 
②需在快速决定之前，事先计划，考虑更多的因素 
③需完成眼前的任务 
④需以适当的观点看待工作和娱乐 
适合领域：贸易、商业、某些特殊领域 服务业 金融证券业 娱乐、体育、艺术领域 
适合职业：各类贸易商、批发商、中间商、零售商、房地产经纪人、保险经济人、汽车销售人员、私家侦探、警察等； 餐饮、娱乐及其他各类服务业的业主、主管、特许经营者、自由职业者等。 股票经纪人、证券分析师、理财顾问、个人投资者等；娱乐节目主持人、体育节目评论、脱口秀、音乐、舞蹈表演者、健身教练、体育工作者等。');
INSERT INTO "public"."character" VALUES ('ESFP', '1.外向、和善、接受性、乐于分享喜乐予他人。
2.喜欢与他人一起行动且促成事件发生，在学习时亦然。
3.知晓事件未来的发展并会热列参与。
5.最擅长于人际相处能力及具备完备常识，很有弹性能立即　适应他人与环境。
6.对生命、人、物质享受的热爱者。 
（1）领导模式： 
①促进善意和合作的领导方式 
②喜欢从开头管理某个工程 
③消除紧张气氛，把人们带入轻松的情境里 
④关注解决即时出现的问题 
⑤促进人际间有效的交流 
（2）学习模式：
①利用充裕的时间通过讨论获取新知识 
②学习事实性的知识，搞清楚这些知识如何发挥作用的 倾向性顺序： ①感觉 ②情感 ③思维 ④直觉 
（3）解决问题模式：
①喜欢对情境进行现实和具体的评估，尤其是对于人更是如此 
②为获得最佳结果，需增强客观性，从长远的眼光看待 
不同事物 
工作环境倾向性：
①喜欢与有活力的、轻松愉快、关注现实的人共事 
②活跃、行为定向的工作环境 
③培养快节奏做事的环境 
④有适应性强、喜爱自由的人的工作环境 
⑤强调和谐、友好、赞赏别人的环境 
⑥乐观的、注重交往的工作环境
⑦有吸引力、丰富多彩的环境 
潜在的缺陷： 
①为保持和谐，过度强调主观性论据 
②行动前不太考虑眼前的事实 
③可能花太多的时间在社会关系上而忽视任务本身 
④常常有始无终 
发展建议： 
①为减少非个体性冲突，做决策时需理智分析决策的意义 
②进行管理工作前应事先制定计划 
③需平衡花费在任务和社会性交往上的时间 
④需致力于完成计划，对时间进行管理 
适合领域：消费类商业、服务业领域 广告业、娱乐业领域、旅游业、社区服务等其他领域 
适合职业：精品店、商场销售人员、娱乐、餐饮业客户经理、房地产销售人员、汽车销售人员、市场营销人员（消费类产品）等；广告企业中的设计师、创意人员、客户经理、时装设计和表演人员、摄影师、节目主持人、脱口秀演员等；旅游企业中的销售、服务人员、导游、社区工作人员、自愿工作者、公共关系专家、健身和运动教练、医护人员等。');
INSERT INTO "public"."character" VALUES ('ENFP', '1.充满热忱、活力充沛、聪明的、富想象力的，视生命充满机会但期能得自他人肯定与支持。
2.几乎能达成所有有兴趣的事。
3.对难题很快就有对策并能对有困难的人施予援手。
4.依赖能改善的能力而无须预作规划准备。
5.为达目的常能找出强制自己为之的理由。
6.即兴执行者。 
（1）领导模式：
①富有活力、热情的领导方式 
②喜欢进行首创性管理 
③经常是重要事件的发言人 
④工作中提倡和支持人们的自主性 
⑤关注如何激励他人，如何鼓励他人付诸于行动 
（2）学习模式：
①积极主动型、经验型、想象型 
②对学习内容感兴趣，不管它们是否有实际应用性 倾向性顺序：①直觉 ②情感 ③思维 ④感觉 
（3）解决问题模式： 
①喜欢根据自己的价值观和准则探索创造性发展的各种可能性和前景 
②为获得最佳结果，冷静理智分析，考虑相关的事实资料和各种细节 工作环境倾向性：①喜欢与想象力丰富、致力于人们未来发展的人共事 ②允许表现交际能力和智力才能的环境 
③爱好参与的氛围，与不同的人分享不同的观点 
④提供变化和具有挑战性的环境 
⑤鼓励提出观点和想法的环境 
⑥有弹性、自由度大、少限制的环境 
⑦气氛愉悦和随意的环境 
潜在的缺点： 
①在没完成已经提出的计划之前又转移到新的想法和计划上 
②忽视相关的细节和事实资料 
③过分扩展，尝试做的事情太多 
④因寻求可能的最佳结果而拖延工作 
发展建议： 
①需要根据重要性事先做好安排，先做最重要的，坚持到底。 
②需要关注重要的细节 
③需要学会筛选任务，不要试图去做所有具有吸引力的任务。 
④为达成目标，需使用制定计划和进行时间管理的技巧 
适合领域：
广告创意、广告撰稿人，市场营销和宣传策划、市场调研人员、艺术指导、公关专家、公司对外发言人等. 
适合职业：
儿童教育老师、大学老师（人文类）、心理学工作者、心理辅导和咨询人员、职业规划顾问、社会工作者、人力资源专家、培训师、演讲家等 记者（访谈类）、节目策划和主持人、专栏作家、剧作家、艺术指导、设计师、卡通制作者、电影、电视制片人等。');
INSERT INTO "public"."character" VALUES ('ENTP', '1.反应快、聪明、长于多样事务。
2.具激励伙伴、敏捷及直言讳专长。
3.会为了有趣对问题的两面加予争辩。
4.对解决新及挑战性的问题富有策略，但会轻忽或厌烦经常的任务与细节。
5.兴趣多元，易倾向于转移至新生的兴趣。
6.对所想要的会有技巧地找出逻辑的理由。
7.长于看清础他人，有智能去解决新或有挑战的问题 
（1）领导模式: 
①制定理论体系满足组织的需要 
②鼓励他人的独立性 
③运用逻辑分析寻找变革的模式 
④对于自己想做的事使用强制性的理由 
⑤在人与组织之间扮演促进者的角色 
（2）学习模式: 
①主动、概念型的学习，喜欢由专家传授知识 
②接受挑战型，定向于未来的发展蓝图 倾向性顺序： ①直觉 ②思维 ③情感 ④感觉 
（3）解决问题模式:
①喜欢探索未来的前景和发展模式，理智地分析每一个正向和反向的结果 
②为获得最理想结果，关注人们的需要和相关的事实和细节 工作环境倾向性:①喜欢与独立的、按理论模型解决复杂问题的人共事 ②提供灵活性和挑战性的工作环境 
③变革型和非官僚作风的工作环境 
④拥有具有竞争力的个体的环境 
⑤奖励挑战风险行为的工作环境 
⑥鼓励行为自主性和自由性的环境 
⑦关注未来发展远景的工作环境 潜在的缺点: ①过多依赖模型而忘记现实状况 ②因竞争心而不会赞赏他人的付出 ③因过分扩展自己而筋疲力尽 ④可能抵制正规的程序和准则 
发展建议: 
①需要注意各个方面的因素和基本的事实 
②需要承认他人贡献的有效性 
③需要设立现实性的开始与结束的期限，知道何时该结束 
④需要学会怎样在组织里如何工作 
适合领域：投资顾问、项目策划、投资银行、自我创业 市场营销、创造性领域 公共关系 政治 
适合职业：投资顾问（房地产、金融、贸易、商业等）、各类项目的策划人和发起者、投资银行家、风险投资人、企业业主（新兴产业）等；市场营销人员、各类产品销售经理、广告创意、艺术总监、访谈类节目主持人、制片人等；公共关系专家、公司对外发言人、社团负责人、政治家等。');
INSERT INTO "public"."character" VALUES ('ESTJ', '1.务实、真实、事实倾向，具企业或技术天份。
2.不喜欢抽象理论；最喜欢学习可立即运用事理。
3.喜好组织与管理活动且专注以最有效率方式行事以达致成效。
4.具决断力、关注细节且很快作出决策—优秀行政者。
5.会忽略他人感受。
6.喜作领导者或企业主管。 
（1）领导模式： 
①直接领导，快速管理 
②运用过去经验解决问题
③直接、明确地识别问题的核心 
④决策和执行决策非常迅速 
⑤传统型领导，尊重组织内部的等级和组织获得的成就 
（2）学习模式： 
①积极主动型，学习间接经验，采用结构化的学习方式 
②实际型，关注他们能运用的学习内容 向性顺序： ①思维 ②感觉 ③直觉 ④情感 
（3）问题解决模式：
①喜欢根据相关的事实和细节进行逻辑分析，从而控 制情境 
②为达到理想结果，会考虑更广阔的前景以及对人们和自己的影响 
工作环境倾向性：
①喜欢与努力工作、有坚定决心把工作做好的人共事 
②任务型定向的环境 
③有组织和组织结构的环境 
④有团队计划的环境 
⑤提供稳定性和预测性的环境 
⑥致力于绩效和生产性的环境 
⑦奖励完成目标的环境 
潜在的缺点：
①决策太迅速，也给他人施以同样的压力 
②不能察觉变革的需要，因为相信一切都在正常运作 
③在完成任务过程中，忽视人际间的小细节 
④长期忽视自己的感受和准则，可能会被自己的情感击跨 
发展建议： 
①决策之前需考虑各种因素，包括人的因素 
②需要促使自己看到他人要求变革而获得的利益 
③需做特别的努力学会赞赏别人 
④需从工作中抽点时间考虑和识别自己的情感和价值观 
适合领域：无明显领域特征 
适合职业：大、中型外资企业员工、业务经理、中层经理（多分布在财务、营运、物流采购、销售管理、项目管理、工厂管理、人事行政部门）、职业经理人、各类中小型企业主管和业主。');
INSERT INTO "public"."character" VALUES ('ESFJ', '1.诚挚、爱说话、合作性高、受　欢迎、光明正大 的—天生的　合作者及活跃的组织成员。
2.重和谐且长于创造和谐。
3.常作对他人有益事务。
4.给予鼓励及称许会有更佳工作成效。
5.最有兴趣于会直接及有形影响人们生活的事务。
6.喜欢与他人共事去精确且准时地完成工作。 
（1）领导模式： 
①关心他人的领导方式 
②以良好的人际关系赢得合作 
③让人们活跃起来 
④承担繁重的工作，坚持到底 
⑤发扬组织的传统精神 
（2）学习模式： 
①系统性、参与性、个体性的学习方式，用较多时间讨论新知识 
②学习早已有实践应用的应用性材料 倾向性顺序： ①情感 ②感觉 ③直觉 ④思维 
（3）解决问题模式： 
①喜欢考虑准则以及对人们的影响，也关注相关的事实和有用的细节 
②为获取理想结果，需识别其它人际关系，然后理智、 冷静地分析 
工作环境倾向性：
①喜欢与诚恳、具有合作性、乐于帮助他人的人共事 
②目标定向型的环境，提供有益、合适的工作程序 
③奖励组织行为和个体工作绩效的环境 
④鼓励人际间的友谊的工作环境 
⑤赞赏他人和开朗的工作氛围 
⑥培养人际间关心和敏感察觉他人需要的工作环境 
⑦关注事实和价值观的环境 
潜在的缺点： 
①避免和回避冲突 
②因致力于令他人满意而忽略自己 
③提供自己认为是对组织和对他人最好的建议 
④不经常有时间客观地反思过去、展想未来 
发展建议： 
①需学会注意差异性和处理冲突 
②需学会分离出自己的需要 
③需学会更客观地听取真正需要什么 
④做决策时，需考虑决策的理性、全局性的意义 
适合领域：无明显领域特征 
适合职业：办公室行政或管理人员、秘书、总经理助理、项目经理、客户服务部人员、采购和物流管理人员等；内科医生及其它各类医生、牙科医生、护士、健康护理指导师、饮食学、营养学专家、小学教师（班主任）、学校管理者等；银行、酒店、大型企业客户服务代表、客户经理、公共关系部主任、商场经理、餐饮业业主和管理人员等。');
INSERT INTO "public"."character" VALUES ('ENTJ', '1.坦诚、具决策力的活动领导者。
2.长于发展与实施广泛的系统以解决组织的问题。
3.专精于具内涵与智能的谈话如对公众演讲。
4.乐于经常吸收新知且能广开信息管道。
5.易生过度自信，会强于表达自已创见。
6.喜于长程策划及目标设定 
（1）领导模式:
①富于活力的行为定向型领导模式 
②为组织制定长远规划 
③必要时，采用直接的、强硬的管理方式 
④喜欢复杂问题并足智多谋地解决这些问题 
⑤尽可能多地参与组织管理 
（2）学习模式: 
①喜欢由专家传授知识 ②对挑战和问题抱开放态度 倾向性顺序: ①思维 ②直觉 ③感觉 ④情感 
（3）解决问题模式:
①根据内在的理解进行逻辑分析从而控制局面 
②为获得理想结果，对事实资料进行现实性决策，同时考虑决策对人们和自己的 影响 
工作环境倾向性:
①喜欢与结果定向型、独立的、有能力的、注重解决复杂问题的人共事 
②目标型定向的工作环境 
③有效率的组织系统和员工 
④工作环境中即刻奖励做出挑战努力的员工 
⑤奖励果断的人的环境 
⑥环境中有意志坚定的人 
⑦组织关注主要的组织计划 
潜在的缺点: 
①关注任务而忽视人们的需要和对组织的贡献 
②忽略现实的考虑和对现实局限性的认识 
③决策太迅速，表现得缺乏耐心，盛气凌人 
④忽视和抑制自己和他人的情感 
发展建议: 
①需要考虑人的因素，赞赏他人对组织的贡献 
②行动前先检查现实的、人力的、环境的资源是否可获得 
③决策前花些时间考虑和反思各个方面的因素 
④需要学会鉴别和重视自己和他人的情感 
适合领域： 工商业、政界 金融和投资领域 管理咨询、培训 专业性领域 
适合职业： 各类企业的高级主管、总经理、企业主、社会团体负责人、政治家等 投资银行家、风险投资家、股票经纪人、公司财务经理、财务顾问、经济学家 企业管理顾问、企业战略顾问、项目顾问、专项培训师等；律师、法官、知识产权专家、大学教师、科技专家等。');
INSERT INTO "public"."character" VALUES ('ENFJ', '1.热忱、易感应及负责任的--具能鼓励他人的领导风格。
2.对别人所想或希求会表达真正关切且切实用心去处理。
3.能怡然且技巧性地带领团体讨论或演示文稿提案。
4.爱交际、受欢迎及富同情心。
5.对称许及批评很在意。
6.喜欢带引别人且能使别人或团体发挥潜能。 
（1）领导模式：
①富于热情和赞扬他人的领导方式 
②以参与的态度管理员工和工作 
③满足员工的需要，努力使每个员工满意 
④促使组织的行为与组织的价值观一致 
⑤鼓励施行给人们带来利益的变革 
（2）学习模式：
①在相互交流和合作中学习重要的内容 
②有良好结构的学习材料，在学习中能获得更多鼓励 倾向性顺序：①情感 ②直觉 ③感觉 ④思维 
（3）解决问题模式： 
①先判断发展计划是否考虑能取得的绩效和对人们的影响 
②为获得最佳结果注意更多事实资料，然后进行理智、冷静地分析 
喜欢的工作环境：
①喜欢与那些关注变革并通过变革改变人们的人共事 
②喜欢人际定向型和社会型的环境 
③鼓励支持和称赞他人的环境 
④富有同情精神和和睦气氛的环境 
⑤鼓励自我表现的环境 
⑥稳定而注重果断性的环境 
⑦注重反馈和秩序的环境 
潜在的缺点： 
①可能会理想化他人，因而遭受他人表面忠诚的蒙蔽 
②可能回避有冲突的问题 
③因重视人际关系而忽视任务 
④过度自我批评 
发展建议：
①需要认识人们的局限性，捍卫真正的忠诚 
②需要学会建设性地处理冲突 
③需要学会同时关注任务中的细节问题和完成任务的人 
④需要认真听取客观的评价，少一些自我批评 
适合领域：培训、咨询、教育 新闻传播、公共关系、文化艺术 
适合职业：人力资源培训主任、销售、沟通、团队培训员、职业指导顾问、心理咨询工作者、大学教师（人文学科类）、教育学、心理学研究人员等 记者、撰稿人、节目主持人（新闻、采访类）、公共关系专家、社会活动家、文艺工作者、平面设计师、画家、音乐家等。');
INSERT INTO "public"."character" VALUES ('ISFJ', '1.安静、和善、负责任且有良心。
2.行事尽责投入。
3.安定性高，常居项目工作或团体之安定力量。
4.愿投入、吃苦及力求精确。
5.兴趣通常不在于科技方面。对细节事务有耐心。
6.忠诚、考虑周到、知性且会关切他人感受。
7.致力于创构有序及和谐的工作与家庭环境。
（1）领导模式： 
①开始可能不愿担任领导，但当需要承担领导任务时会接受 
②希望自己和他人服从组织的需要 
③以个人的影响力作为后盾 
④认真遵守传统程序和规则 
⑤观察细节以获得现实的结果 
（2）学习模式： 
①花费充足的时间以结构化的方式，安静地记忆材料 
②注重实用性，关注做什么可以为人们提供帮助 倾向性顺序： ①感觉 ②情感 ③思维 ④直觉 
（3）解决问题模式：喜欢完全依据事实，尤其是当应用于人和准则方面时为获得理想结果，需退一 
步思考问题的逻辑，然后寻找更多的可能性和其它含义 
工作环境倾向性： 
①喜欢与认真、从事组织性任务的人共事 
②能提供安全性和预测性的工作环境 
③组织结构明晰的环境 
④能保持安静、有一些个人空间的环境 
⑤做事坚持到底的环境 
⑥充满个人化、友好、体谅氛围的环境 
⑦服务型定向的环境 
潜在的缺点： 
①过于谨慎小心，尤其是对待未来发展 
②向他人表明自己观点时，显得意志不太坚定 
③因安静、忘却自我的特性而低估自己 
④过度依赖自己的经验，不能根据环境和其它需要灵活调整 
发展建议： 
①工作中需要估计风险，以积极、全面的观点看待未来 
②需发展更多的自信和直率 
③学会宣扬自己的成就 
④对其它形式的做事方式需保持开放态度 
适合领域：无明显领域特征 医护领域 消费类商业、服务业领域 
适合职业：行政管理人员、总经理助理、秘书、人事管理者、项目经理、物流经理、律师助手等；外科医生及其它各类医生、家庭医生、牙科医生、护士、药剂师、医学专家、营养学专家、顾问等；零售店、精品店业主、大型商场、酒店管理人员、室内设计师等。 ');

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS "public"."class";
CREATE TABLE "public"."class" (
  "CId" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "Dname" varchar(60) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO "public"."class" VALUES ('201', '软件工程');
INSERT INTO "public"."class" VALUES ('202', '软件工程');
INSERT INTO "public"."class" VALUES ('203', '软件工程');
INSERT INTO "public"."class" VALUES ('204', '软件工程');
INSERT INTO "public"."class" VALUES ('201', '网络工程');
INSERT INTO "public"."class" VALUES ('202', '网络工程');
INSERT INTO "public"."class" VALUES ('203', '网络工程');
INSERT INTO "public"."class" VALUES ('204', '网络工程');
INSERT INTO "public"."class" VALUES ('201', '计算机科学与技术');
INSERT INTO "public"."class" VALUES ('202', '计算机科学与技术');
INSERT INTO "public"."class" VALUES ('203', '计算机科学与技术');
INSERT INTO "public"."class" VALUES ('204', '计算机科学与技术');
INSERT INTO "public"."class" VALUES ('201', '机器人工程');
INSERT INTO "public"."class" VALUES ('202', '机器人工程');
INSERT INTO "public"."class" VALUES ('203', '机器人工程');
INSERT INTO "public"."class" VALUES ('204', '机器人工程');
INSERT INTO "public"."class" VALUES ('201', '自动化');
INSERT INTO "public"."class" VALUES ('202', '自动化');
INSERT INTO "public"."class" VALUES ('203', '自动化');
INSERT INTO "public"."class" VALUES ('204', '自动化');
INSERT INTO "public"."class" VALUES ('201', '工业工程');
INSERT INTO "public"."class" VALUES ('202', '工业工程');
INSERT INTO "public"."class" VALUES ('203', '工业工程');
INSERT INTO "public"."class" VALUES ('204', '工业工程');
INSERT INTO "public"."class" VALUES ('201', '机械设计制造及自动化');
INSERT INTO "public"."class" VALUES ('202', '机械设计制造及自动化');
INSERT INTO "public"."class" VALUES ('203', '机械设计制造及自动化');
INSERT INTO "public"."class" VALUES ('204', '机械设计制造及自动化');
INSERT INTO "public"."class" VALUES ('201', '测控技术与仪器');
INSERT INTO "public"."class" VALUES ('202', '测控技术与仪器');
INSERT INTO "public"."class" VALUES ('203', '测控技术与仪器');
INSERT INTO "public"."class" VALUES ('204', '测控技术与仪器');
INSERT INTO "public"."class" VALUES ('201', '车辆工程');
INSERT INTO "public"."class" VALUES ('202', '车辆工程');
INSERT INTO "public"."class" VALUES ('203', '车辆工程');
INSERT INTO "public"."class" VALUES ('204', '车辆工程');
INSERT INTO "public"."class" VALUES ('201', '汉语国际教育');
INSERT INTO "public"."class" VALUES ('202', '汉语国际教育');
INSERT INTO "public"."class" VALUES ('203', '汉语国际教育');
INSERT INTO "public"."class" VALUES ('204', '汉语国际教育');
INSERT INTO "public"."class" VALUES ('201', '汉语言文学系');
INSERT INTO "public"."class" VALUES ('202', '汉语言文学系');
INSERT INTO "public"."class" VALUES ('203', '汉语言文学系');
INSERT INTO "public"."class" VALUES ('204', '汉语言文学系');
INSERT INTO "public"."class" VALUES ('201', '新闻学系');
INSERT INTO "public"."class" VALUES ('202', '新闻学系');
INSERT INTO "public"."class" VALUES ('203', '新闻学系');
INSERT INTO "public"."class" VALUES ('204', '新闻学系');
INSERT INTO "public"."class" VALUES ('201', '法学系');
INSERT INTO "public"."class" VALUES ('202', '法学系');
INSERT INTO "public"."class" VALUES ('203', '法学系');
INSERT INTO "public"."class" VALUES ('204', '法学系');
INSERT INTO "public"."class" VALUES ('201', '制药工程');
INSERT INTO "public"."class" VALUES ('202', '制药工程');
INSERT INTO "public"."class" VALUES ('203', '制药工程');
INSERT INTO "public"."class" VALUES ('204', '制药工程');
INSERT INTO "public"."class" VALUES ('201', '食品科学与工程');
INSERT INTO "public"."class" VALUES ('202', '食品科学与工程');
INSERT INTO "public"."class" VALUES ('203', '食品科学与工程');
INSERT INTO "public"."class" VALUES ('204', '食品科学与工程');
INSERT INTO "public"."class" VALUES ('201', '化学工程与工艺');
INSERT INTO "public"."class" VALUES ('202', '化学工程与工艺');
INSERT INTO "public"."class" VALUES ('203', '化学工程与工艺');
INSERT INTO "public"."class" VALUES ('204', '化学工程与工艺');
INSERT INTO "public"."class" VALUES ('201', '生物工程');
INSERT INTO "public"."class" VALUES ('202', '生物工程');
INSERT INTO "public"."class" VALUES ('203', '生物工程');
INSERT INTO "public"."class" VALUES ('204', '生物工程');
INSERT INTO "public"."class" VALUES ('201', '食品质量与安全');
INSERT INTO "public"."class" VALUES ('202', '食品质量与安全');
INSERT INTO "public"."class" VALUES ('203', '食品质量与安全');
INSERT INTO "public"."class" VALUES ('204', '食品质量与安全');
INSERT INTO "public"."class" VALUES ('201', '应用化学');
INSERT INTO "public"."class" VALUES ('202', '应用化学');
INSERT INTO "public"."class" VALUES ('203', '应用化学');
INSERT INTO "public"."class" VALUES ('204', '应用化学');
INSERT INTO "public"."class" VALUES ('201', '统计学');
INSERT INTO "public"."class" VALUES ('202', '统计学');
INSERT INTO "public"."class" VALUES ('203', '统计学');
INSERT INTO "public"."class" VALUES ('204', '统计学');
INSERT INTO "public"."class" VALUES ('201', '数学与应用数学');
INSERT INTO "public"."class" VALUES ('202', '数学与应用数学');
INSERT INTO "public"."class" VALUES ('203', '数学与应用数学');
INSERT INTO "public"."class" VALUES ('204', '数学与应用数学');
INSERT INTO "public"."class" VALUES ('201', '信息与计算科学');
INSERT INTO "public"."class" VALUES ('202', '信息与计算科学');
INSERT INTO "public"."class" VALUES ('203', '信息与计算科学');
INSERT INTO "public"."class" VALUES ('204', '信息与计算科学');
INSERT INTO "public"."class" VALUES ('201', '经济学');
INSERT INTO "public"."class" VALUES ('202', '经济学');
INSERT INTO "public"."class" VALUES ('203', '经济学');
INSERT INTO "public"."class" VALUES ('204', '经济学');
INSERT INTO "public"."class" VALUES ('201', '行政管理');
INSERT INTO "public"."class" VALUES ('202', '行政管理');
INSERT INTO "public"."class" VALUES ('201', '航空服务艺术与管理');
INSERT INTO "public"."class" VALUES ('202', '航空服务艺术与管理');
INSERT INTO "public"."class" VALUES ('203', '航空服务艺术与管理');
INSERT INTO "public"."class" VALUES ('204', '航空服务艺术与管理');
INSERT INTO "public"."class" VALUES ('201', '人力资源管理');
INSERT INTO "public"."class" VALUES ('202', '人力资源管理');
INSERT INTO "public"."class" VALUES ('201', '工商管理');
INSERT INTO "public"."class" VALUES ('202', '工商管理');
INSERT INTO "public"."class" VALUES ('201', '市场营销');
INSERT INTO "public"."class" VALUES ('202', '市场营销');
INSERT INTO "public"."class" VALUES ('203', '市场营销');
INSERT INTO "public"."class" VALUES ('204', '市场营销');
INSERT INTO "public"."class" VALUES ('201', '旅游管理');
INSERT INTO "public"."class" VALUES ('202', '旅游管理');
INSERT INTO "public"."class" VALUES ('203', '旅游管理');
INSERT INTO "public"."class" VALUES ('205', '航空服务艺术与管理');
INSERT INTO "public"."class" VALUES ('205', '市场营销');

-- ----------------------------
-- Table structure for college
-- ----------------------------
DROP TABLE IF EXISTS "public"."college";
CREATE TABLE "public"."college" (
  "CGname" varchar(60) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of college
-- ----------------------------
INSERT INTO "public"."college" VALUES ('计算机科学与工程学院');
INSERT INTO "public"."college" VALUES ('机电工程学院');
INSERT INTO "public"."college" VALUES ('文法学院');
INSERT INTO "public"."college" VALUES ('生命科学学院');
INSERT INTO "public"."college" VALUES ('理学院');
INSERT INTO "public"."college" VALUES ('经济管理学院');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS "public"."department";
CREATE TABLE "public"."department" (
  "Dname" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "CGname" varchar(60) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO "public"."department" VALUES ('软件工程', '计算机科学与工程学院');
INSERT INTO "public"."department" VALUES ('网络工程', '计算机科学与工程学院');
INSERT INTO "public"."department" VALUES ('计算机科学与技术', '计算机科学与工程学院');
INSERT INTO "public"."department" VALUES ('机器人工程', '机电工程学院');
INSERT INTO "public"."department" VALUES ('自动化', '机电工程学院');
INSERT INTO "public"."department" VALUES ('工业工程', '机电工程学院');
INSERT INTO "public"."department" VALUES ('机械设计制造及自动化', '机电工程学院');
INSERT INTO "public"."department" VALUES ('测控技术与仪器', '机电工程学院');
INSERT INTO "public"."department" VALUES ('车辆工程', '机电工程学院');
INSERT INTO "public"."department" VALUES ('汉语国际教育', '文法学院');
INSERT INTO "public"."department" VALUES ('汉语言文学系', '文法学院');
INSERT INTO "public"."department" VALUES ('新闻学系', '文法学院');
INSERT INTO "public"."department" VALUES ('法学系', '文法学院');
INSERT INTO "public"."department" VALUES ('制药工程', '生命科学学院');
INSERT INTO "public"."department" VALUES ('食品科学与工程', '生命科学学院');
INSERT INTO "public"."department" VALUES ('化学工程与工艺', '生命科学学院');
INSERT INTO "public"."department" VALUES ('生物工程', '生命科学学院');
INSERT INTO "public"."department" VALUES ('食品质量与安全', '生命科学学院');
INSERT INTO "public"."department" VALUES ('应用化学', '生命科学学院');
INSERT INTO "public"."department" VALUES ('统计学', '理学院');
INSERT INTO "public"."department" VALUES ('数学与应用数学', '理学院');
INSERT INTO "public"."department" VALUES ('信息与计算科学', '理学院');
INSERT INTO "public"."department" VALUES ('经济学', '经济管理学院');
INSERT INTO "public"."department" VALUES ('行政管理', '经济管理学院');
INSERT INTO "public"."department" VALUES ('航空服务艺术与管理', '经济管理学院');
INSERT INTO "public"."department" VALUES ('人力资源管理', '经济管理学院');
INSERT INTO "public"."department" VALUES ('工商管理', '经济管理学院');
INSERT INTO "public"."department" VALUES ('市场营销', '经济管理学院');
INSERT INTO "public"."department" VALUES ('旅游管理', '经济管理学院');

-- ----------------------------
-- Table structure for quesType
-- ----------------------------
DROP TABLE IF EXISTS "public"."quesType";
CREATE TABLE "public"."quesType" (
  "QTid" int4 NOT NULL,
  "QTtext" text COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "public"."quesType"."QTid" IS '自增';

-- ----------------------------
-- Records of quesType
-- ----------------------------
INSERT INTO "public"."quesType" VALUES (1, '哪一个答案最能贴切的描绘你一般的感受或行为？');
INSERT INTO "public"."quesType" VALUES (2, '在下列每一对词语中，哪一个词语更合你心意？请仔细想想这些词语的意义，而不要理会他们的字形或读音。');
INSERT INTO "public"."quesType" VALUES (3, '哪一个答案最能贴切地描绘你一般的感受或行为');
INSERT INTO "public"."quesType" VALUES (4, '在下列每一对词语中，哪一个词语更合你心意？');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS "public"."question";
CREATE TABLE "public"."question" (
  "Qid" int4 NOT NULL DEFAULT nextval('table_question_id_seq'::regclass),
  "Qtext" text COLLATE "pg_catalog"."default" DEFAULT ''::text,
  "QAtext" text COLLATE "pg_catalog"."default" NOT NULL DEFAULT ''::text,
  "QBtext" text COLLATE "pg_catalog"."default" NOT NULL,
  "QTid" int4 NOT NULL,
  "QAvalue" char(1) COLLATE "pg_catalog"."default" NOT NULL,
  "QBvalue" char(1) COLLATE "pg_catalog"."default" NOT NULL
)
;
COMMENT ON COLUMN "public"."question"."Qid" IS '自增';

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO "public"."question" VALUES (1, '当你要外出一整天，你会', '计划你要做什么和在什么时候做', '说去就去', 1, 'J', 'P');
INSERT INTO "public"."question" VALUES (2, '你认为自己是一个', '较为随兴所至的人', '较为有条理的人', 1, 'P', 'J');
INSERT INTO "public"."question" VALUES (3, '假如你是一位老师，你会选教', '以事实为主的课程', '涉及理论的课程', 1, 'S', 'N');
INSERT INTO "public"."question" VALUES (4, '你通常', '与人容易混熟', '比较沉静或矜持', 1, 'E', 'I');
INSERT INTO "public"."question" VALUES (5, '一般来说，你和哪些人比较合得来？', '富于想象力的人', '现实的人', 1, 'N', 'S');
INSERT INTO "public"."question" VALUES (6, '你是否经常让', '你的情感支配你的理智', '你的理智主宰你的情感', 1, 'F', 'T');
INSERT INTO "public"."question" VALUES (7, '处理许多事情上，你会喜欢', '凭兴所至行事', '按照计划行事', 1, 'P', 'J');
INSERT INTO "public"."question" VALUES (8, '你是否', '容易让人了解', '难于让人了解', 1, 'E', 'I');
INSERT INTO "public"."question" VALUES (9, '按照程序表做事，', '合你心意', '令你感到束缚', 1, 'J', 'P');
INSERT INTO "public"."question" VALUES (10, '当你有一份特别的任务，你会喜欢', '开始前小心组织计划', '边做边找须做什么', 1, 'J', 'P');
INSERT INTO "public"."question" VALUES (11, '在大多数情况下，你会选择', '顺其自然', '按程序表做事', 1, 'P', 'J');
INSERT INTO "public"."question" VALUES (12, '大多数人会说你是一个', '重视自我隐私的人', '非常坦率开放的人', 1, 'I', 'E');
INSERT INTO "public"."question" VALUES (13, '你宁愿被人认为是一个', '实事求是的人', '机灵的人', 1, 'S', 'N');
INSERT INTO "public"."question" VALUES (14, '在一大群人当中，通常是', '你介绍大家认识', '别人介绍你', 1, 'E', 'I');
INSERT INTO "public"."question" VALUES (15, '你会跟哪些人做朋友？', '常提出新注意的', '脚踏实地的', 1, 'N', 'S');
INSERT INTO "public"."question" VALUES (16, '你倾向', '重视感情多于逻辑', '重视逻辑多于感情', 1, 'F', 'T');
INSERT INTO "public"."question" VALUES (17, '你比较喜欢', '坐观事情发展才作计划', '很早就作计划', 1, 'P', 'J');
INSERT INTO "public"."question" VALUES (18, '你喜欢花很多的时间', '一个人独处', '合别人在一起', 1, 'I', 'E');
INSERT INTO "public"."question" VALUES (19, '与很多人一起会', '令你活力培增', '常常令你心力憔悴', 1, 'E', 'I');
INSERT INTO "public"."question" VALUES (20, '你比较喜欢', '很早便把约会、社交聚集等事情安排妥当', '无拘无束，看当时有什么好玩就做什么', 1, 'J', 'P');
INSERT INTO "public"."question" VALUES (21, '计划一个旅程时，你较喜欢', '大部分的时间都是跟当天的感觉行事', '事先知道大部分的日子会做什么', 1, 'P', 'J');
INSERT INTO "public"."question" VALUES (22, '在社交聚会中，你', '有时感到郁闷', '常常乐在其中', 1, 'I', 'E');
INSERT INTO "public"."question" VALUES (23, '你通常', '和别人容易混熟', '趋向自处一隅', 1, 'E', 'I');
INSERT INTO "public"."question" VALUES (24, '哪些人会更吸引你？', '一个思想敏捷及非常聪颖的人', '实事求是，具丰富常识的人', 1, 'N', 'S');
INSERT INTO "public"."question" VALUES (25, '在日常工作中，你会 ', '颇为喜欢处理迫使你分秒必争的突发', '通常预先计划，以免要在压力下工作', 1, 'P', 'J');
INSERT INTO "public"."question" VALUES (26, '你认为别人一般', '要花很长时间才认识你', '用很短的时间便认识你', 1, 'I', 'E');
INSERT INTO "public"."question" VALUES (59, '当你要在一个星期内完成一个大项目，你在开始的时候会 ', '把要做的不同工作依次列出', '马上动工', 3, 'I', 'E');
INSERT INTO "public"."question" VALUES (60, '在社交场合中，你经常会感到', '与某些人很难打开话匣儿和保持对话', '与多数人都能从容地长谈', 3, 'J', 'P');
INSERT INTO "public"."question" VALUES (61, '要做许多人也做的事，你比较喜欢', '按照一般认可的方法去做', '构想一个自己的想法', 3, 'N', 'S');
INSERT INTO "public"."question" VALUES (62, '你刚认识的朋友能否说出你的兴趣？', '马上可以', '要待他们真正了解你之后才可以', 3, 'F', 'T');
INSERT INTO "public"."question" VALUES (63, '你通常较喜欢的科目是', '讲授概念和原则的', '讲授事实和数据的', 3, 'T', 'F');
INSERT INTO "public"."question" VALUES (64, '哪个是较高的赞誉，或称许为？', '一贯感性的人', '一贯理性的人', 3, 'S', 'N');
INSERT INTO "public"."question" VALUES (65, '你认为按照程序表做事', '有时是需要的，但一般来说你不大喜欢这样做', '大多数情况下是有帮助而且是你喜欢做的', 3, 'P', 'J');
INSERT INTO "public"."question" VALUES (66, '和一群人在一起，你通常会选', '跟你很熟悉的个别人谈话', '参与大伙的谈话', 3, 'E', 'I');
INSERT INTO "public"."question" VALUES (67, '在社交聚会上，你会', '是说话很多的一个', '让别人多说话', 3, 'I', 'E');
INSERT INTO "public"."question" VALUES (68, '把周末期间要完成的事列成清单，这个主意会', '合你意', '使你提不起劲', 3, 'J', 'P');
INSERT INTO "public"."question" VALUES (69, '哪个是较高的赞誉，或称许为', '能干的', '富有同情心', 3, 'N', 'S');
INSERT INTO "public"."question" VALUES (70, '你通常喜欢', '事先安排你的社交约会', '随兴之所至做事', 3, 'F', 'T');
INSERT INTO "public"."question" VALUES (71, '总的说来，要做一个大型作业时，你会选', '边做边想该做什么', '首先把工作按步细分', 3, 'T', 'F');
INSERT INTO "public"."question" VALUES (72, '你能否滔滔不绝地与人聊天', '只限于跟你有共同兴趣的人', '几乎跟任何人都可以', 3, 'S', 'N');
INSERT INTO "public"."question" VALUES (73, '你会', '跟随一些证明有效的方法', '分析还有什么毛病，及针对尚未解决的难题', 3, 'P', 'J');
INSERT INTO "public"."question" VALUES (74, '为乐趣而阅读时，你会', '喜欢奇特或创新的表达方式', '喜欢作者直话直说', 3, 'I', 'E');
INSERT INTO "public"."question" VALUES (75, '你宁愿替哪一类上司（或者老师）工作？', '天性淳良，但常常前后不一的', '言词尖锐但永远合乎逻辑的', 3, 'J', 'P');
INSERT INTO "public"."question" VALUES (76, '你做事多数是', '按当天心情去做', '照拟好的程序表去做', 3, 'N', 'S');
INSERT INTO "public"."question" VALUES (77, '你是否', '可以和任何人按需求从容地交谈', '只是对某些人或在某种情况下才可以畅所欲言', 3, 'F', 'T');
INSERT INTO "public"."question" VALUES (78, '要作决定时，你认为比较重要的是', '据事实衡量', '考虑他人的感受和意见', 3, 'T', 'F');
INSERT INTO "public"."question" VALUES (79, '', '想象的', '真实的', 4, 'N', 'S');
INSERT INTO "public"."question" VALUES (30, '', '温柔', '坚定', 2, 'I', 'E');
INSERT INTO "public"."question" VALUES (31, '', '思考', '感受', 2, 'J', 'P');
INSERT INTO "public"."question" VALUES (32, '', '事实', '意念', 2, 'N', 'S');
INSERT INTO "public"."question" VALUES (33, '', '冲动', '决定', 2, 'F', 'T');
INSERT INTO "public"."question" VALUES (34, '', '热衷', '文静', 2, 'T', 'F');
INSERT INTO "public"."question" VALUES (35, '', '文静', '外向', 2, 'S', 'N');
INSERT INTO "public"."question" VALUES (36, '', '有系统', '随意', 2, 'I', 'E');
INSERT INTO "public"."question" VALUES (37, '', '理论', '肯定', 2, 'N', 'S');
INSERT INTO "public"."question" VALUES (38, '', '敏感', '公正', 2, 'F', 'T');
INSERT INTO "public"."question" VALUES (40, '', '声明', '概念', 2, 'S', 'N');
INSERT INTO "public"."question" VALUES (41, '', '不受约束', '预先安排', 2, 'J', 'P');
INSERT INTO "public"."question" VALUES (42, '', '矜持', '健谈', 2, 'I', 'E');
INSERT INTO "public"."question" VALUES (43, '', '有条不紊', '不拘小节', 2, 'S', 'N');
INSERT INTO "public"."question" VALUES (44, '', '意念', '实况', 2, 'E', 'I');
INSERT INTO "public"."question" VALUES (45, '', '同情怜悯', '远见', 2, 'N', 'S');
INSERT INTO "public"."question" VALUES (46, '', '利益', '祝福', 2, 'F', 'T');
INSERT INTO "public"."question" VALUES (47, '', '务实的', '理论的', 2, 'P', 'J');
INSERT INTO "public"."question" VALUES (48, '', '朋友不多', '朋友众多', 2, 'I', 'E');
INSERT INTO "public"."question" VALUES (49, '', '有系统', '即兴', 2, 'E', 'I');
INSERT INTO "public"."question" VALUES (50, '', '富想象的', '以事论事', 2, 'J', 'P');
INSERT INTO "public"."question" VALUES (52, '', '客观的', '热情的', 2, 'J', 'P');
INSERT INTO "public"."question" VALUES (53, '', '建造', '发明', 2, 'P', 'J');
INSERT INTO "public"."question" VALUES (54, '', '文静', '爱合群', 2, 'I', 'E');
INSERT INTO "public"."question" VALUES (55, '', '理论', '事实', 2, 'S', 'N');
INSERT INTO "public"."question" VALUES (56, '', '富同情', '合逻辑', 2, 'N', 'S');
INSERT INTO "public"."question" VALUES (57, '', '具分析力', '多愁善感', 2, 'T', 'N');
INSERT INTO "public"."question" VALUES (58, '', '合情合理', '令人着迷', 2, 'P', 'J');
INSERT INTO "public"."question" VALUES (27, '', '注重隐私', '坦率开放', 2, 'E', 'I');
INSERT INTO "public"."question" VALUES (29, '', '抽象', '具体', 2, 'S', 'N');
INSERT INTO "public"."question" VALUES (80, '', '仁慈慷慨的', '意志坚定的', 4, 'F', 'T');
INSERT INTO "public"."question" VALUES (81, '', '公正的', '有关怀心', 4, 'T', 'F');
INSERT INTO "public"."question" VALUES (82, '', '制作', '设计', 4, 'S', 'N');
INSERT INTO "public"."question" VALUES (83, '', '可能性', '必然性', 4, 'N', 'S');
INSERT INTO "public"."question" VALUES (84, '', '温柔', '力量', 4, 'F', 'T');
INSERT INTO "public"."question" VALUES (85, '', '实际', '多愁善感', 4, 'T', 'F');
INSERT INTO "public"."question" VALUES (86, '', '制造', '创造', 4, 'S', 'N');
INSERT INTO "public"."question" VALUES (87, '', '新颖的', '已知的', 4, 'N', 'S');
INSERT INTO "public"."question" VALUES (88, '', '同情', '分析', 4, 'F', 'T');
INSERT INTO "public"."question" VALUES (89, '', '坚持己见', '温柔有爱心', 4, 'T', 'F');
INSERT INTO "public"."question" VALUES (90, '', '具体的', '抽象的', 4, 'S', 'N');
INSERT INTO "public"."question" VALUES (91, '', '全心投入', '有决心的', 4, 'F', 'T');
INSERT INTO "public"."question" VALUES (92, '', '能干', '仁慈', 4, 'T', 'F');
INSERT INTO "public"."question" VALUES (93, '', '实际', '创新', 4, 'S', 'N');
INSERT INTO "public"."question" VALUES (39, '', '令人信服', '感人的', 2, 'T', 'F');
INSERT INTO "public"."question" VALUES (51, '', '亲切的', '客观的', 2, 'T', 'F');
INSERT INTO "public"."question" VALUES (28, '', '预先安排的', '无计划的', 2, 'T', 'F');

-- ----------------------------
-- Table structure for result
-- ----------------------------
DROP TABLE IF EXISTS "public"."result";
CREATE TABLE "public"."result" (
  "Sid" varchar(15) COLLATE "pg_catalog"."default" NOT NULL,
  "Rtime" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "Ctype" varchar(10) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of result
-- ----------------------------
INSERT INTO "public"."result" VALUES ('1234567890', '2022-06-13 23:28:11', 'ISFJ');
INSERT INTO "public"."result" VALUES ('2019250217', '2025-05-01 23:28:11', 'ENTP');
INSERT INTO "public"."result" VALUES ('2019250321', '2025-05-01 23:28:11', 'ESTJ');
INSERT INTO "public"."result" VALUES ('2020014107', '2025-05-01 23:28:11', 'ENFP');
INSERT INTO "public"."result" VALUES ('2020022324', '2023-05-01 23:28:11', 'ENTP');
INSERT INTO "public"."result" VALUES ('2020033126', '2023-05-01 23:28:11', 'ESTJ');
INSERT INTO "public"."result" VALUES ('2020082202', '2023-05-01 23:18:11', 'ESFJ');
INSERT INTO "public"."result" VALUES ('2020082211', '2024-05-01 23:18:11', 'ESTP');
INSERT INTO "public"."result" VALUES ('2020082210', '2024-05-01 23:18:11', 'INTP');
INSERT INTO "public"."result" VALUES ('2020082209', '2024-05-01 23:18:11', 'INFP');
INSERT INTO "public"."result" VALUES ('2020082208', '2024-05-01 23:18:11', 'INTP');
INSERT INTO "public"."result" VALUES ('2020082205', '2023-05-01 23:18:11', 'ENTP');
INSERT INTO "public"."result" VALUES ('2020082204', '2023-05-01 13:09:11', 'ENFP');
INSERT INTO "public"."result" VALUES ('2020082213', '2024-05-01 13:09:11', 'INTP');
INSERT INTO "public"."result" VALUES ('2020082216', '2024-05-01 13:09:11', 'INFP');
INSERT INTO "public"."result" VALUES ('2020082217', '2023-05-01 13:09:11', 'INTP');
INSERT INTO "public"."result" VALUES ('2020082219', '2023-05-01 13:09:11', 'ENTP');
INSERT INTO "public"."result" VALUES ('2020082221', '2023-05-01 13:09:11', 'ESFJ');
INSERT INTO "public"."result" VALUES ('2020082220', '2023-05-01 13:09:11', 'ESTJ');
INSERT INTO "public"."result" VALUES ('2020082222', '2025-05-01 13:09:11', 'INFP');
INSERT INTO "public"."result" VALUES ('2020082223', '2025-05-01 10:09:01', 'ENFP');
INSERT INTO "public"."result" VALUES ('2020082224', '2025-05-01 10:09:01', 'ENTP');
INSERT INTO "public"."result" VALUES ('2020082227', '2025-05-01 10:09:01', 'INFP');
INSERT INTO "public"."result" VALUES ('2020082228', '2025-05-01 10:09:01', 'INTP');
INSERT INTO "public"."result" VALUES ('2020082229', '2020-12-12 10:09:01', 'INFJ');
INSERT INTO "public"."result" VALUES ('1234567890', '2022-01-01 10:09:01', 'INFP');
INSERT INTO "public"."result" VALUES ('2020082225', '2025-05-01 10:09:01', 'ESTJ');
INSERT INTO "public"."result" VALUES ('2020082226', '2025-05-01 10:09:01', 'ESFJ');
INSERT INTO "public"."result" VALUES ('2020082218', '2023-05-01 10:09:01', 'ENFP');
INSERT INTO "public"."result" VALUES ('2020082215', '2025-05-01 10:09:01', 'ESFP');
INSERT INTO "public"."result" VALUES ('2020082214', '2025-05-01 10:09:01', 'ESTP');
INSERT INTO "public"."result" VALUES ('2020082212', '2024-05-01 10:09:01', 'INFP');
INSERT INTO "public"."result" VALUES ('2020082207', '2024-05-01 10:09:01', 'ESFJ');
INSERT INTO "public"."result" VALUES ('2020082206', '2025-05-01 10:09:01', 'ESTJ');
INSERT INTO "public"."result" VALUES ('2020082203', '2023-05-01 10:09:01', 'ESTP');
INSERT INTO "public"."result" VALUES ('2020202021', '2022-06-14 11:38:37', 'ISFJ');
INSERT INTO "public"."result" VALUES ('2020202021', '2022-06-14 15:59:49', 'ISFP');
INSERT INTO "public"."result" VALUES ('2020082229', '2022-06-14 16:32:53', 'ISFP');
INSERT INTO "public"."result" VALUES ('2020082229', '2022-06-14 16:34:48', 'INFP');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS "public"."student";
CREATE TABLE "public"."student" (
  "Sid" varchar(15) COLLATE "pg_catalog"."default" NOT NULL,
  "Sname" varchar(70) COLLATE "pg_catalog"."default" NOT NULL,
  "Cid" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "Dname" varchar(60) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO "public"."student" VALUES ('2019250217', '林飞', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2019250321', '宋雅琦', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020014107', '吕馥莹', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020022324', '辛博硕', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020033126', '张可心', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082202', '陈飞宇', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082203', '陈思璇', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082204', '丁颖', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082205', '葛昊天', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082206', '郭佳庆', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082207', '何琪琪', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082208', '黄柳婷', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082209', '姜圣赫', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082210', '李响', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082211', '李秀玉', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082212', '刘祖宏', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082213', '刘皓', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082214', '马潇', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082215', '娜迪热·阿卜力孜', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082216', '彭支梁', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082217', '平川', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082218', '孙悦', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082219', '王一帆', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082220', '王奕琳', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082221', '魏鑫宇', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082222', '乌欣怡', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082223', '肖家伟', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082224', '辛欣', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082225', '杨卿典', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082226', '杨莎莎', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082227', '周波', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082228', '周瑞晗', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082229', '佟帅杰', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2019250201', '阿地拉克孜·阿不都许库尔', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082317', '马丁', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082112', '孟林', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082417', '马金毅', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082128', '覃伟', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082306', '宦雅楠', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082105', '李芬', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082420', '王世泰', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082423', '吴开雨', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('2019250330', '周柏延', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2019250322', '孙雨娜', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082427', '杨芬', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082313', '刘怀玉', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082114', '曲金鑫', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082106', '梁正威', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082321', '唐志宏', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082103', '韩磊', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082314', '刘妍杉', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082121', '杨天宝', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082419', '王嘉欣', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082111', '毛云', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082325', '辛雪', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082401', '艾家骏', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082305', '何庆发', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082329', '奚铭泽', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082323', '韦定访', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082304', '郭虹麟', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082402', '陈雯霞', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082318', '施钰枭', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082310', '廖钟堂', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082109', '刘煜森', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082124', '于欣永', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2019250808', '李昊晖', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082319', '隋永奇', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082116', '孙文轩', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082324', '武云迪', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082312', '刘德美', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082126', '郑琳那', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082328', '荀鹏峻', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082405', '广怀军', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082320', '唐诗硕', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082123', '叶明暄', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082414', '李哲', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082406', '呼和', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082309', '梁荣达', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082426', '严明婧', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082407', '纪学磊', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082311', '林子策', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082316', '马博文', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082415', '刘畅', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082117', '王彤', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082119', '杨波', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082104', '黄朝进', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2019250723', '依木然·买买提', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082422', '韦浩然', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082429', '张鑫', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082110', '马雪娇', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2019250307', '崔洪润', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2019250819', '苏热娅·阿克木江', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082410', '雷猛田', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082425', '徐赫', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082102', '代晓宇', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082327', '张樱', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082101', '蔡君', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082107', '林海燕', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082120', '杨海钰', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082307', '孔伟超', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082409', '金凤', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082303', '高诚彬', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082416', '刘越', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082408', '姜昀卓', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082113', '宁汉垚', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082315', '罗松歧', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082108', '刘彦宏', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082411', '李国梁', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082403', '单立行', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082301', '阿迪力·阿合尼牙孜', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082127', '周爽', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082326', '杨呈鑫', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082118', '许敏浩', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082412', '李廷润', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082302', '方禹皓', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082125', '张思源', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082115', '孙久华', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082421', '王啸飞', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082322', '完颜申', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082428', '张达志', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082308', '李泽昱', '203', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082122', '姚远航', '201', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082413', '李永振', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082424', '吴雪柯', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082404', '高启杰', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('2020082418', '尼加提艾力·麦麦提艾散', '204', '软件工程');
INSERT INTO "public"."student" VALUES ('1111111112', '002', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('1111111113', '003', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('1111111114', '004', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('1111111115', '005', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('1234567890', '佟ss', '202', '软件工程');
INSERT INTO "public"."student" VALUES ('2020202021', '测试4', '201', '软件工程');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."t_user";
CREATE TABLE "public"."t_user" (
  "username" varchar(15) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(255) COLLATE "pg_catalog"."default" NOT NULL
)
;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO "public"."t_user" VALUES ('2019250217', '2022019250217');
INSERT INTO "public"."t_user" VALUES ('2019250321', '2022019250321');
INSERT INTO "public"."t_user" VALUES ('2020014107', '2022020014107');
INSERT INTO "public"."t_user" VALUES ('2020022324', '2022020022324');
INSERT INTO "public"."t_user" VALUES ('2020033126', '2022020033126');
INSERT INTO "public"."t_user" VALUES ('2020082202', '2022020082202');
INSERT INTO "public"."t_user" VALUES ('2020082203', '2022020082203');
INSERT INTO "public"."t_user" VALUES ('2020082204', '2022020082204');
INSERT INTO "public"."t_user" VALUES ('2020082205', '2022020082205');
INSERT INTO "public"."t_user" VALUES ('2020082206', '2022020082206');
INSERT INTO "public"."t_user" VALUES ('2020082207', '2022020082207');
INSERT INTO "public"."t_user" VALUES ('2020082208', '2022020082208');
INSERT INTO "public"."t_user" VALUES ('2020082209', '2022020082209');
INSERT INTO "public"."t_user" VALUES ('2020082210', '2022020082210');
INSERT INTO "public"."t_user" VALUES ('2020082211', '2022020082211');
INSERT INTO "public"."t_user" VALUES ('2020082212', '2022020082212');
INSERT INTO "public"."t_user" VALUES ('2020082213', '2022020082213');
INSERT INTO "public"."t_user" VALUES ('2020082214', '2022020082214');
INSERT INTO "public"."t_user" VALUES ('2020082215', '2022020082215');
INSERT INTO "public"."t_user" VALUES ('2020082216', '2022020082216');
INSERT INTO "public"."t_user" VALUES ('2020082217', '2022020082217');
INSERT INTO "public"."t_user" VALUES ('2020082218', '2022020082218');
INSERT INTO "public"."t_user" VALUES ('2020082219', '2022020082219');
INSERT INTO "public"."t_user" VALUES ('2020082220', '2022020082220');
INSERT INTO "public"."t_user" VALUES ('2020082221', '2022020082221');
INSERT INTO "public"."t_user" VALUES ('2020082222', '2022020082222');
INSERT INTO "public"."t_user" VALUES ('2020082223', '2022020082223');
INSERT INTO "public"."t_user" VALUES ('2020082224', '2022020082224');
INSERT INTO "public"."t_user" VALUES ('2020082225', '2022020082225');
INSERT INTO "public"."t_user" VALUES ('2020082226', '2022020082226');
INSERT INTO "public"."t_user" VALUES ('2020082227', '2022020082227');
INSERT INTO "public"."t_user" VALUES ('2020082228', '2022020082228');
INSERT INTO "public"."t_user" VALUES ('2020082229', '2022020082229');
INSERT INTO "public"."t_user" VALUES ('2019250201', '2042019250201');
INSERT INTO "public"."t_user" VALUES ('2020082317', '2032020082317');
INSERT INTO "public"."t_user" VALUES ('2020082112', '2012020082112');
INSERT INTO "public"."t_user" VALUES ('2020082417', '2042020082417');
INSERT INTO "public"."t_user" VALUES ('2020082128', '2012020082128');
INSERT INTO "public"."t_user" VALUES ('2020082306', '2032020082306');
INSERT INTO "public"."t_user" VALUES ('2020082105', '2012020082105');
INSERT INTO "public"."t_user" VALUES ('2020082420', '2042020082420');
INSERT INTO "public"."t_user" VALUES ('2020082423', '2042020082423');
INSERT INTO "public"."t_user" VALUES ('2019250330', '2012019250330');
INSERT INTO "public"."t_user" VALUES ('2019250322', '2012019250322');
INSERT INTO "public"."t_user" VALUES ('2020082427', '2042020082427');
INSERT INTO "public"."t_user" VALUES ('2020082313', '2032020082313');
INSERT INTO "public"."t_user" VALUES ('2020082114', '2012020082114');
INSERT INTO "public"."t_user" VALUES ('2020082106', '2012020082106');
INSERT INTO "public"."t_user" VALUES ('2020082321', '2032020082321');
INSERT INTO "public"."t_user" VALUES ('2020082103', '2012020082103');
INSERT INTO "public"."t_user" VALUES ('2020082314', '2032020082314');
INSERT INTO "public"."t_user" VALUES ('2020082121', '2012020082121');
INSERT INTO "public"."t_user" VALUES ('2020082419', '2042020082419');
INSERT INTO "public"."t_user" VALUES ('2020082111', '2012020082111');
INSERT INTO "public"."t_user" VALUES ('2020082325', '2032020082325');
INSERT INTO "public"."t_user" VALUES ('2020082401', '2042020082401');
INSERT INTO "public"."t_user" VALUES ('2020082305', '2032020082305');
INSERT INTO "public"."t_user" VALUES ('2020082329', '2032020082329');
INSERT INTO "public"."t_user" VALUES ('2020082323', '2032020082323');
INSERT INTO "public"."t_user" VALUES ('2020082304', '2032020082304');
INSERT INTO "public"."t_user" VALUES ('2020082402', '2042020082402');
INSERT INTO "public"."t_user" VALUES ('2020082318', '2032020082318');
INSERT INTO "public"."t_user" VALUES ('2020082310', '2032020082310');
INSERT INTO "public"."t_user" VALUES ('2020082109', '2012020082109');
INSERT INTO "public"."t_user" VALUES ('2020082124', '2012020082124');
INSERT INTO "public"."t_user" VALUES ('2019250808', '2042019250808');
INSERT INTO "public"."t_user" VALUES ('2020082319', '2032020082319');
INSERT INTO "public"."t_user" VALUES ('2020082116', '2012020082116');
INSERT INTO "public"."t_user" VALUES ('2020082324', '2032020082324');
INSERT INTO "public"."t_user" VALUES ('2020082312', '2032020082312');
INSERT INTO "public"."t_user" VALUES ('2020082126', '2012020082126');
INSERT INTO "public"."t_user" VALUES ('2020082328', '2032020082328');
INSERT INTO "public"."t_user" VALUES ('2020082405', '2042020082405');
INSERT INTO "public"."t_user" VALUES ('2020082320', '2032020082320');
INSERT INTO "public"."t_user" VALUES ('2020082123', '2012020082123');
INSERT INTO "public"."t_user" VALUES ('2020082414', '2042020082414');
INSERT INTO "public"."t_user" VALUES ('2020082406', '2042020082406');
INSERT INTO "public"."t_user" VALUES ('2020082309', '2032020082309');
INSERT INTO "public"."t_user" VALUES ('2020082426', '2042020082426');
INSERT INTO "public"."t_user" VALUES ('2020082407', '2042020082407');
INSERT INTO "public"."t_user" VALUES ('2020082311', '2032020082311');
INSERT INTO "public"."t_user" VALUES ('2020082316', '2032020082316');
INSERT INTO "public"."t_user" VALUES ('2020082415', '2042020082415');
INSERT INTO "public"."t_user" VALUES ('2020082117', '2012020082117');
INSERT INTO "public"."t_user" VALUES ('2020082119', '2012020082119');
INSERT INTO "public"."t_user" VALUES ('2020082104', '2012020082104');
INSERT INTO "public"."t_user" VALUES ('2019250723', '2012019250723');
INSERT INTO "public"."t_user" VALUES ('2020082422', '2042020082422');
INSERT INTO "public"."t_user" VALUES ('2020082429', '2042020082429');
INSERT INTO "public"."t_user" VALUES ('2020082110', '2012020082110');
INSERT INTO "public"."t_user" VALUES ('2019250307', '2032019250307');
INSERT INTO "public"."t_user" VALUES ('2019250819', '2032019250819');
INSERT INTO "public"."t_user" VALUES ('2020082410', '2042020082410');
INSERT INTO "public"."t_user" VALUES ('2020082425', '2042020082425');
INSERT INTO "public"."t_user" VALUES ('2020082102', '2012020082102');
INSERT INTO "public"."t_user" VALUES ('2020082327', '2032020082327');
INSERT INTO "public"."t_user" VALUES ('2020082101', '2012020082101');
INSERT INTO "public"."t_user" VALUES ('2020082107', '2012020082107');
INSERT INTO "public"."t_user" VALUES ('2020082120', '2012020082120');
INSERT INTO "public"."t_user" VALUES ('2020082307', '2032020082307');
INSERT INTO "public"."t_user" VALUES ('2020082409', '2042020082409');
INSERT INTO "public"."t_user" VALUES ('2020082303', '2032020082303');
INSERT INTO "public"."t_user" VALUES ('2020082416', '2042020082416');
INSERT INTO "public"."t_user" VALUES ('2020082408', '2042020082408');
INSERT INTO "public"."t_user" VALUES ('2020082113', '2012020082113');
INSERT INTO "public"."t_user" VALUES ('2020082315', '2032020082315');
INSERT INTO "public"."t_user" VALUES ('2020082108', '2012020082108');
INSERT INTO "public"."t_user" VALUES ('2020082411', '2042020082411');
INSERT INTO "public"."t_user" VALUES ('2020082403', '2042020082403');
INSERT INTO "public"."t_user" VALUES ('2020082301', '2032020082301');
INSERT INTO "public"."t_user" VALUES ('2020082127', '2012020082127');
INSERT INTO "public"."t_user" VALUES ('2020082326', '2032020082326');
INSERT INTO "public"."t_user" VALUES ('2020082118', '2012020082118');
INSERT INTO "public"."t_user" VALUES ('2020082412', '2042020082412');
INSERT INTO "public"."t_user" VALUES ('2020082302', '2032020082302');
INSERT INTO "public"."t_user" VALUES ('2020082125', '2012020082125');
INSERT INTO "public"."t_user" VALUES ('2020082115', '2012020082115');
INSERT INTO "public"."t_user" VALUES ('2020082421', '2042020082421');
INSERT INTO "public"."t_user" VALUES ('2020082322', '2032020082322');
INSERT INTO "public"."t_user" VALUES ('2020082428', '2042020082428');
INSERT INTO "public"."t_user" VALUES ('2020082308', '2032020082308');
INSERT INTO "public"."t_user" VALUES ('2020082122', '2012020082122');
INSERT INTO "public"."t_user" VALUES ('2020082413', '2042020082413');
INSERT INTO "public"."t_user" VALUES ('2020082424', '2042020082424');
INSERT INTO "public"."t_user" VALUES ('2020082404', '2042020082404');
INSERT INTO "public"."t_user" VALUES ('2020082418', '2042020082418');
INSERT INTO "public"."t_user" VALUES ('1111111112', '2021111111112');
INSERT INTO "public"."t_user" VALUES ('1111111113', '2021111111113');
INSERT INTO "public"."t_user" VALUES ('1111111114', '2021111111114');
INSERT INTO "public"."t_user" VALUES ('1111111115', '2021111111115');
INSERT INTO "public"."t_user" VALUES ('1234567890', '2021234567890');
INSERT INTO "public"."t_user" VALUES ('2020202021', '2012020202021');

-- ----------------------------
-- Function structure for insert_user_func
-- ----------------------------
DROP FUNCTION IF EXISTS "public"."insert_user_func"();
CREATE OR REPLACE FUNCTION "public"."insert_user_func"()
  RETURNS "pg_catalog"."trigger" AS $BODY$  
    BEGIN  
        insert into t_user ("username", "password") 
    VALUES (new."Sid", new."Cid" || new."Sid");
                RETURN NEW;
    END;  
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."question_Qid_seq"
OWNED BY "public"."question"."Qid";
SELECT setval('"public"."question_Qid_seq"', 8, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."table_question_id_seq"', 95, true);

-- ----------------------------
-- Primary Key structure for table a_user
-- ----------------------------
ALTER TABLE "public"."a_user" ADD CONSTRAINT "a_user_pkey" PRIMARY KEY ("username");

-- ----------------------------
-- Primary Key structure for table character
-- ----------------------------
ALTER TABLE "public"."character" ADD CONSTRAINT "character_pkey" PRIMARY KEY ("Ctype");

-- ----------------------------
-- Primary Key structure for table class
-- ----------------------------
ALTER TABLE "public"."class" ADD CONSTRAINT "class_pkey" PRIMARY KEY ("CId", "Dname");

-- ----------------------------
-- Primary Key structure for table college
-- ----------------------------
ALTER TABLE "public"."college" ADD CONSTRAINT "college_pkey" PRIMARY KEY ("CGname");

-- ----------------------------
-- Primary Key structure for table department
-- ----------------------------
ALTER TABLE "public"."department" ADD CONSTRAINT "department_pkey" PRIMARY KEY ("Dname");

-- ----------------------------
-- Primary Key structure for table quesType
-- ----------------------------
ALTER TABLE "public"."quesType" ADD CONSTRAINT "quesType_pkey" PRIMARY KEY ("QTid");

-- ----------------------------
-- Primary Key structure for table result
-- ----------------------------
ALTER TABLE "public"."result" ADD CONSTRAINT "result_pkey" PRIMARY KEY ("Sid", "Rtime");

-- ----------------------------
-- Triggers structure for table student
-- ----------------------------
CREATE TRIGGER "create_user_insert_trigger" AFTER INSERT ON "public"."student"
FOR EACH ROW
EXECUTE PROCEDURE "public"."insert_user_func"();

-- ----------------------------
-- Primary Key structure for table student
-- ----------------------------
ALTER TABLE "public"."student" ADD CONSTRAINT "student_pkey" PRIMARY KEY ("Sid");

-- ----------------------------
-- Primary Key structure for table t_user
-- ----------------------------
ALTER TABLE "public"."t_user" ADD CONSTRAINT "t_user_pkey" PRIMARY KEY ("username");

-- ----------------------------
-- Foreign Keys structure for table class
-- ----------------------------
ALTER TABLE "public"."class" ADD CONSTRAINT "dep-class" FOREIGN KEY ("Dname") REFERENCES "public"."department" ("Dname") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table department
-- ----------------------------
ALTER TABLE "public"."department" ADD CONSTRAINT "col-dep" FOREIGN KEY ("CGname") REFERENCES "public"."college" ("CGname") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table result
-- ----------------------------
ALTER TABLE "public"."result" ADD CONSTRAINT "cha_res" FOREIGN KEY ("Ctype") REFERENCES "public"."character" ("Ctype") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."result" ADD CONSTRAINT "stu_res" FOREIGN KEY ("Sid") REFERENCES "public"."student" ("Sid") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table student
-- ----------------------------
ALTER TABLE "public"."student" ADD CONSTRAINT "class_stu" FOREIGN KEY ("Cid", "Dname") REFERENCES "public"."class" ("CId", "Dname") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Keys structure for table t_user
-- ----------------------------
ALTER TABLE "public"."t_user" ADD CONSTRAINT "stu_user" FOREIGN KEY ("username") REFERENCES "public"."student" ("Sid") ON DELETE CASCADE ON UPDATE NO ACTION;
