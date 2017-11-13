Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eENOH-0002lT-Px
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 17:39:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56880)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENOF-0002ip-1J
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:39:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENOB-0007CF-SG
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:39:39 -0500
Received: from mail-by2nam01on0053.outbound.protection.outlook.com
	([104.47.34.53]:55072
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eENOB-0007BW-H6; Mon, 13 Nov 2017 17:39:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=obxq3g6PedzAFxmej/Tt9dTotDLqxxsaNp1uUhcUcQI=;
	b=BzCIF2Fh4jnbP9rWn1fosxFMPbC7AxcM8lrUYVPkkE8qJthWQ77mEb1Ybd8LmlWOzH7l45Fo0pXJ6/7Ks4S11ko2R8Osx/0KV9ZMtrKN+Vp7MfbQVEFVD12wYV5Beiwa2jezvg9WmA1Rukba6HhL0VdRtOAqld6J/cTCpGlzhRc=
Received: from BY2PR02CA0112.namprd02.prod.outlook.com (10.163.44.166) by
	BN6PR02MB3377.namprd02.prod.outlook.com (10.161.152.165) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.20.218.12; Mon, 13 Nov 2017 22:39:32 +0000
Received: from SN1NAM02FT062.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::203) by BY2PR02CA0112.outlook.office365.com
	(2a01:111:e400:5261::38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.218.12 via
	Frontend Transport; Mon, 13 Nov 2017 22:39:32 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; moxielogic.com; dkim=none (message not signed)
	header.d=none;moxielogic.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	SN1NAM02FT062.mail.protection.outlook.com (10.152.72.208) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.197.9
	via Frontend Transport; Mon, 13 Nov 2017 22:39:32 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:45666
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENO7-0004Vs-Av; Mon, 13 Nov 2017 14:39:31 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENO7-0000TQ-85; Mon, 13 Nov 2017 14:39:31 -0800
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vADMdNVo012612; Mon, 13 Nov 2017 14:39:23 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNy-0000Sc-Rq; Mon, 13 Nov 2017 14:39:22 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>,
	<armbru@redhat.com>, Anthony Green <green@moxielogic.com>
Date: Mon, 13 Nov 2017 14:35:22 -0800
Message-ID: <ccfeb16d932f9570efc871c6aa1c2d1229bf31ba.1510612380.git.alistair.francis@xilinx.com>
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
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(346002)(39860400002)(376002)(2980300002)(438002)(189002)(199003)(4326008)(81166006)(2950100002)(50986999)(63266004)(106466001)(50226002)(5660300001)(39060400002)(76176999)(23676003)(2870700001)(36756003)(118296001)(2906002)(9786002)(305945005)(77096006)(81156014)(356003)(33646002)(8676002)(478600001)(110136005)(50466002)(8936002)(316002)(47776003)(36386004)(106002)(54906003)(189998001)(5820100001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB3377; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT062;
	1:nl0lW57OreVEz10Jene3c9vDC1XzDntcQbjboA2U+NdgS+xK3+6S+SZsKh6tm5vuPZuu0Fn8nU2/sUjUzaouCjujQ7Yw8hHKDAZs1yhbxWRSy03x2aVPzPfxSEaCDm/e
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3cbb3337-44c4-4525-b47b-08d52ae768b6
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:BN6PR02MB3377; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3377;
	3:49bKDfBKKZhhX6QmRWXaHQoJXnNuySnC1j1xKVGgJc0sMY/VF8ZKRK3OzVA7kXfvD8OS4c7f1adOa47SlSqohYPRJ+OAD2S8vRiDv3yLnZEB7C5fXPb+9G0aaYgOieYml9K6NcFYSO+CUNETms/ebYICcfuM5Hy9Jzl2rK289NQV8nU+TOfLGSeiDC4UORkBkjNZ+hUS9OkJeGAiDcfRoAtw3okxvXwC488TgQhDfd6C1KsV606RqfwXwqE5Nz2ktYxQ2H/Ol9L4Bf9dPsBL4Br612p84Fq0gPgPHY0gDL+/oGz4ZnBHFyOI2qnIw/aJ0IsO7/sV8lg/NGLeAEdxu1yqu26OnhFU1a+8GkqfhuE=;
	25:JgU1iQM/WV/kqMl5vVUe9PtLuxLW0pLaXpTd6Qmf3D4VCanyZMdd1Hs6BjZn9ZBLi+2RTnO1L3vwZMmOgYVwzx0bekxhj/thbUAYNNMp6nwfSNNa3zmOQeMt4tlua38vPM2GHMSWTPtDX4Ao8MJLbL6tBWDflZ+OFBUCvfRubtJ/kQtmbnzhbti0VOJM2Y0Eu07ZTHzxf7tfX2pRt1gRUaJTAC6JLX5cQRhQ5Tz16fccbtXq6kcD7GT4ALL5A8xj7B+j0Wqu6l9UDBngRRBtT44yjpRGeFh2GBq6yrJOAJhOwH+mH66aPv9tn0NmE7uyLk7sGLOg/2TrSkAfWBLHl/j8CCsQYo7pWP5UA5caFeE=
X-MS-TrafficTypeDiagnostic: BN6PR02MB3377:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3377;
	31:tiy8MO8PpugesEB9WiwzJSLcEpXA60RYW1aJwPcafxcizX10aV0YkWxin+IuqFUSCntyK3dpskILXVTTi3O/cRDGwCI+BIYToechGZQA9G+bFHcrse5ftVSg/y4qPEOHq/1NF4q25VZCZLJN9kChGUUfQDjdFaLRghF+av0s/RDWKPvnNbUgzRoaTNnJWf6eoUeeq+kWLxZuKZLehE1NaZIlvRGq0NY48P32n8JtDnE=;
	20:5mOf8gCXCF6xv9sPTCgdoz8wPt4SRO8lcie+8PNpr/xnt57+qsaXvJd+Rl3vfBVpjXvp1VGyaaxSXLTTl7rqBvkEbbkHQn/sfTXSkYc6n6LCN+Uvj9TVTkcZeUt30yzW/oMo6R1sAjdJlE73CX4d+jTPlB7E+oz08ge7H9L3xXcxgibFuPQwu2C8c01cvQzpJbXvKLf7Qs7cFyzkA2twSnLXodY6xZ/v3I68adTvVOps6hluis4Q8k9CKcMPpU/CGfcTky153r51oP/whTIZkHfxfZTKV1S3t27sCYTZZerf6tbMXMhMBURlKsVW9JE0aLUDwPoQr4MjuNBZ9wCMgdQ+v6pWhVJHsFDHDjx+3v8NUbaT/QPRkYz9c7ieBUSoG822AXfKzQDEKnYBNP8flJ6QVgbZLPDTEQ8a6snSv/VF8bweCVBIdN13TXyymni+czjHMiHfqoJop8reGltv1xJKjHHm1xv7dxcsjrgkvvyIqXMPMBzqVGFdjKkl8c3f
X-Microsoft-Antispam-PRVS: <BN6PR02MB3377783F0F4F0A1CC67AFA4BDC2B0@BN6PR02MB3377.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3231022)(93006095)(93004095)(10201501046)(3002001)(100000703101)(100105400095)(6055026)(6041248)(20161123560025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123558100)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR02MB3377; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR02MB3377; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3377;
	4:dNlqY9vQTyVg643y9U4PrbK9Qi1e3Ju1s1DBWJ4OA+OVhbW8ke3friRE4MgZWDH/+Xo2gqgwZmo4r/RCn9zfuMqrQZHEvhLtkoIsLGVg9RqNgNrgbn7a1ZwIe4J8uOGUS4a0HF17EZg8vDR7w7Hf2bSivZlov90Q9GVOzopYENTCfar+lZmMZ0jb0alt+LMQHEtN5JHKdMZ3n/my3ZgMrHAkj+AqzuRcj96r2LjHHF/e27ppON/UfL4/klmyN+h7aLJDzeCTMnHzzn+zUesbzw1FKX5zlO9p8fp/JqLSn6fESXwffCXOSFCt7lT6qKHXHnpmzxrZEKPPjoRTW41yMA==
X-Forefront-PRVS: 0490BBA1F0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR02MB3377;
	23:GCrrre8+yWspqahGi8csMbcxG+jqKF4pCZpXqrTfN?=
	=?us-ascii?Q?Xin1S64gpld5vw6eFGflxyIrU9BCEWu3murj8rSf8g2uC5YVEC1SCVl6n7Sw?=
	=?us-ascii?Q?h1XlqluUnJgEOIHt5cziL8QzBCfyl8W0npG+NRNcytdNvYuqfQ7CU24kCLHq?=
	=?us-ascii?Q?JAcEN2KlDNphWdOM/dbe3aXIce6EbxIqjSaGYx/9IZnNymB0lfSz6oepqUDF?=
	=?us-ascii?Q?WGmXUSPu85pafT5D7eyOaozFEv+1Pa/2cL6YKL7ujGQcoeU+Dq2Nl5gvvP2v?=
	=?us-ascii?Q?twLjh6uWtudzB1ea86YIjSWZZxEZ3MtFJw8+bnXbcQaxHiTlsePNx2vD1KLR?=
	=?us-ascii?Q?d04NPJMxfKp2egChAStMQtfhbo1V3H9LhML3rfGUAuyZMzmjy/fiAsXIqMhH?=
	=?us-ascii?Q?84D5VuocxaA9dnaOerxiWrBzQDKRqq0qydwn+H5ay1A59aFMiNlkmYrQwGVh?=
	=?us-ascii?Q?dTCxwpPu+KheY2U5X+WtN3fp4WNKiqKZJQhTsr3RWOjgZGpDRlNgikNnoWeI?=
	=?us-ascii?Q?CbfVEb6rOKDQJMVU1Fpba3esBQwiqAb+aNsNPzDlAWzK2y3gIpok7hKwlNus?=
	=?us-ascii?Q?emL4sV/GRASVJ74C/FNZqw6xveFIrw18Y+ccHJjHdpjT9xwpKiTEGMxjiMpd?=
	=?us-ascii?Q?VWx8pzLCVBOWEDyO2BL+EgPXa38VnNWf6qzsdlA1nx1ymDHRNAGVtIf1ttXd?=
	=?us-ascii?Q?Un1uaI0x3r1Y2cxJsAk34RlBF1oQrqpN0gfOweMt9gS67RJzRkqq1Ohkzasg?=
	=?us-ascii?Q?zlWMk+GyDtxIYwQu3qsbw2b1cBs2wTv51qklQC7yVVoJrBhNdtj2uQaHs93v?=
	=?us-ascii?Q?zFqwuqyinRLni34oA4JJPf2iKkdOINgsFE0WaBK9FejCI0SyRU0/RguFZmQ5?=
	=?us-ascii?Q?3B2FKMLv/lkLZMVcnyhyI7G3vaPz0ffdG9SJOeNoqz6itH6kayYGdvRX3HT1?=
	=?us-ascii?Q?7SzWZUf9ol1K+ifJNtr0wjaKfDDxVUQYqL/j8R3Jkx13ft6NwADVs/SyTqrU?=
	=?us-ascii?Q?Nw9SJDv8U5HqsYnjYbU2NyZnSE5FpLQR6HMMxWDOSFeVq6Jvf5kTBDwAiZsv?=
	=?us-ascii?Q?M4kUkc=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3377;
	6:7DjkHpB/PZ9pjX6oGGmH1qqoayxx1BtHr0ctNTKl49gpnc1RvImD0Iv3WTpKTJPHOWhtLz08dtHCyFCRsgSu0Soi1BCtJpozGjmOOuqJCcerZaInDPh3FuuG1N8Lvmha6q6hTVnit15Rg/cZdl/SzF0Seb3aCI9AvolOTmUgQQepwFbdJAxmDomZo2BmaoE3KTbQLVsf9jKrv9fuumvWzYVWzjCVhsUV0PqP0E5MOQpIFTwYBixDKC4/3UXsYJnlDn7CXjrE0TG64QkSK2egLgM6OGP8uE+exA4nSmOFASRe8SyAgEVXcxPfHW8mFYjMfa3jZn1cRa1PuXjybSVSw4vYmFEUPGUYym8D/Dr0XVk=;
	5:pBVunw5R+IOmDvC6xZMsKDJu2RUY9NChBbg02ugdzSJutFp0ueQY9K0+uWvI8r0cSMlXeMf23xoUfMVJMYigx/Q1Sl/L6w6u/umJ4FF6ma8siSs1s8tjaToCzdRvZvZXA8tnWQghfoGld3HXVl0lr5QSZujfP1V4GRS9hlpBpjs=;
	24:8bDav6zgVOS+urU/kT9etqQv1Caki1l/jDqm8HdWXOKRlY9MRUOYFvtpq1ZAV4ji4ZTuR7ilQbUfFTJ21QU9AFb8YXyghZ1GYnDCpN3Ln9M=;
	7:izE3vfhQ98LyUuYqHYNxGDvZ7UtXxJ3I1itv3mO1KSjkb8zhgKVPPr7KnlfvD2ELCwQUS0NauZrFddqiTmcbqtYf3CgzU9P4fojw3UZ+/vx2xPSlnw2XcSAuQWxvlT9fGvg1xSBU0pG+bcOzbARsnkXnNaDgDOzA+enkz3ytefai363pUXVmTYjtXSltPdg1zrXy7IEs0gvNShxUEgvsC1sO8QDRal5lWWGUf/21FlXdYzsnYrL1ZZjXSZ8BwZV4
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2017 22:39:32.1815 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cbb3337-44c4-4525-b47b-08d52ae768b6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3377
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.34.53
Subject: [Qemu-trivial] [PATCH v5 15/29] hw/moxie: Replace fprintf(stderr,
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
X-List-Received-Date: Mon, 13 Nov 2017 22:39:40 -0000

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
Cc: Anthony Green <green@moxielogic.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
V2:
 - Split hw patch into individual directories

 hw/moxie/moxiesim.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/moxie/moxiesim.c b/hw/moxie/moxiesim.c
index 3ba58481d0..69eb8360cf 100644
--- a/hw/moxie/moxiesim.c
+++ b/hw/moxie/moxiesim.c
@@ -25,6 +25,7 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qapi/error.h"
 #include "qemu-common.h"
 #include "cpu.h"
@@ -61,8 +62,8 @@ static void load_kernel(MoxieCPU *cpu, LoaderParams *load=
er_params)
                            0, 0);
=20
     if (kernel_size <=3D 0) {
-        fprintf(stderr, "qemu: could not load kernel '%s'\n",
-                loader_params->kernel_filename);
+        error_report("could not load kernel '%s'",
+                     loader_params->kernel_filename);
         exit(1);
     }
=20
@@ -75,9 +76,8 @@ static void load_kernel(MoxieCPU *cpu, LoaderParams *load=
er_params)
             initrd_offset =3D (kernel_high + ~TARGET_PAGE_MASK)
               & TARGET_PAGE_MASK;
             if (initrd_offset + initrd_size > loader_params->ram_size) {
-                fprintf(stderr,
-                        "qemu: memory too small for initial ram disk '%s'\=
n",
-                        loader_params->initrd_filename);
+                error_report("memory too small for initial ram disk '%s'",
+                             loader_params->initrd_filename);
                 exit(1);
             }
             initrd_size =3D load_image_targphys(loader_params->initrd_file=
name,
@@ -85,8 +85,8 @@ static void load_kernel(MoxieCPU *cpu, LoaderParams *load=
er_params)
                                               ram_size);
         }
         if (initrd_size =3D=3D (target_ulong)-1) {
-            fprintf(stderr, "qemu: could not load initial ram disk '%s'\n"=
,
-                    loader_params->initrd_filename);
+            error_report("could not load initial ram disk '%s'",
+                         loader_params->initrd_filename);
             exit(1);
         }
     }
--=20
2.14.1


