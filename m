Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRiAF-00072M-5y
	for mharc-qemu-trivial@gnu.org; Wed, 20 Dec 2017 12:28:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60476)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiAA-0006yc-Ni
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:28:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiA7-0005f7-LR
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:28:14 -0500
Received: from mail-bn3nam01on0051.outbound.protection.outlook.com
	([104.47.33.51]:9536
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eRiA7-0005eV-DB; Wed, 20 Dec 2017 12:28:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=9VWcpky/QpSJR4kJaKOoXq3bL0CXcwdvVGEwMZ0lfHw=;
	b=UMA9pL+pRGeIO0ya308Xd4WjptonBk+yqoItTqwYN/58bJv4g6Nno7bvXghd9Jn+4CaQ6Aw/fc1T9HE6gw9esUBb2dFT7FlaGhqLjssTabuuYzOUsNFshFEW6awDuFEfI3YF5O53uSRUvm5y4QlhcLlJPSjNO3Pmh2jxxk7k2TA=
Received: from SN4PR0201CA0021.namprd02.prod.outlook.com (10.161.238.159) by
	MWHPR02MB3278.namprd02.prod.outlook.com (10.164.187.138) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.323.15; Wed, 20 Dec 2017 17:28:02 +0000
Received: from BL2NAM02FT050.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::200) by SN4PR0201CA0021.outlook.office365.com
	(2603:10b6:803:2b::31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.323.15 via
	Frontend Transport; Wed, 20 Dec 2017 17:28:01 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; suse.de; dkim=none (message not signed)
	header.d=none;suse.de; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT050.mail.protection.outlook.com (10.152.77.101) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Wed, 20 Dec 2017 17:28:00 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRi9w-0004sH-1P; Wed, 20 Dec 2017 09:28:00 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRi9v-0003cF-VM; Wed, 20 Dec 2017 09:28:00 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp1.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBKHRnZc019683; Wed, 20 Dec 2017 09:27:49 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRi9l-0003ak-AC; Wed, 20 Dec 2017 09:27:49 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>,
	<armbru@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Christian
	Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
	Alexander Graf <agraf@suse.de>
Date: Wed, 20 Dec 2017 09:23:33 -0800
Message-ID: <1546392ef788add26efe65e71b5ddf94a86e9f85.1513790495.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(346002)(376002)(39380400002)(396003)(39860400002)(2980300002)(438002)(189003)(199004)(36386004)(2906002)(2870700001)(4326008)(23676004)(7696005)(76176011)(50226002)(316002)(110136005)(106002)(478600001)(54906003)(356003)(5660300001)(305945005)(6666003)(2950100002)(8676002)(81166006)(59450400001)(106466001)(47776003)(118296001)(8936002)(36756003)(81156014)(77096006)(63266004)(9786002)(5820100001)(39060400002)(50466002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB3278; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT050;
	1:6sRJTpBKz+Yjr5jOq3puDH2c2oS+ogBTR+L6eq00eFAs8usYNpzTm4netZeIzoY6D7Qlr/04f6AIYgaDNk15F/GeLxUR55+3YCzPQDnr8ZNjWelE+Mh4f7FhcBAs2U03
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64e9df43-5c27-425e-65cf-08d547cf04d6
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:MWHPR02MB3278; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3278;
	3:Lj/r7XNnQPhVU5kDq9iIs7XyWMo/9VjqX7MQ2KZDIDR26CYbeD7yRw2J46wkH/NoleeuYdCq8KFL44PS/41RKD04QmKcNYbYw13wK7DaN2FKLYEp5a7GpUYv6j0AUE/ATGFE0CWT1g14CwIvwxOZoa9PnJ3C7j3b5OrJy++VI+44JhbLXJmR7DyXHKFMD3zePS9NsOmRGK/WYDGJgnuNh8KXrD6I/OcS8eqiZkp3dOByBlpx1wKj222jMYNr4QkkkZKapWikv02GDX3sB81d7x96NsECrC9upxFMUR4ocu1Tu7tTPe8na7V7ypCo7kLrEI65h7LrLd/oxS97Asgd0AQYetLi9gP5yTEqiEkrmFU=;
	25:hbDGuKD1YemJnVwlGJeD/r8ZiBxZE7Lt8uZgM6F0lyPMW2wZI/9n4FC5K73IY3/G5Ra85SmycCWKmIX0vjaSzH+/meSGdZAG47LYL8aaI+aVFvQtROh4drjgcQ6IcBhajFKiUgy63G3sD/EoyFWlUvRN63GHjyI0RBOZUZGR64klpDnfF2u1GGdrgk53M0VOrikqNsABgQ3a5G5PROGdkyApJPu3+HXTl8ph932jfE0dUYsvgXfDmIIGSQ/btNjeAGsvhUuTXV8iMVaCkljnj6OtdbfIYISg5BaD2kOVDPx5pyT1KX2WO7ttniq1UMSbqM37esG104iuMt81eAVN1g==
X-MS-TrafficTypeDiagnostic: MWHPR02MB3278:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3278;
	31:8Yzc9oTq27In/qXstqYn2YN1ZVOnyicvVLj17C8b3qp7CWTfAkfyeX6uym3C05xNIbW0ZOitOfbX4ev3pk5pa25MFr1esz7/FOiHYDzreOQ9S7IL0uPMZMtiEVJPE7pd0qCHV3LNkd91apB2jc3uhTyv0BNS135TZ05oDj4AfYw93Zyv4UXIbvlsySayrTPKNIzO5HD/kJvzGyRIXOPVjvFrIlX/SeVbdEq2Z20+4wQ=;
	20:N0yLfBdk0zuYb5ijmD8eNM7+OnKloh99o/Mg6dlYys8k41suBBAVIbwi+XMA8yvizE36eD3mYOsWu5OtTUBENs1PccT91EgGCiYPTQBdL7zssqUww0P2WYwZVm6+YV9M1b3zpoNwfARFsIGcCqosJeZvslrBfoZsALiJBKBQskTjoxG+muqcz40qvoBDTNxKbfRzq2nbE7kQS75+Vd5rJ5a7Zn3nEqMXJWI5Y6wlkwkXv7QSsLofsi5k4tYZgxMMb30QeWS+UC7YuZYxlXL6ZtrTx2v5tCaXcGS5Mj8oY9uJIji0gx1lnJvbi46WgXpTRz/Osrjr1Yg3aHC3hVBGC5bh4SXbI15ekNmH8CZcKB1X3genJPPImwA5TATUfSgQra4IsAiAPNpCa42kALeipIjoeUxV3amPTGkfYMDA5PRb4q8g0tg9PLxgnD4/iNdAlomR4VG54vkxLEbfWf8rU3Nke1Wep/VT8dd/eW4NJctZeEYp8OPcFtzOHA2PiWfF
X-Microsoft-Antispam-PRVS: <MWHPR02MB3278763D0688DA2F4CA5D988DC0C0@MWHPR02MB3278.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(190383065149520)(192813158149592)(104084551191319);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(3002001)(93006095)(93004095)(10201501046)(3231023)(6055026)(6041268)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011);
	SRVR:MWHPR02MB3278; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:MWHPR02MB3278; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3278;
	4:zc+raK82VS+0OUubi19O+rOyckBeiD8tU4xVbGAuI2Q+Hyxq1/pYtE9FKLskh1fcUbsqGPA3hZ0RrIQVPbALshhBtWSCq1bqa+Ja5D4soV/d9nogpi9yRHqvCy5SGKHRmmUx5KXojN8fMxJv5TevwiDjQpL0bXp9m/XjdMnGh/ijsv6TV73pGQjdFdRqVDPs8WRQzqC2Yt4H8VBxE7IWXGdFICdXBWwD+9CdXKN8Mqy4z/axV28iwgrct4HM5jPC8827VAFvi2nTr3YAGM7IQuq2necy9KzmcBptQh01faTkUSRIS0ScLtStdexkyWt4ZGFIypW+E8T5x5MnYHoKJAQMNA+AE263xwCm4kTxAOn/lJdSE2IgDJUS0XDVI9ahOJykmbL5rh3b+kHOOZLVdZY4JvLoswFFynl0IjfnNOI=
X-Forefront-PRVS: 0527DFA348
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR02MB3278;
	23:RvJxufT+1XG3Vthk0ojyxRLIhgA8d7MA3yLsqshoR?=
	=?us-ascii?Q?GAi+eRtwuGOKaNF0VdIMZRUKgE+2byPED7m10437A/3QYzPwRDiSbV1zIhFz?=
	=?us-ascii?Q?x85eeCGAEn/VMxHu+O3gwYCU0iyW2UvQ3CRXoHK/DySoAX5CSpH5SoxPZIiT?=
	=?us-ascii?Q?U270MBrJhbbyY8F220MGu8z9OmN0G+Fotxe2ULjVNSNcxEtuZqypg7WBTBky?=
	=?us-ascii?Q?QLkx/H4bEqdKuj62jqKgFHtl7X35pupyC5kaJVxrzT2mLAP/jBG3akRnI+iA?=
	=?us-ascii?Q?+bfL6eudWOg00UEO0fPEQnqr0CtjULk6U4QVBuvRmIamj4nMlslY50J6DpHH?=
	=?us-ascii?Q?RC+v3g+1dOp1Urn5eY8BYnZ1TtLeRRLpKIhALma3m/q3YVXWB9XtjrjCxSwn?=
	=?us-ascii?Q?zJ5E5SzrqK9wZF+q/IjQLVuOngSWfSN9TS/x6r7Y8F/lrEpyRVj5IebEbz63?=
	=?us-ascii?Q?fkeu3lWyKa+1ekJKLbXzeMME98fDhsUMzWO12tQ8f8fzdVPeFOVXuB/JkBDc?=
	=?us-ascii?Q?p6W9UlvZA4WyLsX+WRto+4c6xpHz0Mta3XaaKF/mBv/fG7hoNAihhgHSgzC5?=
	=?us-ascii?Q?RGhF0FEhQ3BjUdQ3kjyeWKbdONB9KTN/JiRmSfzkt/xEIsRjmOy2X/F78+63?=
	=?us-ascii?Q?tSWIwHJqJzCEdGBQxofhBvgxhaGFzPFJcRgTmsIUCuRNyLUDMrRqF3NcWh83?=
	=?us-ascii?Q?FZT4fWQDTl5RG/0+wAvH76RNX/azF2cDBBY4R8VRqElNE6XXiAfB6A5soOwm?=
	=?us-ascii?Q?n7i0GOL6Zbmyhq55H+QRY6aIiKTU0lse2yfkDXDqNhe2n7RwB2lzhMd4YYQp?=
	=?us-ascii?Q?xQsQDMjaSVGnz+akmv/1Zm4Rqqb+IHhzHf9OlcPgKghbdiGhqF78ukljv24D?=
	=?us-ascii?Q?emodzCh45SaCw3fLRVLaLRAprHAIfOwaL8g6MwEJxuHqDhEbJgXeYQpmypR6?=
	=?us-ascii?Q?y5KlFkBOJ/5qHpFVJJBSoju2FAgg2Db/0IOkZFsh/slgHfZeDu4bujhkxdx0?=
	=?us-ascii?Q?ln9Bp4sVXEzYIGEH/r6Der4K9wxEVvRQtE+9ow8nkK0cg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3278;
	6:Cyz2GdhbKgN7pbMN2v4bsrcCbcYTMR5syvWmchWe2fdOyOP3l9/WMN8c/L295ruWaI4T1DlttGNZhxeVoashwrQf3VrgT7fhtPdq74A7M7KYt6GwGwJbODTCh603vuVk4iKWfXj7KR6WYaASXXsAbQQnJQVRRt03uWppfZnB3U2MSuzRHQc+brBNjjZ0UjiHQBlhRc3Cm7K1ztnwJnFTsV9TrpVi4OgCMksdoThN5pQ2XBmQeOTKFM6R1sLTyMy5anxIEbax/ig+XX+3wjZr5Sa4i8lbL4dEayP2TJAsuGD8zceSSt2ZWKxelyDXtOdcChPeF73hcdtUyVmsJd2xgKw99I9F3WMPUrxLrXejVPc=;
	5:+C9W89FENYFQUBpa68rNpBf8d0MU+GT8M/uYYCfKgqVWTcSMEtOPSHUuvHogLz4fShZspYxt3c57Ab2MuNgZT4euc4or3VjP60ro/ydvyR5VMCs2shHoNBrxcXGilxpMMZ+hh5NEMmffnxeI2z9yuugVgTiUQ7IuoWVaxUhIXdA=;
	24:bJqDbnC4Ut/J24gP9zsbL+V+M8B+n/FtaPFcsZTD+znpxT/Q/zqelcWktIj41tUf+7QPcmudwJx6zGfQ2M0A4YjEJyJveOqvbe/IsPhmbck=;
	7:GW570ovyVIm1OcuZJipcaUcE44N6tevAecA77acm1gVW6/TldvIxWPraRUoBlYNnoczn7rPU1dFf7t38yDusjRMqjwfIp3C+531KfF63uGxeMZHWAcNIlaytLueDJLsubPQpmFjlLhL6AcRNgu+zXssUhQ7xFIRKRKGfmDd4fzTI8L7MsVIYnr577apjqetqSqjYwADDu4uOPorRr1Utfrlegi6W7t3qqDGY3adu5vJyP++j5MawMawll0Iats3i
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2017 17:28:00.5098 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e9df43-5c27-425e-65cf-08d547cf04d6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3278
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.33.51
Subject: [Qemu-trivial] [PATCH v6 10/29] hw/intc: Replace fprintf(stderr,
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
X-List-Received-Date: Wed, 20 Dec 2017 17:28:18 -0000

Replace a large number of the fprintf(stderr, "*\n" calls with
error_report(). The functions were renamed with these commands and then
compiler issues where manually fixed.

find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N; {s|fprintf(stderr,
"\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +

Some lines where then manually tweaked to pass checkpatch.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: Alexander Graf <agraf@suse.de>
Acked-by: Cornelia Huck <cohuck@redhat.com> (s390x part)
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
V2:
 - Split hw patch into individual directories

 hw/intc/arm_gic_kvm.c   | 12 ++++++------
 hw/intc/omap_intc.c     |  4 ++--
 hw/intc/openpic.c       |  1 +
 hw/intc/openpic_kvm.c   |  8 ++++----
 hw/intc/s390_flic_kvm.c |  4 ++--
 5 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/hw/intc/arm_gic_kvm.c b/hw/intc/arm_gic_kvm.c
index ae095d08a3..a5478d3e20 100644
--- a/hw/intc/arm_gic_kvm.c
+++ b/hw/intc/arm_gic_kvm.c
@@ -316,12 +316,12 @@ static void kvm_arm_gic_put(GICState *s)
     num_cpu =3D ((reg & 0xe0) >> 5) + 1;
=20
     if (num_irq < s->num_irq) {
-            fprintf(stderr, "Restoring %u IRQs, but kernel supports max %d=
\n",
-                    s->num_irq, num_irq);
+            error_report("Restoring %u IRQs, but kernel supports max %d",
+                         s->num_irq, num_irq);
             abort();
     } else if (num_cpu !=3D s->num_cpu) {
-            fprintf(stderr, "Restoring %u CPU interfaces, kernel only has =
%d\n",
-                    s->num_cpu, num_cpu);
+            error_report("Restoring %u CPU interfaces, kernel only has %d"=
,
+                         s->num_cpu, num_cpu);
             /* Did we not create the VCPUs in the kernel yet? */
             abort();
     }
@@ -411,8 +411,8 @@ static void kvm_arm_gic_get(GICState *s)
     s->num_cpu =3D ((reg & 0xe0) >> 5) + 1;
=20
     if (s->num_irq > GIC_MAXIRQ) {
-            fprintf(stderr, "Too many IRQs reported from the kernel: %d\n"=
,
-                    s->num_irq);
+            error_report("Too many IRQs reported from the kernel: %d",
+                         s->num_irq);
             abort();
     }
=20
diff --git a/hw/intc/omap_intc.c b/hw/intc/omap_intc.c
index 6844c1aa83..7fc239715a 100644
--- a/hw/intc/omap_intc.c
+++ b/hw/intc/omap_intc.c
@@ -539,8 +539,8 @@ static void omap2_inth_write(void *opaque, hwaddr addr,
         /* TODO: Make a bitmap (or sizeof(char)map) of access privileges
          * for every register, see Chapter 3 and 4 for privileged mode.  *=
/
         if (value & 1)
-            fprintf(stderr, "%s: protection mode enable attempt\n",
-                            __func__);
+            error_report("%s: protection mode enable attempt",
+                          __func__);
         return;
=20
     case 0x50:	/* INTC_IDLE */
diff --git a/hw/intc/openpic.c b/hw/intc/openpic.c
index 9159a06f07..aa18b392e9 100644
--- a/hw/intc/openpic.c
+++ b/hw/intc/openpic.c
@@ -34,6 +34,7 @@
  *
  */
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "hw/hw.h"
 #include "hw/ppc/mac.h"
 #include "hw/pci/pci.h"
diff --git a/hw/intc/openpic_kvm.c b/hw/intc/openpic_kvm.c
index fa83420254..60c784ae86 100644
--- a/hw/intc/openpic_kvm.c
+++ b/hw/intc/openpic_kvm.c
@@ -150,8 +150,8 @@ static void kvm_openpic_region_add(MemoryListener *list=
ener,
=20
     ret =3D ioctl(opp->fd, KVM_SET_DEVICE_ATTR, &attr);
     if (ret < 0) {
-        fprintf(stderr, "%s: %s %" PRIx64 "\n", __func__,
-                strerror(errno), reg_base);
+        error_report("%s: %s %" PRIx64 "", __func__,
+                     strerror(errno), reg_base);
     }
 }
=20
@@ -184,8 +184,8 @@ static void kvm_openpic_region_del(MemoryListener *list=
ener,
=20
     ret =3D ioctl(opp->fd, KVM_SET_DEVICE_ATTR, &attr);
     if (ret < 0) {
-        fprintf(stderr, "%s: %s %" PRIx64 "\n", __func__,
-                strerror(errno), reg_base);
+        error_report("%s: %s %" PRIx64 "", __func__,
+                     strerror(errno), reg_base);
     }
 }
=20
diff --git a/hw/intc/s390_flic_kvm.c b/hw/intc/s390_flic_kvm.c
index d208cb81c4..e710bfdcda 100644
--- a/hw/intc/s390_flic_kvm.c
+++ b/hw/intc/s390_flic_kvm.c
@@ -83,7 +83,7 @@ static void flic_enable_pfault(KVMS390FLICState *flic)
     rc =3D ioctl(flic->fd, KVM_SET_DEVICE_ATTR, &attr);
=20
     if (rc) {
-        fprintf(stderr, "flic: couldn't enable pfault\n");
+        error_report("flic: couldn't enable pfault");
     }
 }
=20
@@ -97,7 +97,7 @@ static void flic_disable_wait_pfault(KVMS390FLICState *fl=
ic)
     rc =3D ioctl(flic->fd, KVM_SET_DEVICE_ATTR, &attr);
=20
     if (rc) {
-        fprintf(stderr, "flic: couldn't disable pfault\n");
+        error_report("flic: couldn't disable pfault");
     }
 }
=20
--=20
2.14.1


