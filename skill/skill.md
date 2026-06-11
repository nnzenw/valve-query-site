阀门数据库爬取 Skill
Skill ID: valve-data-scraper
Version: 1.0
Created: 2026-06-03
Description: 标准化爬取国际主流阀门品牌数据，输出统一JSON格式

目标
爬取全球主流阀门制造企业的产品数据和品牌信息，形成标准化数据库，为后续Supabase迁移做准备。

执行流程
阶段1：品牌信息收集
对每个目标品牌，执行以下操作：

访问官网首页，获取：

品牌全称（英文/中文）
成立年份（约）
总部所在国家
官网URL
品牌简介（中英文优先）
母公司信息
产品系列/专攻领域
访问产品页面，获取：

产品目录结构
各阀门类型的名称（中英文）
产品链接列表（URL）
阶段2：产品数据提取
对每个重点产品（每个品牌至少3-5个）：

获取产品规格表 (Specifications)

提取以下字段：

产品系列/型号
尺寸范围 (Size Range / DN / NPS)
压力等级 (Pressure Class / PN / Class)
材质 (Material - 阀体、内件)
密封材质 (Sealing Material)
温度范围 (Temperature Range)
适用标准 (Standards - API, ISO, EN)
驱动方式 (Drive Type)
连接方式 (Connection)
应用场景 (Applications)
记录：

产品页面URL
数据表PDF链接 (Datasheet URL)
产品图片URL (至少1-2张)
输出格式标准
必须严格按照 valve_data_standard_schema.json 定义的结构输出。

文件命名规范：

outputs/{brand_name_snake_case}_data.json
示例：outputs/gemu_data.json, outputs/kitz_data.json

字段要求：

所有字符串使用UTF-8编码
数值类型必须为数字（如压力等级用 300 而非 "300"）
布尔字段使用 true/false 而非 "yes"/"no"
缺失字段使用 null 而非空字符串
品牌ID使用格式：{品牌简称}-{国家代码}-{序号}
产品ID使用格式：{品牌简称}-{产品型号}
数据质量要求
质量等级	要求
high	包含完整产品规格表，所有关键字段有值
medium	包含部分规格，但关键参数（尺寸、压力、材质）齐全
low	仅有基础信息，缺乏详细规格参数
最低要求：每个品牌必须达到 medium 质量等级。

目标品牌列表
Tier 1 (高优先级 - 国际巨头)
序号	品牌	国家	官网	重点类型
1	GEMU	DE	https://www.gemu-group.com	隔膜阀、球阀
2	ARI	DE	https://www.ari.de	调节阀、疏水阀
3	KSB	DE	https://www.ksb.com	全系列
4	Fisher/Emerson	US	https://www.emerson.com/brands/fisher	控制阀
5	Belimo	CH	https://www.belimo.com	执行器、暖通阀
6	Flowserve	US	https://www.flowserve.com	控制阀、隔离阀
7	Cameron/SLB	US	https://www.slb.com/cameron	高压球阀
8	Velan	CA	https://www.velan.com	高端蝶阀
9	Watts	US	https://www.watts.com	疏水阀、止回阀
10	KITZ	JP	https://www.kitz.co.jp	全系列(最大阀厂)
Tier 2 (中等优先级 - 专业品牌)
序号	品牌	国家	官网	重点类型
11	Yoshitake	JP	https://www.yoshitake.co.jp	疏水阀、蒸汽调节阀
12	TOKU	JP	https://www.tokuyo.co.jp	高端球阀
13	Nikkiso	JP	https://www.nikkiso.co.jp	高压泵阀
14	AVK	DK	https://www.avk-avk.dk	水务阀
15	Bürkert	DE	https://www.burkert.com	电磁阀、过程阀
16	Samson	DE	https://www.samson.de	控制阀、执行器
17	Parker	US	https://www.parker.com/hydraulics	液压阀
18	Armstrong	US	https://www.armstronginternational.com	疏水阀
19	Spirax Sarco	UK	https://www.spiraxsarco.com	蒸汽系统阀
20	Mankenberg	DE	https://www.mankenberg.com	疏水阀、安全阀
Tier 3 (补充优先级)
序号	品牌	国家	官网	重点类型
21	Neway (纽威)	CN	https://www.newayvalve.com	全系列
22	Zhongvalve (中阀)	CN	https://www.zhongvalve.com	全系列
23	3D Valve	CN	https://www.3dvalve.com	球阀、蝶阀
24	DomBor	CN	https://www.dombor.com	全系列
25	Keen Valve	US	https://www.keenvalve.com	全系列
26	Crane	US	https://www.crane.co	全系列
27	Chemett	US	https://www.chemett.com	阻火器
28	Weir	GB	https://www.weir.com	矿业阀
29	Kurita	JP	https://www.kurita.co.jp	水处理阀
30	NACHI	JP	https://www.nachi.co.jp	液压阀
完整URL列表 请参阅：valve_brands_urls_list.json

反爬措施处理
请求间隔：每次请求间隔 3-5 秒
User-Agent：使用标准浏览器UA
headers = {
    'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36'
}
重试机制：失败后等待10秒重试，最多3次
代理：如遇IP封锁，使用代理池
错误处理
错误类型	处理方式
404/403	记录 crawl_status: "failed"，跳过该URL，尝试其他页面
页面结构变化	记录 data_quality: "low"，提取部分可用数据
动态加载内容	尝试JavaScript渲染或查找API端点
图片加载失败	跳过图片URL，不影响整体数据质量
语言障碍	使用英文版本，或从日文/德文页面提取
合并步骤
所有品牌数据爬取完成后，执行合并：

# 1. 将各品牌数据合并到主数据库
python3 merge_valve_data.py \
  --input-dir outputs/ \
  --output all_valve_manufacturers_data.json \
  --schema valve_data_standard_schema.json

# 2. 数据质量检查
python3 check_valve_data_quality.py \
  --input all_valve_manufacturers_data.json

# 3. 生成报告
python3 generate_crawl_report.py \
  --input all_valve_manufacturers_data.json \
  --output crawl_report.md
