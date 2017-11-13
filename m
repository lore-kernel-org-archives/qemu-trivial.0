Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eENON-0002oH-0v
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 17:39:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56928)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENOH-0002ky-BQ
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:39:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENOE-0007E3-72
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:39:41 -0500
Received: from mail-sn1nam02on0049.outbound.protection.outlook.com
	([104.47.36.49]:35151
	helo=NAM02-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eENOD-0007De-U0; Mon, 13 Nov 2017 17:39:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=l6OBUP2qRgRoUgl0zKjUx9as5ar3pCmENjqrRbH3Xe8=;
	b=gA8cepP+yTp9pcJaCgcJ9R+yhNPoAAGxBO11VUILGkoOn0SS4O1Hl+ykBMlgpTi1+72CP2bvIDDeCjHaJr3tjr53hiMhvUoU7EhQp9hog+kwUw/NiBz4wltitZL3rM8367u/ekBxM+3hVQd7GQxtbQyKqR/WYRP1v/O+pt3iqRs=
Received: from BLUPR0201CA0009.namprd02.prod.outlook.com (10.163.116.19) by
	CY1PR02MB1333.namprd02.prod.outlook.com (10.161.170.24) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.197.13; Mon, 13 Nov 2017 22:39:33 +0000
Received: from SN1NAM02FT031.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::208) by BLUPR0201CA0009.outlook.office365.com
	(2a01:111:e400:52e7::19) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.218.12 via
	Frontend Transport; Mon, 13 Nov 2017 22:39:32 +0000
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT031.mail.protection.outlook.com (10.152.72.116) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.197.9
	via Frontend Transport; Mon, 13 Nov 2017 22:39:32 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENO7-00049L-F1; Mon, 13 Nov 2017 14:39:31 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENO7-0000TQ-9g; Mon, 13 Nov 2017 14:39:31 -0800
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vADMdK0u002801; Mon, 13 Nov 2017 14:39:20 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNv-0000SL-TI; Mon, 13 Nov 2017 14:39:19 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>,
	<armbru@redhat.com>, Paul Burton <paul.burton@imgtec.com>, Aurelien Jarno
	<aurelien@aurel32.net>, Yongbok Kim <yongbok.kim@imgtec.com>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Date: Mon, 13 Nov 2017 14:35:19 -0800
Message-ID: <ba536789fd4609d9a45254a4136171b029d0e831.1510612380.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(6009001)(346002)(376002)(39860400002)(2980300002)(438002)(199003)(189002)(106466001)(39060400002)(4326008)(2906002)(2870700001)(36756003)(5820100001)(50466002)(23676003)(316002)(36386004)(63266004)(110136005)(54906003)(575784001)(478600001)(305945005)(50226002)(356003)(2950100002)(33646002)(77096006)(118296001)(9786002)(106002)(189998001)(5660300001)(81166006)(81156014)(8676002)(50986999)(76176999)(47776003)(8936002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY1PR02MB1333; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; A:1; MX:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT031;
	1:YZTg0GADHKzQDr9Qu44T3gAI76CubTu22D0RSYDENDOD49/xDxQQ5Qks1V+TZ6ORZ94pDSpL3VYkXTXZ9IF5wk1Tlg2ULNi5Vt6mLMHimzwPiNSrono5NXsyX95S8BKN
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7e20ffad-20f3-47f5-a9ef-08d52ae768c8
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:CY1PR02MB1333; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1333;
	3:3UO48c+LlJJNGgW8yFhMkeS+DGYW1Yh8q9wpy53ed/HbmuHaBuJfItwEMgd5mKkTzQvSjzgoAzrYonCAWyW14Cc+7HttaFwz64WZr34dBDgEOVu8tUtGbpqidvwMoKAvcKpTiv7qjfj70oBfwY0KRA7HDrzu1BDcm2nuDz1Y7tI5XDuK5kiHUj5D4RIstj2fnmW9tVH2/4Wd8c8uXsPzR+1qCFYpPm3DSV9ofKr/bMTw8y7UAzxHEOTSXWCufITt3k28UaVOOG9rchemUxvDz8vIM92/Ii8ZqpcNlT1KLxX5AHHEgoUv1GZAEWyF6xZCQNWuu0kibTsK3kSyrsbw2ogx0FGQsXARNhZP+z000g0=;
	25:SmmMlIULIXZuVmw+OeXwc/ueP0MtJQH1cShjAvQIUkvOXYb7NwpNnEbhqJx5UEOTlHoI34Ow0zqskY/iiVG8Ces/pQemy5pjHjFKa55XW65s4wulBa6+5D8p4dUj0QeaxqzAdRPR49AojtRw2DwY87jPukWEUFPaiswH1SVdB3Eeglepj67yLPc0r6Ae8VqOXqiVDIsM5YHz4KgknAYnGU5rzuS1z+GcueklNB3ecltG/KdyVHbbsY2Y6r+gCTne2HZMMippCnPMfbJV0BPuy19K7uNq7/50qiEAoJxSVQKUP2Kgc04MCk4dpBUuuvPZB3frkFd3V0CDd9WpdzabZYcUG8Gp3vB/Ylg14d/+pL8=
X-MS-TrafficTypeDiagnostic: CY1PR02MB1333:
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1333;
	31:wWp/JuxSz+zbXnmfCg48vAf8rJA4CdAXRvbacAkO1nbGe2YD7gPe3/k3JMvPD/l0TiDgitPNZp65PQJC68ed3rStNYmfM4pcanHh8+bufjlc9/1pOXPqDBTd1KSjNPmBZgXc4Bg/hi7rAPyam7qw+FAXa8MWjnHrgW7UEdUnhk9pG+JIHd4NdxhTms/d2wI3iLCCDSswtzGzWxEuntagcudVwA1XZboaYgn7QIsbZB8=;
	20:lhLtkcIxNXFxDMoEVTGlU0ySH0+tIcCyAcPAKCicsGw3fRp2hLCt37bOGxud02tWuiCqYHlF8sJ1ePYPOr1GB14t9tWHf9JnOkpC8NQV3EJ1WGKehFvpEe/HpHXYnSFefwRDVbffrUqBRWT/7I4bzty/WJYw2bkJTFTj/DMgT/7tYyiqkggZz6Wo1PSp6t0eSmPod8kCdXh4kKQF/R5NEuNGCdgxLcOR3QKxCXBVhL5kO3jWpZiH0tJ4xB6BhiE+j9Jhbzhr7JRx3Tafk0F/Q/v1TIygRB1mT7bvGy5hmxn03YOQnUvVMZg17E+utdI245qP1yBQNlFWy3uqy9owXzsHC8D3qOno3aQ1mHqDy/L9fcLWx6w6aPcs+I6aINrXV4YtHtLo7NN4J6Jp3PH2wkv2lcnulkBwIBVwMswD3M+KMXJWiatc4MbGhC9SsyjfCz865jUIUk/lx5VWwfq23N+/rSbXUM1tR/O2Igzv0hyY4tmX3VpAKHpSCH4CfjQF
X-Microsoft-Antispam-PRVS: <CY1PR02MB13335A3F676464B2AD1B208ADC2B0@CY1PR02MB1333.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(10201501046)(3002001)(93006095)(93004095)(3231022)(100000703101)(100105400095)(6055026)(6041248)(20161123558100)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123564025)(20161123560025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY1PR02MB1333; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY1PR02MB1333; 
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1333;
	4:8SOuXikWBZnAGAcZR95xYImS/ClTsak2q/39YAfYgr043JZP+n1bb8YuuteL8oWHa/JEDK4/ideBfzy9LUFj6UGa1R/Zz2WnDropQ0h3KzbE2OpPQ8xJKsNKnCa8iyZ2b7CbaHc35aJf+qY6gXdj/DBMUu7Fk00rAFoGTzuXsmtA4oUnHMaysWqK3/2CRJggZuSIpoUlLgCnBmPiUTXBIzw8GTrmF0ZzHbSIeA/i+7DXVsZzwb1qJZ9CDpEz7OOVjIircgcKRqOyqzwOSxIY7txVlMlynx+zE2KFlDqi2sV9aL3R/u369Fe0x1JPSoyN3A6E75EoelVAHYwCxXeapg==
X-Forefront-PRVS: 0490BBA1F0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY1PR02MB1333;
	23:U5zfwZQvj2pf0APK35T6y0QPoUCM23AcdTBZlqqAr?=
	=?us-ascii?Q?2e/mQiBcZp1I72q2ZWjIBU5OviHax8YcFiw022mcDLPgVfKmjSw/GIecSUWr?=
	=?us-ascii?Q?k+owgzMYhsg6vpY8OjIrz7L9aMCIMAGvDLGZjuYiUrmRjDCGG2DTcXf4VC70?=
	=?us-ascii?Q?4DMvWpVmYYn6IW6m4ye/b61X5ne0EjHliXFq9Yat7ZeAr/f2AY4leqyYmlof?=
	=?us-ascii?Q?9Fq0+0cF+0E7F1w6K7JbXPUd0OSLRG+OyMd4+vdHYDx/t1FDHST0uuUw0OLH?=
	=?us-ascii?Q?qUXX0oad9+joJc4kDIaw38hLupdg+gPtatNfN6ULKbmP++67RuH5Z/j0I0Qj?=
	=?us-ascii?Q?tkhXyu6SfBpAb/SwERl5S2QsnoEByohkXHO+aL0O0AXUUqPdTChZx+YQh6T7?=
	=?us-ascii?Q?0hLWgUzzl4NN/SS0zR8iaDTVyCxhh11lJTsZogGUa8LpWvIy93aa4QsynRZt?=
	=?us-ascii?Q?DBNNJS6Bg5YFnWRiYuaN1YLmYF7iYAfTgVqhuEON6vJMKMDKGNWt/cWPBsJr?=
	=?us-ascii?Q?hIMkOnsL+iv6LR2su3ySIyRoF7YH4dSMLLZer//2SEzle5vUkxjAdu5NDcIO?=
	=?us-ascii?Q?lP2TEyUDrLMA3U1xXWeyNUEFsUqeGloe6AGntRTf2FZOCoHIm+hM9r68hb9l?=
	=?us-ascii?Q?HcRNgYfXDHQNE1vcqnd8raZ9SqzN61GjVa1U1uoH2kNLvgy5iqT/DFTByxro?=
	=?us-ascii?Q?HIz7Hqt9ibc4lgRcunPxG3WCel93LDqarhwmm/ahLLlT6kpgoepuwWtCt/kN?=
	=?us-ascii?Q?pohmm0a9SzFkwZgGXdEjQH7P8w5VZ2G4SDCe8V2zAAq8SejLq9V8OAhKa3gP?=
	=?us-ascii?Q?yVq/BC2m/5mabVrTeiNKQRPDrjbnwn6g8BJGTv03Z1luF0PKp63vAk+NAMMV?=
	=?us-ascii?Q?xhLvfv7KRUFhdVE5AJKZ8KDKYE1w+G/OukW0MT/AVEf7uLs7htWCYWZ/3DsK?=
	=?us-ascii?Q?8EhpBjdZOUIZsyIfSDMzytsS+6ltpH/+892RWGGMqIVqsUQMe9tkYIHHf7eD?=
	=?us-ascii?Q?aK1MdcpQ/Rrx7vGgT3yntAFhyEadMYeb7/wkOnYpUCXUg=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY1PR02MB1333;
	6:fTCjE06Ca3GbgOQz+WWYtNhFmDu9uW2ZeNaU45HWnnl5e/LsmMobA4hhPD3tx2F+sqWQk6ZfhH1qLu9a/tqyj9r8c47OV8HUE7ZJCzr1iGBx8IZMa/ts0jAEr+fLVNZbpypepBbfyYyX3JcLSlBozkI3bu6FIjuJQoj8ngO/0iuYB0aG+UjZvmbgZuL3arsEe9daV2bnL/2uG69DNM5NIVvnA3hibGKrxEMvCA6l3+UCXgiZVGWui4lSfmbZFjgMd415fSRqsL1vqPeWIPld1AyzQxaCPC9E8vClbwyrmsqURBt7NaF8tG2tm8TLMpGOp0qIAfR1A6AfQJUI19w4sPmOsKLM6AQb3FpQz3Dg0m4=;
	5:lUkvmW1Gx2WJeau4DDlNbu1UjMZMZxnkMUu4V8es4T+hI785hKK0zaJPdrFtDGb1LXfuQ6guNF9XjCvZuz/YYLQfbkH2EQBSpwnWP4CUev1j0kCe+w7+HTqNMX61wp0klBWp/CqwnZsnTQESX+j1arD5PofMlZPMszqGixWOM1Y=;
	24:uXL+zK3wsE2DtMEsIWSV+xHCxarXoP2HE464cxjMArpX9VFzIMUJBwrzThRkJcfUL77GUR/IetX8YAfWONM3PDnrGmlmI0wjqwvVcWNm/FI=;
	7:yDA7pL3Qa9XeEkdnrdaTMT9G6gqqmbrOEy/ku/rWznJkEU9ZKrlqML4Z2rFOD2dAGRMWT3DF6qfjhGCtBKfaN9bBo7ieCd8ENEmc6r+nWwQI7MfvQPY+udoyDHxsGlQvD0J1+3lBfHse4PPZdGfQlK5LterlOFOgZigXVXcLD7FbpHUPoNqmhhrqaVa60sq+Z+DcdJRuKri7B2siFocTCYRgHKZdI1J3bvw5bBnzNpxdMn1e/y/Huem+KHI2es5P
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2017 22:39:32.2367 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e20ffad-20f3-47f5-a9ef-08d52ae768c8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR02MB1333
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.36.49
Subject: [Qemu-trivial] [PATCH v5 14/29] hw/mips: Replace fprintf(stderr,
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
X-List-Received-Date: Mon, 13 Nov 2017 22:39:45 -0000

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
Cc: Paul Burton <paul.burton@imgtec.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Yongbok Kim <yongbok.kim@imgtec.com>
Cc: "Herv=C3=A9 Poussineau" <hpoussin@reactos.org>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Herv=C3=A9 Poussineau <hpoussin@reactos.org
---
V2:
 - Split hw patch into individual directories

 hw/mips/boston.c        |  4 ++--
 hw/mips/mips_fulong2e.c | 13 ++++++-------
 hw/mips/mips_jazz.c     |  4 ++--
 hw/mips/mips_malta.c    | 16 +++++++---------
 hw/mips/mips_mipssim.c  | 11 +++++------
 hw/mips/mips_r4k.c      | 18 ++++++++----------
 6 files changed, 30 insertions(+), 36 deletions(-)

diff --git a/hw/mips/boston.c b/hw/mips/boston.c
index 1cb4b6aca2..d91a477191 100644
--- a/hw/mips/boston.c
+++ b/hw/mips/boston.c
@@ -353,7 +353,7 @@ static const void *boston_fdt_filter(void *opaque, cons=
t void *fdt_orig,
=20
     err =3D fdt_open_into(fdt_orig, fdt, fdt_sz);
     if (err) {
-        fprintf(stderr, "unable to open FDT\n");
+        error_report("unable to open FDT");
         return NULL;
     }
=20
@@ -361,7 +361,7 @@ static const void *boston_fdt_filter(void *opaque, cons=
t void *fdt_orig,
             ? machine->kernel_cmdline : " ";
     err =3D qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", cmdline);
     if (err < 0) {
-        fprintf(stderr, "couldn't set /chosen/bootargs\n");
+        error_report("couldn't set /chosen/bootargs");
         return NULL;
     }
=20
diff --git a/hw/mips/mips_fulong2e.c b/hw/mips/mips_fulong2e.c
index 146cf0fccd..344171e40b 100644
--- a/hw/mips/mips_fulong2e.c
+++ b/hw/mips/mips_fulong2e.c
@@ -120,7 +120,7 @@ static int64_t load_kernel (CPUMIPSState *env)
                            (uint64_t *)&kernel_low, (uint64_t *)&kernel_hi=
gh,
                            0, EM_MIPS, 1, 0);
     if (kernel_size < 0) {
-        error_report("qemu: could not load kernel '%s': %s",
+        error_report("could not load kernel '%s': %s",
                      loaderparams.kernel_filename,
                      load_elf_strerror(kernel_size));
         exit(1);
@@ -134,17 +134,16 @@ static int64_t load_kernel (CPUMIPSState *env)
         if (initrd_size > 0) {
             initrd_offset =3D (kernel_high + ~INITRD_PAGE_MASK) & INITRD_P=
AGE_MASK;
             if (initrd_offset + initrd_size > ram_size) {
-                fprintf(stderr,
-                        "qemu: memory too small for initial ram disk '%s'\=
n",
-                        loaderparams.initrd_filename);
+                error_report("memory too small for initial ram disk '%s'",
+                             loaderparams.initrd_filename);
                 exit(1);
             }
             initrd_size =3D load_image_targphys(loaderparams.initrd_filena=
me,
                                      initrd_offset, ram_size - initrd_offs=
et);
         }
         if (initrd_size =3D=3D (target_ulong) -1) {
-            fprintf(stderr, "qemu: could not load initial ram disk '%s'\n"=
,
-                    loaderparams.initrd_filename);
+            error_report("could not load initial ram disk '%s'",
+                         loaderparams.initrd_filename);
             exit(1);
         }
     }
@@ -338,7 +337,7 @@ static void mips_fulong2e_init(MachineState *machine)
=20
     isa_bus =3D vt82c686b_init(pci_bus, PCI_DEVFN(FULONG2E_VIA_SLOT, 0));
     if (!isa_bus) {
-        fprintf(stderr, "vt82c686b_init error\n");
+        error_report("vt82c686b_init error");
         exit(1);
     }
=20
diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
index fe4f17389f..18b5ff733e 100644
--- a/hw/mips/mips_jazz.c
+++ b/hw/mips/mips_jazz.c
@@ -267,10 +267,10 @@ static void mips_jazz_init(MachineState *machine,
             sysbus_connect_irq(sysbus, 0, qdev_get_gpio_in(rc4030, 4));
             break;
         } else if (is_help_option(nd->model)) {
-            fprintf(stderr, "qemu: Supported NICs: dp83932\n");
+            error_report("Supported NICs: dp83932");
             exit(1);
         } else {
-            fprintf(stderr, "qemu: Unsupported NIC: %s\n", nd->model);
+            error_report("Unsupported NIC: %s", nd->model);
             exit(1);
         }
     }
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index ec6af4a277..9702ff85ff 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -812,7 +812,7 @@ static int64_t load_kernel (void)
                            NULL, (uint64_t *)&kernel_entry, NULL,
                            (uint64_t *)&kernel_high, big_endian, EM_MIPS, =
1, 0);
     if (kernel_size < 0) {
-        error_report("qemu: could not load kernel '%s': %s",
+        error_report("could not load kernel '%s': %s",
                      loaderparams.kernel_filename,
                      load_elf_strerror(kernel_size));
         exit(1);
@@ -846,9 +846,8 @@ static int64_t load_kernel (void)
             initrd_offset =3D (loaderparams.ram_low_size - initrd_size - 1=
31072
                              - ~INITRD_PAGE_MASK) & INITRD_PAGE_MASK;
             if (kernel_high >=3D initrd_offset) {
-                fprintf(stderr,
-                        "qemu: memory too small for initial ram disk '%s'\=
n",
-                        loaderparams.initrd_filename);
+                error_report("memory too small for initial ram disk '%s'",
+                             loaderparams.initrd_filename);
                 exit(1);
             }
             initrd_size =3D load_image_targphys(loaderparams.initrd_filena=
me,
@@ -856,8 +855,8 @@ static int64_t load_kernel (void)
                                               ram_size - initrd_offset);
         }
         if (initrd_size =3D=3D (target_ulong) -1) {
-            fprintf(stderr, "qemu: could not load initial ram disk '%s'\n"=
,
-                    loaderparams.initrd_filename);
+            error_report("could not load initial ram disk '%s'",
+                         loaderparams.initrd_filename);
             exit(1);
         }
     }
@@ -1034,9 +1033,8 @@ void mips_malta_init(MachineState *machine)
=20
     /* allocate RAM */
     if (ram_size > (2048u << 20)) {
-        fprintf(stderr,
-                "qemu: Too much memory for this machine: %d MB, maximum 20=
48 MB\n",
-                ((unsigned int)ram_size / (1 << 20)));
+        error_report("Too much memory for this machine: %dMB, maximum 2048=
MB",
+                     ((unsigned int)ram_size / (1 << 20)));
         exit(1);
     }
=20
diff --git a/hw/mips/mips_mipssim.c b/hw/mips/mips_mipssim.c
index e5d3654586..e0ba5efc84 100644
--- a/hw/mips/mips_mipssim.c
+++ b/hw/mips/mips_mipssim.c
@@ -78,7 +78,7 @@ static int64_t load_kernel(void)
         if ((entry & ~0x7fffffffULL) =3D=3D 0x80000000)
             entry =3D (int32_t)entry;
     } else {
-        error_report("qemu: could not load kernel '%s': %s",
+        error_report("could not load kernel '%s': %s",
                      loaderparams.kernel_filename,
                      load_elf_strerror(kernel_size));
         exit(1);
@@ -92,17 +92,16 @@ static int64_t load_kernel(void)
         if (initrd_size > 0) {
             initrd_offset =3D (kernel_high + ~INITRD_PAGE_MASK) & INITRD_P=
AGE_MASK;
             if (initrd_offset + initrd_size > loaderparams.ram_size) {
-                fprintf(stderr,
-                        "qemu: memory too small for initial ram disk '%s'\=
n",
-                        loaderparams.initrd_filename);
+                error_report("memory too small for initial ram disk '%s'",
+                             loaderparams.initrd_filename);
                 exit(1);
             }
             initrd_size =3D load_image_targphys(loaderparams.initrd_filena=
me,
                 initrd_offset, loaderparams.ram_size - initrd_offset);
         }
         if (initrd_size =3D=3D (target_ulong) -1) {
-            fprintf(stderr, "qemu: could not load initial ram disk '%s'\n"=
,
-                    loaderparams.initrd_filename);
+            error_report("could not load initial ram disk '%s'",
+                         loaderparams.initrd_filename);
             exit(1);
         }
     }
diff --git a/hw/mips/mips_r4k.c b/hw/mips/mips_r4k.c
index 3bbb1827e1..2e2f9aa5cc 100644
--- a/hw/mips/mips_r4k.c
+++ b/hw/mips/mips_r4k.c
@@ -97,7 +97,7 @@ static int64_t load_kernel(void)
         if ((entry & ~0x7fffffffULL) =3D=3D 0x80000000)
             entry =3D (int32_t)entry;
     } else {
-        error_report("qemu: could not load kernel '%s': %s",
+        error_report("could not load kernel '%s': %s",
                      loaderparams.kernel_filename,
                      load_elf_strerror(kernel_size));
         exit(1);
@@ -111,9 +111,8 @@ static int64_t load_kernel(void)
         if (initrd_size > 0) {
             initrd_offset =3D (kernel_high + ~INITRD_PAGE_MASK) & INITRD_P=
AGE_MASK;
             if (initrd_offset + initrd_size > ram_size) {
-                fprintf(stderr,
-                        "qemu: memory too small for initial ram disk '%s'\=
n",
-                        loaderparams.initrd_filename);
+                error_report("memory too small for initial ram disk '%s'",
+                             loaderparams.initrd_filename);
                 exit(1);
             }
             initrd_size =3D load_image_targphys(loaderparams.initrd_filena=
me,
@@ -121,8 +120,8 @@ static int64_t load_kernel(void)
                                               ram_size - initrd_offset);
         }
         if (initrd_size =3D=3D (target_ulong) -1) {
-            fprintf(stderr, "qemu: could not load initial ram disk '%s'\n"=
,
-                    loaderparams.initrd_filename);
+            error_report("could not load initial ram disk '%s'",
+                         loaderparams.initrd_filename);
             exit(1);
         }
     }
@@ -195,9 +194,8 @@ void mips_r4k_init(MachineState *machine)
=20
     /* allocate RAM */
     if (ram_size > (256 << 20)) {
-        fprintf(stderr,
-                "qemu: Too much memory for this machine: %d MB, maximum 25=
6 MB\n",
-                ((unsigned int)ram_size / (1 << 20)));
+        error_report("Too much memory for this machine: %dMB, maximum 256M=
B",
+                     ((unsigned int)ram_size / (1 << 20)));
         exit(1);
     }
     memory_region_allocate_system_memory(ram, NULL, "mips_r4k.ram", ram_si=
ze);
@@ -238,7 +236,7 @@ void mips_r4k_init(MachineState *machine)
                                    blk_by_legacy_dinfo(dinfo),
                                    sector_len, mips_rom / sector_len,
                                    4, 0, 0, 0, 0, be)) {
-            fprintf(stderr, "qemu: Error registering flash memory.\n");
+            error_report("Error registering flash memory.");
 	}
     } else if (!qtest_enabled()) {
         /* not fatal */
--=20
2.14.1


