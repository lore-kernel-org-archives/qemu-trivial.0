Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRiAv-0007jQ-Tg
	for mharc-qemu-trivial@gnu.org; Wed, 20 Dec 2017 12:29:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiAt-0007h8-VZ
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:29:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiAq-0006yg-Uy
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:28:59 -0500
Received: from mail-by2nam03on0064.outbound.protection.outlook.com
	([104.47.42.64]:47425
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eRiAq-0006wp-LB; Wed, 20 Dec 2017 12:28:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=M3PgPRa10i3NFmo0PWu2zgoMB1J64iqhXMoHZ3NZBqI=;
	b=C2ImS3vcdcExl6ZDDwn1oh7IQ4+bTdMUqWY8D1KAbkMSHtVFMMKqrowxbolipoQCRoXyPmUUfoi02qhloFCuOG8b6uufi2B9pyvqVU087uvKFjUk9N48Lh4NxxtDqJZkInznLZhRfAG+Eip/dyFul8GeDSeV6o6Ub7yPwKRRLKY=
Received: from BY2PR02CA0125.namprd02.prod.outlook.com (10.163.44.179) by
	SN1PR02MB1341.namprd02.prod.outlook.com (10.162.0.147) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.323.15; Wed, 20 Dec 2017 17:28:53 +0000
Received: from SN1NAM02FT021.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::208) by BY2PR02CA0125.outlook.office365.com
	(2a01:111:e400:5261::51) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.323.15 via
	Frontend Transport; Wed, 20 Dec 2017 17:28:53 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT021.mail.protection.outlook.com (10.152.72.144) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Wed, 20 Dec 2017 17:28:52 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiAm-0004t5-7o; Wed, 20 Dec 2017 09:28:52 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiAm-0003lo-5V; Wed, 20 Dec 2017 09:28:52 -0800
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBKHSl6D008436; Wed, 20 Dec 2017 09:28:47 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiAh-0003lT-An; Wed, 20 Dec 2017 09:28:47 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>,
	<armbru@redhat.com>, Jia Liu <proljc@gmail.com>, Stafford Horne
	<shorne@gmail.com>
Date: Wed, 20 Dec 2017 09:24:29 -0800
Message-ID: <f39f11aecdd22a2eb8b8e7c00bd57a94948373a8.1513790495.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1513790494.git.alistair.francis@xilinx.com>
References: <cover.1513790494.git.alistair.francis@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23540.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(396003)(39860400002)(376002)(39380400002)(2980300002)(438002)(189003)(199004)(106002)(478600001)(110136005)(316002)(54906003)(77096006)(63266004)(7696005)(23676004)(47776003)(76176011)(5820100001)(2906002)(2870700001)(305945005)(356003)(81156014)(8936002)(81166006)(39060400002)(4326008)(8676002)(106466001)(5660300001)(50466002)(2950100002)(36386004)(50226002)(6666003)(118296001)(36756003)(9786002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1PR02MB1341; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT021;
	1:QRaPb+3SGpTsQI0KuiHtVL+fL1fguH8GZXx2i5QADnDemhrVgH0QoZ2EL7iK8gxJwfM6AR6uPbNeOZtGGVEz0v7qxTzci89aU3qXMOh8+5exBpfW91TqC4fuUGizQI2O
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 45b8c97f-5b90-4403-18e4-08d547cf23fc
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(5600026)(4604075)(4608076)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603307)(7153060);
	SRVR:SN1PR02MB1341; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1341;
	3:2j5XeTgRlMy7Avig3EKx/d0mj0bpt1fKJXEXHdEQQpRVVo7qgHSkhuwmh7lt5RUqeFK8yhSrIGG8zYQn5KRLxqIak5UHJT7AIKOZPMqchqQ5l25tVT8bnucyka0CTbaoxmcFMGEgYsfSaZ1beA5Cx6BsFEDJMzFvJ7N2AhTRq18lpdFiT+JPYOT+LA9MO9ZvxjGPw9GyWMmHYVjcFS4PjmaJfiXLW8By4qFlObOgRxx5QEm1RzmOpzniFixgrc72CAzoNhrl4dvm9dOYXj3MfzIP9Knh253jDYKfRbODqFrVOQQSVi0YvpnDD2XFdtaeOVVGwSmVrdr0APVmWkCZP5JfN28J8SzVxOtUxHjmnUk=;
	25:rVCoR+aOmivKileSKr4gz48ogef2XdDlpKRUg9zqsruhDifKlqh78Qp2U5+zgpLPukwwKaht4wzaHe8njXF2wk06grPiY+ZnLjGNo0ZIg7CLUTTicHy4bxp//PT1Du3LntiqQ0vAnl2aNkqcL8Yb2iB4uc28znShEcacRLDep+OdkuxSDqA/83pBC1jylITmnW7jJdV+QljKggM8z0trxyastcl6rXe4nRkHsqKfp7Ev3nEZP/AEF3F3ILYaVvIB+NAgaNuVj0NHnozG/koWqS15IBDs2Y09Pv2DqMjJO+oeQi4ka873ASSRC9cafWWATW0fyryaZseYJ6KENZDbLVZfVdALQUUFawJtatgNoPY=
X-MS-TrafficTypeDiagnostic: SN1PR02MB1341:
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1341;
	31:IeSyHLbAaaegCG45OmjAKL4JPoAVUt/b56f2PLL1WgmKViLKsAlN/G2xV41536qJfAR/WIQQ79O+15+51c2Gh7Oli96h2FkxiTxix7kQTO9X7xh5YiZ7qvsMdwrd5aw4XZrv84H0TdCntexXnXsdcUAXQqP3DL28/FHYJo/L+bJ1BhRDExgWRrefmAMTiQxecXrKb1CBliYLbuecpVoEYk8h3oTrZW25vTmHEcMNdnY=;
	20:37OqRy0iQ0/Qo+IdetJGOH/RUw5QZsWF38qbCTNL06mFe6UNGpvokhICRS5HMaK1s25p0/V+Y2H0ue501ny/71rvUSsUWaodb4qPvxBDp8GW+8btFJ/K34RqoFC1RdUicUHST5DqdYZ1e8jIA8dHkXZjr7Q3X6xVNAS25SdRW1O6Q6RuCq9gSGQYF7PIaZMo54r93F44790LOiOXolt5aSaBIPa7GWiRaHzVhmJ5GnwvyBikb3D2WQgXvmy1PaukxKef2sLwogbCS46qf2agSKFbk1Tb04796M9PXXRpE2Qdsy7FR3CAGfOHxwOxnTrAFaDZgpg5vS16NYs72eQQHIy+uSEH7AV1Qz5e1Xm8uYHKn8GU0piBWoNMl3/u7Whjy62co3qb7HdAT7erG2GQe18QdUyVky3RzfgNsTS9OoVTRj+JaVlZOBk5789c1D3SG1oxA2Vg0dy9d8xImRyqixICbwD0rLn78dT1wwKmpFYc8wL9ZopA3PHU3HbHO9RB
X-Microsoft-Antispam-PRVS: <SN1PR02MB1341A74E585F526C54DA5EB4DC0C0@SN1PR02MB1341.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(3231023)(93006095)(93004095)(10201501046)(3002001)(6055026)(6041268)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:SN1PR02MB1341; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:SN1PR02MB1341; 
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1341;
	4:o+dBXie5gw1pcyzvMRNaWQL/mipGDniEhnI/uk5xdSONRIw5Ijx4sfMrM8lxVHhRMGcxjz6fAXSi1AXoRI/kO8nzZEywsueCrpzUTO6RGhqiH6d572FzlFrpV6NGHpHQoT/hb4DHRbcPxsbLbnMr+QEHl2Fjemp66Rp8+PHnPxU4tsf7uASRfFJIzMnvGY/XSXsTobUbVahj8jdJ5b+ek5KX3CULIjE932XQix6chvwH0EVosoqdO4iu+R2vHhWAaMkwdWSQcBIZmEDMc7jjcvzVCZ92qY1t7mJqcilnp2EatcCmFgonqgKY+tOyIMsZECm1Xxdb0YLfT+O1s32hqg==
X-Forefront-PRVS: 0527DFA348
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; SN1PR02MB1341;
	23:QHeFW46tqnXtTWHxnyT4jj5cHtj8mEBOwDTwUgU31?=
	=?us-ascii?Q?UKy/Y8i3JvFonw/6CsIn/3iklvqAbtJGA47b1+a0YxWVfKAC+W1pD0LVzpvC?=
	=?us-ascii?Q?ddninyxWG9hw9ljYb8wcGjcgJ2qYuidrI7CQgC98fIdDWrg0WkC0SIUWr7T7?=
	=?us-ascii?Q?yEoawzJ/VnOVX0QZCDCCRY/TktLW/j39EDEHYg2uFzQnirFQvutwmr7pgJqj?=
	=?us-ascii?Q?1U4dG/+584VUWhUEX00Sxzq6erBKCFBE9s7zGEjX2hemTr8qZ4a/a4RmoyK0?=
	=?us-ascii?Q?PpQWoGhtOfDS5fdeBlE9vduOPqRd+DWpNhGzQ5TSE8e00h1Dvs0sYCxCmwKw?=
	=?us-ascii?Q?C7c41+EQWYNK4mFY5I10PGNUfBCTLXBHbMMci6cSwxX6mPe5DSS/nWkI5Nl2?=
	=?us-ascii?Q?E1CHcmE3JmRTIits7EXqpFFwafAhmCHLqC0HQmJL3mQn5JlBW0Rri2C9b0zQ?=
	=?us-ascii?Q?VwAx9ItaiAnXKy1pXWUNKLp9WVEQbWExXIEo7qXeU5czfTXpcozBW1yhAEaB?=
	=?us-ascii?Q?6ng2feR/elnp6jOrjdU8AhRAmNwn6iwa7wspvo90P87OXFVGy5iFUkWZsocx?=
	=?us-ascii?Q?VaxNpq5QqzXYl+O78J07+5ztHIXY1hPy7z5wXoUv2IZd081rRFYgCiMeCnB6?=
	=?us-ascii?Q?qa02ef+CaZaXsIzxxhW5GujyThEkGfl5ehRBBSf5BRthdT6LRNfz8NDAHiAk?=
	=?us-ascii?Q?3Eoh0M5p4H8iIxoQYuDsjO+YM1/Oa8Rgfd7y9xsZE6mu9WGD1kgFFZXP/xK5?=
	=?us-ascii?Q?01SLGw1ZSGSCyChfku57o4S5zqaynZkKfAdhDm/aYw5hCRTH7zDxxytsd9Rq?=
	=?us-ascii?Q?9D6G74FkO6L2iNBfuiXDqelJONIq2qOGo6J5Hhf4Qgw/LMcEI3G8W7iwMc++?=
	=?us-ascii?Q?IDzfYtnYAi1puXMODsimOf2FTLgq9dAJMBz3BToBrq/Xs6EJCsR9nuuq6N7m?=
	=?us-ascii?Q?vsxmF3NhKjM006PJBvWv8K4FxsxSVYUh/gQGqbMxF6DA5ONObInBzEnyFK6+?=
	=?us-ascii?Q?SL9sJJYhqEFPnQ41LxJRE0U?=
X-Microsoft-Exchange-Diagnostics: 1; SN1PR02MB1341;
	6:SAJfXvmKFQkJaq06vQJjhuRPz7Hi0qJNPdQIQ1Cd1kH4ximkLhhY2TX3SM/wJxtybZimq9e6wqmc3oyEr3iK5sipVScyCr/N/bI0A9h4DFub5WxYo0qNNG8mgChh8544AHEtcDqvMwkq4xLnFsesKHQpjja/fg52zxCTZijpIP2uV95eg9/m4Q+xpT39vmkElotK4zMAF3xK1KMailq6CdTYD50EA9lLTlYxgitUnXpICNddDpsqqEr35NSuHaHeuPbwd/FvlV8JqYh5hAwtduMN4FJFBYhoppBYccAokOO5LShZNL1kh3R7AolqOjill4cMW+fUCP0m1+O+fMmKT4nEmJfGS2SufeVPEGUcD/I=;
	5:TwAbK6+eAlKgl5xNHpu5TV2eV0+xP6yb7Sm5eZHsh9kVfWTVT33/i2gS4uaPq4IxLQKmtnrhWTdSEKPQ59iTOT+8kI/DLDebhbYjCbXCRSdLmRaMrEkDMjAsAdH2cbyeZ8VzfI+Gjz8xqDrVsJC4Tavk01x5a4Mk4Kf8Zb5/9iw=;
	24:E4hkXp/zjy2QEbvEEUSmLM7ziWXd1E9CXtLYbOy0ZvwsItYwNNcQkiC+bUQLihsWnFa+ZOni9l6UFque/GUDrj5DTan0yzekR0gUUxoiAeY=;
	7:QDBqwV4PQTcElsqjlj4jZt8hMsqp14ZDUw45M1dQt+N50XqIzq4x5sMmvTipEcOV8dLnjmzC/i0p5ubi5HBXL8ckQEnB4nD/BZRk2MQxlB/bjZQtBCAjA1yX7f7SQONzwENJNBQQ2AUqI6KMXGDaMTSybhEbxF7p+huf1Nh5uoTHeHPOV0ETPiHlltyxdsbByLceKPaPIvx+eIM4zzEio+up/OG92HFrqwVHPqGHlqL4T9+jxAK090dUtOM0o72m
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2017 17:28:52.7507 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45b8c97f-5b90-4403-18e4-08d547cf23fc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR02MB1341
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.64
Subject: [Qemu-trivial] [PATCH v6 18/29] hw/openrisc: Replace fprintf(stderr,
 "*\n" with error_report()
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Dec 2017 17:29:01 -0000

Replace a large number of the fprintf(stderr, "*\n" calls with
error_report(). The functions were renamed with these commands and then
compiler issues where manually fixed.

find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_=
report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_re=
port("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report=
("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("=
\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1=
"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\=
2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2)=
;|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|=
Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig=
}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}'=
 \
    {} +
find ./* -type f -exec sed -i \
    'N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +

Some lines where then manually tweaked to pass checkpatch.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Cc: Jia Liu <proljc@gmail.com>
Cc: Stafford Horne <shorne@gmail.com>
Acked-by: Stafford Horne <shorne@gmail.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
V2:
 - Split hw patch into individual directories

 hw/openrisc/openrisc_sim.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index e9558f1ca4..c755f11efd 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -19,6 +19,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -114,8 +115,7 @@ static void openrisc_load_kernel(ram_addr_t ram_size,
         }
=20
         if (kernel_size < 0) {
-            fprintf(stderr, "QEMU: couldn't load the kernel '%s'\n",
-                    kernel_filename);
+            error_report("couldn't load the kernel '%s'", kernel_filename)=
;
             exit(1);
         }
         boot_info.bootstrap_pc =3D entry;
--=20
2.14.1


