Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRiAS-0007EM-2x
	for mharc-qemu-trivial@gnu.org; Wed, 20 Dec 2017 12:28:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiAO-0007BP-TY
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:28:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiAL-00063U-Sy
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:28:28 -0500
Received: from mail-sn1nam01on0081.outbound.protection.outlook.com
	([104.47.32.81]:40544
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eRiAL-00062t-LP; Wed, 20 Dec 2017 12:28:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=H8w7/Dv0bLgiwuN3e1H6dpfFMBXgFYZanZDrQU8j0VI=;
	b=d0urlWLnk+93c6A+EzVoeEN8XHiwhENRz9lHi1zt5gQtafOC/c8MBhWPd/muuOzSSQ8yzPs/YOtxNA6bGQuQK4B4afFoJfwG1sZQ2m3mornhtCDe0srdomajdI4G6oR68a1Eizz3PhhN6X/3kuorWWZ07gAIhZbDT38o1MUCF9A=
Received: from BLUPR0201CA0035.namprd02.prod.outlook.com
	(2a01:111:e400:52e7::45) by DM2PR02MB1339.namprd02.prod.outlook.com
	(2a01:111:e400:50c8::26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.323.15;
	Wed, 20 Dec 2017 17:28:22 +0000
Received: from BL2NAM02FT043.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::206) by BLUPR0201CA0035.outlook.office365.com
	(2a01:111:e400:52e7::45) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.323.15 via
	Frontend Transport; Wed, 20 Dec 2017 17:28:22 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; walle.cc; dkim=none (message not signed)
	header.d=none;walle.cc; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT043.mail.protection.outlook.com (10.152.77.95) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Wed, 20 Dec 2017 17:28:22 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:49598
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiAH-0003rg-FD; Wed, 20 Dec 2017 09:28:21 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiAH-0003iR-C8; Wed, 20 Dec 2017 09:28:21 -0800
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBKHSIh3008349; Wed, 20 Dec 2017 09:28:18 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiAE-0003i0-5X; Wed, 20 Dec 2017 09:28:18 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>,
	<armbru@redhat.com>, Michael Walle <michael@walle.cc>
Date: Wed, 20 Dec 2017 09:24:02 -0800
Message-ID: <48d2cc59ffc16788bc78c8a508c670d6cd03ea53.1513790495.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(346002)(396003)(39380400002)(39860400002)(376002)(2980300002)(438002)(189003)(199004)(81156014)(54906003)(36756003)(81166006)(9786002)(8936002)(63266004)(50226002)(106002)(8676002)(2906002)(2870700001)(356003)(7696005)(77096006)(76176011)(23676004)(5820100001)(316002)(47776003)(4326008)(118296001)(39060400002)(50466002)(478600001)(305945005)(110136005)(36386004)(5660300001)(2950100002)(6666003)(106466001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR02MB1339; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT043;
	1:e+MF3C/OBy+tDLy172bI+pRc2RY+sKJmcH3deX2TIe5rFlPeJGFVpDLfxv4Z8GBNQ4XD0CqagDdQOQXDXMv8d6io9h3paZiVNMzNstxy8LkDipUYzxSzLr+LEJlzEHO4
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4700cb9-3c4b-4c58-c6d1-08d547cf11d9
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:DM2PR02MB1339; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1339;
	3:hChwTCDnOHsrBfxAY2IWCoggctxlyKUIOeh1LruBbFFSDVztF/DkZYkPsrvjrCxgmN9y3zD2Ga5fyi4kfxnoni3NzQ4os70/YVGX7N2s9az15RCKPf17rcgVes7CVECcLxFjxPhiLMz1HnDcpdOzbArNslWx0RdjmvobAgKS4rEEsDx9CLO3+C8VSISew5oYeQe676J98CCtFrPRWxWTTh2pAvzyxYtvy2D8Yd21d1S6IG1hLBPmMLdBmcsGkVHdHheYep0PFJpiE9T3B27q9Jxb/SbOqcrHVWI+X+/B4fplWdESjZoWx15jQNGuUDsCbuS+tbidbRUpNPX506FOloCjjCQefMZ9lIk7yMY9xQo=;
	25:wgbfMiJ4B093guIEuFobd9qQY2fCJ2WSJus0jPWDUneN5t8lpaQzU6zSBnxrLd9OptiNEOHhsEKwoHDfRo1LdpjCa+wIH1aORK4t+yldBH+tOYHG9PF/TUVFjWTXqDMe92mpsX9zf9yhkxoN6FPQKF67pwFnxpjMnb3j/R6MhEQM6q6V+Zm6YdJ6gYS38mso1ibAzRw9KnQXiuyZQ+0yx8OY7XspbSkb8vWdlo7UylPW6Dm/YaewvyUG3yr7Q+lwN6IQoDQ1KqP+kqgS5vk4MXUvJF11tKAr3+w8CCsWLeJd7wsLBuXb/EZBpUJcjj2ZUegylwWvsWi/mzlg0pZrZA==
X-MS-TrafficTypeDiagnostic: DM2PR02MB1339:
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1339;
	31:WEzfAnC4wzEFBQLOiISIDRsWU040Rj7bTMFnLw+cN6GSEz0JfHKiyApmjvAG81WPCU7U6pgr+o83py+UmoFb5HvmGuurQ8HLoIXyG9NGr0kjUorqHKfTszbkxO2JYxq2NEnKY0jbQuLo8+Vu3NGoWzcgQtYMRoWv1zrQtH2gOT7LMnRVQb2Zg3C49BEK7x8Z3nu0Jn9biunPgUcRAvGV2F3b7gQcr02WDQBWuXjSH04=;
	20:Kko6iUqayoZMrTeB8Ij4g5D6Ay8qsTa0gWn/wW6L4Ip0zmzZeBY8zw6699PJFCOJATkGdvtJVktrwGnyR3nm/qCg0IyvttRKDXaL/7+2R3cZAV0rSffmZEANf/gjOnOSfubkdL5Y55RmXgtqcvf44bBWH1ob7dZtvCXhUOggAMOMICddUOQkTVPC/0zZCAHBgW4hKvPThuofdRBI/TuL4i5GpEBu0iCoWE9Wn8kpqi+yNSusSEfTDr447JHS7+jhOTW+7SoPLqx6JJF7y325+4pVY9iyIgM52M0BysuMZdRQRWumMw4fFGW/xOf2Dd02KNAgzUTJPkMeHs7lOq7TRmsr5qv8kbO3FqXtK8xUYzZ7U4iYzHNKFPuSCDyGRPatSLVSNN8KJVNUEzuO1hY6UnIcFOdH7U7rCHIv4T9BXEnUFNcVsIcJcL2VzsaeBciQjH0IEqzMbV9OVhaW6eOzFZ/Zrm4tmwU/LnDyhdvYJH30mLjWFojNW9cKtROrvqyo
X-Microsoft-Antispam-PRVS: <DM2PR02MB133922D6CBC65F91126353FBDC0C0@DM2PR02MB1339.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(10201501046)(3231023)(93006095)(93004095)(3002001)(6055026)(6041268)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123564045)(20161123560045)(6072148)(201708071742011);
	SRVR:DM2PR02MB1339; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:DM2PR02MB1339; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1339;
	4:LJrbUNMRa13ayKpTtxIt2EBEoBt2gX/+lk6Zs4m4CbBBdLv7UOwAaqV9On6hh1ZjyAkkaOhruASblDeQQgVYRHFS+dbYo2hlo9plh17xHds0LjQ6U2zoV+0Lrqt2+Vk7zA6x8UWyQ4Ml9B2OcOPsgJJOtebFhQZPcgaYPDuNCNr/nLoi+ov60Qb4V9RBm3jsvLxi/2hSQ02CLjAzlzscfnnW1bO6+cgAX3VWZRCyz+qJXuJiRJMh2/LXjPlSgv8lAUJy6O5nJkINW9v7ChO/mqHO0fWcsxOIg5VwHW08rsNzbvF7b/rbsmzcVBvmUZ0MV20OMq4qqLHjJSjEdZP2pQ==
X-Forefront-PRVS: 0527DFA348
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR02MB1339;
	23:mNKQ0zfD7Re2OmWjTbT+jJp5ybqKldXTzRoMXgDq7?=
	=?us-ascii?Q?J4S50OPxKSlyRfurzdRLZSiWrtdz/EKHxMUv/NsbpzpGrU1/vPpuUKbEOW1g?=
	=?us-ascii?Q?0A+BXji2D+XBB3wtGTX8mhHlmEUgfFdHbimhKahPCsV5A9XF63FK5JbK15Nv?=
	=?us-ascii?Q?tofxVKC0B1/wajIkEP7aL9Ug/aMCuR1onGFCclh6rhAm08Lw+YPTSFN25lif?=
	=?us-ascii?Q?K1eYaGJp/1qkKPlZNIKNpR7DUPGhuY7Ipi7MW0a31oNsHMP647nEXgU/zGJj?=
	=?us-ascii?Q?y3fawpmP5neealGQ8EgI2MsgqLagfVE2fBiS151+H5AomIfGz+D9HBhRdHAx?=
	=?us-ascii?Q?zefAWGeiVaXvW6+6iLRKlThLjBmKIwxVUWPRwuZUJW/M90aIHLnj/Tiq7Kmq?=
	=?us-ascii?Q?KxErB6BdisSYrRhXU7LnOsNYYhZtYRu22XcTl2h1nsH4sKQYFYS8pZhiG+4z?=
	=?us-ascii?Q?DwazHrvPqsdmIYVPDNvd5czSSTKmodNY/QkWe7kVfXGWp0AfLiNol65p1Wx0?=
	=?us-ascii?Q?zGx+zK3ICnhcluBthY9jcKzEMU8EVlhmZDzEgdSlXRW+fZn08BxxG3cz6B1r?=
	=?us-ascii?Q?wF5c8CaAHjgrtnX2e/G5Yjtiuom0+AvHCH0KZXnKbmUWlbuYlcW0bBQuLppk?=
	=?us-ascii?Q?kvIu4SDMZ1BhVNv2BQbiLvLzZTaKwMQ3yCfakpcUeQpf0/3uT9UTqJGB63qd?=
	=?us-ascii?Q?bBo1QBf3064q9dGn06Numqf0xOBwPPkypMPRtJAW/f2ovuEGAc1wCbfOPNUt?=
	=?us-ascii?Q?sFPcyTA2UzXqVetS9zU9eHhfIJ/rxmZ6WfxUHii1zLDVd825Kq+sQNqWNyV3?=
	=?us-ascii?Q?MUSbCTaJyszC45QjPgtx3UZSzuH58KLpolgalyXEUf8vKCW44xd0Vi2o0ch8?=
	=?us-ascii?Q?lTOjpszrW69NTG2xUP4heCKn/RzwcSoQtRiRWJAVUkkjWh6spfrL9PMyopGP?=
	=?us-ascii?Q?VmsKZytWTDlHAPbR4rU8I0zipc2JXJzLGWGpeuSS0dO7q4WXHbSmJMg6a8VT?=
	=?us-ascii?Q?by5nyymPDaZu6m9Zh8lyDKU67G6T4eXB2i4tGHCHhh7idk5QcfWIpIVHnmDa?=
	=?us-ascii?Q?C7/ab0=3D?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1339;
	6:w2YWJ8SFxYHk7lWQ1CqNzAjXx+6tsvpS/4JVEM51sJxUBv3v3q9p3NrDyoQWl9gjWMreSb9Kdput9qNfUFZyaRdI6GBRMYv30aQ91Mmrd0TuvMKwqx4J7YZz182olwmQEQyjKqbOpC9emuXjvvv6cMM5nIspem3kSzwskM/7EZDo7d3v1cbfZWSzt97qOxDHwJHuEWHEWu/gaVXNY3smMUnjQ3yvCXchUXaBfix+X/kLUkUg9KIlsBxiagYf0BpEDXT4u6oMvM2uBkcRDoARvjjttOhlLlbNq7m82JmFORTUAq2RZdX6J/R5jNRZcAw/N3RiUmueYj7XRTiBAQQjSdNHJJ9pTIVoJce7sPPOWqU=;
	5:6P+FazLdUdj0/OBYr3nsW0A3JFKd4i4+0GeK+kEZlMQu82FfBgbQcQj3m3erlPXiae6kh+6KuE/z4FMQ5m+asMyGDHbJbicCJ97B36f/Unl3rODqCaE+BoQejE05PJkhlj9Zm34iuKNxph1jyFM0cfMjM8/nsPKKm4SO2yAGBEo=;
	24:wipN7DlUFFvW2doQXnzma6qV3ZIRggR/WpiFOlVGVERYO5BkbOsWR6qYc0TOjieiQM5wHxhfNZBDgFAs6aZmgt9JvEsv7iaDT8qrVn2/Lks=;
	7:q7KNa9iPDkEfxTC1JWrq/JSLtrPDu9QaaljtCRwfmEVqeq+KYBhpSV+NJLvSN6T66gttLFCKY35Y9QJADV+7YDtNai0r9Wr2t+zdRjwFCkmOFGSPZcbhM7WGLp2H+0mzizYQzP27IW7N2P45Hi59OllrVxtNWPKd/0w7AsGiB1b7M4Pe7WWYfwtV1mCpOLLZLm10H8EmaTKy3N5eauhjbmdioIS4f7xtRuRXJRLFWE6bY0sxt86TMiYwmaI+6uX7
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2017 17:28:22.3424 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4700cb9-3c4b-4c58-c6d1-08d547cf11d9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR02MB1339
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.81
Subject: [Qemu-trivial] [PATCH v6 13/29] hw/lm32: Replace fprintf(stderr,
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
X-List-Received-Date: Wed, 20 Dec 2017 17:28:30 -0000

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
Cc: Michael Walle <michael@walle.cc>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Acked-by: Michael Walle <michael@walle.cc>
---
V2:
 - Split hw patch into individual directories

 hw/lm32/lm32_boards.c | 7 +++----
 hw/lm32/milkymist.c   | 7 +++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/hw/lm32/lm32_boards.c b/hw/lm32/lm32_boards.c
index 002d638edd..527bcc229c 100644
--- a/hw/lm32/lm32_boards.c
+++ b/hw/lm32/lm32_boards.c
@@ -18,6 +18,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qemu-common.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
@@ -148,8 +149,7 @@ static void lm32_evr_init(MachineState *machine)
         }
=20
         if (kernel_size < 0) {
-            fprintf(stderr, "qemu: could not load kernel '%s'\n",
-                    kernel_filename);
+            error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
         }
     }
@@ -242,8 +242,7 @@ static void lm32_uclinux_init(MachineState *machine)
         }
=20
         if (kernel_size < 0) {
-            fprintf(stderr, "qemu: could not load kernel '%s'\n",
-                    kernel_filename);
+            error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
         }
     }
diff --git a/hw/lm32/milkymist.c b/hw/lm32/milkymist.c
index d4e765f2eb..85d64fe58d 100644
--- a/hw/lm32/milkymist.c
+++ b/hw/lm32/milkymist.c
@@ -18,6 +18,7 @@
  */
=20
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qemu-common.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
@@ -145,8 +146,7 @@ milkymist_init(MachineState *machine)
=20
     /* if no kernel is given no valid bios rom is a fatal error */
     if (!kernel_filename && !dinfo && !bios_filename && !qtest_enabled()) =
{
-        fprintf(stderr, "qemu: could not load Milkymist One bios '%s'\n",
-                bios_name);
+        error_report("could not load Milkymist One bios '%s'", bios_name);
         exit(1);
     }
     g_free(bios_filename);
@@ -184,8 +184,7 @@ milkymist_init(MachineState *machine)
         }
=20
         if (kernel_size < 0) {
-            fprintf(stderr, "qemu: could not load kernel '%s'\n",
-                    kernel_filename);
+            error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
         }
     }
--=20
2.14.1


