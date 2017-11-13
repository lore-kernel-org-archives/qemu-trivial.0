Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eENOz-0003oa-Op
	for mharc-qemu-trivial@gnu.org; Mon, 13 Nov 2017 17:40:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57430)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENOx-0003fx-1r
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:40:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eENOt-0007ep-TL
	for qemu-trivial@nongnu.org; Mon, 13 Nov 2017 17:40:23 -0500
Received: from mail-co1nam03on0054.outbound.protection.outlook.com
	([104.47.40.54]:12640
	helo=NAM03-CO1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eENOt-0007e1-HV; Mon, 13 Nov 2017 17:40:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=VB3PqBubYdBgHtnb6dS/uOSJJ+VmvYPGj5XXWWI7sJE=;
	b=JOdwLf/kwrLUXSw+PCeTiTpBvsRhzxnZXDaywaqPp4LrL0eRlV9tIyNT03nWEjmVoJU3yJv3LR1v2eG7s61pnFGLxnsLgaGr5TWPgi9VyOvhHW7uMZu3t/1yTXbc82GAzmh+aJJ22RMPfcco9696RSQ8+wQzRWlgHp5+gEgg6Vk=
Received: from MWHPR0201CA0020.namprd02.prod.outlook.com (10.167.160.161) by
	CY4PR02MB3384.namprd02.prod.outlook.com (10.165.89.155) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.218.12; Mon, 13 Nov 2017 22:40:16 +0000
Received: from BL2NAM02FT025.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::206) by MWHPR0201CA0020.outlook.office365.com
	(2603:10b6:301:74::33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.218.12 via
	Frontend Transport; Mon, 13 Nov 2017 22:40:16 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.100)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.100 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.100; helo=xsj-pvapsmtpgw02;
Received: from xsj-pvapsmtpgw02 (149.199.60.100) by
	BL2NAM02FT025.mail.protection.outlook.com (10.152.77.151) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.197.9
	via Frontend Transport; Mon, 13 Nov 2017 22:40:15 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66]:47793
	helo=xsj-pvapsmtp01) by xsj-pvapsmtpgw02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOp-0004Wd-0N; Mon, 13 Nov 2017 14:40:15 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOo-0000sx-T2; Mon, 13 Nov 2017 14:40:14 -0800
Received: from xsj-pvapsmtp01 (maildrop.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vADMeDxC003210; Mon, 13 Nov 2017 14:40:13 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eENOn-0000rJ-BJ; Mon, 13 Nov 2017 14:40:13 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>, <armbru@redhat.com>
Date: Mon, 13 Nov 2017 14:36:13 -0800
Message-ID: <d297d74fd53f91e25e4ffb980ea40d4032beaf0b.1510612380.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1510612380.git.alistair.francis@xilinx.com>
References: <cover.1510612380.git.alistair.francis@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.1.0.1062-23462.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.100; IPV:NLI; CTRY:US; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(346002)(39860400002)(376002)(2980300002)(438002)(199003)(189002)(2906002)(9786002)(110136005)(54906003)(16586007)(118296001)(50226002)(106002)(47776003)(8936002)(81166006)(8676002)(81156014)(50986999)(76176999)(4326008)(478600001)(5660300001)(305945005)(50466002)(106466001)(5003940100001)(48376002)(33646002)(356003)(36386004)(189998001)(39060400002)(316002)(36756003)(63266004)(77096006)(2950100002)(107986001)(5001870100001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR02MB3384; H:xsj-pvapsmtpgw02;
	FPR:; SPF:Pass; PTR:unknown-60-100.xilinx.com,xapps1.xilinx.com;
	A:1; MX:1; LANG:en; 
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT025;
	1:NuQbqmVZbPbueuYNrM3/fFzBOTIxIUXQrTR9n6IEBBhTgRjcKumVr1WohS0Fk58DUPzowgvJB/0X/8x0HRFb0CZuXwitvG7xU+Kqo/08wCA9mncrzGKN5JRsSyhc2sWZ
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7bb532f7-67be-492e-54ce-08d52ae7828f
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(8251501002)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603199);
	SRVR:CY4PR02MB3384; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3384;
	3:24eC3XBuM8xzpp6GySWkZFHWVzrQ33Op05q/VhrMAxC3Z+F9A2TlCRhPH4XcwL/m4+b7a7QvMYuOmBS8TJoefakhPkmg8Xf2APTIs0EHzH0J5u/NF2GwObeC7PY6ikzHKs3U67d2FCA+80mqS4KewYa9b+k1VrI4kyKf0rh6EB55REDCAX1PfNOQh0hnu5/91Em79Pn3TyUzhlVbN04gOCHw8reBysxJsvhlZBADJSxl7ucvKgS8v1yq4nWGthiWZKfVTnTgPUOcnc5CCldlbTq2aNRWuCulpu130KHQmUpfnPwUoRo3H2a510E8PBxs3jC2L9rQOhtYUeOVIC94ZqnYlHdnn6h3XjR08fJ3NNI=;
	25:X117TvaygZDtgi7E9mdNTc/hHIO1kWFMjqWsO7ePsCZzZ+QksA7GBB8/zeIehI4418MqYqF5hYjjK1G+WjqCo5872ZjLzi5fh5hYhmt7TSvmgWYLVNc3sLQWcj9tbojsBLoirA77SAwfNzFUPPtLsZ1FWpwcDfJXOf8P4lelMK9f9RRzheFpRAUgvU3nqP+yAl9Q1xUTB6ddFoQBfDiJOn+Hf3xcRFQgragx8h07TCZnOFgvwCWqZ33Y8Hn6QHJJuiwEHjai2D4xZmsjGDGHPSfcgomMDTnJs69ARwQriAOULP0OgiA+yjkv66lesm7v7ZvmbaQaZUhYxKeXifizXw==
X-MS-TrafficTypeDiagnostic: CY4PR02MB3384:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3384;
	31:ODkPfWa67OJeGPEOxErbv16cwZ2m/+t8kF6xNA6m9wMXuPvGMTKGrZNP6+NopKiK0xHgQ480++mj7h/VzpdFYWxKJhRKguqgZUKtyGzEkZQZH2w9nxGHMumoARfWNDGIfWRqUPx/z99ocLSY2RTcpmDZlNtEzUBi3EKIUGpsA+hTbj92S2ErgGoPIvBHzFf6rmpLSsw+k9V5DtB4ATDoMiYGI69T1/e7jWoCrG9XfDI=;
	20:/BQ1juCgRxcz0l73zmkabXLIyhHRbsKcoOhBs4tyDBeeAdkmq1aUhfdEB0G4fqmueSvoTIaIz3SWw5S7O416OAbXIlRgPGlveFki/uzb/R7mNKoOHBgMpclhWJ/VhOLhjTbrlFOC/zwcpBSHhhy8JElC4aOnZjaeXYNFwee2AYxIL+yWcvYDL0muhw8OBfcwHcPIgsJgl498Ih8+D8F/quNrs1xlMqmsnqh7QtIsjUp2ZXGDIMQ9pmNh0knwZbiFvk9uHU/9mO2s8cokcum8re8VDC+gcXpyhWumfB+L9XjQF7QCWnjG/99qhwz2ch6gGTg9YzkpK6wDcRqr83uJjBT6CLNwWmMkVD4bg/NVJpYv1DQCUT6AU29WgqAlb+wqcEI1cVNlSgi3WsmgcKRz7UlkMpUnAWWyQPWLqI8DHkwetGy6XoXwDxGNyIOGFboIRFFoFdmrtPrS2Bjrin3XIN7vjoxX3/P16Qt+TdBySLackNM8kNTeIyL5eeH1Vlmm
X-Microsoft-Antispam-PRVS: <CY4PR02MB3384A00B77323A92A40DF2D8DC2B0@CY4PR02MB3384.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93004095)(100000703101)(100105400095)(3002001)(3231022)(6055026)(6041248)(20161123564025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123560025)(20161123555025)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR02MB3384; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR02MB3384; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3384;
	4:OJfmhR2F45yg0wbxZr6GmalKMIgCgXzvoRs89aVafvq2MkT9Nzuu+wwue0Pk8XxsNbRPSjXq2RmvtWjt/9HxFsVQQ6bpab6WHyWgnsCDInhCVFy/lkIr97VZ3gaupsRv+1vgPOGGC+t4BFET7A7M/i9VgJcaX2SvKUgfPenqI6hO8TQetAbF1I1vL8lYKfJmGlRMu7Rg5XZZYIQichbgeIv3tal537YiYN3ZK55TU8iKr46HeV7mLKWWM/9OyGL1lH8/OJcCmJgYYtRHIBBZLw09ctYHMyvEhqmXrY57UuOFIjPi0MHCnDOARNEnsoa+
X-Forefront-PRVS: 0490BBA1F0
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR02MB3384;
	23:WuKVil+DjEZ3rJLUDhtfdl10JLlaBFPy2lOXMaSIC?=
	=?us-ascii?Q?krENfF6WA4//bTngIdq1inQck0/VaGi00OoccSEtzk0s3bgP65NXR8F6CU3t?=
	=?us-ascii?Q?b4kBTbmxcJAvsYVw9ftq+L6QlCphGZCdL+Pp402hQWdN8T0OtiNwN6ncyySk?=
	=?us-ascii?Q?dNO5/zFnxODljDIpzoREyR2PKORyEA9mHiWvqci6rjfKuYEo6cqUeYqGG5t8?=
	=?us-ascii?Q?haEVG19E0c0fAAg+eswmJAHHZVmuC2zNFLHctgzLygguILIpeYv/vIUxtMcq?=
	=?us-ascii?Q?KJi99TI8716e9Fg4t2KffHHuzDMjFTZ6lMcj1ov0iU+dVJ+LPRZ/OmJMtUYa?=
	=?us-ascii?Q?yt4hLocaRAWKfx5FikTv7g2NcDeoWJm/aNq/x0Q1NUvlGS5XKzWan6Vhfg7x?=
	=?us-ascii?Q?qh3Jln1UPUOInnrkIJrQhx0TjKlta13RJsiCx9b5ssVG6z8M5jXhv96tgHaq?=
	=?us-ascii?Q?sE80bCzkMOIgDzjw9YGDAkuuzAUFhvEfh7HBYZtGa4JGrHdNO9Wtd+Jv1Wvh?=
	=?us-ascii?Q?rluyRvs0JBzOBFiEhejUlm06LkoNLZWPilNuxWfakIKL8nQe7Lmiw/lhduUY?=
	=?us-ascii?Q?XpSMsGuM9O9iCr65KDu7vO1Qszh3/q8K0r6U4iC0L/+VK0gimnZBaPSEH9I1?=
	=?us-ascii?Q?U82zyaszPlYXS1XQr0oI6c66O82h7NTHky83L9EvbMltyjw7VvXG/CkPdrPZ?=
	=?us-ascii?Q?3rK/oaq3iwWR634rcxYDcMBAvILW9izpCwFCt2ztl2cuI9tzzu/1RhYIYx6y?=
	=?us-ascii?Q?tqkekgWJGnO/+M8eL0CLLNLxeBLH9U0VftQ6kaGbcr9kUnOZ6r5zZ/x0gDPJ?=
	=?us-ascii?Q?NdJeuIHwnm/tC76QRkl9/p5hHvZGNkCDyheodFmCdkyxmnA8grhDl42MzZQl?=
	=?us-ascii?Q?+VGC/tsUX/d9oziowmtnrwYGZXPrDd/YHJoycRgP0q4ghns+BfyGOVva6xbm?=
	=?us-ascii?Q?A2rtfXj2gj2gA3pu+H4UBvy8OZOIbTfzs6j7VKbT/cMA4oAmR8+Gy8/Eu6Yl?=
	=?us-ascii?Q?4RvSnChX/zLEPdCj0kT3uv3IEudKNYd8MawLPwjx24xdksTmBQwW6EntpjCp?=
	=?us-ascii?Q?8w8ytI=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR02MB3384;
	6:Ss6YWgAPTnNOD6MvTIDUCIs5WE6QiXzyKGMB9cnHxDIBj83pDBGQAVSy6BlyS5qQiwqjOmWEuFdy2gmIs9cESg5srMv6yXPlnhBCQAgD2K4N27MPQcIc7+tEQ3hvVg3JRJA8KYHFyMNw5aUY4lF2ZrfkaGzFLiEEqqICnDkT1sdu2/OUrb9MsMBIWtF7qxyATGPUh2BG0x2143Nw4NDAQkHdXPB1kn2xPbHT9nAfJykh3Nei6Om5FOZAC9rW7um1u4wv2XbRZU+nQB76dvl7X5J5bnPrUPooK7uDPLnRB9ZuvWwmrT8j7dknyW/Kp4itBTPAreZBpDrdXmsedUnj/yHSnHY2rIKSP/pAEoegHWA=;
	5:lcL/y4tCH7F6bgFE00g+quoK9hWOWQSb0ef85Mc/UBAqsuDrwvxO11BD/3OzERUshNHo70AXhTBfE8dRecil7sTjp3S5PNj90n9F8xNOxR51KnCml8bzgFUvso7VRypX9bnq3vBzmS06Ho/OnNszEbFMvF1p47bmnVDRJnh/kdU=;
	24:NVzAuHx12omE7SG1iADcPsppKyAf94hJ0hqPTBC/QB6D4t8csQ7tTB4/rQHH0PGCEZyoy8gd7VTnEqqYWJ9E3ppf2u2pfvyY+dpEsWHZvfc=;
	7:xe5CsG7GCLhKL3SGcdA6nSo5ZkKZzQYjq5b+jK/eQPfo5hzVXxshd+JLDvhsIRDyWdiUbsR4kSnEw1QWm8Ua33d4z8X+rOzUhiM08Y5Mg4+HPuNf6/cLhUpFT58F0rQVmyh9gXvS0BGG5kI4a2DE9cJAwgYnEmWwj/kg2kH4euTCNrFaKdiuoWHhMUfPVMkFxcpeOydaQLdUYuLHqFQVkxqZy/dIhEuNjzqxPBSphVfCSdm9RExKlSKoSN1ehYHH
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2017 22:40:15.6536 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb532f7-67be-492e-54ce-08d52ae7828f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.100]; Helo=[xsj-pvapsmtpgw02]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB3384
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.40.54
Subject: [Qemu-trivial] [PATCH v5 29/29] target: Use qemu_log() instead of
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
X-List-Received-Date: Mon, 13 Nov 2017 22:40:24 -0000

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---

 target/cris/translate.c      |  2 +-
 target/ppc/translate.c       | 22 +++++++++++-----------
 target/sh4/translate.c       |  4 ++--
 target/unicore32/translate.c |  2 +-
 4 files changed, 15 insertions(+), 15 deletions(-)

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
index 998fbed848..8eafe30624 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -3945,11 +3945,11 @@ static inline void gen_op_mfspr(DisasContext *ctx)
              * allowing userland application to read the PVR
              */
             if (sprn != SPR_PVR) {
-                fprintf(stderr, "Trying to read privileged spr %d (0x%03x) at "
-                        TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
+                qemu_log("Trying to read privileged spr %d (0x%03x) at "
+                         TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
                 if (qemu_log_separate()) {
                     qemu_log("Trying to read privileged spr %d (0x%03x) at "
-                             TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
+                              TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
                 }
             }
             gen_priv_exception(ctx, POWERPC_EXCP_PRIV_REG);
@@ -3962,8 +3962,8 @@ static inline void gen_op_mfspr(DisasContext *ctx)
             return;
         }
         /* Not defined */
-        fprintf(stderr, "Trying to read invalid spr %d (0x%03x) at "
-                TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
+        qemu_log("Trying to read invalid spr %d (0x%03x) at "
+                 TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
         if (qemu_log_separate()) {
             qemu_log("Trying to read invalid spr %d (0x%03x) at "
                      TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
@@ -4108,8 +4108,8 @@ static void gen_mtspr(DisasContext *ctx)
             (*write_cb)(ctx, sprn, rS(ctx->opcode));
         } else {
             /* Privilege exception */
-            fprintf(stderr, "Trying to write privileged spr %d (0x%03x) at "
-                    TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
+            qemu_log("Trying to write privileged spr %d (0x%03x) at "
+                     TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
             if (qemu_log_separate()) {
                 qemu_log("Trying to write privileged spr %d (0x%03x) at "
                          TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
@@ -4129,8 +4129,8 @@ static void gen_mtspr(DisasContext *ctx)
             qemu_log("Trying to write invalid spr %d (0x%03x) at "
                      TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
         }
-        fprintf(stderr, "Trying to write invalid spr %d (0x%03x) at "
-                TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
+        qemu_log("Trying to write invalid spr %d (0x%03x) at "
+                 TARGET_FMT_lx "\n", sprn, sprn, ctx->nip - 4);
 
 
         /* The behaviour depends on MSR:PR and SPR# bit 0x10,
@@ -7372,8 +7372,8 @@ void gen_intermediate_code(CPUState *cs, struct TranslationBlock *tb)
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
index 703020fe87..32b72b4701 100644
--- a/target/sh4/translate.c
+++ b/target/sh4/translate.c
@@ -427,7 +427,7 @@ static void _decode_opc(DisasContext * ctx)
 	}
 
 #if 0
-    fprintf(stderr, "Translating opcode 0x%04x\n", ctx->opcode);
+    qemu_log("Translating opcode 0x%04x\n", ctx->opcode);
 #endif
 
     switch (ctx->opcode) {
@@ -1788,7 +1788,7 @@ static void _decode_opc(DisasContext * ctx)
         break;
     }
 #if 0
-    fprintf(stderr, "unknown instruction 0x%04x at pc 0x%08x\n",
+    qemu_log_mask(LOG_UNIMP, "unknown instruction 0x%04x at pc 0x%08x\n",
 	    ctx->opcode, ctx->pc);
     fflush(stderr);
 #endif
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


