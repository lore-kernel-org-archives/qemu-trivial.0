Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRiA0-0006pj-VQ
	for mharc-qemu-trivial@gnu.org; Wed, 20 Dec 2017 12:28:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRi9y-0006nF-5q
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:28:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRi9x-0005US-0P
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:28:02 -0500
Received: from mail-sn1nam01on0047.outbound.protection.outlook.com
	([104.47.32.47]:18709
	helo=NAM01-SN1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eRi9s-0005RS-Ek; Wed, 20 Dec 2017 12:27:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=ZLirvtTfn6Qwy0ibly8tFVEn9BOO6hG4NEe3d/hNGlU=;
	b=HJBvS0vmtKseQUrJg9DJaIIX+udDg3DMq6xq3L2dYCPBK+vXJp9z7vB85g+Rs3lZWDXqISCcqTXVD7dLuLTYoBL83KV3dB0MJfsWpLByui+7PFqAUEqHp4GUYm3iUfb3o3liHIOWpRBFh19Om7Hv6s8FyBKXFpDB4uJ37VQMn2w=
Received: from MWHPR02CA0024.namprd02.prod.outlook.com (10.168.209.162) by
	CY4PR02MB3381.namprd02.prod.outlook.com (10.165.89.152) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.323.15; Wed, 20 Dec 2017 17:27:51 +0000
Received: from SN1NAM02FT030.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::206) by MWHPR02CA0024.outlook.office365.com
	(2603:10b6:300:4b::34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.323.15 via
	Frontend Transport; Wed, 20 Dec 2017 17:27:50 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
	header.d=none;nongnu.org; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT030.mail.protection.outlook.com (10.152.72.114) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Wed, 20 Dec 2017 17:27:50 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRi9l-0004sA-UZ; Wed, 20 Dec 2017 09:27:49 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRi9l-0003an-S1; Wed, 20 Dec 2017 09:27:49 -0800
Received: from xsj-pvapsmtp01 (smtp2.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBKHRdOQ008173; Wed, 20 Dec 2017 09:27:39 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRi9b-0003ZD-3x; Wed, 20 Dec 2017 09:27:39 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>,
	<armbru@redhat.com>, <qemu-block@nongnu.org>
Date: Wed, 20 Dec 2017 09:23:23 -0800
Message-ID: <256ce28b607ce7b1a63afcc14c34cc4aa42bbb29.1513790495.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1513790494.git.alistair.francis@xilinx.com>
References: <cover.1513790494.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23540.006
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(39860400002)(396003)(346002)(39380400002)(376002)(2980300002)(438002)(189003)(199004)(106466001)(478600001)(81166006)(76176011)(51416003)(7696005)(47776003)(48376002)(81156014)(8676002)(6666003)(5660300001)(2906002)(305945005)(356003)(50466002)(2950100002)(9786002)(50226002)(4326008)(118296001)(77096006)(8936002)(39060400002)(63266004)(36756003)(110136005)(54906003)(16586007)(36386004)(316002)(106002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB3381; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT030;
	1:imJELMJtRCzuYoBPj797whic28WZaTaAdUoOt93z/vUmNX+K8HsRk79/DRN23WRDa5tWQrXmh7BqPh90cSehdNPsT1fDmwBb3vALRwY4F9nrYu7D0kKsS4eFC5Mlr/1c
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4903078c-4c0d-482f-74bb-08d547cefedb
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(5600026)(4604075)(4608076)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603307)(7153060);
	SRVR:CY4PR02MB3381; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3381;
	3:Mfag7rurW55cR6RRKqPtUtE1dsJeNuk5HOpXr6TRqczZnLE13G1+fpekUMVUKxULln88TdYJ4UANaoXObQyLXVjuqzsIIW22bx8vWjZzE2WH1cF6I44Dsgv89jvDUPlWgKm6S2jpcw09ifSuqdhf3tiAlYo+2L7278d0jR3VPBuBtoJ5xtozJic4jphyFX0ABC4g8QtOK5mrnTpwM2N5AGBqKxDC2JLlp71a/WvHqhQ2NRqUMawnl/tjOa8Ohesfow44DcaZf5rKXgtd7US0a81RYrcqkw3YwR6H04rwwdLGllxT8OXPOZcuL/0NlCAOcYd/Y4vjURdTzWIv29SO3i1eMfTizRKrM3Llf/lCVmc=;
	25:jCLNLDYYUA8JRntq6aCIBLOfe1s769Z7a4OtD7JQY+Mw10WCILOxcAeuT0EuE5RS+x/GGnsF7jx1giQIRrtTjHh4oO0PhIUpgaJ1zIBBe002paRYEfQFmUrbsHg4LosebT3jXzRqGoiX5VXzN2NwSYXy796G2LKxYLVRvYWVoR7fdLbNrwguR98EWC/Mg//vTbSRJS8GauXBLRUvUIOznLLr4HUKyrxsMhoNhFb0n/+N/W0e+yNhzDjPratyWDDEkSTqt3yc0TS58w32NP98TuAO1JVY3gD4jm833vlQwf+C9K0XMxq45q8JNLS0NIezl5Zo0NiUrd6a3PYfMOUzTg==
X-MS-TrafficTypeDiagnostic: CY4PR02MB3381:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3381;
	31:SwG2BVTwswlH3bQChwQwzDwoVlTx5+6SdeSDr36an5uepbziqOPgiXcc7ofBmN3sVNSkyewtl8diQo9LwaVkLdxwMEsZc3SAQvOnNRKUPhwaQCPpdsvi7IZ73sk6Px/NYNMPd1AjBVv6cEIRVR/3JmSnjAuMy+cET3LQTR2AYLSJWbgU66nTp/YiBsRdzSXpFXhzSyM2JF8wuIHKCJ1HMz5+JYnHgzfKvnE76HcgS0s=;
	20:VNUJzg1pvabbF6qLUyRBuETcKzQenAYaWGJmlK4U42HWFCHHm0vm8MqGlVp4Ap1hE+5mohDngHvm0C4D6QQBeSpr0RrvSzbfuXf4tqqlKnqu4NG67iRhSGbxla0+ldK92Ayx06rDTKbAF0NX3gq9WSvO3+D6HCtamxOXr1Dlyt+WOCqJtr38vNJjMkH1tyfwSg7TEL2H9CZS2Iksg2tup7ayhj6Y4wVGVb8ty068oOKA0SxkjmbsWcZ+M7eU33LRQi6qegOymQyiFddW/y6F4O3F89ut3B2OWfWqLYktYgy2JiNUpI3Iyx2I1lDM1xAmF6QP4qNoCAcocieC814YC8lIsYQqz81dYzVXS7Hj/BMW6cyW+mhG7CcgLajaqbaFGLb+xQwi6UQh8FSvST7GdcAlcAAojDqNzx69HXPdE8UVbJgS7VS9J7Lifpy3d3dQNG154bMW+4QDrHxu2LCeZbjrO6oXx1/xJfHoNpj02RFzT7vvZUzozcCcqEKC0aas
X-Microsoft-Antispam-PRVS: <CY4PR02MB3381F47D8D5168210DA1204DDC0C0@CY4PR02MB3381.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(3002001)(3231023)(93006095)(93004095)(10201501046)(6055026)(6041268)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:CY4PR02MB3381; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:CY4PR02MB3381; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3381;
	4:TlEqTkZCeaGkBQLFwAp6Spl1P8Zc8/QoBJylDsjVUQbNS8dDTASI/ygOZ1bRiDTb31pMhRJFSl4xctI2nZZmlPbrn89C+FLCxbz6LiRg5xR3wRW2i/1anyZLTQ0gl4mmPCHeHm7UbsqBUcxcQvtPJplFpD9XjyzfYKw6jJq8maNgcjdvaCRgdzHimv23MAjOXoqI9+WX98P+sy7+s/rSniVswfRxoWcG/WgMjJyXVpNPmTSoS1BjByWauj3vkuspt5iCeXEaX5MWuI24IbKPZj5/EiVG1A/uZy1qV3mLbqGo15lBZ9HNuRyGfnCipycXUkW5jdzHDWM+0m8qBlI+zQ==
X-Forefront-PRVS: 0527DFA348
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB3381;
	23:etumbOmLfkPOG8/44BHl19DB4Lxnwe4NjB/DD4JeL?=
	=?us-ascii?Q?5oTmTrTX4FGyqFA3KKEX8lCogQQMTWk4TVHq1T0L4h3aof4WcHKbgiSLlGYN?=
	=?us-ascii?Q?wTzi3izgcazSlcgETV4he/JTR69qlP0qYUagiprEfQS17/fQ5Qtx+RJG1jms?=
	=?us-ascii?Q?YcsQ3VZvkMArygNVeOmH6WrGTipGUCV9ED/+wmxjr9oPASzOb3jK/kFbIE7M?=
	=?us-ascii?Q?q10znbR1oZl2TIw5hGcGRRM1tG538wle5fsaey0dhuJojCoMH+WXezKwx2MG?=
	=?us-ascii?Q?jIo4umerrsr+luSA6jnthokBzZydnqqNBcpjW9jItEkekrLlnMmtsWHLWCe4?=
	=?us-ascii?Q?Bi12VxpTmA7HEdE2dqM0QJsMvcvg5MssK/zs0aZ48r87BxOc+1tHCt48CM/a?=
	=?us-ascii?Q?Q1iwhIGBZVzuIq+9kK3p7V5CUOh+IXdhaA7wObS0swIyMMXhq4t3H+SX5oaM?=
	=?us-ascii?Q?LDXqXs578TgKa4joTj6vv8h3t8QuWHCrBI8BKwTv+r1EqVIsa6NwGIV1w77K?=
	=?us-ascii?Q?CZqUEsrD4XuOGyP46EYtHqHcqTAKt7SXLTKvy9btUP3uT/Fa4l4olqWWbv0P?=
	=?us-ascii?Q?3GFFUDjVP6yVtWdjtV6OMKnGq/P6li1JRXUIi+OZ+hgqMAtrhbOrrRzKc8ov?=
	=?us-ascii?Q?hq8vALNBFdSNRPeOlaI7Cr6IlGWu/aoZyI8O3fHe8bf/ETNihEOQA7u+yKxq?=
	=?us-ascii?Q?5EM5jjtWGgTgqdAcvfVZU9dVmbylIKOPtbjB1Fd7uvG6nkXJThX0zBHnnQ4O?=
	=?us-ascii?Q?BCFmnnWZ8vOLoOTwUGIsjYEUikoGtTRYn5iI0h3Q+PtxtuwY/fkKa78T2SeG?=
	=?us-ascii?Q?FyxZuj6unxoi5thVVTqa2vw3dCcdM5Z+tfIeUdS1dYgfQCzvEoUMfsGtKBry?=
	=?us-ascii?Q?lSiREAZasp1FoDLK1I+E676JKVTgDmD4tgRclNRYkSBX30kJTy/KQc6n21Cg?=
	=?us-ascii?Q?PLZ5x3cAOBS5k1imQdS1qYloamhcMXwwwbud8yuFuOwCZIxr8XirboVSEBHg?=
	=?us-ascii?Q?I0n8eVOrKwR73rcpgjILxGV?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3381;
	6:PO7crvOZ5xc+KdbwOvvS2gEUSiV1LOmSp3EFxW0uKtLdGXggtOXNFgatT84xY8Ve1z913ABw3UrfKgCQ1a0S6ZXb9ZQ1kQ4g+r1IZMfx68KDwItGsTz1k1jYcUxcAN/YrUUMZuKpbmm7Dv+7lf0HoKKVdlVJlNOgzgwbBRhj0xQYax9df7LCgKzFhcvNEGVTNXmyV3utxHvjuz7KJcJMaZkkBHgB5RzdLdInhn+NLJKY/WLJVYZpXTbYixw2nZZwj4wDLsUNCBWwLeBrr1FDFhBrC36pT9sKRHjn203u9D5KuEhCxf7tz27INQOHuhNGJV3+nqKY7xxyU0xxBW4gPURmNPXULvVXjpxfmEVnyeQ=;
	5:RaTBiiEPHBz+GxWkWVEceq1Ue68L8wBChNVVpGBZY+zLTQ1vsKERBJSR1YbtPRaCf/sO0FKbi05mpjoFS2qdeqE+eHUl/n3qF18Z8iJ1gAoI8djozy5jgzj1UtkiWirFtd8F2445KADI86+1n7VFpGL5+oNRI3Vylw230Gx6qhc=;
	24:bnhuUWSuB4re6Aw5cVCaH0QOsui1xjqx2NSKHQpXw0hqmDek1KtqBWtkwMc7Vta0c985ZhWs2Su0eGSEo+y7x7zZr0E83dp4b12ZgQqs864=;
	7:0E70IUXSZ0v4O86Nsr+MgMZuP8vbwoaID+hLeB5kWVpCMx+MPAp9NAcf8Psp2wh2ZHvLjb5T3btPlx0yYoTyUxR2tjMrbX8C9pifoKVAppr1VBxEocmdfP9djsLByoA8oOHB4mo/p2/t/cbk3IZYTIqQdzyX5i19F08iBxbYOydlpuFEW0lZbIdIt58xtuBF95yxNBE+FXnhDowXkuOA9YT0CbYDSZGs+liTOnLu5JpgxKqbJnAg9U989ERoz4t+
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2017 17:27:50.4923 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4903078c-4c0d-482f-74bb-08d547cefedb
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3381
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.32.47
Subject: [Qemu-trivial] [PATCH v6 09/29] hw/ide: Replace fprintf(stderr,
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
X-List-Received-Date: Wed, 20 Dec 2017 17:28:03 -0000

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

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Cc: qemu-block@nongnu.org
Reviewed-by: Philippe Mathieu-Daud <f4bug@amsat.org>
Acked-by: John Snow <jsnow@redhat.com>
---
V2:
 - Split hw patch into individual directories

 hw/ide/ahci.c | 6 +++---
 hw/ide/core.c | 3 +--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index e22d7be05f..c35e347020 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -409,8 +409,8 @@ static void ahci_mem_write(void *opaque, hwaddr addr,
 
     /* Only aligned reads are allowed on AHCI */
     if (addr & 3) {
-        fprintf(stderr, "ahci: Mis-aligned write to addr 0x"
-                TARGET_FMT_plx "\n", addr);
+        error_report("ahci: Mis-aligned write to addr 0x" TARGET_FMT_plx,
+                     addr);
         return;
     }
 
@@ -1052,7 +1052,7 @@ static void process_ncq_command(AHCIState *s, int port, uint8_t *cmd_fis,
     g_assert(is_ncq(ncq_fis->command));
     if (ncq_tfs->used) {
         /* error - already in use */
-        fprintf(stderr, "%s: tag %d already used\n", __func__, tag);
+        error_report("%s: tag %d already used", __func__, tag);
         return;
     }
 
diff --git a/hw/ide/core.c b/hw/ide/core.c
index 1ea5812b7e..d3090f123c 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -2764,8 +2764,7 @@ static int ide_drive_pio_pre_save(void *opaque)
 
     idx = transfer_end_table_idx(s->end_transfer_func);
     if (idx == -1) {
-        fprintf(stderr, "%s: invalid end_transfer_func for DRQ_STAT\n",
-                        __func__);
+        error_report("%s: invalid end_transfer_func for DRQ_STAT", __func__);
         s->end_transfer_fn_idx = 2;
     } else {
         s->end_transfer_fn_idx = idx;
-- 
2.14.1


