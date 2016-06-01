Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b8AdO-0002wn-VK
	for mharc-qemu-trivial@gnu.org; Wed, 01 Jun 2016 14:12:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42705)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fabien.siron@epita.fr>) id 1b88Wn-0002kA-Bv
	for qemu-trivial@nongnu.org; Wed, 01 Jun 2016 11:57:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fabien.siron@epita.fr>) id 1b88Wi-0007Ol-Dx
	for qemu-trivial@nongnu.org; Wed, 01 Jun 2016 11:57:52 -0400
Received: from mail-am1on0084.outbound.protection.outlook.com
	([157.56.112.84]:6960
	helo=emea01-am1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fabien.siron@epita.fr>) id 1b88Wi-0007OY-2Q
	for qemu-trivial@nongnu.org; Wed, 01 Jun 2016 11:57:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=epitafr.onmicrosoft.com; s=selector1-epita-fr;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=MzRQpsiYBIwozJijRG53zYUbtuLRHZyP1wTwcUYpuas=;
	b=UuQ3A0RCl7E1Ucvt6iz+cAtb2oyv3igt58JKOCAXqpBApY5wVqC4xrqSHbEjCzSxwRKXyAUySWBpo9lqO3/wfEshQfLr28kBe4o9OnIZ5WHoYz1cHC6xfMkzHYCqJGpT5KgqUP3P7Ffr1Z4Ml0slXN2R27eYQykjqSC0NiFb1tc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org; dmarc=none action=none header.from=epita.fr; 
Received: from localhost (163.5.55.17) by
	AM2PR07MB0579.eurprd07.prod.outlook.com (10.160.33.143) with Microsoft
	SMTP Server (TLS) id 15.1.506.9; Wed, 1 Jun 2016 14:23:10 +0000
From: Fabien Siron <fabien.siron@epita.fr>
To: <qemu-trivial@nongnu.org>
CC: Fabien Siron <fabien.siron@epita.fr>
Date: Wed, 1 Jun 2016 14:23:04 +0000
Message-ID: <1464790984-8123-1-git-send-email-fabien.siron@epita.fr>
X-Mailer: git-send-email 2.8.0
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [163.5.55.17]
X-ClientProxiedBy: AM3PR02CA0026.eurprd02.prod.outlook.com (10.242.240.26) To
	AM2PR07MB0579.eurprd07.prod.outlook.com (10.160.33.143)
X-MS-Office365-Filtering-Correlation-Id: 082a8170-3a3e-4394-106a-08d38a28426d
X-Microsoft-Exchange-Diagnostics: 1; AM2PR07MB0579;
	2:RR9IkE1wH++uLk1+9p7Ys92wbxLPz0NAEr3pM4SZ0JBPQ83xlKpB4Whl15GItrGbQvrwW8E2uSp5HaMrPA5fbCYpyVHX7zY2rs/c7UnwfBfv4ztgmcg+erGeWMxAu3RWHYwpP9siHjqC1Bl++tSZVAZhbaME/mGMpZ0o79Ox3O92Tka7Mvz/86CmgdQLnPUu;
	3:7c5ygVAwyrHORnsoxDUn/S2cErjVyZNu9vMmQCWmaH+QZgJNtLzbsEGu1NtW39Sg+AliuiXEmx7M2EnZpzFeve12w+7TcFetF4/2YbW9QOBTx6I9DRq2JYpcSxP+eBxR
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM2PR07MB0579;
X-Microsoft-Exchange-Diagnostics: 1; AM2PR07MB0579;
	25:2lVOKF9Qb9vhQBXCYiCmsY4ljXZtqEsb4eebQ87Ky5bePihWKdUMSUStxAappDGuWpzfWxIoLRwuyB+DGVmw8YXDitfcRE/gnzZFzakDjZAs5ZV10q2ypt7yi9otIq/6NqjWn2nsoBr3KkFDm8xZhyAQacBw2pP4vt9txdeBjauqn5OdS2NxUL4b9x8KjMwHfergQIWEM7Q5JTaCRff5ctvja9VpdU49HMqYSzSa6ojFknqOxuaLjgIRbljV+S1pjNnktYCUZq2duzGqJXFoy6GylaP5+SEVFZpRC/EJZREdKegXIm8/4HE9RTidXeZF4KaGydzDSw448d/ohn/jK24YqR9SfGxWfyVF7hrSO7fsS+2DsjQ0DqGxJ9+9xcsB7kjzMdOwb2uJdLlQz57zpE5AfOIm9XM1yfsxupmnsgk+KaLZuBc6EaKe9D+iL2XYF+G0gXO9xw7aN4udzGLvJEwQBr+oXZKxfhU5Cg56vayU3JR6d7LVF75MQ1xKd3RdcNXLb2DmiVE7WK2ITAH+0EeaYJ23NrrV0HlCuAUEr7Kv4tcd3BV9om55ICTfEVMv7dl2d6QR5V6YJQDo7GWfIANSHBBjGaRjsUc37VOmi61xDwLYhcvQhIOBv4H1ovbvVhnxeHlpopTbbhZL0X8g0m0RYsHt1o2Enk+u9qpLA3weeCf1tBe+7xnzq9G+717K7CPA1rdpT0jZd3mrrUuRVQ==
X-Microsoft-Antispam-PRVS: <AM2PR07MB057907362B71C8232B5F1EB0E9470@AM2PR07MB0579.eurprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040130)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6041072)(6043046);
	SRVR:AM2PR07MB0579; BCL:0; PCL:0; RULEID:; SRVR:AM2PR07MB0579; 
X-Microsoft-Exchange-Diagnostics: 1; AM2PR07MB0579;
	4:L/DXX6eo9TAYnBFH421Y8HrwL1at4mTxWzdr3a8DeBQ8m6m0Mw/VHp/DouSIgMZjtCQpHSl5CT1/+AFtLE7V6XiCC17ctsXM0Wjvq2jA850e1ziMjgDxtcjh1E7xZjuaHEBHItHSEB8qlsPCSZ+Dj9Fz83FLEtS8tHcF/swYExLryfkPUs+5gtM7c0o3CGIvL0mJrxxRln4Jtws7zigAa6Thj0bWnwWeEI2TFfDJT7t2JcjAA0hJiCfdapxGqZZ2n8IFnpcvPGiJKl881s8BuTUWy7xDdbZtNqz+uPf+d+pnXNEZyo9pFxQcWP+Uooy0lDAHDoz5aV1xNwv/nZN0zXv1v3+RtHBLzjUwDSn6/LEkZNef8zOUW24wtY+Y219LwO5biRqICSSrStHTaMxrfK+3nQJ+G55hY3mYDioH1b8=
X-Forefront-PRVS: 096029FF66
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(6069001)(5004730100002)(76506005)(36756003)(450100001)(42186005)(33646002)(19580395003)(19580405001)(74482002)(50466002)(92566002)(86362001)(66066001)(50986999)(107886002)(189998001)(48376002)(5003940100001)(77096005)(2351001)(229853001)(5008740100001)(4326007)(6116002)(47776003)(81166006)(3846002)(50226002)(586003)(4001430100002)(2906002)(8676002)(110136002)(21314002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM2PR07MB0579; H:localhost; FPR:;
	SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM2PR07MB0579;
	23:pFuKHgCjQUtV2SkviR/mjtfXrwhyohmROyUxITG3O?=
	=?us-ascii?Q?CSLYd7lzPEoQrOeFyjFBJJ+8iFfSVfPREoA0/tZZg0wb0efMhcu8icvz5HOb?=
	=?us-ascii?Q?kzfNd5y8EbYuYh/T1GdcVCxM2MMan8BaDFk2gwxZ8RYt7bi02mp3cezT6HV0?=
	=?us-ascii?Q?OC0i2bZzUpMqsykjt8utYR15fU/9KYo4vYiJq74beazUHpJEOyPUaCkg59O9?=
	=?us-ascii?Q?JTK3FnlmgCp2T2iTUX/YzUevCW2apmRtXlml6YNtiB7YT95Safnpo16AYYhI?=
	=?us-ascii?Q?15wUsbcd62dWPE6SiyWQBBDeqpypdb9r+t5bw1cfPvWC0v1L6wIP1faC5Vgs?=
	=?us-ascii?Q?pTFCVU7/PF79WdrXssURhGlsOmF/xHIK9yyrEg+N45en+98eOrrvWi3ikdXj?=
	=?us-ascii?Q?RYbvfRpUZo3xaLvsOiS6U/ziXpdAc1TyTM8H7hv/8GhThebRp6czATExjLbI?=
	=?us-ascii?Q?PEm83wSynACMI8TUjny7NqTYBueleaYEt4cgUCwfcAWc+WBh9p8CDiRklWSq?=
	=?us-ascii?Q?0zKTKy0rNyxZ6BEFlg2RBGrMUQoUxzsvfrscFIBHRgKuGuEXLN/tjkRMCY6g?=
	=?us-ascii?Q?4UCtpnKQfEKhX7IIB6F+LPNbFUVKw8fHe+hHRCfH+6KxbKll/MGM3ZIgaTGG?=
	=?us-ascii?Q?bLCgz0HGrj8cHAf0SnqtjrxpGemH9+/uaw0/akhtSFqxlTFONvK081r+0WZn?=
	=?us-ascii?Q?1+Gm3tfP1v5W16uWDEN1s2QIqE4kld/clIdQa7vN428irkCgi6xRa7huFNRR?=
	=?us-ascii?Q?jg4lyuN/FaDka8dyALqZMXpS8EN5Sg7rw+Ht0A1/3FsYyDDsxkRizNYtS4ah?=
	=?us-ascii?Q?2KoFSSnIBeYRoOkiX+h0C37BAJkLy2SKveI7vfyyVZo9c4oHtA13oSxteQQB?=
	=?us-ascii?Q?OS+xqWtHsNpvDfLBLNc410jtjDJ0ypXDUqR+aNh/qSM0EGg2XyKGtob3gdVb?=
	=?us-ascii?Q?M1GH5Vi2XK75bOhdTFlRUICSTzFU5sAg5tZ66uVaDffV5Qpe5Nj4ZK+aEbNC?=
	=?us-ascii?Q?Det2i/OdMYVcDiIraGVjcfj?=
X-Microsoft-Exchange-Diagnostics: 1; AM2PR07MB0579;
	5:0izmTtXHrVJB0J97ELGYLMB0C+KmsUGn8ySMZWKrhRQArzJNr/NLsL9MoBhtEWf6oXca/k61LOPyfZVRG83iNv69wWl+i4poV3qdYyT6te7f4HOHchWB9WqnZBrA0YPMeu84uKDCITc27ehLUTfklA==;
	24:q26SdqGTKAcxvo9VDfaXpXIMz1dxpxfyaqe+7SbKqcOm8Sv3YEDJ4sLwsA7xo5hZagbEG9zEt9z07WrVVEz9RHQjTZjlNZlIOjO1ry0eCxQ=;
	7:gFYoTTchQDKnXwhAsiwFXwI8YIrfy7RQ1C/4Z+f3YSC878d0lF/inemUArPkVjULXrl1WKjbiJbaoRo3k9Ytkh2C/xkEZXw4p9nyC/PLzN58ZRrwmsAub3CIqzKYEbI1br7kbpE6hllvKq2lJ9Z6JtEFgpWqmhKy3vMP10Cq3hbxIcWeg2jHgGplPLgT5/L8
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: epita.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2016 14:23:10.6671 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM2PR07MB0579
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.112.84
X-Mailman-Approved-At: Wed, 01 Jun 2016 14:12:49 -0400
Subject: [Qemu-trivial] [PATCH] pc: Use fstat in get_file_size()
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
X-List-Received-Date: Wed, 01 Jun 2016 15:57:54 -0000

As mentioned in the comment, fstat is quite simpler than playing with
ftell() and fseek().

Signed-off-by: Fabien Siron <fabien.siron@epita.fr>
---
 hw/i386/pc.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 99437e0..fecb067 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -801,16 +801,13 @@ static FWCfgState *bochs_bios_init(AddressSpace *as, PCMachineState *pcms)
 
 static long get_file_size(FILE *f)
 {
-    long where, size;
+    struct stat stat;
+    int fd;
 
-    /* XXX: on Unix systems, using fstat() probably makes more sense */
+    fd = fileno(f);
+    fstat(fd, &stat);
 
-    where = ftell(f);
-    fseek(f, 0, SEEK_END);
-    size = ftell(f);
-    fseek(f, where, SEEK_SET);
-
-    return size;
+    return stat.st_size;
 }
 
 static void load_linux(PCMachineState *pcms,
-- 
2.8.0


