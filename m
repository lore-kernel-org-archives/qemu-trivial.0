Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRi9W-0006L0-Hb
	for mharc-qemu-trivial@gnu.org; Wed, 20 Dec 2017 12:27:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60032)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRi9P-0006E9-Fc
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:27:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRi9M-00055K-77
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:27:27 -0500
Received: from mail-cys01nam02on0046.outbound.protection.outlook.com
	([104.47.37.46]:44491
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eRi9L-00054C-Uj; Wed, 20 Dec 2017 12:27:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=S+6VqGilA9q9s60aMvy85ngvbYlkB6KAAnWs63Kk+sQ=;
	b=OilIO0IW8SlydtQza8nXuOc9qNfYGxBorRnZPOFv1jO+bshQ8uJ5Et/pF5/walXcINB5+G6XoFfoLFUsOY92x3qpxaDbws1CdivSCp0hM9AHPu5Y/J2wV0i4R2b5xgngbk505HQxwcfXjwm+PQZLqbrX2JOlWCWUosV/Hc8O+I4=
Received: from MWHPR0201CA0039.namprd02.prod.outlook.com (10.167.160.16) by
	BN6PR02MB3378.namprd02.prod.outlook.com (10.161.152.166) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.323.15; Wed, 20 Dec 2017 17:27:21 +0000
Received: from CY1NAM02FT022.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e45::201) by MWHPR0201CA0039.outlook.office365.com
	(2603:10b6:301:73::16) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.345.14 via
	Frontend Transport; Wed, 20 Dec 2017 17:27:20 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	CY1NAM02FT022.mail.protection.outlook.com (10.152.75.185) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Wed, 20 Dec 2017 17:27:19 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:48544
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRi9H-0003qB-82; Wed, 20 Dec 2017 09:27:19 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRi9H-0003VY-5b; Wed, 20 Dec 2017 09:27:19 -0800
Received: from xsj-pvapsmtp01 (xsj-pvapsmtp01.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBKHR8lG008100; Wed, 20 Dec 2017 09:27:08 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRi96-0003UA-BU; Wed, 20 Dec 2017 09:27:08 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>,
	<armbru@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Date: Wed, 20 Dec 2017 09:22:52 -0800
Message-ID: <62349d20b956f70019eb532b34263b77ed037ce2.1513790495.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(376002)(346002)(396003)(39860400002)(39380400002)(2980300002)(438002)(189003)(199004)(81156014)(47776003)(118296001)(50466002)(48376002)(50226002)(8936002)(5890100001)(7696005)(478600001)(8676002)(36756003)(356003)(2906002)(51416003)(305945005)(2950100002)(6666003)(575784001)(76176011)(63266004)(59450400001)(36386004)(5660300001)(4326008)(77096006)(39060400002)(81166006)(106466001)(16586007)(316002)(106002)(54906003)(9786002)(110136005)(107986001)(21314002)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB3378; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	MX:1; A:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; CY1NAM02FT022;
	1:2D2Hr0U9FLXOtAQ6dJwO91zFwGCvDCI6a50G7P1zYeiLyYXBZv95giZCZKtRgc4ZEj+bQ6tTS+eCiq/MS10aaH6RMhpttkuvkkMBnjCnAFNrP8aFMcYDsLzJJouAN9Nl
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40a4c980-dccf-46cd-e80b-08d547ceecb1
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(5600026)(4604075)(4608076)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603307)(7153060);
	SRVR:BN6PR02MB3378; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3378;
	3:9kibkaYN1CL83WqgbX0jyGdHvrWJlDr0O2WWzpzdrK7yIZKhqrwQxFV9BPDVuZTZHfVD1Tms+wq6XUZvYwqH5NvfATK9pY0SaHO3WfOTQEgNanEPay/7af8udEuos83MkEcMrc50Lt7Cqsv6fiAXsm3C5LvhrXLdix2qHRPSvlY2htdoVK6I6NFIBdoXWSppUj9bjSvAxrOsainyelUyxB9Y1bOFWL0BMQEJCi/h1HTfJP9xtXxAOxhoNrKvaml3igGQwKO6/A24iHG5NtlPPeFOaejaxqsHU2AgvqSCekWOEWDLMiTfTEaJ197f6u4X46fNwFQLRvWKgSz2+8piSO++hXrRWI5DM34sETjcwCw=;
	25:izyWLxw+J7XWc7LcvJEL5YsPuHeDVpytsBk4988HfaI33CI51+T8wIXRtMIbdWIs3CU+C0k7cfdYg7VFaEb8ZmmedjGpshWxBlieSrQSBNgoPcimZdX462YD3dxhtjDIPxuknMSs5iT0bm6qPnrATDPcEvwrfUMuEkqugBWmF+cdRy0YNccAEsfuFecVqIqiIgTjcMJ6bVLMpnsBDNzzMzR1wgyP5ZPVddKWmQSw+VrIGPc+NBMo6F3EpPh55lRBxlJfrLoPgPAH+U08eebz30WuemmqyQ/KNp0pkekln0cSyixTf0cIhIXlEKXRqWfc6Y6+fMUqHv/IuAZRLSKnqg==
X-MS-TrafficTypeDiagnostic: BN6PR02MB3378:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3378;
	31:v/fGwlCgrgB/Tfdf4FDQiWIGVnggK4SjlApowo/EiRwVUxdai0GXIivhpI/w7Lv/KQYLKQHO/kTNYX82LvMYZrDqD26ktObulsjKChxkc1vLC6CJY9kfqVLtEghWx0EyJnzSidN4dIGOm2f3d8ye4MoRk8vHNJO+TiAv8wQss89gVbFjNAiLVqp7UxNUfE/ej+lLjR3qBFartxQwunGtMcs/0WC22JhSPIN4qlLRdfE=;
	20:aBDSC8ORkJWriaJqBh6uddd4mjK3ehi9TuFZgoZ9CaW74ufEfyQe41aOboURr8tjHVA92Dt0PgHaG2rsf77+kvXJ9Q9+whmhw/7IRZNCgJtgyTKrDHplSVB04GKd/cHaif6UrDWg4Hwao7WeScX/sVHOf4eB5Squ5qOQ9hQ4PPUGNx1iv7D/S9Db150LMrykKwQ10J43u8qhQo2jQurlaIIpfxlLeEHonpQRd0Nq3ucbKmuZNx4fkQdZjvOxbfMVEfeoYaNkqC1gRbjGfiD72ierhro/vfezNMpdMeLaTJx2Ndhf9LEA1+IIq1tBr5W7DFlIet1oFy2ge5n+degAvZwJZLRz+Itv/X66kYTDVG/KLTJVP1uavFYao2xEHQLX11DXDhz9MPMY5Ke596+Vb4gnSPkX0ymASY6xuPz2D9+p90+owgWq6KHKVzA+auLiZlGRRXGlOzlkYceBZERndL3S7wOmYj+da4Offp8VC8X6HyBAWpHZV+47oIFfhUCI
X-Microsoft-Antispam-PRVS: <BN6PR02MB3378631722EE94F4DF24959CDC0C0@BN6PR02MB3378.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089)(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(93006095)(93004095)(3231023)(10201501046)(3002001)(6055026)(6041268)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:BN6PR02MB3378; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:BN6PR02MB3378; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3378;
	4:wZQKa6mmsbGrttMUVDJ1Ye7+LYP2CRhL4bqe0IBK2U6g2aic99mU2LcVy5BnOZdq+eEWmG1RH3DByr+cBcGbPTjGGoMNZx17xaDWN4CezIP4m8nIWPf6xOUQ/kP9OE3RF8PhGU/+MQSziLXqe602TLp4x4zwTVOlTuB+tWpXrn4BdBEKpDcaeF83wqumuiFUv9FRMAAjnoIb7iZKbnNKfYu1HYh28XLMFKunJIH6QZQpUCC4nB9QOvYI12cVOATZIk4Q4L/mgOV/l9DvoJPlLgSNhG/+mcaZyzVy5w9Mf8gZfVULE/IHM3BXs9Zy5jagGpkoEaxCo9EsuKfPdIlqhg==
X-Forefront-PRVS: 0527DFA348
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR02MB3378;
	23:SLO5M5oFSbk/xPW4DE4iyXXCiZjoR0eVxSRt9L4DI?=
	=?us-ascii?Q?jPI1oR9yURQAv2ncDY/1pxF2VdYdta+8DDdB/qy8Zj6yvCwUcwxSsiQXTekP?=
	=?us-ascii?Q?ADw1QfuVl5F5/wxqfL1TgzwJq9PSX+cFLCWuXAkTsa2T34nEarKXX/FdL8QG?=
	=?us-ascii?Q?hm0KBTqRtqyoE7qMrnoQ5WE7lpWM6r4d2OK3UYnKcyopeDLqdfrmy7AqJCrS?=
	=?us-ascii?Q?vaE5dDCu4HY/tSVIKHY2i0eo7w2mkexdD1uWS6Wko6wkL3t+q1wcdCNWq1SC?=
	=?us-ascii?Q?vsGfMFFDVQutqn1voKzxXeIdYKvRu7d9GB0GGKkE7K8Bu+qeGFQK9GrGrytF?=
	=?us-ascii?Q?j4Q5c+v0eDtBqjINM+/z23yMnJR9EmKcHVTN97p+iE2K1xGL8U6OJo438vx1?=
	=?us-ascii?Q?yHjX6i7Bt/zkzUcG+cNOU+14P4o+eJyDIIv/8A6Vza7Zw1yrr1ajwEpFq6Sg?=
	=?us-ascii?Q?a1L2MKmW3wjfxzpR/pQJJg6VDhwkcpF5DIIn+IHCWqJVO9By/HUdtSCVsEio?=
	=?us-ascii?Q?W5aWI7sVN+TfjMmfcKjpJVIq3Z0NOU7YnaqgvH4tGeFW81buZm4OHQKZAYB9?=
	=?us-ascii?Q?RdH3CCQ8VDEdJMMdtgr5IhlO/8ySYG17rpNkCLORHmDYq/mC+9Re01PJ+Vlp?=
	=?us-ascii?Q?KeNtZm8xVpGDDga1HjamZ+b2DDAmrL5xbm0Yb4hCjkVKZltM9gBaFFAkPALz?=
	=?us-ascii?Q?WCOjtRtLnRu6fyNIc9GjyR7dyvB76Qs7aaB7lXZZE0AMV5oKMtiRU2DHvH+Z?=
	=?us-ascii?Q?JKPuu+tHXSdciT2eobOXyjQFlQg7oQZP7gVHErwVVpK9M9Oep5uwfM1znHwD?=
	=?us-ascii?Q?G/2YlAgfvVNM7sli3jjAWTQskPxuFum90nrkwNYx8z3lFjA/TdJZT66RCMCC?=
	=?us-ascii?Q?Z2wOHyK9KkghPedskFxq1m4dqCzt1yPMWpa9YkBpdr5kQ58IH0UrK4MOyIEH?=
	=?us-ascii?Q?dbx7bzzLGq5D8NBgwO6pQYs/EoodCDFrinPmVBF/W/9r3l/ki2ptwKAkno5M?=
	=?us-ascii?Q?qFWB/Zvq0Ai+FyRBiz3c3cstnibECdzYuY+Je1X9uOPsn24CsuustVeOHRuW?=
	=?us-ascii?Q?6uvrD/rj1i2KBIEh0ESRFGrKQlZ29GqPwvt27Q4NcM1PJSACXYERwwK4CMEj?=
	=?us-ascii?Q?41WBTeKSxojDay4kb/55Q5/jVceDl/f?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3378;
	6:8yqhDGKEwt/QdSU15WbR3uJxZXfs2Y9qTkRqOb0/iw2Nhkxw1PvQhI9MqiFrB1/ljtCa/lieLehhkVD9he4OENwQr/RChEDoUHcqM8Vvu2BRUJBrHYH0qwPhGHBAIRjfZQwFgodMWLDL1aaQdhR/RWZB4wbG2N/7utSwwF0q80zuPYe6K8vwuIbtRz75ok6VEj5Sm5o1jyANox0lKIMuepQnugRlBBfSjjQ6Ymj1GxA4WVF2+n6NYYGvAVZc6s/ou2QJ+d4VBHc1SqvLSo0WWC7N8ew+Ik4a1YGTwZHepvdYouDfLES5BdXr9xFPxcoMF6TKT5t3O+BluYSBtENe58/1xL6q8SuCa1vqNEjACOM=;
	5:3/my6crpcSC4CN6GcvkWHw0Y2LVVJO3IFteqak+MmcQjGLFiqSbDSJCZ5COq7FMyTBrKsk05sGdexMHlg1e9w8sGf7WE6kqRhDHP/3XzlwOXnWKHjZfcCvO5MV2s7IWIcGr2oCMH5HKH6xxPdtnm5wuRxL24NUK0Zpc9TNZAwYQ=;
	24:7Nynl8WIObnHvAiWi32pjOoz68GYyFu59JR4O7HrQxb6BuIIemzFiD22w5BIRtTtwxYM5WuqVY/nejQlBzuiiMSQji2HRjdeDoW/hu6butc=;
	7:l5KTBQasJ0SiziTzewZjnJKAAVthuJPqdLyIZ/4TngIM5Nex+thLybZJ6dsLd7XI2htzeYrJCgt7fkGmagBUVvLTvW7AQ3DcT2+NKZo2mndgkXaL8D9fo5kBRdlj6eS07lMgrRVzNtVsVHJtSWL7TwWWhmNnRYy802fBUgaGDQJsPSctrCAX0lI62bGK/ud8NzcDIPJVetPXFc+/biILZnIlbyngz9EbLpPyw+9eyvpt9dGL3+kvhYohtiI9UhDE
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2017 17:27:19.7866 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a4c980-dccf-46cd-e80b-08d547ceecb1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3378
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.46
Subject: [Qemu-trivial] [PATCH v6 01/29] audio: Replace AUDIO_FUNC with
 __func__
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
X-List-Received-Date: Wed, 20 Dec 2017 17:27:30 -0000

Apparently we don't use __MSC_VER as a compiler anymore and we always
require a C99 compiler (which means we always have __func__) so we don't
need a special AUDIO_FUNC macro. We can just replace AUDIO_FUNC with
__func__ instead.

Checkpatch failures were manually fixed.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
---

 audio/alsaaudio.c      |  4 ++--
 audio/audio.c          | 40 ++++++++++++++++++------------------
 audio/audio_int.h      |  6 ------
 audio/audio_pt_int.c   | 28 ++++++++++++-------------
 audio/audio_template.h | 26 +++++++++++------------
 audio/dsoundaudio.c    |  2 +-
 audio/mixeng.c         |  2 +-
 audio/ossaudio.c       | 10 ++++-----
 audio/paaudio.c        | 56 +++++++++++++++++++++++++-------------------------
 audio/sdlaudio.c       |  2 +-
 audio/wavaudio.c       |  2 +-
 11 files changed, 85 insertions(+), 93 deletions(-)

diff --git a/audio/alsaaudio.c b/audio/alsaaudio.c
index 3652a7b5fa..92a96f8b2b 100644
--- a/audio/alsaaudio.c
+++ b/audio/alsaaudio.c
@@ -823,7 +823,7 @@ static int alsa_init_out(HWVoiceOut *hw, struct audsettings *as,
     audio_pcm_init_info (&hw->info, &obt_as);
     hw->samples = obt.samples;
 
-    alsa->pcm_buf = audio_calloc (AUDIO_FUNC, obt.samples, 1 << hw->info.shift);
+    alsa->pcm_buf = audio_calloc(__func__, obt.samples, 1 << hw->info.shift);
     if (!alsa->pcm_buf) {
         dolog ("Could not allocate DAC buffer (%d samples, each %d bytes)\n",
                hw->samples, 1 << hw->info.shift);
@@ -934,7 +934,7 @@ static int alsa_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
     audio_pcm_init_info (&hw->info, &obt_as);
     hw->samples = obt.samples;
 
-    alsa->pcm_buf = audio_calloc (AUDIO_FUNC, hw->samples, 1 << hw->info.shift);
+    alsa->pcm_buf = audio_calloc(__func__, hw->samples, 1 << hw->info.shift);
     if (!alsa->pcm_buf) {
         dolog ("Could not allocate ADC buffer (%d samples, each %d bytes)\n",
                hw->samples, 1 << hw->info.shift);
diff --git a/audio/audio.c b/audio/audio.c
index beafed209b..7658d2af66 100644
--- a/audio/audio.c
+++ b/audio/audio.c
@@ -424,12 +424,12 @@ static void audio_process_options (const char *prefix,
     const char qemu_prefix[] = "QEMU_";
     size_t preflen, optlen;
 
-    if (audio_bug (AUDIO_FUNC, !prefix)) {
+    if (audio_bug(__func__, !prefix)) {
         dolog ("prefix = NULL\n");
         return;
     }
 
-    if (audio_bug (AUDIO_FUNC, !opt)) {
+    if (audio_bug(__func__, !opt)) {
         dolog ("opt = NULL\n");
         return;
     }
@@ -792,7 +792,7 @@ static int audio_attach_capture (HWVoiceOut *hw)
         SWVoiceOut *sw;
         HWVoiceOut *hw_cap = &cap->hw;
 
-        sc = audio_calloc (AUDIO_FUNC, 1, sizeof (*sc));
+        sc = audio_calloc(__func__, 1, sizeof(*sc));
         if (!sc) {
             dolog ("Could not allocate soft capture voice (%zu bytes)\n",
                    sizeof (*sc));
@@ -848,7 +848,7 @@ static int audio_pcm_hw_find_min_in (HWVoiceIn *hw)
 int audio_pcm_hw_get_live_in (HWVoiceIn *hw)
 {
     int live = hw->total_samples_captured - audio_pcm_hw_find_min_in (hw);
-    if (audio_bug (AUDIO_FUNC, live < 0 || live > hw->samples)) {
+    if (audio_bug(__func__, live < 0 || live > hw->samples)) {
         dolog ("live=%d hw->samples=%d\n", live, hw->samples);
         return 0;
     }
@@ -886,7 +886,7 @@ static int audio_pcm_sw_get_rpos_in (SWVoiceIn *sw)
     int live = hw->total_samples_captured - sw->total_hw_samples_acquired;
     int rpos;
 
-    if (audio_bug (AUDIO_FUNC, live < 0 || live > hw->samples)) {
+    if (audio_bug(__func__, live < 0 || live > hw->samples)) {
         dolog ("live=%d hw->samples=%d\n", live, hw->samples);
         return 0;
     }
@@ -909,7 +909,7 @@ int audio_pcm_sw_read (SWVoiceIn *sw, void *buf, int size)
     rpos = audio_pcm_sw_get_rpos_in (sw) % hw->samples;
 
     live = hw->total_samples_captured - sw->total_hw_samples_acquired;
-    if (audio_bug (AUDIO_FUNC, live < 0 || live > hw->samples)) {
+    if (audio_bug(__func__, live < 0 || live > hw->samples)) {
         dolog ("live_in=%d hw->samples=%d\n", live, hw->samples);
         return 0;
     }
@@ -935,7 +935,7 @@ int audio_pcm_sw_read (SWVoiceIn *sw, void *buf, int size)
         }
         osamp = swlim;
 
-        if (audio_bug (AUDIO_FUNC, osamp < 0)) {
+        if (audio_bug(__func__, osamp < 0)) {
             dolog ("osamp=%d\n", osamp);
             return 0;
         }
@@ -990,7 +990,7 @@ static int audio_pcm_hw_get_live_out (HWVoiceOut *hw, int *nb_live)
     if (nb_live1) {
         int live = smin;
 
-        if (audio_bug (AUDIO_FUNC, live < 0 || live > hw->samples)) {
+        if (audio_bug(__func__, live < 0 || live > hw->samples)) {
             dolog ("live=%d hw->samples=%d\n", live, hw->samples);
             return 0;
         }
@@ -1014,7 +1014,7 @@ int audio_pcm_sw_write (SWVoiceOut *sw, void *buf, int size)
     hwsamples = sw->hw->samples;
 
     live = sw->total_hw_samples_mixed;
-    if (audio_bug (AUDIO_FUNC, live < 0 || live > hwsamples)){
+    if (audio_bug(__func__, live < 0 || live > hwsamples)) {
         dolog ("live=%d hw->samples=%d\n", live, hwsamples);
         return 0;
     }
@@ -1263,7 +1263,7 @@ static int audio_get_avail (SWVoiceIn *sw)
     }
 
     live = sw->hw->total_samples_captured - sw->total_hw_samples_acquired;
-    if (audio_bug (AUDIO_FUNC, live < 0 || live > sw->hw->samples)) {
+    if (audio_bug(__func__, live < 0 || live > sw->hw->samples)) {
         dolog ("live=%d sw->hw->samples=%d\n", live, sw->hw->samples);
         return 0;
     }
@@ -1287,7 +1287,7 @@ static int audio_get_free (SWVoiceOut *sw)
 
     live = sw->total_hw_samples_mixed;
 
-    if (audio_bug (AUDIO_FUNC, live < 0 || live > sw->hw->samples)) {
+    if (audio_bug(__func__, live < 0 || live > sw->hw->samples)) {
         dolog ("live=%d sw->hw->samples=%d\n", live, sw->hw->samples);
         return 0;
     }
@@ -1354,7 +1354,7 @@ static void audio_run_out (AudioState *s)
             live = 0;
         }
 
-        if (audio_bug (AUDIO_FUNC, live < 0 || live > hw->samples)) {
+        if (audio_bug(__func__, live < 0 || live > hw->samples)) {
             dolog ("live=%d hw->samples=%d\n", live, hw->samples);
             continue;
         }
@@ -1389,7 +1389,7 @@ static void audio_run_out (AudioState *s)
         prev_rpos = hw->rpos;
         played = hw->pcm_ops->run_out (hw, live);
         replay_audio_out(&played);
-        if (audio_bug (AUDIO_FUNC, hw->rpos >= hw->samples)) {
+        if (audio_bug(__func__, hw->rpos >= hw->samples)) {
             dolog ("hw->rpos=%d hw->samples=%d played=%d\n",
                    hw->rpos, hw->samples, played);
             hw->rpos = 0;
@@ -1410,7 +1410,7 @@ static void audio_run_out (AudioState *s)
                 continue;
             }
 
-            if (audio_bug (AUDIO_FUNC, played > sw->total_hw_samples_mixed)) {
+            if (audio_bug(__func__, played > sw->total_hw_samples_mixed)) {
                 dolog ("played=%d sw->total_hw_samples_mixed=%d\n",
                        played, sw->total_hw_samples_mixed);
                 played = sw->total_hw_samples_mixed;
@@ -1513,7 +1513,7 @@ static void audio_run_capture (AudioState *s)
                 continue;
             }
 
-            if (audio_bug (AUDIO_FUNC, captured > sw->total_hw_samples_mixed)) {
+            if (audio_bug(__func__, captured > sw->total_hw_samples_mixed)) {
                 dolog ("captured=%d sw->total_hw_samples_mixed=%d\n",
                        captured, sw->total_hw_samples_mixed);
                 captured = sw->total_hw_samples_mixed;
@@ -1924,7 +1924,7 @@ CaptureVoiceOut *AUD_add_capture (
         goto err0;
     }
 
-    cb = audio_calloc (AUDIO_FUNC, 1, sizeof (*cb));
+    cb = audio_calloc(__func__, 1, sizeof(*cb));
     if (!cb) {
         dolog ("Could not allocate capture callback information, size %zu\n",
                sizeof (*cb));
@@ -1942,7 +1942,7 @@ CaptureVoiceOut *AUD_add_capture (
         HWVoiceOut *hw;
         CaptureVoiceOut *cap;
 
-        cap = audio_calloc (AUDIO_FUNC, 1, sizeof (*cap));
+        cap = audio_calloc(__func__, 1, sizeof(*cap));
         if (!cap) {
             dolog ("Could not allocate capture voice, size %zu\n",
                    sizeof (*cap));
@@ -1955,8 +1955,8 @@ CaptureVoiceOut *AUD_add_capture (
 
         /* XXX find a more elegant way */
         hw->samples = 4096 * 4;
-        hw->mix_buf = audio_calloc (AUDIO_FUNC, hw->samples,
-                                    sizeof (struct st_sample));
+        hw->mix_buf = audio_calloc(__func__, hw->samples,
+                                   sizeof(struct st_sample));
         if (!hw->mix_buf) {
             dolog ("Could not allocate capture mix buffer (%d samples)\n",
                    hw->samples);
@@ -1965,7 +1965,7 @@ CaptureVoiceOut *AUD_add_capture (
 
         audio_pcm_init_info (&hw->info, as);
 
-        cap->buf = audio_calloc (AUDIO_FUNC, hw->samples, 1 << hw->info.shift);
+        cap->buf = audio_calloc(__func__, hw->samples, 1 << hw->info.shift);
         if (!cap->buf) {
             dolog ("Could not allocate capture buffer "
                    "(%d samples, each %d bytes)\n",
diff --git a/audio/audio_int.h b/audio/audio_int.h
index 5bcb1c60e1..5b25da0a37 100644
--- a/audio/audio_int.h
+++ b/audio/audio_int.h
@@ -252,10 +252,4 @@ static inline int audio_ring_dist (int dst, int src, int len)
 #define AUDIO_STRINGIFY_(n) #n
 #define AUDIO_STRINGIFY(n) AUDIO_STRINGIFY_(n)
 
-#if defined _MSC_VER || defined __GNUC__
-#define AUDIO_FUNC __FUNCTION__
-#else
-#define AUDIO_FUNC __FILE__ ":" AUDIO_STRINGIFY (__LINE__)
-#endif
-
 #endif /* QEMU_AUDIO_INT_H */
diff --git a/audio/audio_pt_int.c b/audio/audio_pt_int.c
index 21ff9c5803..3fe56d8514 100644
--- a/audio/audio_pt_int.c
+++ b/audio/audio_pt_int.c
@@ -31,7 +31,7 @@ int audio_pt_init (struct audio_pt *p, void *(*func) (void *),
 
     err = sigfillset (&set);
     if (err) {
-        logerr (p, errno, "%s(%s): sigfillset failed", cap, AUDIO_FUNC);
+        logerr(p, errno, "%s(%s): sigfillset failed", cap, __func__);
         return -1;
     }
 
@@ -57,8 +57,8 @@ int audio_pt_init (struct audio_pt *p, void *(*func) (void *),
 
     err2 = pthread_sigmask (SIG_SETMASK, &old_set, NULL);
     if (err2) {
-        logerr (p, err2, "%s(%s): pthread_sigmask (restore) failed",
-                cap, AUDIO_FUNC);
+        logerr(p, err2, "%s(%s): pthread_sigmask (restore) failed",
+               cap, __func__);
         /* We have failed to restore original signal mask, all bets are off,
            so terminate the process */
         exit (EXIT_FAILURE);
@@ -74,17 +74,17 @@ int audio_pt_init (struct audio_pt *p, void *(*func) (void *),
  err2:
     err2 = pthread_cond_destroy (&p->cond);
     if (err2) {
-        logerr (p, err2, "%s(%s): pthread_cond_destroy failed", cap, AUDIO_FUNC);
+        logerr(p, err2, "%s(%s): pthread_cond_destroy failed", cap, __func__);
     }
 
  err1:
     err2 = pthread_mutex_destroy (&p->mutex);
     if (err2) {
-        logerr (p, err2, "%s(%s): pthread_mutex_destroy failed", cap, AUDIO_FUNC);
+        logerr(p, err2, "%s(%s): pthread_mutex_destroy failed", cap, __func__);
     }
 
  err0:
-    logerr (p, err, "%s(%s): %s failed", cap, AUDIO_FUNC, efunc);
+    logerr(p, err, "%s(%s): %s failed", cap, __func__, efunc);
     return -1;
 }
 
@@ -94,13 +94,13 @@ int audio_pt_fini (struct audio_pt *p, const char *cap)
 
     err = pthread_cond_destroy (&p->cond);
     if (err) {
-        logerr (p, err, "%s(%s): pthread_cond_destroy failed", cap, AUDIO_FUNC);
+        logerr(p, err, "%s(%s): pthread_cond_destroy failed", cap, __func__);
         ret = -1;
     }
 
     err = pthread_mutex_destroy (&p->mutex);
     if (err) {
-        logerr (p, err, "%s(%s): pthread_mutex_destroy failed", cap, AUDIO_FUNC);
+        logerr(p, err, "%s(%s): pthread_mutex_destroy failed", cap, __func__);
         ret = -1;
     }
     return ret;
@@ -112,7 +112,7 @@ int audio_pt_lock (struct audio_pt *p, const char *cap)
 
     err = pthread_mutex_lock (&p->mutex);
     if (err) {
-        logerr (p, err, "%s(%s): pthread_mutex_lock failed", cap, AUDIO_FUNC);
+        logerr(p, err, "%s(%s): pthread_mutex_lock failed", cap, __func__);
         return -1;
     }
     return 0;
@@ -124,7 +124,7 @@ int audio_pt_unlock (struct audio_pt *p, const char *cap)
 
     err = pthread_mutex_unlock (&p->mutex);
     if (err) {
-        logerr (p, err, "%s(%s): pthread_mutex_unlock failed", cap, AUDIO_FUNC);
+        logerr(p, err, "%s(%s): pthread_mutex_unlock failed", cap, __func__);
         return -1;
     }
     return 0;
@@ -136,7 +136,7 @@ int audio_pt_wait (struct audio_pt *p, const char *cap)
 
     err = pthread_cond_wait (&p->cond, &p->mutex);
     if (err) {
-        logerr (p, err, "%s(%s): pthread_cond_wait failed", cap, AUDIO_FUNC);
+        logerr(p, err, "%s(%s): pthread_cond_wait failed", cap, __func__);
         return -1;
     }
     return 0;
@@ -148,12 +148,12 @@ int audio_pt_unlock_and_signal (struct audio_pt *p, const char *cap)
 
     err = pthread_mutex_unlock (&p->mutex);
     if (err) {
-        logerr (p, err, "%s(%s): pthread_mutex_unlock failed", cap, AUDIO_FUNC);
+        logerr(p, err, "%s(%s): pthread_mutex_unlock failed", cap, __func__);
         return -1;
     }
     err = pthread_cond_signal (&p->cond);
     if (err) {
-        logerr (p, err, "%s(%s): pthread_cond_signal failed", cap, AUDIO_FUNC);
+        logerr(p, err, "%s(%s): pthread_cond_signal failed", cap, __func__);
         return -1;
     }
     return 0;
@@ -166,7 +166,7 @@ int audio_pt_join (struct audio_pt *p, void **arg, const char *cap)
 
     err = pthread_join (p->thread, &ret);
     if (err) {
-        logerr (p, err, "%s(%s): pthread_join failed", cap, AUDIO_FUNC);
+        logerr(p, err, "%s(%s): pthread_join failed", cap, __func__);
         return -1;
     }
     *arg = ret;
diff --git a/audio/audio_template.h b/audio/audio_template.h
index 99b27b285e..7de227d2d1 100644
--- a/audio/audio_template.h
+++ b/audio/audio_template.h
@@ -57,13 +57,13 @@ static void glue (audio_init_nb_voices_, TYPE) (struct audio_driver *drv)
         glue (s->nb_hw_voices_, TYPE) = max_voices;
     }
 
-    if (audio_bug (AUDIO_FUNC, !voice_size && max_voices)) {
+    if (audio_bug(__func__, !voice_size && max_voices)) {
         dolog ("drv=`%s' voice_size=0 max_voices=%d\n",
                drv->name, max_voices);
         glue (s->nb_hw_voices_, TYPE) = 0;
     }
 
-    if (audio_bug (AUDIO_FUNC, voice_size && !max_voices)) {
+    if (audio_bug(__func__, voice_size && !max_voices)) {
         dolog ("drv=`%s' voice_size=%d max_voices=0\n",
                drv->name, voice_size);
     }
@@ -77,7 +77,7 @@ static void glue (audio_pcm_hw_free_resources_, TYPE) (HW *hw)
 
 static int glue (audio_pcm_hw_alloc_resources_, TYPE) (HW *hw)
 {
-    HWBUF = audio_calloc (AUDIO_FUNC, hw->samples, sizeof (struct st_sample));
+    HWBUF = audio_calloc(__func__, hw->samples, sizeof(struct st_sample));
     if (!HWBUF) {
         dolog ("Could not allocate " NAME " buffer (%d samples)\n",
                hw->samples);
@@ -105,7 +105,7 @@ static int glue (audio_pcm_sw_alloc_resources_, TYPE) (SW *sw)
 
     samples = ((int64_t) sw->hw->samples << 32) / sw->ratio;
 
-    sw->buf = audio_calloc (AUDIO_FUNC, samples, sizeof (struct st_sample));
+    sw->buf = audio_calloc(__func__, samples, sizeof(struct st_sample));
     if (!sw->buf) {
         dolog ("Could not allocate buffer for `%s' (%d samples)\n",
                SW_NAME (sw), samples);
@@ -238,17 +238,17 @@ static HW *glue (audio_pcm_hw_add_new_, TYPE) (struct audsettings *as)
         return NULL;
     }
 
-    if (audio_bug (AUDIO_FUNC, !drv)) {
+    if (audio_bug(__func__, !drv)) {
         dolog ("No host audio driver\n");
         return NULL;
     }
 
-    if (audio_bug (AUDIO_FUNC, !drv->pcm_ops)) {
+    if (audio_bug(__func__, !drv->pcm_ops)) {
         dolog ("Host audio driver without pcm_ops\n");
         return NULL;
     }
 
-    hw = audio_calloc (AUDIO_FUNC, 1, glue (drv->voice_size_, TYPE));
+    hw = audio_calloc(__func__, 1, glue(drv->voice_size_, TYPE));
     if (!hw) {
         dolog ("Can not allocate voice `%s' size %d\n",
                drv->name, glue (drv->voice_size_, TYPE));
@@ -266,7 +266,7 @@ static HW *glue (audio_pcm_hw_add_new_, TYPE) (struct audsettings *as)
         goto err0;
     }
 
-    if (audio_bug (AUDIO_FUNC, hw->samples <= 0)) {
+    if (audio_bug(__func__, hw->samples <= 0)) {
         dolog ("hw->samples=%d\n", hw->samples);
         goto err1;
     }
@@ -339,7 +339,7 @@ static SW *glue (audio_pcm_create_voice_pair_, TYPE) (
         hw_as = *as;
     }
 
-    sw = audio_calloc (AUDIO_FUNC, 1, sizeof (*sw));
+    sw = audio_calloc(__func__, 1, sizeof(*sw));
     if (!sw) {
         dolog ("Could not allocate soft voice `%s' (%zu bytes)\n",
                sw_name ? sw_name : "unknown", sizeof (*sw));
@@ -379,7 +379,7 @@ static void glue (audio_close_, TYPE) (SW *sw)
 void glue (AUD_close_, TYPE) (QEMUSoundCard *card, SW *sw)
 {
     if (sw) {
-        if (audio_bug (AUDIO_FUNC, !card)) {
+        if (audio_bug(__func__, !card)) {
             dolog ("card=%p\n", card);
             return;
         }
@@ -399,7 +399,7 @@ SW *glue (AUD_open_, TYPE) (
 {
     AudioState *s = &glob_audio_state;
 
-    if (audio_bug (AUDIO_FUNC, !card || !name || !callback_fn || !as)) {
+    if (audio_bug(__func__, !card || !name || !callback_fn || !as)) {
         dolog ("card=%p name=%p callback_fn=%p as=%p\n",
                card, name, callback_fn, as);
         goto fail;
@@ -408,12 +408,12 @@ SW *glue (AUD_open_, TYPE) (
     ldebug ("open %s, freq %d, nchannels %d, fmt %d\n",
             name, as->freq, as->nchannels, as->fmt);
 
-    if (audio_bug (AUDIO_FUNC, audio_validate_settings (as))) {
+    if (audio_bug(__func__, audio_validate_settings(as))) {
         audio_print_settings (as);
         goto fail;
     }
 
-    if (audio_bug (AUDIO_FUNC, !s->drv)) {
+    if (audio_bug(__func__, !s->drv)) {
         dolog ("Can not open `%s' (no host audio driver)\n", name);
         goto fail;
     }
diff --git a/audio/dsoundaudio.c b/audio/dsoundaudio.c
index 516846eb80..bc39cb9b4d 100644
--- a/audio/dsoundaudio.c
+++ b/audio/dsoundaudio.c
@@ -543,7 +543,7 @@ static int dsound_run_out (HWVoiceOut *hw, int live)
         }
     }
 
-    if (audio_bug (AUDIO_FUNC, len < 0 || len > bufsize)) {
+    if (audio_bug(__func__, len < 0 || len > bufsize)) {
         dolog ("len=%d bufsize=%d old_pos=%ld ppos=%ld\n",
                len, bufsize, old_pos, ppos);
         return 0;
diff --git a/audio/mixeng.c b/audio/mixeng.c
index 0bf9b5360f..2ab22df2aa 100644
--- a/audio/mixeng.c
+++ b/audio/mixeng.c
@@ -344,7 +344,7 @@ struct rate {
  */
 void *st_rate_start (int inrate, int outrate)
 {
-    struct rate *rate = audio_calloc (AUDIO_FUNC, 1, sizeof (*rate));
+    struct rate *rate = audio_calloc(__func__, 1, sizeof(*rate));
 
     if (!rate) {
         dolog ("Could not allocate resampler (%zu bytes)\n", sizeof (*rate));
diff --git a/audio/ossaudio.c b/audio/ossaudio.c
index 0edd7ea5fe..a0428881c2 100644
--- a/audio/ossaudio.c
+++ b/audio/ossaudio.c
@@ -582,11 +582,9 @@ static int oss_init_out(HWVoiceOut *hw, struct audsettings *as,
     }
 
     if (!oss->mmapped) {
-        oss->pcm_buf = audio_calloc (
-            AUDIO_FUNC,
-            hw->samples,
-            1 << hw->info.shift
-            );
+        oss->pcm_buf = audio_calloc(__func__,
+                                    hw->samples,
+                                    1 << hw->info.shift);
         if (!oss->pcm_buf) {
             dolog (
                 "Could not allocate DAC buffer (%d samples, each %d bytes)\n",
@@ -705,7 +703,7 @@ static int oss_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
     }
 
     hw->samples = (obt.nfrags * obt.fragsize) >> hw->info.shift;
-    oss->pcm_buf = audio_calloc (AUDIO_FUNC, hw->samples, 1 << hw->info.shift);
+    oss->pcm_buf = audio_calloc(__func__, hw->samples, 1 << hw->info.shift);
     if (!oss->pcm_buf) {
         dolog ("Could not allocate ADC buffer (%d samples, each %d bytes)\n",
                hw->samples, 1 << hw->info.shift);
diff --git a/audio/paaudio.c b/audio/paaudio.c
index 65beb6f010..8cf19c51d0 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -206,7 +206,7 @@ static void *qpa_thread_out (void *arg)
     PAVoiceOut *pa = arg;
     HWVoiceOut *hw = &pa->hw;
 
-    if (audio_pt_lock (&pa->pt, AUDIO_FUNC)) {
+    if (audio_pt_lock(&pa->pt, __func__)) {
         return NULL;
     }
 
@@ -222,7 +222,7 @@ static void *qpa_thread_out (void *arg)
                 break;
             }
 
-            if (audio_pt_wait (&pa->pt, AUDIO_FUNC)) {
+            if (audio_pt_wait(&pa->pt, __func__)) {
                 goto exit;
             }
         }
@@ -230,7 +230,7 @@ static void *qpa_thread_out (void *arg)
         decr = to_mix = audio_MIN (pa->live, pa->g->conf.samples >> 2);
         rpos = pa->rpos;
 
-        if (audio_pt_unlock (&pa->pt, AUDIO_FUNC)) {
+        if (audio_pt_unlock(&pa->pt, __func__)) {
             return NULL;
         }
 
@@ -251,7 +251,7 @@ static void *qpa_thread_out (void *arg)
             to_mix -= chunk;
         }
 
-        if (audio_pt_lock (&pa->pt, AUDIO_FUNC)) {
+        if (audio_pt_lock(&pa->pt, __func__)) {
             return NULL;
         }
 
@@ -261,7 +261,7 @@ static void *qpa_thread_out (void *arg)
     }
 
  exit:
-    audio_pt_unlock (&pa->pt, AUDIO_FUNC);
+    audio_pt_unlock(&pa->pt, __func__);
     return NULL;
 }
 
@@ -270,7 +270,7 @@ static int qpa_run_out (HWVoiceOut *hw, int live)
     int decr;
     PAVoiceOut *pa = (PAVoiceOut *) hw;
 
-    if (audio_pt_lock (&pa->pt, AUDIO_FUNC)) {
+    if (audio_pt_lock(&pa->pt, __func__)) {
         return 0;
     }
 
@@ -279,10 +279,10 @@ static int qpa_run_out (HWVoiceOut *hw, int live)
     pa->live = live - decr;
     hw->rpos = pa->rpos;
     if (pa->live > 0) {
-        audio_pt_unlock_and_signal (&pa->pt, AUDIO_FUNC);
+        audio_pt_unlock_and_signal(&pa->pt, __func__);
     }
     else {
-        audio_pt_unlock (&pa->pt, AUDIO_FUNC);
+        audio_pt_unlock(&pa->pt, __func__);
     }
     return decr;
 }
@@ -298,7 +298,7 @@ static void *qpa_thread_in (void *arg)
     PAVoiceIn *pa = arg;
     HWVoiceIn *hw = &pa->hw;
 
-    if (audio_pt_lock (&pa->pt, AUDIO_FUNC)) {
+    if (audio_pt_lock(&pa->pt, __func__)) {
         return NULL;
     }
 
@@ -314,7 +314,7 @@ static void *qpa_thread_in (void *arg)
                 break;
             }
 
-            if (audio_pt_wait (&pa->pt, AUDIO_FUNC)) {
+            if (audio_pt_wait(&pa->pt, __func__)) {
                 goto exit;
             }
         }
@@ -322,7 +322,7 @@ static void *qpa_thread_in (void *arg)
         incr = to_grab = audio_MIN (pa->dead, pa->g->conf.samples >> 2);
         wpos = pa->wpos;
 
-        if (audio_pt_unlock (&pa->pt, AUDIO_FUNC)) {
+        if (audio_pt_unlock(&pa->pt, __func__)) {
             return NULL;
         }
 
@@ -342,7 +342,7 @@ static void *qpa_thread_in (void *arg)
             to_grab -= chunk;
         }
 
-        if (audio_pt_lock (&pa->pt, AUDIO_FUNC)) {
+        if (audio_pt_lock(&pa->pt, __func__)) {
             return NULL;
         }
 
@@ -352,7 +352,7 @@ static void *qpa_thread_in (void *arg)
     }
 
  exit:
-    audio_pt_unlock (&pa->pt, AUDIO_FUNC);
+    audio_pt_unlock(&pa->pt, __func__);
     return NULL;
 }
 
@@ -361,7 +361,7 @@ static int qpa_run_in (HWVoiceIn *hw)
     int live, incr, dead;
     PAVoiceIn *pa = (PAVoiceIn *) hw;
 
-    if (audio_pt_lock (&pa->pt, AUDIO_FUNC)) {
+    if (audio_pt_lock(&pa->pt, __func__)) {
         return 0;
     }
 
@@ -372,10 +372,10 @@ static int qpa_run_in (HWVoiceIn *hw)
     pa->dead = dead - incr;
     hw->wpos = pa->wpos;
     if (pa->dead > 0) {
-        audio_pt_unlock_and_signal (&pa->pt, AUDIO_FUNC);
+        audio_pt_unlock_and_signal(&pa->pt, __func__);
     }
     else {
-        audio_pt_unlock (&pa->pt, AUDIO_FUNC);
+        audio_pt_unlock(&pa->pt, __func__);
     }
     return incr;
 }
@@ -579,7 +579,7 @@ static int qpa_init_out(HWVoiceOut *hw, struct audsettings *as,
 
     audio_pcm_init_info (&hw->info, &obt_as);
     hw->samples = g->conf.samples;
-    pa->pcm_buf = audio_calloc (AUDIO_FUNC, hw->samples, 1 << hw->info.shift);
+    pa->pcm_buf = audio_calloc(__func__, hw->samples, 1 << hw->info.shift);
     pa->rpos = hw->rpos;
     if (!pa->pcm_buf) {
         dolog ("Could not allocate buffer (%d bytes)\n",
@@ -587,7 +587,7 @@ static int qpa_init_out(HWVoiceOut *hw, struct audsettings *as,
         goto fail2;
     }
 
-    if (audio_pt_init (&pa->pt, qpa_thread_out, hw, AUDIO_CAP, AUDIO_FUNC)) {
+    if (audio_pt_init(&pa->pt, qpa_thread_out, hw, AUDIO_CAP, __func__)) {
         goto fail3;
     }
 
@@ -636,7 +636,7 @@ static int qpa_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
 
     audio_pcm_init_info (&hw->info, &obt_as);
     hw->samples = g->conf.samples;
-    pa->pcm_buf = audio_calloc (AUDIO_FUNC, hw->samples, 1 << hw->info.shift);
+    pa->pcm_buf = audio_calloc(__func__, hw->samples, 1 << hw->info.shift);
     pa->wpos = hw->wpos;
     if (!pa->pcm_buf) {
         dolog ("Could not allocate buffer (%d bytes)\n",
@@ -644,7 +644,7 @@ static int qpa_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
         goto fail2;
     }
 
-    if (audio_pt_init (&pa->pt, qpa_thread_in, hw, AUDIO_CAP, AUDIO_FUNC)) {
+    if (audio_pt_init(&pa->pt, qpa_thread_in, hw, AUDIO_CAP, __func__)) {
         goto fail3;
     }
 
@@ -667,17 +667,17 @@ static void qpa_fini_out (HWVoiceOut *hw)
     void *ret;
     PAVoiceOut *pa = (PAVoiceOut *) hw;
 
-    audio_pt_lock (&pa->pt, AUDIO_FUNC);
+    audio_pt_lock(&pa->pt, __func__);
     pa->done = 1;
-    audio_pt_unlock_and_signal (&pa->pt, AUDIO_FUNC);
-    audio_pt_join (&pa->pt, &ret, AUDIO_FUNC);
+    audio_pt_unlock_and_signal(&pa->pt, __func__);
+    audio_pt_join(&pa->pt, &ret, __func__);
 
     if (pa->stream) {
         pa_stream_unref (pa->stream);
         pa->stream = NULL;
     }
 
-    audio_pt_fini (&pa->pt, AUDIO_FUNC);
+    audio_pt_fini(&pa->pt, __func__);
     g_free (pa->pcm_buf);
     pa->pcm_buf = NULL;
 }
@@ -687,17 +687,17 @@ static void qpa_fini_in (HWVoiceIn *hw)
     void *ret;
     PAVoiceIn *pa = (PAVoiceIn *) hw;
 
-    audio_pt_lock (&pa->pt, AUDIO_FUNC);
+    audio_pt_lock(&pa->pt, __func__);
     pa->done = 1;
-    audio_pt_unlock_and_signal (&pa->pt, AUDIO_FUNC);
-    audio_pt_join (&pa->pt, &ret, AUDIO_FUNC);
+    audio_pt_unlock_and_signal(&pa->pt, __func__);
+    audio_pt_join(&pa->pt, &ret, __func__);
 
     if (pa->stream) {
         pa_stream_unref (pa->stream);
         pa->stream = NULL;
     }
 
-    audio_pt_fini (&pa->pt, AUDIO_FUNC);
+    audio_pt_fini(&pa->pt, __func__);
     g_free (pa->pcm_buf);
     pa->pcm_buf = NULL;
 }
diff --git a/audio/sdlaudio.c b/audio/sdlaudio.c
index e8d91d22af..e92135bd2f 100644
--- a/audio/sdlaudio.c
+++ b/audio/sdlaudio.c
@@ -277,7 +277,7 @@ static void sdl_callback (void *opaque, Uint8 *buf, int len)
             return;
         }
 
-        if (audio_bug (AUDIO_FUNC, sdl->live < 0 || sdl->live > hw->samples)) {
+        if (audio_bug(__func__, sdl->live < 0 || sdl->live > hw->samples)) {
             dolog ("sdl->live=%d hw->samples=%d\n",
                    sdl->live, hw->samples);
             return;
diff --git a/audio/wavaudio.c b/audio/wavaudio.c
index 341eec3121..068a595732 100644
--- a/audio/wavaudio.c
+++ b/audio/wavaudio.c
@@ -139,7 +139,7 @@ static int wav_init_out(HWVoiceOut *hw, struct audsettings *as,
     audio_pcm_init_info (&hw->info, &wav_as);
 
     hw->samples = 1024;
-    wav->pcm_buf = audio_calloc (AUDIO_FUNC, hw->samples, 1 << hw->info.shift);
+    wav->pcm_buf = audio_calloc(__func__, hw->samples, 1 << hw->info.shift);
     if (!wav->pcm_buf) {
         dolog ("Could not allocate buffer (%d bytes)\n",
                hw->samples << hw->info.shift);
-- 
2.14.1


