Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eENOU-0002xA-M6
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 17:39:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56993)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENOQ-0002tD-Qk
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:39:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENON-0007Jw-Ne
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:39:50 -0500
Received: from mail-by2nam03on0071.outbound.protection.outlook.com
	([104.47.42.71]:56080
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eENON-0007ID-Dm; Mon, 13 Nov 2017 17:39:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=VVk/zPMAQCNBRjkGaGOjd6jVBL5OqIaeup4ZjLbWDlE=;
	b=fnVwT9WcniVrjfy0qgs2z9DAXcuEJBY7BVZugD0tbzDlsutFaHGzYUI372pl1xB9ysOR/GO36CGx4lR/kvMKceTfs1JJt7gNHvV4JwWQop8ZJf8Dc3fGo9j80uexQgrDws0cPwZXoUF9DIU+l2hIuejI6Ha9flDlp9Rmv2BFJLY=
Received: from MWHPR02CA0045.namprd02.prod.outlook.com (10.164.133.34) by
	MWHPR02MB3392.namprd02.prod.outlook.com (10.164.192.11) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.218.12; Mon, 13 Nov 2017 22:39:43 +0000
Received: from CY1NAM02FT017.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::208) by MWHPR02CA0045.outlook.office365.com
	(2603:10b6:301:60::34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.218.12 via
	Frontend Transport; Mon, 13 Nov 2017 22:39:43 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT017.mail.protection.outlook.com (10.152.75.181) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.197.9
	via Frontend Transport; Mon, 13 Nov 2017 22:39:42 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:45756
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOH-0004Vz-OO; Mon, 13 Nov 2017 14:39:41 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOH-0000Ux-Hl; Mon, 13 Nov 2017 14:39:41 -0800
Received: from xsj-pvapsmtp01 (xsj-smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vADMdZUA002831; Mon, 13 Nov 2017 14:39:35 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOA-0000Ts-Uj; Mon, 13 Nov 2017 14:39:34 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>, <armbru@redhat.com>
Date: Mon, 13 Nov 2017 14:35:29 -0800
Message-ID: <83aa5da9c3f6220edf68b49c6f16bf84108616ab.1510612380.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(6009001)(39860400002)(376002)(346002)(2980300002)(438002)(189002)(199003)(5660300001)(76176999)(50466002)(48376002)(33646002)(8936002)(6666003)(50986999)(8676002)(81166006)(81156014)(77096006)(63266004)(39060400002)(106466001)(106002)(2950100002)(4326008)(47776003)(36386004)(50226002)(36756003)(5003940100001)(54906003)(16586007)(110136005)(316002)(118296001)(356003)(478600001)(2906002)(305945005)(575784001)(189998001)(9786002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR02MB3392; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT017;
	1:/tZU69avJIPP/EpmAfgwEYzUgFS2b0AewGmgJLaXUv8WyQz5hTOIry3CrC62qeAiyATJJmP3Vk+ygWkIpn9BcKsT1jK3Y2OUR+Ezk11Sfs3eodDh/Pz1Ppl4idJsZilw
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 428ef95a-2b8b-424f-d05b-08d52ae76ebf
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:MWHPR02MB3392; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3392;
	3:GAMTw8nRCnvzpMZd1ljP7cpEHvzlHm/YezH4l8ppFBB5i920+bfcRA4rqXJCVFZoeyxl9zP9THP0JMBdmVlyPgU0SZmF4twLDU/57c5nWcOC/TnY9C8rfKH1L6U5T6qhCemYBCiekXGu17h4pYLjnek90GtJGDlxVhv0ApkxQFqFHep4ZgwHR+W4B9ltL4GqnGCLXiBYkcSm8IPBM6Z5Ikuj/KRi3Kk/h1b/R1sWGjZM0hzctuLInbdPIuBob7W9GPpRySTYR5AQK0FgxANmmLZiQZReUrxW7uzJ6mTVAi/GEkps7ZEJPbD9fNdmdtIHaUlDL/ZIXZH9qYofw+dclW2VmSoA1GVDP9/fTqzVA/M=;
	25:q7yuxWL3mqdP37VzuUGMiyD6v53msWJ0dZZEcSt6siM8k6N+0XmAP9e+LfbfSsUucnQc5mBoK0XQVvyUZWec1QyqKXKOibgTVYotwoHCEBXK7ck9UPxyNlOQDIwD4QdwAaLjfsTv7shFmtNSkfaA9OrTbky2bzFWbNX0YyGTpm5q7r7yteCstJbc4oEYlnO9y6HOPYHu0IpHwtwJCusuIeTwmIVak/PVM8jqlqbmPBFiwSVjUY8PNhsoo9eWHxFNyOYpsZ7tRGIMx3uYAtwP8kpgCUGbi79gSU4tQd1y7rH5V9+X0wEe+q6umXWpuS26tWe3GZxv4nDYH6y8DtLBOw==
X-MS-TrafficTypeDiagnostic: MWHPR02MB3392:
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3392;
	31:/sxWWsWVnaG25GzPcBY2kMAFrfqE6LpqERos84DBXPEgY9LjEbKZbHkLRDlWAeVbq1UP/6a2V2IcaYUCn6S+ZzKzLcEyvHBBJjWRdchL4wGyiHfRHJiODbnHJsBkL9tXFGcnb8YfDLwrihckP04DU1+hwJ7sWWNEUK3Rzvl1vjlB4nUjSJvMTLRGYcRLH+bf07ltM/p/phZZZIM/tqRNB4EHO2hOXG4mVW5lBsqTU40=;
	20:7VrcXyDyfavLH1apvrEpD92TetuOtsZoAOlMk9RiwFyiwe9jWFTulT7/vA92KOweIsbNDnI8VVyI1W+AqG/bQASjizvaVDVkWmWw67SiuzE6Uj9m/tQe7v1OnEuU9zUyo0h0L5QGytNCndBaVYsgy7oo1TIIA/91TfbJnrlGHQEnTCp0bwwhCx/OmkGIL3mQiO36pghDqa6azWlqmRkRIW66gDEgBQMOHGDN6oqoD1aeTkdfOsjkszsUmJ55czDPb3Goqfz2BXya9IBGmcw3sYXn5Zoiv4/YoEaf0NN2lo/NFSpQFru/viEmqu+1VRqXET5UZQ5VWnmZz7Kht1ptUyAvOPQ6a/czfIv47WK6Ds2szAAVARDdEoseOvuozDK4kSurKB+l/X3O2aCTB+rV3cWNwXRTzavCZLDA4hJaJFLAi33U242KSttEqVPx4auHU0rN+PpMgz+10MDaQwo+H4PssKqOuPl1ssR0lKVBnxHf/BVOxDL7bewhwaS9tZRt
X-Microsoft-Antispam-PRVS: <MWHPR02MB3392F31553D56A6CDDC19F96DC2B0@MWHPR02MB3392.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(10201501046)(3002001)(100000703101)(100105400095)(3231022)(93006095)(93004095)(6055026)(6041248)(20161123555025)(20161123562025)(20161123560025)(20161123564025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:MWHPR02MB3392; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:MWHPR02MB3392; 
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3392;
	4:upnmC0gA3lLqyTgJTvU3wuJShzU8juFUSNtGZ00QDrNFnzV31+UobfoNP38HXT/IrVNsD/TnGAa9TtgXOZGr+eITbncniH2eSOrMEIZdqmOym6/EVecvJ7ZWIbNE/3Zz5T1hHdK3J1Vct7D8rcINYZdnQh68uWLAtYwQhcYQe3vFjgGCxT9tiw7t3uIABx8pS8wsmJfZl3XCXAoARe3OOkuUqZSRRTV8GOHAmNgyhX4inBpJMn+z8aKbRLxiUtN4Q2a2L1jlP59fx1tTIfL6Z4PoMPclgQqppanySQaJDPsg834JUomWERfJBgOXd1qTT+8tNM/ud7b64mpNRrL/vw==
X-Forefront-PRVS: 0490BBA1F0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; MWHPR02MB3392;
	23:b5F+TAvR0vSwY6wQ36nm7v3OJJEToJ23QTI9/IlIV?=
	=?us-ascii?Q?HgqDqGKgYsoY0eSBObmpe4A6lH0b2ix5FQj6SRKPnYGAfVczjTM+SK0jUQiI?=
	=?us-ascii?Q?XSoLesWmBq6HABZ5V2jIIQe/kIlcLvK8kIJRejzBvs87gJPS7LGsb7Jl67ai?=
	=?us-ascii?Q?iZaoh/iRcBe/UKheyR+cPsL48b4TfJaoo/pFPoapSrom27g1VhKKQ4BsMM5z?=
	=?us-ascii?Q?zLEg/enxInPz/75tp5FRB5gbdeHrXaYfLMlYVi/7IQfE0fdX/z9IsqmWOf47?=
	=?us-ascii?Q?bJCItnVH0pPipgFNuJnDpvqfnIP3pjRUTs99q10lGr8tk98O+G/E+qbFcEnd?=
	=?us-ascii?Q?vN/3Gl9siv8YHhiZt65vG7L5Oc5Hn3ifWhXCSa2fD7J7hZ3BIpbCaB0UHQM/?=
	=?us-ascii?Q?imyPsR/psWJo99mcV0+0GE/6KY9F/VGhCqs5PyVfVSbGFN7dx9huyjgNj7bu?=
	=?us-ascii?Q?o/yEePM/weeClBAj47gbs7VcHRAKT5gg/2uYDTSTPDGmfO+6gEynEkv+T3wn?=
	=?us-ascii?Q?BwQmONO81p6sB1ldQ14Cxj4zTn+O72DCXcQDKBUFXAvzvB4GAp38QoEOxxDF?=
	=?us-ascii?Q?sWG9PrMjhHDUnctXYvzELl7BFfVTYsqTa7veCc2br7/V07ILxInL66vwueer?=
	=?us-ascii?Q?dMxAE0WYWeOuMPZtr4YPW/NvrukaTb8dsbOC7S9Xtuc3zjmxORTrIZo3LaPC?=
	=?us-ascii?Q?KMpZ++nVAUt7etLSg4lcsv1zOzH5fcdVdCS1X+Gk8dX+8sETNgpzhcVgiW/o?=
	=?us-ascii?Q?TTZFF3AAVoNOGEiQKNEkGqU7w0FIYwkQTRXmGdMwFvT6O/l5O6Fr6W1SQc5s?=
	=?us-ascii?Q?JofqIBRxZvWPJb7jfesIH6Zub2nfC2UZKWSuQLxXfmQ9CVk7UtMXd+sdEn2M?=
	=?us-ascii?Q?F9MDCoiQqXKAyQEu8xqnt8r8NPfaOq7TCoYfuSVeo0gbGYcal1yVLpW6rGgM?=
	=?us-ascii?Q?MHXzQ5UZyBPbGP2cYRd/UmLJH0PYpJ0Ak778PDBSZXeaG8uMBSY8W8BddaVQ?=
	=?us-ascii?Q?beqZMX/rM78sTHFE0J/j0wxQIdZAP876JhMeiO4DNo3WSx+KUF6mz8bd619C?=
	=?us-ascii?Q?wasN+x8KiaH6kScMBaPDUxnVxpwzbCvwGsYXBCyP0MrABYWcQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; MWHPR02MB3392;
	6:O6lSXvTjvICAPxe47FAEjkLHaVzHPM1nteImOARQk0uX6cSnUxXVlDGzCv2PR8sC22DGp8fEkK5lVRCvnWVp7My/l00waNtaDs17AashXTCRTDp1vHglI3JpuQ92R8e7/wc/mdii0VLxz+rsLKdSQocpB4o1LjMALUK2coSPUHC82PbFWgkA/SoRcUQeFuhsfR2SQEiKEh9tT32id0Fm/tPxsJfAhcCnZePtVj4BgkOc24h1u6xGry9nAc1QROxpJDzFXIZfQdeKGKI6EFDjJ5EBm++wVEUkIV8XAQNTtWJuOiOKYk4XDwUpa3PnmkZLenIVHdHq7d398WLAvTzQAW5YKGbMQUkQA5kueN6VDFI=;
	5:lhmGdSYq8NlUwUkgCDHA+FCIq4GuIEOx5b1Qe/03mgjdq73ong74GYIWUuJBqS/rUJDv0w1oeDOIVFEkX+RnA1FF01WKCn3qb5il8eIy6LkjFNznQi40uJ+veOwRttGujR3VGexKJHbZqkP/q2LDKlAM3CAetTRBCqCu9kySAF0=;
	24:PLy14AbiC6z6otGMInN//0UhOQADWA/GOvQHAB4+9RBqRy4ONbx8IRqIjdzdZD/0AJOwc7v6W7Fo8uRH8ISRyg30Xt06U8Izh7RtUeXHExM=;
	7:J9Bvn9tYYZQh8z6ADUdUM/QQzAQYIdoZyJS+GfEsTy73ymciQ46cKc/1CiaS48paIdJM6sQwSdoqGbG1uJlhtQN/ZRflV0aHZ3LysPGsXRdsrfuOEwqXEGy2Y5N/P8EGNvsts62TmTUhn5nIZ5Jiv11JDJOyKsGmJi9X7Qnw9jdRiwoyklKa9y52jCtgqzyLVKsBAXxsDgk7BxYsHUzuYHELaBPmOMsRRgsjSNXyDYBmNQnAACqsKaufrNI83Sx3
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2017 22:39:42.2607 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 428ef95a-2b8b-424f-d05b-08d52ae76ebf
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3392
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.71
Subject: [Qemu-trivial] [PATCH v5 17/29] hw/nvram: Replace fprintf(stderr,
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
X-List-Received-Date: Mon, 13 Nov 2017 22:39:54 -0000

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

Some of the message in put_unused() was removed and replaced with
g_assert_not_reached() and some of the messages were updated.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
V3:
 - Add g_assert_not_reached() in unused function
V2:
 - Split hw patch into individual directories

 hw/nvram/eeprom93xx.c | 7 ++++---
 hw/nvram/fw_cfg.c     | 5 +++--
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/nvram/eeprom93xx.c b/hw/nvram/eeprom93xx.c
index 2fd0e3c29f..6ffce745ae 100644
--- a/hw/nvram/eeprom93xx.c
+++ b/hw/nvram/eeprom93xx.c
@@ -36,6 +36,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "hw/hw.h"
 #include "hw/nvram/eeprom93xx.h"
 
@@ -105,9 +106,9 @@ static int get_uint16_from_uint8(QEMUFile *f, void *pv, size_t size,
 static int put_unused(QEMUFile *f, void *pv, size_t size, VMStateField *field,
                       QJSON *vmdesc)
 {
-    fprintf(stderr, "uint16_from_uint8 is used only for backwards compatibility.\n");
-    fprintf(stderr, "Never should be used to write a new state.\n");
-    exit(0);
+    error_report("uint16_from_uint8 is used only for backwards compatibility.");
+    error_report("It should never be used to write a new state.");
+    g_assert_not_reached();
 
     return 0;
 }
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 753ac0e4ea..1c66052f1f 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -518,8 +518,9 @@ static int get_uint32_as_uint16(QEMUFile *f, void *pv, size_t size,
 static int put_unused(QEMUFile *f, void *pv, size_t size, VMStateField *field,
                       QJSON *vmdesc)
 {
-    fprintf(stderr, "uint32_as_uint16 is only used for backward compatibility.\n");
-    fprintf(stderr, "This functions shouldn't be called.\n");
+    error_report("uint32_as_uint16 is only used for backward compatibility.");
+
+    g_assert_not_reached();
 
     return 0;
 }
-- 
2.14.1


