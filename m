Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRiBC-0007zP-6H
	for mharc-qemu-trivial@gnu.org; Wed, 20 Dec 2017 12:29:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiB8-0007vw-M6
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:29:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiB6-0007Ki-Ci
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:29:14 -0500
Received: from mail-bn3nam01on0063.outbound.protection.outlook.com
	([104.47.33.63]:40181
	helo=NAM01-BN3-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eRiB0-0007Gx-Gq; Wed, 20 Dec 2017 12:29:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=9ZLdBgh0DXKAFEXwVRkYDLnmRZztFchnZ4rLl5gJ1p8=;
	b=0hYmLPJscPIm4PXvR1Wkq1gs6sTEV32joJtDesB4akCo05n+/dmtbY9l4+qlU/9QKIBXmsO9ty+kEFwj5jUhfBXIoBU6GgFiVBxd7c62lbDuR0GWkyVCzJaUlNFhRCA9UyrVmcvhiqocFv8yi38BvaoJiDFhEqrjXaJ+J8OwvLI=
Received: from CY4PR02CA0021.namprd02.prod.outlook.com (10.169.188.31) by
	CY4PR02MB3383.namprd02.prod.outlook.com (10.165.89.154) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.345.14; Wed, 20 Dec 2017 17:29:04 +0000
Received: from BL2NAM02FT042.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::201) by CY4PR02CA0021.outlook.office365.com
	(2603:10b6:903:18::31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.323.15 via
	Frontend Transport; Wed, 20 Dec 2017 17:29:04 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT042.mail.protection.outlook.com (10.152.76.193) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Wed, 20 Dec 2017 17:29:03 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:50354
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiAw-0003ss-Cb; Wed, 20 Dec 2017 09:29:02 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiAw-0003rN-AG; Wed, 20 Dec 2017 09:29:02 -0800
Received: from xsj-pvapsmtp01 (xsj-mail.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBKHSrX8019902; Wed, 20 Dec 2017 09:28:53 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiAn-0003mJ-JK; Wed, 20 Dec 2017 09:28:53 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>,
	<armbru@redhat.com>, <qemu-ppc@nongnu.org>
Date: Wed, 20 Dec 2017 09:24:37 -0800
Message-ID: <4c91df850ffd16249c62680148150c15a2b4c9ff.1513790495.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1513790494.git.alistair.francis@xilinx.com>
References: <cover.1513790494.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23540.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(346002)(376002)(39380400002)(396003)(2980300002)(438002)(199004)(189003)(316002)(8676002)(106002)(2906002)(9786002)(81166006)(36386004)(47776003)(48376002)(59450400001)(81156014)(54906003)(110136005)(36756003)(50466002)(356003)(305945005)(4326008)(8936002)(50226002)(5660300001)(16586007)(51416003)(7696005)(76176011)(77096006)(2950100002)(106466001)(6666003)(39060400002)(118296001)(63266004)(478600001)(21314002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB3383; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT042;
	1:O0+1ZhacEWnDz58JOxnCyuegpsK8QOyEWVqX+cUsA5LULuIqP+FN5IRzUGjRplTO5hHy19mtWwldTupBuYH0s3oAYVHaJPS1I89BYxPh2APjUfWx+1s01qYbHvwLOTeu
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbf0cf65-9317-4c50-9055-08d547cf2a31
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:CY4PR02MB3383; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3383;
	3:F40iHp7cHCSyqhg3VCyDbxApFyf8UFdrLor2wiAx3MSSNxo9rJ4AapWtn8HX2rtvqdqrms5zg8O0FA+bsQDgW8g5bqmW4k4Bmtpry0Ob77wX2TdLVM/4L+1AiIarskNzFgjakPRbSO44GR6GRE43qpo8OwaQCn8PnHeM1xQBYdISAYB/fqbiNjuWvzz3/7vgClTGdn677M61nVS/kICNOVxhigK/nHPf4OL9hi61F3Ohk6ZnM2jTrOEg3CLqM1Qk4KPvum+P21VEZkyGSThdMuM7p5Ozq5UtY4XbWA6qz4I62GTucw8ItYs/Q0YROCV3Cks9Hh4eX/vQs9TU4mLhB4pzx0NX9P55p5N0lfvdduw=;
	25:Z+5CzRN0qvoIEo3V3FK3vDVdMhferfkd3jbS1TpEtW8Ux0Zt1WHAMevfM0rmFc4VmqRuOAzzJSihZrJpeGwpiotHvwZnuZsrMNtoNe0RR4fXkUvWuNenLQfXZelk8lostnrbwvmrnn7gLrf9Lv1tu9E/+xLYvMT1hO1cbmDxU5XSq+P1l3MoweCnpmP8RT8fMMmNNrJ6nyhrIgMqVfgMsjmJCvoCl6SLqMH3jgTI7InofUg2d/Rx9/ByZp/f0LHJgxdufEFCHeY/I+t4iiPv/Iq40uOLhy6orBBhN1x4TfhrEKJTbzRN85lQr7snHd+JvzkqafybO0d1i/q6gVjmYQ==
X-MS-TrafficTypeDiagnostic: CY4PR02MB3383:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3383;
	31:N9qmVuPYIhMF9Gxu6EtWkjQ5qPqGsrKmcXF6wQ1HjrO0n2s2u0rzRvVPQIg2yRnbV/x9A0jI7a2ETAGz62EFFFYO+MJZVLPQlZNFOhsgR+dimJrB97ytT1QB5hvsIGREgr6o5r4+xP9HENIwmZ0v06tbf+JkcL/Ej1wlZ6KWBQGsrWaiTLo9zNRJk8mZrkdyazTRyFcI5+Tgf9gL+pBHeGgv2PWFH9EOYrnHC+5oB4M=;
	20:KvICNqjsvFeyo6wRxNsHn2aDLhPzSB0DiNi+c1FoJhLK0DwTQt64KHO5AoAblOnARb+wRI21Frqgfg5b4qacZeO3+gYbVNUuk8zoc1Qe8VTz72wXyAl/WR4v1gnszwIZrdd7Q1xIhXa8dfEfOGMIIeVxMNbW/PEjMHGaeTY4ePb4bmU7hvrD/hljMRUHpyph+Vh1zujnmoIxrAsF0/cHAC8Zpgukbqtrih+nVxZV+WDxvg7o6cTVLvfb2eYYW8fgEM2uei0buwVfalrPUAPnQJhLygBf/TnmJrWbOGA0o1MtF7WuXEi+b24k8sYqxvvEUD1lFk5xandFHlyATnuv3prpm80RD5RmyNe2PsuyGPIdM9UMasnFCBBNh1801xlNeNcIQan8/3Zf6TjhfJZcMfo1ImUYHvqU4kWEijNkKPl4Iuq9JBPXCn1YLiWFFbT6ppRH0y6owrBSFg1ZZxiNclN44QveEdkWViIo1wsza5LeQmc7kGdH901agBz0WxLf
X-Microsoft-Antispam-PRVS: <CY4PR02MB33832C7AE921C4C88BB1AB29DC0C0@CY4PR02MB3383.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(142945433499172)(788757137089)(192813158149592)(21532816269658);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(3002001)(93006095)(93004095)(10201501046)(3231023)(6055026)(6041268)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011);
	SRVR:CY4PR02MB3383; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:CY4PR02MB3383; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3383;
	4:RDCkCME7Jsbb1OO6Wo7EQsM6Bq2gmJxZmuv1EMbdLAqjYk8U7R75Za8855a7gWHJMlpKRir0aNksGUiPWtlbw3eu8REyrevVQx7GwzXGzdcZc0PcL6WQXamLomyrH/bUN/a6uBDEYpvUDj3o4pfbisw6ggw0667g11atSl1eXw7O+ZkwJT3jEFXBKTDp8OPBcFqq//74lmpaYdJ0YXCOzuwZt1YymaBlzG6bP0BFDNlan3yqil0DJI+UQqeA8VRVrDXzsNwd9FOGaL3PYmNzcrMCQuGb9r55v+1sl//xEnC4PIzPcU7/R1q05h0Bd+52ZjXKdwwdfStzrfPuF5itPRR/XWj3QFzBhVNwzKd9/fov/yyBg125ZQKwBiOkyTMb+KiNju0PZzu/4q+yRHATwTAE00H6HgrFlFUaQArJA2E=
X-Forefront-PRVS: 0527DFA348
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB3383;
	23:sGRW7lSEojqlmPf4VDbEirw9l2UwfPrdlETcdngOr?=
	=?us-ascii?Q?JZwMOID4Jv3v+j1sQPYBVyZfIhMbeccDOpw6R9D8lRqqzhIaKIvUPqK1H6lU?=
	=?us-ascii?Q?/xRrNaqEXvdcxMigg7UXtdS5rHf+w9wwKwWGnKpPYLDNAeJSnCEbp1zRSINn?=
	=?us-ascii?Q?f0+vvdTv4fqH2X39OGY2MbEaNgM1hkkdPjYaTjBUHYktsb+IBDKYS+mVHedP?=
	=?us-ascii?Q?9bKHZj02Yx6BoZIH723+6NTBzwL1HVpT+Ji/5ESpJsJ94zI2TJQT2FqXxkdO?=
	=?us-ascii?Q?ox8o6pokbwUKIqQsEF623UrsJqT+IT8s/cCsRwvM5jZTvEVYAmy3PGK8TjDu?=
	=?us-ascii?Q?8EMHSjFuKB3JOj9Fu8SRMRF41ShSPW5K/+vEs85dtCAn/+RKc9G/B1uk3Ne/?=
	=?us-ascii?Q?ejReStOfCEdGZxpP5cv0TlY7h3/puEieklJueHdFB5Gbf0h21qexc6KY8qTL?=
	=?us-ascii?Q?qJQAaQVXjBSXCifBwJXDaTC6d8yDM8ufIdKh+LQJGX08ZSZ2DHjiK7zKJkdc?=
	=?us-ascii?Q?Mzz2SQMY3TyG8JGSLBovJMqrmFx2yUe9Yvj+Byj9tTWZhUVUTVWpW41BReKz?=
	=?us-ascii?Q?sQzQR62OLB98KydLztiin16+A574aVjpC4jNUfGvxakEP66+UjFCnucX1ssV?=
	=?us-ascii?Q?9tJ3+XXgk3vB6tnGZ4djiFMA5oeesCuX/DLsH/b2WMOwlfr7UumAjLOsiTWd?=
	=?us-ascii?Q?oJpulrMGiOQ98Yj9YgjgfGJcHHEhtM4RppjqKqLSdW7HsynWSEu6AlWUex6G?=
	=?us-ascii?Q?X9OsPZ3c9E0a+7ZW69TBDooZk3C6tZrByjNKebTBtsiIHx4ec9/kcg7EoHZ3?=
	=?us-ascii?Q?58Uesg5i4m/3tjb5UZsDN48UEK0b2myfabrwZBapcRoe7nEWcl26pjy7oxPM?=
	=?us-ascii?Q?EZn35yZHNvrJj+KKu4KxeX2MsUpLx0O7ZAwZ70zrd1AfbATN79NOcZraLkKC?=
	=?us-ascii?Q?qpOPMgugYGw+B2jiNNTtW5Br5E50wASC1qQVF74bFGqOTb4gPDWo6fFl3GXi?=
	=?us-ascii?Q?qyjL3xH+8jgJjyIc1CN75fbe/zFlg4sJ+qGNQkrW2I3cJG6V2qZOCTPfVNdP?=
	=?us-ascii?Q?BAyiWAdKEhy/X+ovzunb1cb4Bft?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3383;
	6:HAlAaYQhfugipUMaKSfZp9zT0hnMY5oESY93tkJgBXQjLj7a1ROAVLrkOWxKcobIC4ojf25L0t/IRmPDvXETnefEJizILLQLhRGsSCPmnaRQ28Zf7WLtdUv02hq1fBtNWLvGP4oMDbDAE5raSVQtiK8kTYgJYy4ZrO5BBnEMkgiVa3JyLYBeWgsfNVuh5zr8Ipgq0UdOP0rfjQCBV5rKmQPWYtnwf9I4IEAcpBeA1CE4HXdPNvMCZTJyTGGuLBl6t0FLzQClK9KZPLRKxv0GMEyEVAfXL/Ip9xOWXzf4wpoS1pmK+DtcKMKM6dbuxxPyByAXsMYaZ2mBFhj97K4UTNPQPjcZ9JP7tsMto+Tj/Bk=;
	5:0BtGnONMVimzohfhnrEBud2KlujpSEfklWC1cymNbVWMtBeZF5+lgCWU3f700cQwNZtaj9D21w0e8QCfgizVKrSDhOfI36GCnZx24DDahwaAZW0s4esTg+qv1g/w1k6OdIChWCxGeeuQNiLXsFu3UMme8A33ktYXaWfUmnZGkus=;
	24:8s9vJ+kRL0sz2ViHN7iONp775qR/hJI1vAkHNjIiWbnoDd4ngL8bNZSzq/SLIABBoQX/DeLwghDSBQQ5541TaQEP+LkS/y+ywEnq6J9cm14=;
	7:EPQ7WS6wDkJGvlK+U0fRNEJOqdtqcnViXah/vnPwFSfR3nzvErzrSoc6RROkT+cJz5wwfXJn+k0z0dZhssQz4bcUI6I4z0WbIgACyejm7EgKIubd9MoUDQr2r/0aueps3ZEwjykgyn2Ak8HfcvccSgEKRJtOwnHjtJU153eq9hFjILXul+wI29wgx1p7LdlhvGdSYHij0AhL4IK+j+YO1v7J5RY4BY9h2VJAGXBGzTg+J2GVYOq/HxK+3OU8HvJv
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2017 17:29:03.0736 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbf0cf65-9317-4c50-9055-08d547cf2a31
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3383
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.33.63
Subject: [Qemu-trivial] [PATCH v6 20/29] hw/ppc: Replace fprintf(stderr,
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
X-List-Received-Date: Wed, 20 Dec 2017 17:29:17 -0000

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

Some lines were then manually tweaked to pass checkpatch and some curly
braces were added to match QEMU style.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Cc: qemu-ppc@nongnu.org
Acked-by: David Gibson <david@gibson.dropbear.id.au>
---
V6:
 - Fix indentation
 - Add curly braces
V2:
 - Split hw patch into individual directories

 hw/ppc/e500.c          | 28 ++++++++++++++--------------
 hw/ppc/mac_newworld.c  |  2 +-
 hw/ppc/mac_oldworld.c  |  2 +-
 hw/ppc/mpc8544_guts.c  |  7 ++++---
 hw/ppc/ppc405_boards.c | 15 ++++++---------
 hw/ppc/ppc440_bamboo.c | 27 ++++++++++++++-------------
 hw/ppc/ppc4xx_pci.c    |  3 ++-
 hw/ppc/prep.c          |  4 ++--
 hw/ppc/virtex_ml507.c  |  9 +++++----
 9 files changed, 49 insertions(+), 48 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index c4fe06ea2a..c826f4b667 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -333,13 +333,13 @@ static int ppce500_load_device_tree(MachineState *machine,
         ret = qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start",
                                     initrd_base);
         if (ret < 0) {
-            fprintf(stderr, "couldn't set /chosen/linux,initrd-start\n");
+            error_report("couldn't set /chosen/linux,initrd-start");
         }
 
         ret = qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
                                     (initrd_base + initrd_size));
         if (ret < 0) {
-            fprintf(stderr, "couldn't set /chosen/linux,initrd-end\n");
+            error_report("couldn't set /chosen/linux,initrd-end");
         }
 
     }
@@ -352,8 +352,9 @@ static int ppce500_load_device_tree(MachineState *machine,
 
     ret = qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
                                       machine->kernel_cmdline);
-    if (ret < 0)
-        fprintf(stderr, "couldn't set /chosen/bootargs\n");
+    if (ret < 0) {
+        error_report("couldn't set /chosen/bootargs");
+    }
 
     if (kvm_enabled()) {
         /* Read out host's frequencies */
@@ -722,8 +723,7 @@ static DeviceState *ppce500_init_mpic_kvm(PPCE500Params *params,
 
     CPU_FOREACH(cs) {
         if (kvm_openpic_connect_vcpu(dev, cs)) {
-            fprintf(stderr, "%s: failed to connect vcpu to irqchip\n",
-                    __func__);
+            error_report("%s: failed to connect vcpu to irqchip", __func__);
             abort();
         }
     }
@@ -811,8 +811,8 @@ void ppce500_init(MachineState *machine, PPCE500Params *params)
         cs = CPU(cpu);
 
         if (env->mmu_model != POWERPC_MMU_BOOKE206) {
-            fprintf(stderr, "MMU model %i not supported by this machine.\n",
-                env->mmu_model);
+            error_report("MMU model %i not supported by this machine.",
+                         env->mmu_model);
             exit(1);
         }
 
@@ -959,8 +959,8 @@ void ppce500_init(MachineState *machine, PPCE500Params *params)
                                           cur_base,
                                           ram_size - cur_base);
         if (kernel_size < 0) {
-            fprintf(stderr, "qemu: could not load kernel '%s'\n",
-                    machine->kernel_filename);
+            error_report("could not load kernel '%s'",
+                         machine->kernel_filename);
             exit(1);
         }
 
@@ -974,8 +974,8 @@ void ppce500_init(MachineState *machine, PPCE500Params *params)
                                           ram_size - initrd_base);
 
         if (initrd_size < 0) {
-            fprintf(stderr, "qemu: could not load initial ram disk '%s'\n",
-                    machine->initrd_filename);
+            error_report("could not load initial ram disk '%s'",
+                         machine->initrd_filename);
             exit(1);
         }
 
@@ -1016,7 +1016,7 @@ void ppce500_init(MachineState *machine, PPCE500Params *params)
         kernel_size = load_uimage(filename, &bios_entry, &loadaddr, NULL,
                                   NULL, NULL);
         if (kernel_size < 0) {
-            fprintf(stderr, "qemu: could not load firmware '%s'\n", filename);
+            error_report("could not load firmware '%s'", filename);
             exit(1);
         }
     }
@@ -1029,7 +1029,7 @@ void ppce500_init(MachineState *machine, PPCE500Params *params)
                                        initrd_base, initrd_size,
                                        kernel_base, kernel_size);
     if (dt_size < 0) {
-        fprintf(stderr, "couldn't load device tree\n");
+        error_report("couldn't load device tree");
         exit(1);
     }
     assert(dt_size < DTB_MAX_SIZE);
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index 3fa7c429d5..b832417a56 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -270,7 +270,7 @@ static void ppc_core99_init(MachineState *machine)
             }
         }
         if (ppc_boot_device == '\0') {
-            fprintf(stderr, "No valid boot device for Mac99 machine\n");
+            error_report("No valid boot device for Mac99 machine");
             exit(1);
         }
     }
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 010ea36bf2..d1f4546613 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -218,7 +218,7 @@ static void ppc_heathrow_init(MachineState *machine)
 #endif
         }
         if (ppc_boot_device == '\0') {
-            fprintf(stderr, "No valid boot device for G3 Beige machine\n");
+            error_report("No valid boot device for G3 Beige machine");
             exit(1);
         }
     }
diff --git a/hw/ppc/mpc8544_guts.c b/hw/ppc/mpc8544_guts.c
index ce1254b5d4..0a1adb04d2 100644
--- a/hw/ppc/mpc8544_guts.c
+++ b/hw/ppc/mpc8544_guts.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qemu-common.h"
 #include "cpu.h"
 #include "hw/hw.h"
@@ -83,7 +84,7 @@ static uint64_t mpc8544_guts_read(void *opaque, hwaddr addr,
         value = env->spr[SPR_E500_SVR];
         break;
     default:
-        fprintf(stderr, "guts: Unknown register read: %x\n", (int)addr);
+        error_report("guts: Unknown register read: %x", (int)addr);
         break;
     }
 
@@ -102,8 +103,8 @@ static void mpc8544_guts_write(void *opaque, hwaddr addr,
         }
         break;
     default:
-        fprintf(stderr, "guts: Unknown register write: %x = %x\n",
-                (int)addr, (unsigned)value);
+        error_report("guts: Unknown register write: %x = %x",
+                     (int)addr, (unsigned)value);
         break;
     }
 }
diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index e92db2c66a..fae9c76174 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -324,8 +324,7 @@ static void ref405ep_init(MachineState *machine)
         kernel_size = load_image_targphys(kernel_filename, kernel_base,
                                           ram_size - kernel_base);
         if (kernel_size < 0) {
-            fprintf(stderr, "qemu: could not load kernel '%s'\n",
-                    kernel_filename);
+            error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
         }
         printf("Load kernel size %ld at " TARGET_FMT_lx,
@@ -336,8 +335,8 @@ static void ref405ep_init(MachineState *machine)
             initrd_size = load_image_targphys(initrd_filename, initrd_base,
                                               ram_size - initrd_base);
             if (initrd_size < 0) {
-                fprintf(stderr, "qemu: could not load initial ram disk '%s'\n",
-                        initrd_filename);
+                error_report("could not load initial ram disk '%s'",
+                             initrd_filename);
                 exit(1);
             }
         } else {
@@ -607,8 +606,7 @@ static void taihu_405ep_init(MachineState *machine)
         kernel_size = load_image_targphys(kernel_filename, kernel_base,
                                           ram_size - kernel_base);
         if (kernel_size < 0) {
-            fprintf(stderr, "qemu: could not load kernel '%s'\n",
-                    kernel_filename);
+            error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
         }
         /* load initrd */
@@ -617,9 +615,8 @@ static void taihu_405ep_init(MachineState *machine)
             initrd_size = load_image_targphys(initrd_filename, initrd_base,
                                               ram_size - initrd_base);
             if (initrd_size < 0) {
-                fprintf(stderr,
-                        "qemu: could not load initial ram disk '%s'\n",
-                        initrd_filename);
+                error_report("could not load initial ram disk '%s'",
+                             initrd_filename);
                 exit(1);
             }
         } else {
diff --git a/hw/ppc/ppc440_bamboo.c b/hw/ppc/ppc440_bamboo.c
index 693c215108..02a80eef67 100644
--- a/hw/ppc/ppc440_bamboo.c
+++ b/hw/ppc/ppc440_bamboo.c
@@ -12,6 +12,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "qemu-common.h"
 #include "net/net.h"
 #include "hw/hw.h"
@@ -80,22 +81,23 @@ static int bamboo_load_device_tree(hwaddr addr,
     ret = qemu_fdt_setprop(fdt, "/memory", "reg", mem_reg_property,
                            sizeof(mem_reg_property));
     if (ret < 0)
-        fprintf(stderr, "couldn't set /memory/reg\n");
+        error_report("couldn't set /memory/reg");
 
     ret = qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-start",
                                 initrd_base);
     if (ret < 0)
-        fprintf(stderr, "couldn't set /chosen/linux,initrd-start\n");
+        error_report("couldn't set /chosen/linux,initrd-start");
 
     ret = qemu_fdt_setprop_cell(fdt, "/chosen", "linux,initrd-end",
                                 (initrd_base + initrd_size));
     if (ret < 0)
-        fprintf(stderr, "couldn't set /chosen/linux,initrd-end\n");
+        error_report("couldn't set /chosen/linux,initrd-end");
 
     ret = qemu_fdt_setprop_string(fdt, "/chosen", "bootargs",
                                   kernel_cmdline);
-    if (ret < 0)
-        fprintf(stderr, "couldn't set /chosen/bootargs\n");
+    if (ret < 0) {
+        error_report("couldn't set /chosen/bootargs");
+    }
 
     /* Copy data from the host device tree into the guest. Since the guest can
      * directly access the timebase without host involvement, we must expose
@@ -186,8 +188,8 @@ static void bamboo_init(MachineState *machine)
     env = &cpu->env;
 
     if (env->mmu_model != POWERPC_MMU_BOOKE) {
-        fprintf(stderr, "MMU model %i not supported by this machine.\n",
-            env->mmu_model);
+        error_report("MMU model %i not supported by this machine.",
+                     env->mmu_model);
         exit(1);
     }
 
@@ -220,7 +222,7 @@ static void bamboo_init(MachineState *machine)
                                 NULL);
     pcibus = (PCIBus *)qdev_get_child_bus(dev, "pci.0");
     if (!pcibus) {
-        fprintf(stderr, "couldn't create PCI controller!\n");
+        error_report("couldn't create PCI controller!");
         exit(1);
     }
 
@@ -261,8 +263,7 @@ static void bamboo_init(MachineState *machine)
         }
         /* XXX try again as binary */
         if (success < 0) {
-            fprintf(stderr, "qemu: could not load kernel '%s'\n",
-                    kernel_filename);
+            error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
         }
     }
@@ -273,8 +274,8 @@ static void bamboo_init(MachineState *machine)
                                           ram_size - RAMDISK_ADDR);
 
         if (initrd_size < 0) {
-            fprintf(stderr, "qemu: could not load ram disk '%s' at %x\n",
-                    initrd_filename, RAMDISK_ADDR);
+            error_report("could not load ram disk '%s' at %x",
+                         initrd_filename, RAMDISK_ADDR);
             exit(1);
         }
     }
@@ -283,7 +284,7 @@ static void bamboo_init(MachineState *machine)
     if (kernel_filename) {
         if (bamboo_load_device_tree(FDT_ADDR, ram_size, RAMDISK_ADDR,
                                     initrd_size, kernel_cmdline) < 0) {
-            fprintf(stderr, "couldn't load device tree\n");
+            error_report("couldn't load device tree");
             exit(1);
         }
     }
diff --git a/hw/ppc/ppc4xx_pci.c b/hw/ppc/ppc4xx_pci.c
index 4765dcecca..807e91b8fa 100644
--- a/hw/ppc/ppc4xx_pci.c
+++ b/hw/ppc/ppc4xx_pci.c
@@ -20,6 +20,7 @@
  * 4xx SoCs, such as the 440EP. */
 
 #include "qemu/osdep.h"
+#include "qemu/error-report.h"
 #include "hw/hw.h"
 #include "hw/ppc/ppc.h"
 #include "hw/ppc/ppc4xx.h"
@@ -254,7 +255,7 @@ static void ppc4xx_pci_set_irq(void *opaque, int irq_num, int level)
 
     trace_ppc4xx_pci_set_irq(irq_num);
     if (irq_num < 0) {
-        fprintf(stderr, "%s: PCI irq %d\n", __func__, irq_num);
+        error_report("%s: PCI irq %d", __func__, irq_num);
         return;
     }
     qemu_set_irq(pci_irqs[irq_num], level);
diff --git a/hw/ppc/prep.c b/hw/ppc/prep.c
index af08ac319a..794698d240 100644
--- a/hw/ppc/prep.c
+++ b/hw/ppc/prep.c
@@ -574,7 +574,7 @@ static void ppc_prep_init(MachineState *machine)
             }
         }
         if (ppc_boot_device == '\0') {
-            fprintf(stderr, "No valid boot device for Mac99 machine\n");
+            error_report("No valid boot device for Mac99 machine");
             exit(1);
         }
     }
@@ -595,7 +595,7 @@ static void ppc_prep_init(MachineState *machine)
     qdev_init_nofail(dev);
     pci_bus = (PCIBus *)qdev_get_child_bus(dev, "pci.0");
     if (pci_bus == NULL) {
-        fprintf(stderr, "Couldn't create PCI host controller.\n");
+        error_report("Couldn't create PCI host controller.");
         exit(1);
     }
     sysctrl->contiguous_map_irq = qdev_get_gpio_in(dev, 0);
diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 5ac4f76613..abd13cb7af 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -186,8 +186,9 @@ static int xilinx_load_device_tree(hwaddr addr,
     }
 
     r = qemu_fdt_setprop_string(fdt, "/chosen", "bootargs", kernel_cmdline);
-    if (r < 0)
-        fprintf(stderr, "couldn't set /chosen/bootargs\n");
+    if (r < 0) {
+        error_report("couldn't set /chosen/bootargs");
+    }
     cpu_physical_memory_write(addr, fdt, fdt_size);
     return fdt_size;
 }
@@ -215,8 +216,8 @@ static void virtex_init(MachineState *machine)
     env = &cpu->env;
 
     if (env->mmu_model != POWERPC_MMU_BOOKE) {
-        fprintf(stderr, "MMU model %i not supported by this machine.\n",
-            env->mmu_model);
+        error_report("MMU model %i not supported by this machine.",
+                     env->mmu_model);
         exit(1);
     }
 
-- 
2.14.1


