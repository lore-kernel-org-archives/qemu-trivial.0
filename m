Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eENOT-0002vo-Dq
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 17:39:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENOQ-0002sY-5w
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:39:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENON-0007IH-1w
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:39:50 -0500
Received: from mail-by2nam01on0073.outbound.protection.outlook.com
	([104.47.34.73]:58242
	helo=NAM01-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eENOM-0007HZ-My; Mon, 13 Nov 2017 17:39:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=M3PgPRa10i3NFmo0PWu2zgoMB1J64iqhXMoHZ3NZBqI=;
	b=ceI4zP+a2z84PCvF1dLMi3bJnnQT+ndUrZWaSI77b0mxRno1QkOehklplHJJ4yZ7uG8KcZZurluyU2SM5gnyEFCQBDsLLrWD7ydFaubd8NyUDePEZPoYDpSGheW8GqAbuML8CmM365ca/+oPMmiOjMhZ7ZJC+wfOlJQ0AiqypKU=
Received: from SN4PR0201CA0022.namprd02.prod.outlook.com (10.161.238.160) by
	BN6PR02MB3377.namprd02.prod.outlook.com (10.161.152.165) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.20.218.12; Mon, 13 Nov 2017 22:39:43 +0000
Received: from BL2NAM02FT057.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::203) by SN4PR0201CA0022.outlook.office365.com
	(2603:10b6:803:2b::32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.218.12 via
	Frontend Transport; Mon, 13 Nov 2017 22:39:43 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT057.mail.protection.outlook.com (10.152.77.36) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.197.9
	via Frontend Transport; Mon, 13 Nov 2017 22:39:42 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOI-00049X-3F; Mon, 13 Nov 2017 14:39:42 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOH-0000Ux-N4; Mon, 13 Nov 2017 14:39:41 -0800
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vADMdcHh002839; Mon, 13 Nov 2017 14:39:38 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOE-0000U9-5T; Mon, 13 Nov 2017 14:39:38 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>,
	<armbru@redhat.com>, Jia Liu <proljc@gmail.com>, Stafford Horne
	<shorne@gmail.com>
Date: Mon, 13 Nov 2017 14:35:37 -0800
Message-ID: <b59251c0c9b882df52cbd735575ee555dd22dfaa.1510612380.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(6009001)(346002)(39860400002)(376002)(2980300002)(438002)(189002)(199003)(4326008)(81166006)(2950100002)(50986999)(63266004)(106466001)(50226002)(5660300001)(39060400002)(76176999)(23676003)(2870700001)(36756003)(118296001)(2906002)(9786002)(305945005)(77096006)(81156014)(356003)(33646002)(8676002)(478600001)(110136005)(50466002)(8936002)(316002)(47776003)(36386004)(106002)(54906003)(189998001)(5820100001)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB3377; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT057;
	1:sk5znVeIXZ5mMm8cWk3BIimYz9CTlD4fbRPFZGuxiqm8qkgHhUVKmHH220ElbZ6tQeX9Fe2AuVQBhylUJGcTjuzyhCvtbmv+62oZRSkM6k6xtSBuzmjaBkX43/eBED7T
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6aba06cc-c800-491a-8f39-08d52ae76f11
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603258);
	SRVR:BN6PR02MB3377; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3377;
	3:9R30+Qwyr1uqf0KG1ocnbUe2vi0ne3Bi4TmKjmz2ZTh9Z8zD8yu3vyNlyM5n+B1C2CG8RbC+GB7BvkJ4MNWsgIDJjWUn8X3xZdMoRsPcW7GcOBkrcw78mfF+vZqCJUQBWNM90ky8XXlmp5o5ecznVjutfEfOA8HwlXER7DU6oNucK2F/K4Zb9id2aH52CNLcr6Z0Ux9d59QzGAxCZJFUxfuN5tEOmD9qO9BZhSDO0XL73KtN1mIR8sQVzTgKgTAGVvlv/gV/mLf3iZrURj2czbSe9qeJYDElmodZkvHVV4MKPvNeP4vQePj1ImAEFJ1hy3U7k+DU7y6b+GXknRiB22v0UcNngzVNUl6+cYy1nTI=;
	25:WLHmP7XqpMqSDIvGqDbbr3aU1Wwxo6d6YjjjqQ5ISy21foP+22VMMa4rsdMuJF1RnS8sjfX7d0W3QLAMpemjNl4ku4EQvaDD2f9tP3/rxYsvpAYzGzeJOtxIInl+SSFCC2+4ad9XiR7kAP4G91x+JkYPfsJf5wD5X7sZNjWiOp0WZSCEVa6cj1aG77MPwFiC0tRlbKtB9rzKCoZafNOPJyOpikGFIERqiIoev8dkXphUa6zWBaIZ5Q++bdLsdP1KI9emRaL+OniRa4gL0GFlTfHKMincg905EkifeJEEi/Oavv1PNnH1UK9P4q9WMmoeMGwax1LpA8io7t96fcP/nDw6QsdsloGNU1PfFS4eLws=
X-MS-TrafficTypeDiagnostic: BN6PR02MB3377:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3377;
	31:evFUaEgoMN7ryxEKNd7tgNZo6A8fbbEBUpXtVbMFDsmYDVsvgjhWEMsrOqX5xHvil8PHKHvXW8Rn/X9fI1UFQthh9FZxENAtn/Rm0iQRe2184zDt230hYCxWJRtOyU3t74LbJc1rcJB8pJ/u3JEAABbPRxbPIAeqMDtMNxJSzYizjk6HyKi/dk6Kdb+8wxpx2n9ADCdmCx618Nl6xNgc0qrQI/Q81qiI13DYqjt4HI0=;
	20:DtK7yPSu8OUnxttcMtwZsqjAbKjZWO+GVos12m99BkLZ6UGp24kqJpurA5A1QGvAQVWU1NMF/5AYjjvfZZOtn1JfFYYyMMHvfCNf/GJhrbhLXlRf82Ux7NhsodLTDZg7FrWJelXJTmcZA5NfAFpESXQVqMqUErO6FaIf9latr4UY5PIl2Eaflb9QUPZDFVBFfBaXKIC5TV6dQ8Dq8UTcPDutK2eZDfKXcQ1/T7qTBb2Y6Fts39pzvIUPt7aIWIFBBuVqfdlY9ZIeFkYyqi/scGpIPL6xppkJ/fUgWbToB0spSn1XzzaFTT870W/PWxEIZ2AJbMR8wBlXLY64dzLNxkM3/xsmXCn26kZxeti8iVBK7ChpyrzsurNfPjxqAMGTCkdRuUEVXLWLFFTwWbW1f8qpstwXgeVV84E7c0IXh3esgSg66qu6zwGCvvTWroRRUXSEu03gPJQALkVTDk1mdIPKPIfs7g0xk6E4zwB29tcIb4k0NcCwmt/Y7wHDM88x
X-Microsoft-Antispam-PRVS: <BN6PR02MB337758AA772257288BB3E663DC2B0@BN6PR02MB3377.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3231022)(93006095)(93004095)(10201501046)(3002001)(100000703101)(100105400095)(6055026)(6041248)(20161123560025)(20161123555025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123558100)(20161123562025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BN6PR02MB3377; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BN6PR02MB3377; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3377;
	4:yVEMn++UpFNh4YoiQIMJWoZU9nDHz7PjuzQ+dFSbBsXk6Z70/Yde6phAqMRRuH9b9c24wZt/XVRra42Gl2FabE4YQoWUzDTUy3EWaTGdGF4DnRpeV8RvAdSX7x4uSHFwMoOzNIqgTh0EoyJvfIMFY3HwR1dV/fs+95Gf1uj32/LBgHruUyA0Tgu3qskcMX5Jk9RTGdyJFcOF1dv+nPI5VBCKJny1eTzUMerIPHV8Y3XgnoYqxGTRn97f/TpXsMfpQl7yK4kC4KWs+7eo35PXnDAQ2pJ0OKXpp6LB2n50/XjfgMzr4JS60taCgh8J7av2eBisSrv2+11ts5A6VeqbYQ==
X-Forefront-PRVS: 0490BBA1F0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR02MB3377;
	23:2Y/1QTy5aMxwngu2qkfMtDPE+aCTHPlK0b9MronEZ?=
	=?us-ascii?Q?5+lwTmulLp7m5+kVzN9hc25H1vBYMAvVuGn8qaB6umhWuss7OUZK2nZIryfj?=
	=?us-ascii?Q?SGBPPqCisdD2gPo3ifhhW498eq+Ope6ZRIpTFrXbrERuzwDdbPOiA9wg/IH1?=
	=?us-ascii?Q?risBA2Q9PgCl9L4YIm8422QubzUTzq/7E7CPZ6/sVqd2i1T7fZasvXFRjXDY?=
	=?us-ascii?Q?37E1WSssNq4YA4B2QTEJNbTpyJx0dZ3JrMM1XNJlLepJK7XweQLUMq1Ep9Ru?=
	=?us-ascii?Q?g0geRmD8zwdTWfXs/PDbXz8wEkphNHi8g7HbAn8cxoyD8dpWY4KKRBJZBM4h?=
	=?us-ascii?Q?IsenAzfLMFaalGr8yVkcsoAADiHte6R5kwYBRrPHl9UYJE5N3ChgyRxcCClj?=
	=?us-ascii?Q?YQt9kSmdsgwESeEhijnbiupeIN1Qea0tF0/aRX1cg3T4GMADbwdJpXDYIh+M?=
	=?us-ascii?Q?bfPGYz+A089f+9TedDLyNFcAzAQb/BYUXqWfc1VKNumEIezrOSTvyqs8mpZ1?=
	=?us-ascii?Q?kyyfeJHbjxBsxRIYEnSq4VDO6HqtCmyzbM0lMNDrUxi5Axz+3+F3SrV12xiv?=
	=?us-ascii?Q?YYhJ7XIJXEqXejCsovzWr3TF2hdlC+et0/RfR7cUhe9+3CJ3+7/9Xrp/wwWa?=
	=?us-ascii?Q?ECoZcw4IH+InFoqOIZI0fWaQYvP+sojWorIvleae8ZcBFPyhJzJXfa8MvtmT?=
	=?us-ascii?Q?tP+oze4O1pXoj1rUiW7T6cDvCv7uhNwqiUnyPLSy8ugsjNATk94OhFLQEwXY?=
	=?us-ascii?Q?qWDRVf0zo3rkLLNlqoIrYp4o0CPT7LWxCc8VT0D/Ds54qHNOOdYypgAxCCZu?=
	=?us-ascii?Q?xgqCYcwraISPaFo4aKKAXc3QSud8FdMv6rOcUF+8234TMTS1myrvtfUrsIeI?=
	=?us-ascii?Q?jlGQv0tQqyNlPuGDhec3y65x8+3mPyfQFsD1aeWuaPD/C5IG8wZnIi4KeQDp?=
	=?us-ascii?Q?S2mudBenTk0AgFc+VpqGLTd+JpGijA5GH3FUp+dfmfORtOKKNOnQ5ybGxXXl?=
	=?us-ascii?Q?XnV2GqkVLcacqTz6qly+SiG?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3377;
	6:s/GNRmor0EGFmXQcl4VVTaoJxNrow0hoKglzEY4rWvP5MK/aT/D8bR490C86rw+fuwBlk6yWqmofcUAeU4/8B4HY7oVONxXex9VEwOSOxiOaK9tMJ4jMdFpW9+JfxDaqtk09lZH3VV5Ii7Lj1J5qtxxTsFmErIzH6KHqQ7wYE2A2llWxL1/7xcnFRAQ8fJPFDtNzVq39vlcduPvqhZfsDDCsXCMTzalsmREETYH16SBO+2NFHed/jr6GCm4mhdGCg8VwofthGy6xalZYObYvlPDKwzuYAHfoGcVWnF1NU0JthcgV7aRklIJH5G/IgwCvtoOkzUhd6ZbxJUtHy9e3Xc4A+vpXDFjDtnDzhbQaSvs=;
	5:J8ZSgshj1Ba6Ioq+P7WtMDXKeKvd3zXzrBkC+3dICe3xJz4hwjXFd1Cpu3Y3ZLHeezwS8PXr+AtJ2uCJL7CHlcqTe2nDqbVo7hgA8skqcATlCXh84hW9iVK+j2v/IVdvEahC+Hvy0GypJyqsjP23whcz+YAEdPvgIv7JbnXUxco=;
	24:wxVKecaP5lhazmkX1seAKxA3+J4Jy3i+GC/I4HKlH14sCd/d4TgzGGCTrOufykRjFFzUYFzN8UeLUelwx/zU0J2UGv0ZvCfMCARfj493XZg=;
	7:lQQb91Fp7hR96lgaU5tY7psq9xV0pjMkSjyqPnjIWFrhYuKX0faaWR0jQcuS11IEGXShTweUSUrd2SqFxXe95vCZPUgac8u2vjBs6f1o9tG6fsgdrJuTyGwODxBtpbjpD1VoqejLFfpr7n6TZlTkEW56Wy/18WkzuPs4bj7ifYvyKcdYvCeeiMqicLqsayJQyVY4BBISIVTI+dzJILHbTdhJiWIPDyja1aqNa7GIYHq/4s4mFbGRFJIb3m+4vWWi
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2017 22:39:42.9526 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aba06cc-c800-491a-8f39-08d52ae76f11
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3377
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.34.73
Subject: [Qemu-trivial] [PATCH v5 18/29] hw/openrisc: Replace fprintf(stderr,
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
X-List-Received-Date: Mon, 13 Nov 2017 22:39:51 -0000

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


