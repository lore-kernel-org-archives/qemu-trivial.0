Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRiBI-000863-Ko
	for mharc-qemu-trivial@gnu.org; Wed, 20 Dec 2017 12:29:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiBD-000816-RW
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:29:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiBA-0007NT-Om
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:29:19 -0500
Received: from mail-bn3nam01on0057.outbound.protection.outlook.com
	([104.47.33.57]:26976
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eRiBA-0007NA-HN; Wed, 20 Dec 2017 12:29:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=VqyQwNz1WPbwk+lJ/ot05h8Pr3LBhGencn21FAW7xXo=;
	b=TU7cySOcLIQ7bVMXpd1cGJaFXf9WQB/giiPZOoEDgElZ0InzZchUcx7nJAAwA42jwjxlWswrony2rz/mzHhc2QoevMM+ZH9cIpcryNJkA5vKPfuQRS4vm3hicXw2ApL3hdCMq+qLUlsoG3k4FfcOyTzXlVPIl4yf60cO8ySQmIA=
Received: from BY2PR02CA0106.namprd02.prod.outlook.com (10.163.44.160) by
	CY4PR02MB3383.namprd02.prod.outlook.com (10.165.89.154) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.345.14; Wed, 20 Dec 2017 17:29:14 +0000
Received: from SN1NAM02FT021.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::207) by BY2PR02CA0106.outlook.office365.com
	(2a01:111:e400:5261::32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.345.14 via
	Frontend Transport; Wed, 20 Dec 2017 17:29:14 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT021.mail.protection.outlook.com (10.152.72.144) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Wed, 20 Dec 2017 17:29:13 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:50659
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiB6-0003t4-QJ; Wed, 20 Dec 2017 09:29:12 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiB6-0003vN-Ns; Wed, 20 Dec 2017 09:29:12 -0800
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBKHT6co020000; Wed, 20 Dec 2017 09:29:07 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiB0-0003tH-PX; Wed, 20 Dec 2017 09:29:06 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>,
	<armbru@redhat.com>, Fabien Chouteau <chouteau@adacore.com>,
	Mark Cave-Ayland
	<mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>
Date: Wed, 20 Dec 2017 09:24:51 -0800
Message-ID: <20db575739761ca7dea1f0670d2c019e3678f035.1513790495.git.alistair.francis@xilinx.com>
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
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(346002)(376002)(39380400002)(396003)(2980300002)(438002)(199004)(189003)(316002)(8676002)(106002)(2906002)(9786002)(81166006)(2870700001)(5820100001)(36386004)(47776003)(81156014)(54906003)(110136005)(36756003)(50466002)(356003)(305945005)(4326008)(8936002)(50226002)(5660300001)(7696005)(23676004)(76176011)(77096006)(2950100002)(106466001)(6666003)(39060400002)(118296001)(63266004)(478600001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB3383; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT021;
	1:1nL1h+Z7WNLq49O9B1LSgrRUYwGAzIB5xV0OFCUTQQJ9iLEELaTcukePxJFTT+VoX9AyjjtMMDxvA7Di3I9/kUKG+V3W9ZlJJmnudIT4pFVbLBiiDaqAp3A4jo544eA5
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9acba569-13ce-4993-ead8-08d547cf3063
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:CY4PR02MB3383; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3383;
	3:qWgKZFm50o0Jrmma6CPbFpLlUk/eM82ICetJVTm25AJRLUTi9kr9AD1ZpNWdtVDqqBJWkuydiiNixvKry9wThgRvLkCAW8TpHH3uifRToBSN8Q29vhThawJHWj801QyAgYvEMLt9IRtzhT1WvYcp9lxxuxRf0E5K1/AjuqamWe0VL8rtuEsJ58ZlL19UQoHW5LtxE5h1ohs4F5Tq5e//TM23IMFZ2me/wtUg37Y0sgmlPqPVw0owLK82X0ru7++VOBUo2gwBxUSltV3RFopDNMc+4wLXbIOETteIE3ztBE0FwO/lknkes2CsgwlgT58VXZoC04xnOXrJ+s0NLe6PvMSs81OJC88ycUmWDgXiadg=;
	25:+jo3+jxvso1P4W3YPqrNDEl7NDbbwnz3ZekzAfwWPXR0/4593YvQj9VCle0DoHCI62NvFJZs4lJw/X+vvwOCmI6++DAUPmJvfz5JU1wI8DXkRxp5++SgCZN3dbKw9ipAVzC/9Iel3nu3V9F2bLE56b8FlzQhsilhMb9aJRRMKCMQAjD4MK+YXNAb61DqM7Kz95+2AhRaHTXo+PJNxsOrYr2eYrhYcXfZuhau7apGVZb7CVg9TcvjxarSZo84TvrXJLHEjDmV4wHIfWx/XWRQEAIsLKNP7vKzg9Nzu32/Qqhl7ahAyIkt+raVXRboGCQlOlH3T8sUGBM1qODdx2qYLA==
X-MS-TrafficTypeDiagnostic: CY4PR02MB3383:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3383;
	31:1wa8JR2ZAcPcM+9jSfhwBV3TtXHGUg9ClY2nOc+QZssi0lqavHOEUkCK03G6tdAsGjMNiuzj34FIAIgg15cHGGs2wmyQJfH56yQRENI83L0R1oQW/cJGFqoHDndnCETK2PsEHmID99+1IMmAs6FpRso3Lq/bIzCF6gQh20sj6V8Vt+ayKtUWr5FwDxlVCOEElPdXndMJVBwlQsQ+Vun5BVLUhhLSqUdJm+i3+61mHt0=;
	20:kqOs7k8wllqq4hdttKBbiH2p+TGB7qw1DHjFZSaNz5pPvP7oguCE23kg5a8aZatUGJ7bSk++ByROeUQlyH7Dj+ZxZ8VTtI0F66BU/eZ+cPET9gSRw5tGG8f1F2tqhAQFzsblYnswiEx3LbZZN9vK85HWVCRpak310N8kxPi9eSsfeQG9xW0k5IXVlhxfXXpe4ld99wNY+jeOm4VStrag5ajyU856EBqdTzDf/RPa7eCgZS8wrX8isMl7XMfeZ+rcNwE2wz3hL5PiJnkg+k1pGCsD/rrQ7/s3RqgsW0FXr8oOYspPhtOMxDjVEyPnZNPmX+SO8jEy/ylSVPHS4FuacpzSzg6QAkCcKcx4GrWtNGygVJanAonrTM50hBVtQG6eLma0sbt4Zv/6pkaPLq3Zu16WoXbC0quL3n+q8XRbKVC8J6Jtjr2NEQ1v5yxZTUTt8rD2sxg1nn0xRYWSRC2TA6eBQB1XXExIWg7Ze0VErYS7kUDuZV8zLjJDypSVs3Rj
X-Microsoft-Antispam-PRVS: <CY4PR02MB3383FE29D5D64490FEAA78BFDC0C0@CY4PR02MB3383.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(3002001)(93006095)(93004095)(10201501046)(3231023)(6055026)(6041268)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011);
	SRVR:CY4PR02MB3383; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:CY4PR02MB3383; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3383;
	4:/Cl0oVgy74zNoBuiJ6mXfLrooUZkt6vtXMiOKMbnRRq6IrIax8n0R1NBmx7+IUY9dSYW4vXt/erRe3d8yveP3+8FMCUTfKSFqvl95ddAY++y0FWM03FOtEkErDhgZx9M8Ql5HITRqUV1hLw+FA65FiG8bo9emUG6n5pe5A36OFwwq3ZtV/+SPvCSLnXX8TS2CW6447mu/gyk8jcu8mtGXU/3Y3YCbPbgWwiIb3y+Gjcir/cYb0Kb0A70/qnabPIsxGv+vCxhv5Hte7Olv+wC0fJHCaXEuRCf1m1hcEc/gk9TxMJt+X+NP/VCiIgzvatgeHC0fUsgl8kGylpLdlrlAw==
X-Forefront-PRVS: 0527DFA348
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB3383;
	23:G1gLzWJHQwwuFpWRPi57EYQqrADHwKTYTa7NgjzBg?=
	=?us-ascii?Q?G+10W4vCNlo/R7gbS8XUfYX8TC+XaoafRmfQ//EVTISIY4YHK9yfyOcVbW+i?=
	=?us-ascii?Q?tnpn4WNWZjahcq2itvH2kSpz8/f5SFfW5BfPKqdg8iDvMCG9pkLRHzwOrw/7?=
	=?us-ascii?Q?L++uohwGQY/3EFQVNwx1SNo4xv1FnCzf5UndqaGPi2H/5tvHwQiqrbl23K5q?=
	=?us-ascii?Q?XDEJKGfSnFjijbd3oHamZ52IulUZQG+U8RxVLCHYDfggJqIBpde11XoMensl?=
	=?us-ascii?Q?VoMa+WgrEFcVGq7SEkFEFiQBOi40hGyXmrv1ERqO+EnmJMdstBQWp7ROFQT6?=
	=?us-ascii?Q?8d+qSBfXSScWqY76u5Z635kWH6/rTr3gqEeTutswSdjt8mSTBfD4LOSrQG/F?=
	=?us-ascii?Q?F1KhRg2+cjZHa17rM+JxH9pCsY8xYWUJjNX+cOF6WsLoKYze8mVH1Xn+OcWm?=
	=?us-ascii?Q?9gz5GVOtwI/FgAbNcpDugrAZxmP1Z3Co40UrnB9xQ8ZEBWCX/yblHM5gnuv2?=
	=?us-ascii?Q?S81/TixDpuL40NUE5WB7jj6zdFL7AO6Vv6zq52PYHIm/j4ZLqua3PMvNz/15?=
	=?us-ascii?Q?SppK9+Ymf4CsIhlk9yy6rYhLcOhGsvMYPPFwgQxekPysWDj70kWtC+YX9Ua5?=
	=?us-ascii?Q?CrLLTzFSOIOwad3Y0BZyu2Lj+Aw9FVemvV8lYCbJ6Nw69uIfwizgD09ZxgrG?=
	=?us-ascii?Q?kymxZau/+arg9Wd3ZleeJXnppfJuzh2xo2poedNuV4KiS8R3ci1rM6X2vh5O?=
	=?us-ascii?Q?a5EI2XiPdK/l5QdzAWJC0fD/zZv7NRB2codfPAFiwJw7siDAGjVjFQSt0i4t?=
	=?us-ascii?Q?MnrycWlJd1Q/UNw6EjqtePjhyHqaeuHOA43wpwcxJDMCD0wcI6J9JnrsCT90?=
	=?us-ascii?Q?8yljo0C3yW5zFJRPOgzwwUoBON2zUPikttiMT/ZdJA1TocRptDBu2Bsd9J9E?=
	=?us-ascii?Q?sPfCtG2ptJl14vO9YSuh28Toszz2lS5pV4tUtMP+VItSEwmBMI7/CGXGRgXr?=
	=?us-ascii?Q?r64gFH037nrAL4zCp11cER75uZZmwWuoPodwCfZrGnxaNbblPik42ZvERq5j?=
	=?us-ascii?Q?0TLeMo=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3383;
	6:OsUIVQWq7BWZ8p11VrBIYubahSBJwi1X08oBp7FqL/cS84rUTrWjFfWeTKJmplNjZsMw0PMHObk+yrFjwEGRVOl3OMjG7xVlJdRXMWWKDPH2M8pCWDcVmmnYLg+fEyjQF3G085Aup/ieJuxFMwUMnMIf1Cy7yDuZF3NQYoEosxG8AUcOjwyylsKq9dr7yHuwZXaLyH5VAOK6c7ol4M7zif+xCgFIZeWbX+OqLU2WmlIwMre4iRg/7SIYiK7o9tFuzC5yjddYGBbZwbTH2HA3r3IaPvahUZqh9T/22qhzaiLD2KYhxSxBxcARUBWq1ETWqH4b8JuBD+/EFgOOxctLSENQ1lSvhYMMX6o7PSg9zHM=;
	5:CuzMDrSAGY0IG3CMqvfW+MhQ56dIJxv/XatGEbgea1tB4Z+PBvfFR1IpXCvCr8wPqrGb6T29IUPPQU5VefX5mGcCCZgPExvo8XqpiOU4f3hUBpQaKLO3hvIzAImY1WyWvU+nO1/iP99JbE0VezTmNucEgpFhqtzrKN6lbKfr0sE=;
	24:7G1dZuE2PfIRjix4NT6LQ5lil16hGx8fHPBTDg4HrfRyNr22uCYji3j9qDl75nMZ2KTHaPvqUWMycvZnO0efhPt3E/9TcowKQdu4XjtQ1QA=;
	7:/Fnmzu7C8Boj/vWdI1XuuhURE6iUynYN90ZmxObXxqx8U2Wf6RNmQRdh5fljZbEsgbrRUkoDpafT9Awvg5v+gJsJWzfFCy1L5xJsPr4Sx2CndLUUF1655OCh1vSdeiiz6WW2i83tj2b8RFUSaex1cueOQMrXpJUo2j6Q/kuPZYMxP9zWAC2lMnveDpyFP5aPFj1Rvhsv/kNrZjF8C0XX1ZERl7vSw2wMozDy2gfYBXOpgd2y66JrwwT+RPTKPcqB
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2017 17:29:13.3918 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9acba569-13ce-4993-ead8-08d547cf3063
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3383
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.33.57
Subject: [Qemu-trivial] [PATCH v6 24/29] hw/sparc*: Replace fprintf(stderr,
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
X-List-Received-Date: Wed, 20 Dec 2017 17:29:22 -0000

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
Cc: Fabien Chouteau <chouteau@adacore.com>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Artyom Tarasenko <atar4qemu@gmail.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
---
V2:
 - Split hw patch into individual directories

 hw/sparc/leon3.c     | 16 +++++++---------
 hw/sparc/sun4m.c     | 16 +++++++---------
 hw/sparc64/niagara.c |  4 ++--
 hw/sparc64/sun4u.c   | 10 +++++-----
 4 files changed, 21 insertions(+), 25 deletions(-)

diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index 8c66d5af24..bba3aa3dee 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -22,6 +22,7 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -139,9 +140,8 @@ static void leon3_generic_hw_init(MachineState *machine=
)
=20
     /* Allocate RAM */
     if ((uint64_t)ram_size > (1UL << 30)) {
-        fprintf(stderr,
-                "qemu: Too much memory for this machine: %d, maximum 1G\n"=
,
-                (unsigned int)(ram_size / (1024 * 1024)));
+        error_report("Too much memory for this machine: %d, maximum 1G",
+                     (unsigned int)(ram_size / (1024 * 1024)));
         exit(1);
     }
=20
@@ -167,19 +167,18 @@ static void leon3_generic_hw_init(MachineState *machi=
ne)
     }
=20
     if (bios_size > prom_size) {
-        fprintf(stderr, "qemu: could not load prom '%s': file too big\n",
-                filename);
+        error_report("could not load prom '%s': file too big", filename);
         exit(1);
     }
=20
     if (bios_size > 0) {
         ret =3D load_image_targphys(filename, 0x00000000, bios_size);
         if (ret < 0 || ret > prom_size) {
-            fprintf(stderr, "qemu: could not load prom '%s'\n", filename);
+            error_report("could not load prom '%s'", filename);
             exit(1);
         }
     } else if (kernel_filename =3D=3D NULL && !qtest_enabled()) {
-        fprintf(stderr, "Can't read bios image %s\n", filename);
+        error_report("Can't read bios image %s", filename);
         exit(1);
     }
     g_free(filename);
@@ -192,8 +191,7 @@ static void leon3_generic_hw_init(MachineState *machine=
)
         kernel_size =3D load_elf(kernel_filename, NULL, NULL, &entry, NULL=
, NULL,
                                1 /* big endian */, EM_SPARC, 0, 0);
         if (kernel_size < 0) {
-            fprintf(stderr, "qemu: could not load kernel '%s'\n",
-                    kernel_filename);
+            error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
         }
         if (bios_size <=3D 0) {
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index e71648404c..e38b5d84be 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -259,8 +259,7 @@ static unsigned long sun4m_load_kernel(const char *kern=
el_filename,
                                               KERNEL_LOAD_ADDR,
                                               RAM_size - KERNEL_LOAD_ADDR)=
;
         if (kernel_size < 0) {
-            fprintf(stderr, "qemu: could not load kernel '%s'\n",
-                    kernel_filename);
+            error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
         }
=20
@@ -271,8 +270,8 @@ static unsigned long sun4m_load_kernel(const char *kern=
el_filename,
                                               INITRD_LOAD_ADDR,
                                               RAM_size - INITRD_LOAD_ADDR)=
;
             if (initrd_size < 0) {
-                fprintf(stderr, "qemu: could not load initial ram disk '%s=
'\n",
-                        initrd_filename);
+                error_report("could not load initial ram disk '%s'",
+                             initrd_filename);
                 exit(1);
             }
         }
@@ -680,7 +679,7 @@ static void prom_init(hwaddr addr, const char *bios_nam=
e)
         ret =3D -1;
     }
     if (ret < 0 || ret > PROM_SIZE_MAX) {
-        fprintf(stderr, "qemu: could not load prom '%s'\n", bios_name);
+        error_report("could not load prom '%s'", bios_name);
         exit(1);
     }
 }
@@ -746,10 +745,9 @@ static void ram_init(hwaddr addr, ram_addr_t RAM_size,
=20
     /* allocate RAM */
     if ((uint64_t)RAM_size > max_mem) {
-        fprintf(stderr,
-                "qemu: Too much memory for this machine: %d, maximum %d\n"=
,
-                (unsigned int)(RAM_size / (1024 * 1024)),
-                (unsigned int)(max_mem / (1024 * 1024)));
+        error_report("Too much memory for this machine: %d, maximum %d",
+                     (unsigned int)(RAM_size / (1024 * 1024)),
+                     (unsigned int)(max_mem / (1024 * 1024)));
         exit(1);
     }
     dev =3D qdev_create(NULL, "memory");
diff --git a/hw/sparc64/niagara.c b/hw/sparc64/niagara.c
index 7a723326c5..996ce2ada0 100644
--- a/hw/sparc64/niagara.c
+++ b/hw/sparc64/niagara.c
@@ -152,8 +152,8 @@ static void niagara_init(MachineState *machine)
             dinfo->is_default =3D 1;
             rom_add_file_fixed(blk_bs(blk)->filename, NIAGARA_VDISK_BASE, =
-1);
         } else {
-            fprintf(stderr, "qemu: could not load ram disk '%s'\n",
-                    blk_bs(blk)->filename);
+            error_report("could not load ram disk '%s'",
+                         blk_bs(blk)->filename);
             exit(1);
         }
     }
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 1672f256e7..1fd1c3c861 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -22,6 +22,7 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -166,8 +167,7 @@ static uint64_t sun4u_load_kernel(const char *kernel_fi=
lename,
                                               RAM_size - KERNEL_LOAD_ADDR)=
;
         }
         if (kernel_size < 0) {
-            fprintf(stderr, "qemu: could not load kernel '%s'\n",
-                    kernel_filename);
+            error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
         }
         /* load initrd above kernel */
@@ -179,8 +179,8 @@ static uint64_t sun4u_load_kernel(const char *kernel_fi=
lename,
                                                *initrd_addr,
                                                RAM_size - *initrd_addr);
             if ((int)*initrd_size < 0) {
-                fprintf(stderr, "qemu: could not load initial ram disk '%s=
'\n",
-                        initrd_filename);
+                error_report("could not load initial ram disk '%s'",
+                             initrd_filename);
                 exit(1);
             }
         }
@@ -327,7 +327,7 @@ static void prom_init(hwaddr addr, const char *bios_nam=
e)
         ret =3D -1;
     }
     if (ret < 0 || ret > PROM_SIZE_MAX) {
-        fprintf(stderr, "qemu: could not load prom '%s'\n", bios_name);
+        error_report("could not load prom '%s'", bios_name);
         exit(1);
     }
 }
--=20
2.14.1


