Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eENOe-000371-IX
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 17:40:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57064)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENOa-00032i-7C
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:40:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENOX-0007Od-48
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:40:00 -0500
Received: from mail-co1nam03on0085.outbound.protection.outlook.com
	([104.47.40.85]:24656
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eENOW-0007Nt-Qb; Mon, 13 Nov 2017 17:39:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=6sWQyi27uHIY1TM8CKvaqAnO1QdiwXyPrWQWalNx3pE=;
	b=1lcnfV3Yt1RQfbXKUFR8ZLEiDy0hwEt+eB9rj5+e4CR6EJ++kur8MBkjUdVM1CYkcB+2r2NC7Cxe8HbAXCN5wka9yTtX2RWKYAbGtCchfupBvSCVf5p5xbjoMAU/uHhLWBHy1JN89MF93NROIghsPBrQZF8+WE/p6QXeVUI9IsQ=
Received: from BN6PR02CA0077.namprd02.prod.outlook.com (10.161.158.18) by
	MWHPR02MB3390.namprd02.prod.outlook.com (10.164.187.167) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.218.12; Mon, 13 Nov 2017 22:39:54 +0000
Received: from BL2NAM02FT058.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::207) by BN6PR02CA0077.outlook.office365.com
	(2603:10b6:405:60::18) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.218.12 via
	Frontend Transport; Mon, 13 Nov 2017 22:39:53 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT058.mail.protection.outlook.com (10.152.76.176) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.197.9
	via Frontend Transport; Mon, 13 Nov 2017 22:39:53 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:45864
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOS-0004W6-KV; Mon, 13 Nov 2017 14:39:52 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOS-0000WC-9j; Mon, 13 Nov 2017 14:39:52 -0800
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vADMdmWa002868; Mon, 13 Nov 2017 14:39:48 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOO-0000Vj-7B; Mon, 13 Nov 2017 14:39:48 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>, <armbru@redhat.com>
Date: Mon, 13 Nov 2017 14:35:48 -0800
Message-ID: <e58089d06e65c4b85bddeaf2228ef7d7d86b559e.1510612380.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1510612380.git.alistair.francis@xilinx.com>
References: <cover.1510612380.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23462.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(39860400002)(346002)(376002)(2980300002)(438002)(199003)(189002)(81166006)(305945005)(63266004)(189998001)(36386004)(5660300001)(2950100002)(47776003)(48376002)(8936002)(106002)(50466002)(81156014)(8676002)(118296001)(2906002)(4326008)(76176999)(9786002)(33646002)(39060400002)(478600001)(50226002)(77096006)(36756003)(106466001)(5003940100001)(50986999)(316002)(110136005)(54906003)(356003)(16586007)(107986001)(21314002)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB3390; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT058;
	1:et6rAp7gA9JhB4EWWx81dhfWAZu3Qk8hu9OlLDEBxg3ygjepYmhSvzjW0eRaHxKpiiCfq8uT6daptz12QE7T0ewfr/rt9JuiYbL7lVuqH2AekJbHMXp7CLdUmo1RI1X8
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abac19ba-3553-4163-cf3a-08d52ae77528
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:MWHPR02MB3390; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3390;
	3:0iPR1hY9BiMto2OyWrYp9p//45MvMA0F7p+8dBYOwhyFv2Q1KD4YEYjSi5od+5dtBduMDULg/IJh+ezfWKRXm+aR8zG9bKXIQ37zBOaDyErFnBj0W+af0DfZDNLvzZsi5cVHhNaMGlewGAD7d4Mo0Fj4La+6kXi+taTMt6jWCDjYPGvGb7hd7sh3AdAawiJYi6g1KM/MMPBh8chVl/G0vHqK/+SXxO5ES/9ofqBXPPkkWjUuLzPP06CGLjELl7z+BYgVa4UgF4Lsu7HohlXJgmfm3xnM9ynIGi2eHiwGysxY6x8EqlTxiC/spM0wVMIG5nrjvhRIew4IIMtb/8SwAiTgjNyWy8I+WkNz/r5Sh1Q=;
	25:FHhsd88ZzBBMu0pwoM4+J/2fIH/x3Y2veqdEr6BfOuaQNqW4VdLEaWrFXo6ZJkE34D2lL1Ik3LXINUmTaJTMtF+D+Ynob6igyOingyw2LEEWk+Wj8fiejlpqAMetDwWY6stOUXPcw7KFc5RbICI19BqSoEzPN4J3tW9mGozR9oKZptC/ybnr5xGYgzsW6VTcvVBerZSYnuPortN5sPUPXBanvkCP8wbFwjW1Fw+1urkfR3iuLUeAVfCSpom4j5+cK0gLhmG/j3iBCVWnhossXl69oc53IHp1nFL2dClNTvBvyPSji6vsVafjcO49zFL9He9boh9KDHIl/covsE7pvCADruPCbnQg0sTQR7dY87k=
X-MS-TrafficTypeDiagnostic: MWHPR02MB3390:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3390;
	31:XN3hvMy96EntHbvaGz+S4eVX0YXsVpvFCqgN1w+GmCnc67txQSAPlYPS3F/1AK7HU6UjnUSsuqQgpxlA5lhEyIgUBXKNrqPuYOCdYt5RPn/K37teNLBkdkfSiyLNx/X60k0wfxV68zMY4J+xEZRcJ4e0GXAl45+PYHz904cbuv4yOeBxFzV8D2CFBJg+JYbkHNddH5pGbslinlIHijBOZqPmInF2t+WzMd8QZ+vECf4=;
	20:DbXYLMFlXr7O5x005SdU2EdYlBH4ubAZuD3N2bZrVg9JOzVr5gg6CEKcF0z6dhgXUGb9sI/mNo16QozeJqLXR+S8vOqJt+46T0SJinjGkfNqfzEqzeGvMuKb+gj0ortxXOKDItKRVF6JVC6JAiQi17ZQMBquXoNrfZVT4lWCI01BYd9ReV+S/aIzbh5Zuf+C5Ru69Fszyp9SVuYXz7gCWkW1dsTfk/yWoa2Jbgt8O3jpADn1uFZ4xLgOTz45tq3LVEQcm37aXRHzNEh0m6GLPiPqXC5WRdC5lbbM2F8+6DPrntr3ltDcdOGbM+VBoU/Sv9JJ6krq1tHG9qsU4EdkI1NbgLEUzqu8+BvgwfL9cfau59BMnQnw7XbgPcTexqzWotGZEAgSSMEbU8NSgiRWpX19Jo2rWb/igTf8TeVRlNa+bFqXwzD5MjsUT7gvkOqJ9R5yM1JOtde81KYUuHwehPluQY5rxBLVBA0ESyr6P0NLxVIqTndSGOp1FIX0pM03
X-Microsoft-Antispam-PRVS: <MWHPR02MB3390F1D199917ABEC4954A06DC2B0@MWHPR02MB3390.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93004095)(3231022)(100000703101)(100105400095)(6055026)(6041248)(20161123560025)(20161123564025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123558100)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR02MB3390; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR02MB3390; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3390;
	4:KokkTrVH4OqgcZ1QEByk9+zWF6Ch3H/mpUDT0dVvpTmy+UseXc1QQMMsgPN0Wl+6pYJMKCxlAYxhk3JLJ66Ia0anI/RAIQPnUDp8ZP/A467ptbJ+hGjnD7cUPmjBdWGO5cbnJKRPbsQuKtw7XisqvfEgGetBYNNSknukHFkbs3T07M57i29ypsHQiYkhzg4T8oVZ53XNmySZPYfSDHwPYW9rAWBk/NYAJhNFQdV5OmvZElfJq06jYT5nU2Ho6LrbdIl2qZYViH77e5lOnVjCP6oVrIC6yoejGe4VBI0cNK9fKUen5yE93suZlJHWSYj6AsDqoE+/0TOxyacWdToArA==
X-Forefront-PRVS: 0490BBA1F0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR02MB3390;
	23:QzK6CzrxuHiJQ20XPj44p6ZGiMqN6NZPV3XREDLkn?=
	=?us-ascii?Q?Fis6t/pZB+fCR0xipMLHUOivL8aG/q8YT5T4wQMeoboOA8hgMfNnB2y6j299?=
	=?us-ascii?Q?jl2/mVFa0GKEXNcPDsVioD3I+X6mt4G2XFpx8/C7kXpdRbLsDkazhox2lJf/?=
	=?us-ascii?Q?YzNmh8Ry3V0ZwrxaJXzE7vL9VHi8sRBnkLOr9cichUTvyKqYqzHaNDmspo0l?=
	=?us-ascii?Q?1p4MYTdprNqwIElnPGpZZ0zQ+5j9qUHjFlL00/wa7S1pCSik9Skox6wD9m3k?=
	=?us-ascii?Q?8kRgD07G9PIttdHLMD57+Z+zbOiQAP3Ls5ismY6q+J8+uK9LVIyXgLHfMmxs?=
	=?us-ascii?Q?35CNxHx9fkv91EpsSsbdMBdcr4pnJemARUhyY5IB+FyUSCLRc168q4L1udBX?=
	=?us-ascii?Q?75lNsxXJ8Jz9ZWOjhdKk0S1qUDMiS2mo/qLaog/UFJdTGn6+Dl9MyUD1HXiW?=
	=?us-ascii?Q?kTJwuVNcem2IvU1W/1t+rG9u42ElNOigXXKgqnofSEk4ugLCAGGwB5KIhhv5?=
	=?us-ascii?Q?ayg/2U2lXdIOKEXRUjjuBmsix5qjdHbuN1hU3t91pGV0zYl9+5tkSVv2sFkY?=
	=?us-ascii?Q?HEvNmzrqUSWgpc9ebwpyhfmW+Rdb8x+y5qEWlr979aSfFl14XSnv4p3O/mbx?=
	=?us-ascii?Q?fOflxDjaY2lcn1VRfutALSnTChwFT2qSZLG9A96KsPfQIcVu58ilwHGNUEkB?=
	=?us-ascii?Q?woehrg3+xb4wRV16JRTYU2ka2lc3ZFxMYE8YGW3nXSttpKY/auHMA7FOmdm5?=
	=?us-ascii?Q?UEJ33pIO2AIiTimu2g6LkaVBgMNXyx212hQIRXOfWS7tAZHsuanx87VTRbSg?=
	=?us-ascii?Q?Yk+yyv+qNX5/AObpXGqJPwSBE20vS6V3YarPYyvHM+B9pa88/4paf900nBwq?=
	=?us-ascii?Q?mOufp94iWwE+zfXPPLOY7Ds/L2NntHgk1xgIPbCRZB6/2w6p/czo+AOI4ijD?=
	=?us-ascii?Q?hmm/OrRHnVgH/CvOLUjXfl2ETb8yChAI8oOhwVZpz0Mo+2OkZ8yFNVPeKLWg?=
	=?us-ascii?Q?5kRqMOC4qL4nPxstF+PLzefKzde1mG0XjFdWTxJNy0GNKqehDS65j0Jes/6x?=
	=?us-ascii?Q?bUgqk7pApzE1T2JLzK59IFTZnqq?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3390;
	6:sene2CoMyS2lmiZq1xZHGKixF4fgBEP6DBLXPHCQeQCJh2V+DuNqAxhiHPkf6ulEtkjy+1yJA/fSErBPEF67p0n7WeS3cyUztjsJNsvkuZFPHPF5KawwMy4hAOKUK/c8mzh/qaDxokDz+gruQ/xnI8aNaMWk1jN9R9lwJsigNV3s66cfyGgUkk7bnS45ctWPPqhAgNS1u61L+SpUMQ5dS22+h7nieSVKsH1rPlCoyBcv+saItQ7S+e7wgyx6Gr+E7zNLwbOO2Oxi55DS/KGAFBFphI02G4MqI3ZDlGqN4PyQffkJr6A+a8LDG2sDQQBUpnkr5lNI8biMrviTiG9VXHYfI+xoYm8KENbIpNRpx6s=;
	5:rWOn3yAOWUVUd/+F/wXV+Z2bwhAfUQQOS0wI5IgAG7Q+N+M+tmzPMKeFJp+mwNRoRlRebaUYk8YCLp9c8q/Dod1hwoXmY95BM3KZ18TUALlLQWhSuTUV0bqdvcc7CQP6NRTk81nLGwc2cMfQagiMmj2M5GArVRQcbX0RRnq7iMw=;
	24:45I9Zv5sflUIGIiskYSbJHX2BkAHQUGqRyh0A/EAP1eJeE77ydjlK/Cm4Gw7oU2cCp5NPDbphKdI3xf5nvM5uzEID9kqAQSdTLkRLMrTwIc=;
	7:LyN7xighAhtfjXL6Q1db9V+OtxweoOOT5bdnW1lWm4Nj/Ga6qQL49MWfHsEfdfa1dsymJe2YampI7O6anlHKV2OhSwuwP5d/rr1Z3XxlnvS9K+R4BnCrTp+u7mXUjkHIeUGKuPfkM7ijgJNimGMlRyyS+Lwnh5fnj8gJ97fiPYBYpHdA2NOSNk8jjfrDeRGw0N3cNf6SzWOc+n3EQmmyQJpE1gfcl+RjJt022ZB9zmrOiWpLE9o5a81vd+dXWNEP
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2017 22:39:53.1557 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abac19ba-3553-4163-cf3a-08d52ae77528
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3390
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.40.85
Subject: [Qemu-trivial] [PATCH v5 21/29] hw/s390x: Replace fprintf(stderr,
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
X-List-Received-Date: Mon, 13 Nov 2017 22:40:03 -0000

Replace a large number of the fprintf(stderr, "*\n" calls with
error_report(). The functions were renamed with these commands and then
compiler issues where manually fixed.

find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N;N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +
find ./* -type f -exec sed -i \
    'N; {s|fprintf(stderr, "\(.*\)\\n"\(.*\));|error_report("\1"\2);|Ig}' \
    {} +

Some lines where then manually tweaked to pass checkpatch.

One fprintf(stderr, was manually converted to a
qemu_log_mask(LOG_GUEST_ERROR,

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
V3:
 - Use a qemu_log_mask(LOG_GUEST_ERROR,
V2:
 - Split hw patch into individual directories

 hw/s390x/virtio-ccw.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/s390x/virtio-ccw.c b/hw/s390x/virtio-ccw.c
index 184515ce94..c1dac3325f 100644
--- a/hw/s390x/virtio-ccw.c
+++ b/hw/s390x/virtio-ccw.c
@@ -426,8 +426,9 @@ static int virtio_ccw_cb(SubchDev *sch, CCW1 ccw)
                  * passes us zeroes for those we don't support.
                  */
                 if (features.features) {
-                    fprintf(stderr, "Guest bug: features[%i]=%x (expected 0)\n",
-                            features.index, features.features);
+                    qemu_log_mask(LOG_GUEST_ERROR,
+                                  "Guest bug: features[%i]=%x (expected 0)",
+                                  features.index, features.features);
                     /* XXX: do a unit check here? */
                 }
             }
-- 
2.14.1


