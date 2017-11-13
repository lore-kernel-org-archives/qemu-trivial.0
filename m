Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eENNe-00022N-2t
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 17:39:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENNZ-000211-AF
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:39:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENNW-0006mP-6C
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:38:57 -0500
Received: from mail-cys01nam02on0065.outbound.protection.outlook.com
	([104.47.37.65]:45024
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eENNV-0006lW-Tn; Mon, 13 Nov 2017 17:38:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Ar9T/gbxE4P58QM9LI3LmU5IEjU46ANs9gl0qK85TGo=;
	b=NUtXOUijVHs/4VtWw+mLsHGawwv0Wtx7vipxmTdQhDuj7mq3if+xNKcWbTdY8jCtilxmtLV940bBFzDTGzCXx0oxF7AWSobUQEI6Sy0AfCTAFshS/rAkec1VqLiPWPJQAzWRSedeWnkGDtq27lckYMlIcnrZLrKhoT7JHqbma1Q=
Received: from SN4PR0201CA0006.namprd02.prod.outlook.com
	(2603:10b6:803:2b::16) by DM2PR02MB1338.namprd02.prod.outlook.com
	(2a01:111:e400:50c8::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.20.197.13;
	Mon, 13 Nov 2017 22:38:51 +0000
Received: from SN1NAM02FT026.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e44::202) by SN4PR0201CA0006.outlook.office365.com
	(2603:10b6:803:2b::16) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.218.12 via
	Frontend Transport; Mon, 13 Nov 2017 22:38:50 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	SN1NAM02FT026.mail.protection.outlook.com (10.152.72.97) with Microsoft
	SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.197.9
	via Frontend Transport; Mon, 13 Nov 2017 22:38:50 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNR-00048c-Lo; Mon, 13 Nov 2017 14:38:49 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNR-0000Km-J3; Mon, 13 Nov 2017 14:38:49 -0800
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vADMcjpc012418; Mon, 13 Nov 2017 14:38:46 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENNN-0000KY-Mn; Mon, 13 Nov 2017 14:38:45 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>,
	<armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Date: Mon, 13 Nov 2017 14:34:45 -0800
Message-ID: <e5b06e7b283106c82aee47044d4d0475718d8a78.1510612380.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1510612380.git.alistair.francis@xilinx.com>
References: <cover.1510612380.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23462.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(376002)(346002)(39860400002)(2980300002)(438002)(189002)(199003)(118296001)(36756003)(8936002)(4326008)(39060400002)(106466001)(316002)(5003940100001)(305945005)(33646002)(189998001)(2906002)(50226002)(356003)(47776003)(36386004)(48376002)(50466002)(106002)(81166006)(63266004)(2950100002)(76176999)(54906003)(77096006)(81156014)(478600001)(50986999)(16586007)(5660300001)(9786002)(110136005)(8676002)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM2PR02MB1338; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; SN1NAM02FT026;
	1:yZT2G4cxeu3NZ36x7RR1+3EpE1vXMZ6OddNQX0I7GZ5twTuh9GS9J5gZET5WpRDuC2uOw7zRFdVL1oPJHLaGSOG5xCiIl0KxrwcJ9yWWdRHr1Ou5MGxrR9ygKcLy3JiF
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cf71bd0-f865-497a-31a2-08d52ae74fa0
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:DM2PR02MB1338; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1338;
	3:wtgkuyU4fnFuiM/JzS3vatSUbMTxWP3DJ9aQsMu9g4304kUo44gmMVAxmVY4J6196vrpsWfH2RVbyySTIod3k/CAioVcnrWXARo66i7KWvGx2AL/Boi0YxtUuXB8q4Hg192aGi7GFbfDW07+MZNwfOe9pOhbW37lKVODGRAFTak2Wo1aJh3UzgDU+Mb9ilePHReIZacnck/M54y+iTULlE4VoTjvOat/Gs+Jguo3pGITLWxmpNGg04lNa8oBySQSL/8DNkxg5OjLlggpS9Hdr9R/ZXvmU4+zqD3PAuwjSyJgPqsFFBWE3ZKGEF3PaI8kmNheVBySq/xu9YTfneOCKzpEX6kcPj7bJdC2Kl8RMXQ=;
	25:xFBKeWrQrM00TkMXxbMb2TQA9/3SjxirWIeD2RiizKx8KFNFbcRFjoh6uwyLuMe3HBA+3jJAiG6UF/vGw9Xijl488/xsk8TzGwfAKtrv60bs1mRFjBX0l3eRFqcbGp+zsQMSp5gkUAZn5N+pKTT6Ki9d8DlbsaUy8XSW59SqDrF/7ofbt5bjKerknRiBM/aYCDhMVdmAiLw/h6WBsB73SWenN985S6xbtMn+QdNB4VWCdjVqGuXdounhpkWACsgTp1Ba6Tm4VKhm+9gNwNywffbM6KcC5vHPipzYAid9V4RrxMDHu0QLLQ0/Nd2xuT2mWKsr06Jhkq9o046Eyj39h9XCbDipM8OboOq8tYKswx8=
X-MS-TrafficTypeDiagnostic: DM2PR02MB1338:
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1338;
	31:Olb7ulg+0zKw2WO/j3Kx3w+uMPQTcbwdFR2WrSZNf/4f8PrPzYbJcvcloQUckx0sbFCIdZTJi6qb9uFcg+2Nq/mozrqOopSxdhemw/iHfSGOMvqnP1iFd1dq/AgfwaS0rkrMDyQbzdyPXhgFquFaocqGkUZ0q4nsfd76L2xEv1z9xqR+CMtF9U4qQK7re/3ITTgyRW4jjSzhCFaeLXvnHMLzbGdiu2X3Kvz3VmiAR8s=;
	20:XRKjVonS9mPlCwhSI1zlMVqf/latrHdTSo157I64MS5+BR4sfFVP5sehTEy73C5CWdLqfLOnafqpp5Qs9IITMvI0eqh3kkDf7e4nZ91gURNkjuzG35LDJQRiuTVqrcQjqrYQy5tlEPgrExB/SdY5DSN5TRYTtCAvgyHuVGb/RavpQvU3WaiK8mzxzVpIzMl3NDM6oo7tR1bK8qHUtjhdjylS3br+MmaytG0Yb0sYEczfSw5b+wAu0bKSeWwzZDlCmIYaHSAJTDKy/wRdrfWDgVlqkUnVnfpyaWTzeCgAfKy2j7IRzooqTvvJTF+cKP2eE72tnLKXlK6t4308JUQW9EBOa7Vq0wxlZnrvpVenFM2tGdaTrkqZHyQdCRuuhql6CRMsMFEFA9H2bsyyxPtvcjL6gtiWOp8wBCoLOFtv8aZhNXfpft7zDU2Ga4yUBNyWCiciZB4PS2FsIDNVbjndG65Js4lJtm9tozFijEH65LZ3RPpwFRsDNQRr0u+xeK56
X-Microsoft-Antispam-PRVS: <DM2PR02MB133864FEDA48AA23C17DBA5DDC2B0@DM2PR02MB1338.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(100000703101)(100105400095)(10201501046)(3231022)(3002001)(93006095)(93004095)(6055026)(6041248)(20161123558100)(20161123564025)(20161123555025)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM2PR02MB1338; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM2PR02MB1338; 
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1338;
	4:Vr/X0hB00w5ZBFhgGNBql57ToD6Njp2cfBb9t3bfoxkIkYdDf4P/M4lK3RlpNJ2iMMUjOJfF1piVgPxlIl3d3rXofLXlzFkrFuMWagypqq6TCoPHDYUgUZSMta0Lv0QvhLOmtULathcn6VRFyoZZTzgW9JYdmnksne58YwXmQaVZ64Z9rx+qSN4172kXl5HMFMBqK1KcBVeHd+vGFIAy9zVgaz/wbmbfRYTFn1Bj+y0zMq7bVb/RQQmSf/ViFLjGQ5frmA6VxjHTLUxVA4Vk+r+9XtSx+iXBqKcejTR+b0Oq9gndcfdD1Al5hL983jMZ
X-Forefront-PRVS: 0490BBA1F0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; DM2PR02MB1338;
	23:0t4aRvsZCgOolfSWtHjCsqjn3O3VbnHj1Ijl5trZt?=
	=?us-ascii?Q?RYKYJX+X8sGS5LL4zPQOuTrtPw6kUc9F5MzCpwITr+mxvOZZyryB0XGEOahc?=
	=?us-ascii?Q?/nLpDoaHjN2rM6ZfCu2iidCROlyB0YXQvLkC/VYdaDNmS6OjfTQ9Chjr73Pc?=
	=?us-ascii?Q?rbqTBtPOaCUrbM8KOk6snDwPa/CRJuk4NzmVbxwViw8Tfv9Q7hEHtdrNLAGr?=
	=?us-ascii?Q?NDPfftFTUPEFTKt6ns8lj31Ff4UX2dWnBgyO2dIhafV7dT84UGbmekl3wXyW?=
	=?us-ascii?Q?kFPrOPG0x0jcTDIYXcbumxSW3jxhxPZesfYIJtQCh+O/h09HQhXoFu3sTeC3?=
	=?us-ascii?Q?sCokycA7H/aEDHAXFsza/0oVE5OuLGc75cwzp8iGJrFR/QppAJJeREPi3VvH?=
	=?us-ascii?Q?OiJAGuH6vLaM5Mqk3nDjxVlZh6GFPh0vZFUkFV4RsD0ICVgG8Mwisq0bOL03?=
	=?us-ascii?Q?xyYO6xQotAMCmthE3EuK5NiWI4Xq36lBB4JCRsUCGms+VPXdcyvZPfMZ8ghf?=
	=?us-ascii?Q?eHOYaBcy9u59lqY+DfcAX9zkE892pCWbckfTv6IoLSKLnAdj1qLyKLZ5YWVp?=
	=?us-ascii?Q?uIyOk82sI0G/mGYhdv1zIvVGaWJpsAo37k7E4e4zmZAbEynuA4p2fSvvDw+2?=
	=?us-ascii?Q?AXIYM4CGbwVSTqYIu374uiIukp3dU1XhFpJNSH0cCrzFITgAvYs0u+jGRTr1?=
	=?us-ascii?Q?EbI+jcXlAb0sumOtHl5OsIuO8j3ypnY2+qHVg9pS9NxrfS5sgajDwYB83Ah0?=
	=?us-ascii?Q?MHzWa//hlrIR83J6rXFhYmQIvnqXhnTS23Bk2l6hEk6V/aTjKeSBwTezoFkQ?=
	=?us-ascii?Q?OrhY0etgXDiRS+mwgbGmJm5a+8V81lrVZNKodPt2EwnpthPP/xMUZqn8fVYp?=
	=?us-ascii?Q?lbM3eBgm86OQOKlodjH9xYTW62Hhl25MGavf00ceX/wsLDoaqAUbNd+yqXGU?=
	=?us-ascii?Q?95KDz0vxs0B7MXoZKxZsUeeBGSB8yWF76qzCvpvAhL3ei01mSht6T8sQqLgh?=
	=?us-ascii?Q?gq43NzXMdg6vR2te9jKINfy?=
X-Microsoft-Exchange-Diagnostics: 1; DM2PR02MB1338;
	6:rTE4LGqq0qjRIaOSNA+sE9u2hIXYVDfWOdsGVGPuqAmp2QejWdF6Yy+eLVz4f0iVM38U9VEADpL4Rixoq6z0hliuvFrxwFwS7rCKz7pcV/jZJ7NjGGhe4rLW/UFI+C1F0JEAEFTa1NxyT27ZhxAVfI7klWYws35LWfNvkFdHDUT3cBO8V/26o7Zn/A0SDmNxohR3Tx+wgzyus/r1LicFHT4WuuOUgK+NlvDHDMxol8YZbXCL5lxkvjLi79R+FJGyPsH98EKUFpCUJtJFLg+YZcYFNVraXoNx/DGqb1j5ivExIj8WHP6G7tKQuzom5iCjqwxPkeBhG60xBLmEUOqbyJQR0cejcDVY+Fjvp/9QQjI=;
	5:KAP8Wc56zkc3siLP7wxnmPz92ZxFS/M/HyU0D+eIUSLge+OzRPMUvBWHrAAtM7xNSX6+yPk7BnhXA5vItxBzCuzZlLoth3p711FEqQmPWFyrqvV9ve0HeWQfpRh7rn8/orcYulKGAQXpvaKLkIzGRdovj/4M1qpEIs0NljQjSLU=;
	24:4WVD1gMKd0dzJI8S8gsE39ll+IigJeOGRBZYH00ZPGr5u9KFJ/1HqJiOuvy1+8yVYnW9avcuNaXubhwfvXNI4nn0mJgoHGbenDX3YnC2Gr8=;
	7:p2uydfA6YtyD92IXLwVpx2YKL3/qv1mC9/lSyX8UH1JVsJUqgmsy31BEWVxSBZiVj1t9MzUdIlkFJvRtE87ZssDFfetPWXl1PiaDdM4GR9NNGURNQyzB9y82n2/MQFdewt4+x3bKg14T176Sdn/riCqdIQzUgPVoyOqujJSX6CJWO1qWq00JTm4OF1voaGu+IqOUaPJMS4L0I6qYX0szQXCdM3zstt/JJceIIrVfFojA6ozpvlwb4V2mqWvtoQah
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2017 22:38:50.1847 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf71bd0-f865-497a-31a2-08d52ae74fa0
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM2PR02MB1338
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.65
Subject: [Qemu-trivial] [PATCH v5 03/29] Fixes after renaming __FUNCTION__
 to __func__
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
X-List-Received-Date: Mon, 13 Nov 2017 22:39:00 -0000

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
Cc: Eric Blake <eblake@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
V3:
 - Squash onto single lines
 - Don't fix indentation of case in omap_prcm_apll_update()

 hw/arm/omap1.c     | 8 +++-----
 hw/block/onenand.c | 2 +-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/arm/omap1.c b/hw/arm/omap1.c
index 1388200191..92e58f09c8 100644
--- a/hw/arm/omap1.c
+++ b/hw/arm/omap1.c
@@ -1717,7 +1717,7 @@ static void omap_clkm_write(void *opaque, hwaddr addr,
         if ((s->clkm.clocking_scheme ^ (value >> 11)) & 7) {
             s->clkm.clocking_scheme = (value >> 11) & 7;
             printf("%s: clocking scheme set to %s\n", __func__,
-                            clkschemename[s->clkm.clocking_scheme]);
+                   clkschemename[s->clkm.clocking_scheme]);
         }
         s->clkm.cold_start &= value & 0x3f;
         return;
@@ -3329,14 +3329,12 @@ static void omap_mcbsp_writeh(void *opaque, hwaddr addr,
     case 0x18:	/* MCR2 */
         s->mcr[1] = value & 0x03e3;
         if (value & 3)					/* XMCM */
-            printf("%s: Tx channel selection mode enable attempt\n",
-                            __func__);
+            printf("%s: Tx channel selection mode enable attempt\n", __func__);
         return;
     case 0x1a:	/* MCR1 */
         s->mcr[0] = value & 0x03e1;
         if (value & 1)					/* RMCM */
-            printf("%s: Rx channel selection mode enable attempt\n",
-                            __func__);
+            printf("%s: Rx channel selection mode enable attempt\n", __func__);
         return;
     case 0x1c:	/* RCERA */
         s->rcer[0] = value & 0xffff;
diff --git a/hw/block/onenand.c b/hw/block/onenand.c
index e243182394..ed77f859e9 100644
--- a/hw/block/onenand.c
+++ b/hw/block/onenand.c
@@ -659,7 +659,7 @@ static uint64_t onenand_read(void *opaque, hwaddr addr,
     case 0xff02:	/* ECC Result of spare area data */
     case 0xff03:	/* ECC Result of main area data */
     case 0xff04:	/* ECC Result of spare area data */
-        hw_error("%s: imeplement ECC\n", __func__);
+        hw_error("%s: implement ECC\n", __func__);
         return 0x0000;
     }
 
-- 
2.14.1


