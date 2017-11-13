Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eENNx-0002KY-1O
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 17:39:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56620)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENNu-0002Fk-4J
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:39:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENNq-00070f-Vw
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:39:18 -0500
Received: from mail-cys01nam02on0044.outbound.protection.outlook.com
	([104.47.37.44]:19632
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eENNq-000706-KA; Mon, 13 Nov 2017 17:39:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=3sCVdQ7nZhopq35xrouOkeRHYdSgCrF+tRkwdjsFnrc=;
	b=evGhAcsutnVwlKOL0XIA+yhgb4B3DZcsmG9qjGeRPi2YKEXTfcmBfbNXDXCFH+6a65r8VHTvPx0BYG8EpQv6SXCe2CzdQfnM5yJAhRwPnNkXEmwg5FTmwAVpo4Wk4UnSp3vW44sm6Bz833tfOg2HCbgsmxxQs3eI/unwL39dzSI=
Received: from SN4PR0201CA0041.namprd02.prod.outlook.com (10.162.76.27) by
	BN6PR02MB3378.namprd02.prod.outlook.com (10.161.152.166) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.218.12; Mon, 13 Nov 2017 22:39:12 +0000
Received: from SN1NAM02FT002.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::200) by SN4PR0201CA0041.outlook.office365.com
	(2603:10b6:803:2e::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.218.12 via
	Frontend Transport; Mon, 13 Nov 2017 22:39:11 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; suse.de; dkim=none (message not signed)
	header.d=none;suse.de; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT002.mail.protection.outlook.com (10.152.72.94) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.197.9
	via Frontend Transport; Mon, 13 Nov 2017 22:39:11 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNm-000497-Mq; Mon, 13 Nov 2017 14:39:10 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNm-0000RI-K5; Mon, 13 Nov 2017 14:39:10 -0800
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vADMd7W7012573; Mon, 13 Nov 2017 14:39:07 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNj-0000Qm-6K; Mon, 13 Nov 2017 14:39:07 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>,
	<armbru@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Christian
	Borntraeger <borntraeger@de.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
	Alexander Graf <agraf@suse.de>
Date: Mon, 13 Nov 2017 14:35:07 -0800
Message-ID: <ae9d2524367e169827ddd608a2f1c52eb91c47e4.1510612380.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1510612380.git.alistair.francis@xilinx.com>
References: <cover.1510612380.git.alistair.francis@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23462.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(346002)(39860400002)(2980300002)(438002)(189002)(199003)(77096006)(39060400002)(316002)(8676002)(81166006)(81156014)(189998001)(47776003)(8936002)(4326008)(2906002)(54906003)(50466002)(110136005)(36386004)(106002)(118296001)(36756003)(23676003)(9786002)(478600001)(33646002)(106466001)(63266004)(5820100001)(2950100002)(76176999)(50986999)(2870700001)(5660300001)(305945005)(356003)(50226002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB3378; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT002;
	1:dJH9pQaw2lhXx9dO0AHeF3f8WNESMQfn2u6Zlf5foK8gemqh0YGRGD74a04ODpHvQyUs+hKG+XHtI/jja8IRExdRgNpjSPnLwJICgu3WdnU5bRNXUyNrLxxoj5mP9U5P
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3fd7de9d-39e4-4995-ca9b-08d52ae75c35
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:BN6PR02MB3378; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3378;
	3:aoz8aIgTag48MQ6vWcuMx1wIvZf7z/UXdyFHxv+EDbTKux13LWX+5q4idoiX4T4E86IRMQAl8icd1/68iMzwOZOSmJbldIZ/P0yaQmRjtGUMGfdxAER9j+dvXpYJTSGMMc7TJ8SxEsycUs6mEhfX18TfxFx6ZOsO+O2y06Z72zNY2fhciiAF4sHYkv0EpqVccXE8LAXIw92PGmUWQ6vZvYKxnai7eSm6hBztl1I4mslHj63Emvjs25fFdDSpcmP+BN38EU+lvKRqOBEYAnq8vJsH8Ab4NpW0SRbEJtdVbc7FAIvrVmLigqEtcQMXg/atKI8py6dIpzKxTn45UmVHVLVXu/6DTsRVeIlP3z5zSs8=;
	25:JKGJXPVhlFeDw9tEFivLcpCBaKihHmo7IuSwywgUJZDPWnAA8mMvRuz7N+0AdNBmxbdax6MeykZIls9QETM6qNQuTAUVQ0ywRlyz2O/Mjv7ThN5CuG6cD41W84e2815iRUHCJE6YBrICcRCLPJ8WC/hmw6xkO6+v5c/vbLoduZsKlvf670b4RT6aRj+21lY5+G3gKr81wXLjjWcIsD8vjZ0diHdr46WJmwxUHY3OzBpY4oKqPUoiVdvr5oW1MOvh0NVsXxfD4uTa/zaqANc/moTuk0+NwwbPfqG1hOQqCbE9DZAxcRZ6XMuNdnLA+k22HF2Jlo7977S/0arSMBnwta3sCipIV/OGwH1WI73Sh8g=
X-MS-TrafficTypeDiagnostic: BN6PR02MB3378:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3378;
	31:EHpBmw7BWvGPe5mzS7IOYccrCSnGUe1ybyL95kYZtA0ufec9CF9Um/dmm6paFI8TTU33PXacyWKYo9gNBeAnzVRaBvA0/EOM11xtoTIf/aD1MUhWbnp0/JbyoUvBTveupD1nV6GxhpWh/Tp73cU00rTn/YDztFY+1K0xw+9HAS9Pyqe+FzmdwKrT6UgWSvzQhU7b1yXaeomfrBPMgs5Nseha5d6r0dWr/vl0YG4H4M8=;
	20:4XBfYGxEcQdOERaOSQyvc00bbZ/jRQYffydwgifqA/6eRCAixCYMhjvguCyWsPD9jKzZiPQHDiU3vAOc9Fbmno0TbZVS62WzUfAPVjhDKRhI8j19FaWBrP0qRU7tnQTCGb3jD0zdwhPCyi3EKW5ZluWO5+2nH18cdqwI1I+N39ERggW/PD121WscgF3y7K17HONFgJ8rZbXZG6TdtdvHdCFw6bgrHwvCEGeDPjRH5rDF3ZSuiv0Ap8+oet342zh2r1qywHS7k3IKkHOLOPh4IJs/qH6X+Z2q8uRCxvZFdCuVvFzYDco9ltU06oSXTmK+4Mhf7k1MwdnSj6B4wkoRFdC9YBwsrx3l6t6HMWZnG/4iY97M2NIfZ5EBf0WBvA4WTJGRq7CUdIQ1f3zaWRA/8O/mN1vufXX6O/jf1R3CX4wdbRTWTNGG5f6VmUOcL6kYUgqOyjEN+7oXVvAlk4ggR3GcF8KUCA4HNmtKX+HtToxEPPRgXu/FdJaffbfUQJ4A
X-Microsoft-Antispam-PRVS: <BN6PR02MB33785C3088B08060C557E6F4DC2B0@BN6PR02MB3378.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(190383065149520)(192813158149592)(104084551191319);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(93006095)(93004095)(10201501046)(3231022)(100000703101)(100105400095)(3002001)(6055026)(6041248)(20161123564025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123560025)(20161123558100)(20161123555025)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR02MB3378; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR02MB3378; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3378;
	4:dvuVogH+z5Posl712GCu46nOJxQK8J8bY6gkthbJhASBmKmnghcnRy+kTh3St6mch5C6royI9/2YOIdSB5lBPnO5NFTAvVueWV9aI6WlPiyiO7XRvHBBZpo+4vLAJEg/tvrDRhmOwqSxoYWS9oLWHhSt/bfozkyRxfzWC/2n8BhYdLh8sOA+/meGkWJKukjIPKCdbG/rzgRUxrURNAXQ3yP4AeO8WWHnes3g4PHfsg113qLEaeuXqUAhNsYWSje0puu0h8BAwdcO3oeJnmp+j4LzBbN0uoM64JNUVDR+NMaPURIwths7p/U5eeWLAmzLX/HLsLukLTLh0t2J41vlE6yJ327MyxyKLJP30shJQx+/Yp1OAGj0TKkkLooPhL8FU+P0O5SP5aDSK36DKld0TxMSSgCM3zK6oBWSb+r1K2c=
X-Forefront-PRVS: 0490BBA1F0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR02MB3378;
	23:OBmxMVeCaEBCkEIwnWXIBVnWTruQdzLYu9CDycGlu?=
	=?us-ascii?Q?hWF6BS+H7BSEnJo68lcLZ0kWADwYjLdEjo/P3slKABVfTWhFQbQuonHlWO61?=
	=?us-ascii?Q?b8bBtFIvDR5hL/7BQubrcxQMZYAmVksZn06pCMylgnvGv356F13VGnKr8rvs?=
	=?us-ascii?Q?5l4KXROW4hVftXM1AWOZokcJyXYPnXTQK+b1nV8bspIa4JqI6RKer3nblhSp?=
	=?us-ascii?Q?eEuyPicTCkBRvxfNUPqZASxn72/mIL6LzbbaIBfhEB1VUAJSll7oz+phGORq?=
	=?us-ascii?Q?e7nzU71a8OPq9qNYZ6yaHT9wPXeXaGI3pySlCq98wmQPX8fCoTd0udVruk0U?=
	=?us-ascii?Q?SJMoYxH89JxIidjzRcFyOM8qiKrQjSaptpAlWzcQwe49aGGUtGlkSJJdHMaW?=
	=?us-ascii?Q?H7p/9RyC5xFuU7MCBcbGeO3zSiKihZbjQLHmhCc6GjqTKJqKcEWVeWJznPYp?=
	=?us-ascii?Q?YHElTmwtwYYiiAETdwaDlmj4Npxowr/2za8nZJ7wo2pE1o6UeXiYGZ2X0jWN?=
	=?us-ascii?Q?IS6hvB9BWQeeDNeWzY8ab56XNcoNDyynssBj45SOqnUrBBT2O7i1YZEBvHfh?=
	=?us-ascii?Q?J90mHaSoOyjuzBGpImHT2jiXxK93eeDdsdHfqt0y8Yj8NSS0/Lybu5VOzJvb?=
	=?us-ascii?Q?EEs2CohSpRLu5DK9uzdhBTbd3bfo/UBOoK6cOGWAQmhN5YZHvQnkvXYNY3+a?=
	=?us-ascii?Q?aiDxN0WCcUoja+dPr1kl69cEQ8o+0t/QDvAHRvivs7bEFHFmxmpASQh1EwPg?=
	=?us-ascii?Q?Xl4FQwAn8N/MoTv6jEZNlQYyFoFFkFxoy6sqTJEjRUKqAaZIRnBioqV2/BVE?=
	=?us-ascii?Q?7oac9DhdMJj6eOVojeDvRdS0UvhrzKy70rpygTKcDWjwyLLHz/nlB0g/xejD?=
	=?us-ascii?Q?uXMYFh4bH+2zQM3URyWvhP2ieQcCWawMTP1PueZ67tgIVNEx18JL7yJTqJz3?=
	=?us-ascii?Q?IGS23SyQCfpLVUyDwLzpeUTtdUNz/PfvMOtbxJjoApM2ahwtYrZbemg2Ub65?=
	=?us-ascii?Q?NGPuf9ZCSh+e/15Obcuk582?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3378;
	6:3t+IPzVpGAIV988hcqgMFdJvA9yi9RZdvzcNHu6n1PV61tDGAvD2xSWC6JTS0P/9VGefY6+m8HXjG/N23mrBsbadbHjtAVoJw4eBoHgbrD1g2GT85j3p2JzU8FvAmzJhLHQh9ocVoyPVKlY03AZ36qCm/GIHZ1yAVeYDSBQwgVAhSGd+ZTRS1JdlFq0zSSpdyl+k8hMlb8jai9PUvfjkSpidY/cjKEOp418tf4PbMJyaMptb7vQLSwzujRRLc09SH+dgKWYui0q9nMDhnYWeD1bELu76th70ndkDUBSKrrZNixW5rhlhWqxhcTcw6r+vMiFFi5sAVNua48lmI2s1z/ZENhC5ovDtJuF9Xn+2xIA=;
	5:WOjb7MhEF1MBrGaY1uWGCVzuYuACnDwifYd7YMlvWP39BLmszlDymw8JRh5ycPYUvnIa8rb94ZAiv6DMp+mR2aRFhhd/ETzZHABJ3aPZRznIVlr2/iZclNBh91uYt8W6qSidbjNnMVR7ITQHVn1jsgSqixz8Ny01jWqTICVmcYU=;
	24:0e+RcnHNTxgfv6XwUw8dqR12L0tn2JnZHpd01BNED8P1PnnH5S/MaELdEMkMxyy330N0exsEuZ1iJJ0YQOaorF71UwdYS4oScltENqRO/8Q=;
	7:u52bVMwJ55+JNHNCYMEZOd5zs3Qymmxt1b8in/ZHkQo8HLRIOpGfz8nVc/mClwPvx3DVvt2ZELf+8wtRVq9u9ZCjo2RFZU+B64jEemETmsq1KGISfk9x5+9i2rNhRaFd84n/hJjbBBBL33hlAdKoj9K1Lo0JjkWZmmMlvAAYJ+bitMR+wbHDMAhAyBI1hYpe+uut/6anaHcuXOF62iES6JNJL2kEhkf8x22v9hWPGkhFwgwib2mAzdZzvJ3QU00Y
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2017 22:39:11.0477 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fd7de9d-39e4-4995-ca9b-08d52ae75c35
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3378
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.44
Subject: [Qemu-trivial] [PATCH v5 10/29] hw/intc: Replace fprintf(stderr,
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
X-List-Received-Date: Mon, 13 Nov 2017 22:39:19 -0000

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
 hw/intc/openpic.c       |  7 ++++---
 hw/intc/openpic_kvm.c   |  8 ++++----
 hw/intc/s390_flic_kvm.c |  4 ++--
 5 files changed, 18 insertions(+), 17 deletions(-)

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
index 10d6e871fb..7b1cafcc50 100644
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
@@ -173,7 +174,7 @@ static int inttgt_to_output(int inttgt)
         }
     }
=20
-    fprintf(stderr, "%s: unsupported inttgt %d\n", __func__, inttgt);
+    error_report("%s: unsupported inttgt %d", __func__, inttgt);
     return OPENPIC_OUTPUT_INT;
 }
=20
@@ -547,7 +548,7 @@ static void openpic_set_irq(void *opaque, int n_IRQ, in=
t level)
     IRQSource *src;
=20
     if (n_IRQ >=3D OPENPIC_MAX_IRQ) {
-        fprintf(stderr, "%s: IRQ %d out of range\n", __func__, n_IRQ);
+        error_report("%s: IRQ %d out of range", __func__, n_IRQ);
         abort();
     }
=20
@@ -1221,7 +1222,7 @@ static uint32_t openpic_iack(OpenPICState *opp, IRQDe=
st *dst, int cpu)
     src =3D &opp->src[irq];
     if (!(src->ivpr & IVPR_ACTIVITY_MASK) ||
             !(IVPR_PRIORITY(src->ivpr) > dst->ctpr)) {
-        fprintf(stderr, "%s: bad raised IRQ %d ctpr %d ivpr 0x%08x\n",
+        error_report("%s: bad raised IRQ %d ctpr %d ivpr 0x%08x",
                 __func__, irq, dst->ctpr, src->ivpr);
         openpic_update_irq(opp, irq);
         retval =3D opp->spve;
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


