Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRiBd-0008RM-OU
	for mharc-qemu-trivial@gnu.org; Wed, 20 Dec 2017 12:29:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33230)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiBZ-0008Nh-Ce
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:29:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRiBW-0007bl-9a
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:29:41 -0500
Received: from mail-by2nam03on0052.outbound.protection.outlook.com
	([104.47.42.52]:46296
	helo=NAM03-BY2-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eRiBV-0007ao-Si; Wed, 20 Dec 2017 12:29:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=FBLujxmLium8o8CJuxU5tsi4IyNSuKRZxKiMad4YwTI=;
	b=UxmU+j9iqGTAnUmmqSVe34Kf3Gu09wAj9t2+PGTH7YkLua1fnEHlQWDsBVZwlRRkuinA84Ki0Cvjc7AsqJzxDqaOtdUcgAPaaqSJ+Oh3kolRNuj8+ZQwgsdclSATbjCxniXBdE4BJY/F8TqeNd1JWGuFnZOfv01Gb+gLfUNqz6Q=
Received: from SN4PR0201CA0037.namprd02.prod.outlook.com (10.162.76.23) by
	CY4PR02MB3384.namprd02.prod.outlook.com (10.165.89.155) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.345.14; Wed, 20 Dec 2017 17:29:34 +0000
Received: from BL2NAM02FT046.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::208) by SN4PR0201CA0037.outlook.office365.com
	(2603:10b6:803:2e::23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.345.14 via
	Frontend Transport; Wed, 20 Dec 2017 17:29:34 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT046.mail.protection.outlook.com (10.152.76.118) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Wed, 20 Dec 2017 17:29:34 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:50994
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiBR-0003tS-G7; Wed, 20 Dec 2017 09:29:33 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiBR-0003z9-DI; Wed, 20 Dec 2017 09:29:33 -0800
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBKHTNMa020070; Wed, 20 Dec 2017 09:29:23 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRiBH-0003wp-3r; Wed, 20 Dec 2017 09:29:23 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>, <armbru@redhat.com>
Date: Wed, 20 Dec 2017 09:25:07 -0800
Message-ID: <6203a3d4e7a51f1508819c4f8916aa5fa97fbc01.1513790495.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(39380400002)(376002)(346002)(39860400002)(396003)(2980300002)(438002)(199004)(189003)(4326008)(39060400002)(106002)(54906003)(2906002)(77096006)(6666003)(16586007)(47776003)(110136005)(5660300001)(316002)(81166006)(8676002)(50226002)(81156014)(8936002)(2950100002)(9786002)(76176011)(356003)(48376002)(478600001)(50466002)(36756003)(7696005)(36386004)(575784001)(106466001)(51416003)(305945005)(63266004)(118296001)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB3384; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:xapps1.xilinx.com,unknown-60-100.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT046;
	1:E/tpHHJdaNDY+pFey2axwsjM0WfZQNyEVT1XEThvSbtXTzWEYrQXKdeKo4HeJUYyoFjdBzp0Gg6rK3Vy3Z9vBgiiIBwwpJva4KaQIczLscpfXWtHlePnweKaJ/cUJdSy
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3ecf606-2acc-4033-5ad7-08d547cf3caa
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(5600026)(4604075)(4608076)(2017052603307)(7153060);
	SRVR:CY4PR02MB3384; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3384;
	3:uG1z8GkjyhddLNJMpzxA1JrWwKg1DWX5ewmyNxiJsP2dl8NPXxiw413lXWramg43iC5RZFY9Wxi2jz1mv+qv8im5CEoRjNgfdxB2J+Ygl7++pQB34aQLByAxVqdHHy3gL2bJDSUNk9+OZqmqnVDJU6KkWkbvfmdnNY7ZWfwWDTowM9hlqi/sr10EJG+FOui6LQ7/9D2cmcxnl1rKPPaXotd8CftSl30BWgEx2/x9kyBDiA9R7givBW2oyqSKX/mlSHv68ulijMJs0ArMbwklnDIR2oXK5cuX5ipXQoEemJ9rLBrOfsB/Oo0XaxD8tl96ao5HOFFrK9iABydLlUscSjhS4WJzz99pdUFat4YYWoI=;
	25:6soUGudyGhIkeBAmmJIImjNZ2Rhn6afIWtS7z6U/EozJHUYal3mcf3wouHXzQUSolvPNikhcZE+eFe93qRvYeT5x9QvB93MEBE1NzvgJjQtUzSHirBV6jafihCDulzMzkA1Uu2feAo2e/cYy1mfaTln6l/6gvY2tIaZEb7ZnnYIiG8wJH5tmyOCljfYfgDTAd6iJzglzcdG0k+IXy8AvWdWBu5ZxZbd0gK5tXI6j+CXvrCRHiOIxtm/ID8NYk/nBAC2i5Tfa2i2CpBfgACk9X7tctikzGfBass9SNd/4xB+gsGRhafABaHV3YE5MxGZu2OzewJs+n1x+EBrP0qPEvQ==
X-MS-TrafficTypeDiagnostic: CY4PR02MB3384:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3384;
	31:zPa6Np5KktBj2rQOyIJcTKDqJqRmAH8mp4bsxnzh/bH4cKxxUNZQzLsJYFWVRyU9426v/JQVv8c03/wG0Jsgp3K8tDGOJMPp82iBDD+aFsaWaZC525bPmAnaRNGoorPCnH0JiZVMjGvVbpvPqP761o8ah+tahh5E7vHd70HXpP/vdiF4NEM16EBl7M637sQRw5jt2Gkr6qhQ3abs2r+KTgh85ifK6SXEqfW+Ul3Vm9A=;
	20:dH1Murp6rggybZR0l6p+kP28fMOfzpTpbaBDMSPzsFni43utQXE+PodQhm5XAonKMfTFSJGn7UUAP2aDmQoyG+4BSnEj1UEQjBWP/iUW36fkHQgo4e/h0XPF1CCOWH81NlBHK4EIddf4Rv7gLCwjCLRtVPMvE7GME3292tIM3J9WtiiE4moEF4JcW14vHWx9LAYlVYuGkQQT2Y+Fj2rlleUcOXSKozicfDeg/bHMzaavZZuZDqJKaT+YJ5yeRf4EsdTNBWUo+RMEuVcNwKMCUuzzpYs51gxUvpFB38DAIDlhPdTAD+AXSe3z9hE4tpdikr+W0jFW3A7ZkotH7uMpeBtRJJoiEDokGi3xefQOUYl85UwWEFCmvAlUhWRaxzWPrv4Mi6UD5ujh+MuEZrzAvjbEgnYqbMmnB3AlBFGh8zP8Zi8mfS0rqN0lZLALAizRGV1grZLPNWhDvc6SVhkTtRdEBikNHwq8ur3l/+9rmirZ5FunGbrthQziovpdBc//
X-Microsoft-Antispam-PRVS: <CY4PR02MB338406D2AF1D3CF4ED501374DC0C0@CY4PR02MB3384.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592)(17755550239193);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(8121501046)(5005006)(3002001)(93006095)(93004095)(10201501046)(3231023)(6055026)(6041268)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(6072148)(201708071742011);
	SRVR:CY4PR02MB3384; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:CY4PR02MB3384; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3384;
	4:vWuWe8g9dMZpZugkx/QcP9rWics0f1Grv6gC5gkBEqjNXNK1ChX5s0hOE9/7LVqHbcRQR2IiV5FVCTkJOwHM74pf1/7x/LcZSNLgVfgNXr3xolPkse32QA8+aKePUL7CiAnstW+BZpfIjDaRjEncb6ipkMcpzd99vYjbeiGEovWTUtCFv3tRfRGD7Nibx1HkLHN/i76p9SLH88OlF+z/nS1Rc69WTA1fV8vmRnf9OIFHF3q0hdpJTPruw+rDy9dVEUavmI0VUrQjaAPe7Dov0nYlUzSl++e1WM0Cc4FiajdY2i6g5+TKFG1oc681i/12k4pHJofHIlzcEOUcVPGhhDK5qsdn+y8DqeuHAR1v3xk=
X-Forefront-PRVS: 0527DFA348
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB3384;
	23:JB+3ZvKtdJjcDbLgtHLBA/Fr3aXL7NMpmiML9Mouw?=
	=?us-ascii?Q?nlYz43cOPGV/UmxAIR6xF+HIkD4/izBcl30KSqkcMOV1sOkpaaOYPu2fMb5k?=
	=?us-ascii?Q?PnwCtoxWGi06+ranOg5DC8QzAtmJe515LGXFqJsG0HyFcOi4Vd1JRNBkvNBP?=
	=?us-ascii?Q?aNh6jscxKcx0ZX6I2a2qjGwu3DIK4R3VLAp/doIGpqro08/bHRurcYImsMY/?=
	=?us-ascii?Q?yDlGLCSLdride7VpZMaXjT7Lj7fPOEdqyzKxhmjofTdqcvWN3H5rA0CWspfG?=
	=?us-ascii?Q?dQcfHdjzP5XwqgLSl+oy9oj1zJ1e4+KGer/FOD3DzjOdVijAVrTXb9xn7q+5?=
	=?us-ascii?Q?g0ZrsKiNtb972eweHGock9IFdy3hPMxjQt5RVBxTYGAny1FmlpGQrRCJMrJp?=
	=?us-ascii?Q?AaqiWlEOW4DBL2cc2TlxvZjdQud87jCcIx1fUFRGCCVCT+e2mF0usI2wFFSi?=
	=?us-ascii?Q?VVmqNebrYYPRc3h68EOEeMeS8jduJqSDxXLGT3ZN+fMf+AqqYRhCHHpVGXlG?=
	=?us-ascii?Q?pE9DJkez7b1wc3qybernqe7BrgPTLpsianHIhbRvFOmKfTwc81NVDQuULCF7?=
	=?us-ascii?Q?8Qq0roT65iWIc0O8lYhMCU7Fgn68CnbC9BBgWC/0Z/QcXMBpzzpDW3iFLZKS?=
	=?us-ascii?Q?gZXjqMzytMyRJD/z0CRSVGrx2fokQ8Lq3f1dntmLG3G+vrN4mkKbimtIPG+S?=
	=?us-ascii?Q?2YNOuzNQpyWcNLXUHLifryrinxBbi+fM9NMOBMGhiVSmcTfdFU2F8Ja9w7x3?=
	=?us-ascii?Q?Ph6M0P1mPkagJc4NuPm7MniSmTKgrGxdwKBklcAuN2jLouJP5uOSuizdrJmk?=
	=?us-ascii?Q?le8uZEol6mKkulG9y9mpALxtv+5JpTDxb1T0PtkZ+uL7g+i8c1Wz93QhJWq1?=
	=?us-ascii?Q?mUyWBa0P7xMHKkRfPO9oIBbafvVhZwPmh5G5EIiwjvIMI/9tc7FhbkgmVU9i?=
	=?us-ascii?Q?EZvR6bvQ46xdhK2QtFii0+tgTy6t3XwbZHFraWZLyMlSmw/gHPKO0Uage0E7?=
	=?us-ascii?Q?s+YWtxQp1S7w5csHCdX9RT58fTp2YK55nYLM85LOQImLvpVUw2SJWhWQBxjg?=
	=?us-ascii?Q?QgGWT0=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3384;
	6:JPxlYag0bjNeFBMeSlYvVszbRSZnYmUcrX4YqsdxCFOtd+W+CU6s3doS6LakuZmeilcfy4nmWsptbn7hFZd4cakD8txUnh+Psxhrqk7/lDvF01pfKVVJKlSkQqCs8tkHPOfUN+sPzISYE851EBgUQpEme44Ve4GL5Jfm4ybEUWtuUGDYSO2eKaBnwvhj1W9tgivnNL7CEAlqHmdHN5WHGC8T8sln4VIrxya/2Orcp6msPu9ukfTVEhwo4SBe1OeM5bP7cVOPGhu54X67Yxx3nJeWMYnuPd/OOihridp4LafJnH/8Zm1A+tL6+BdnpEAAdVRsg21uo9fKs0DPX/Oie43qF69oAUDtMoLbTvIXwxA=;
	5:MGWtRTXLMeUSm1q1EjoW84UDSm/Nmg6ZQTYDLR1aWIGndcY7zDHhHyQ0dCNxJEmzspYws1uhDEXJuB52/cfm0ay3CgM5Du8jSAO3VH+tgLTrMgfFcyXydcWjEHtppS4xyMsoUNhNnMVA0v1JOKL2rP3mZCQKkHGQwFC76dEXNMo=;
	24:RVbJCgUAwK+FwV3IGLxGzGolEfyv7UVB/1H8pp+I5FQOPpsSNhlYxq1GG7ufuAJXKxXCV0CyQ5lzy8VPiaxTe/cvqcB3//KENwgFORNj6ZE=;
	7:jIMysuY6pM/4qW3u3ngKBgO9YF2kncQHjcpy4wf1MNkhHJcqMyMbZbUNODRWW/Y/fJSYweeKin+13GFYpzEkajeo/RJAaNc9qDHfkzEtX9ldJ8XQrGDvMfuun240kydeGs0X5iAYQiConLgq6GdJqc6QPjpI0Q0ZpUEdDTJEGMclUOkq1kLXzyxTXKto5PGg7jFE0brds30As+er5zwQ/G7FUKeBRsK9oBx1JXaAbKJrA/WrzNgvexmdHvjQ8/Sl
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2017 17:29:34.1736 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3ecf606-2acc-4033-5ad7-08d547cf3caa
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3384
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.42.52
Subject: [Qemu-trivial] [PATCH v6 29/29] target: Use qemu_log() instead of
 fprintf(stderr, ...)
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
X-List-Received-Date: Wed, 20 Dec 2017 17:29:44 -0000

Convert fprintf(stderr, ...) to use qemu_log(). Double prints in
target/ppc/translate.c were manually remove. A fprintf() in
target/sh4/translate.c was kept as it's inside a #if 0. The #if 0 and
fflush() was removed around the unimplemented log in
target/sh4/translate.c as well.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 target/cris/translate.c      |  2 +-
 target/ppc/translate.c       | 36 ++++++++++--------------------------
 target/sh4/translate.c       |  7 ++-----
 target/unicore32/translate.c |  2 +-
 4 files changed, 14 insertions(+), 33 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index 2831419845..d2dba748cd 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -137,7 +137,7 @@ typedef struct DisasContext {
 
 static void gen_BUG(DisasContext *dc, const char *file, int line)
 {
-    fprintf(stderr, "BUG: pc=%x %s %d\n", dc->pc, file, line);
+    qemu_log("BUG: pc=%x %s %d\n", dc->pc, file, line);
     if (qemu_log_separate()) {
         qemu_log("BUG: pc=%x %s %d\n", dc->pc, file, line);
     }
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 4075fc8589..eb1fa9a0cf 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -3938,12 +3938,8 @@ static inline void gen_op_mfspr(DisasContext *ctx)
              * allowing userland application to read the PVR
              */
             if (sprn != SPR_PVR) {
-                fprintf(stderr, "Trying to read privileged spr %d (0x%03x) at "
-                        TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
-                if (qemu_log_separate()) {
-                    qemu_log("Trying to read privileged spr %d (0x%03x) at "
-                             TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
-                }
+                qemu_log("Trying to read privileged spr %d (0x%03x) at "
+                         TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
             }
             gen_priv_exception(ctx, POWERPC_EXCP_PRIV_REG);
         }
@@ -3955,12 +3951,8 @@ static inline void gen_op_mfspr(DisasContext *ctx)
             return;
         }
         /* Not defined */
-        fprintf(stderr, "Trying to read invalid spr %d (0x%03x) at "
-                TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
-        if (qemu_log_separate()) {
-            qemu_log("Trying to read invalid spr %d (0x%03x) at "
-                     TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
-        }
+        qemu_log("Trying to read invalid spr %d (0x%03x) at "
+                 TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
 
         /* The behaviour depends on MSR:PR and SPR# bit 0x10,
          * it can generate a priv, a hv emu or a no-op
@@ -4101,12 +4093,8 @@ static void gen_mtspr(DisasContext *ctx)
             (*write_cb)(ctx, sprn, rS(ctx->opcode));
         } else {
             /* Privilege exception */
-            fprintf(stderr, "Trying to write privileged spr %d (0x%03x) at "
-                    TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
-            if (qemu_log_separate()) {
-                qemu_log("Trying to write privileged spr %d (0x%03x) at "
-                         TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
-            }
+            qemu_log("Trying to write privileged spr %d (0x%03x) at "
+                     TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
             gen_priv_exception(ctx, POWERPC_EXCP_PRIV_REG);
         }
     } else {
@@ -4118,12 +4106,8 @@ static void gen_mtspr(DisasContext *ctx)
         }
 
         /* Not defined */
-        if (qemu_log_separate()) {
-            qemu_log("Trying to write invalid spr %d (0x%03x) at "
-                     TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
-        }
-        fprintf(stderr, "Trying to write invalid spr %d (0x%03x) at "
-                TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
+        qemu_log("Trying to write invalid spr %d (0x%03x) at "
+                 TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
 
 
         /* The behaviour depends on MSR:PR and SPR# bit 0x10,
@@ -7365,8 +7349,8 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
             break;
         }
         if (tcg_check_temp_count()) {
-            fprintf(stderr, "Opcode %02x %02x %02x %02x (%08x) leaked "
-                    "temporaries\n", opc1(ctx.opcode), opc2(ctx.opcode),
+            qemu_log("Opcode %02x %02x %02x %02x (%08x) leaked "
+                     "temporaries\n", opc1(ctx.opcode), opc2(ctx.opcode),
                     opc3(ctx.opcode), opc4(ctx.opcode), ctx.opcode);
             exit(1);
         }
diff --git a/target/sh4/translate.c b/target/sh4/translate.c
index 8569179883..5de92b19e9 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -1787,11 +1787,8 @@ static void _decode_opc(DisasContext * ctx)
         }
         break;
     }
-#if 0
-    fprintf(stderr, "unknown instruction 0x%04x at pc 0x%08x\n",
-	    ctx->opcode, ctx->pc);
-    fflush(stderr);
-#endif
+    qemu_log_mask(LOG_UNIMP, "unknown instruction 0x%04x at pc 0x%08x\n",
+                  ctx->opcode, ctx->pc);
  do_illegal:
     if (ctx->envflags & DELAY_SLOT_MASK) {
  do_illegal_slot:
diff --git a/target/unicore32/translate.c b/target/unicore32/translate.c
index 384aa86027..1d4f3dd2ac 100644
--- a/target/unicore32/translate.c
+++ b/target/unicore32/translate.c
@@ -1936,7 +1936,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
         disas_uc32_insn(env, dc);
 
         if (num_temps) {
-            fprintf(stderr, "Internal resource leak before %08x\n", dc->pc);
+            qemu_log("Internal resource leak before %08x\n", dc->pc);
             num_temps = 0;
         }
 
-- 
2.14.1


