Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9Y8o-0004IB-Ld
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 09:30:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35589)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fabien.siron@epita.fr>) id 1b9TCx-00026c-Ho
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 04:14:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fabien.siron@epita.fr>) id 1b9TCu-0001mn-BA
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 04:14:55 -0400
Received: from mail-am1on0070.outbound.protection.outlook.com
	([157.56.112.70]:57778
	helo=emea01-am1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fabien.siron@epita.fr>) id 1b9TCt-0001mS-UI
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 04:14:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=epitafr.onmicrosoft.com; s=selector1-epita-fr;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=F8k7DC3gScdfBq+RcsgPtzrFWDAzoUDrl36rEvPBlmw=;
	b=huBe49TDlNRMDz7Ua+cOpyCt5qiJT/+bmjkroUNhU5+dFsKhc+3fiOq3Mn8h8V3DouLx4Kt3Unncr2SMs1vHTauK6YfDxkX0f48NU4P9RRtu8CnrYE0Xe/9f1/wbUetENaJFmqToOyl7J6Dc4/iEo2JoBWQ1RnlWDP7fbIFn+4s=
Authentication-Results: nongnu.org; dkim=none (message not signed)
	header.d=none; nongnu.org; dmarc=none action=none header.from=epita.fr; 
Received: from localhost (2a01:cb00:50a:5100:fa16:54ff:fee0:ce96) by
	AM2PR07MB0579.eurprd07.prod.outlook.com (10.160.33.143) with Microsoft
	SMTP Server (TLS) id 15.1.506.9; Sun, 5 Jun 2016 08:14:49 +0000
From: Fabien Siron <fabien.siron@epita.fr>
To: <qemu-trivial@nongnu.org>
CC: <qemu-devel@nongnu.org>, Fabien Siron <fabien.siron@epita.fr>
Date: Sun, 5 Jun 2016 08:14:39 +0000
Message-ID: <20160605081439.26794-1-fabien.siron@epita.fr>
X-Mailer: git-send-email 2.8.3
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [2a01:cb00:50a:5100:fa16:54ff:fee0:ce96]
X-ClientProxiedBy: HE1PR05CA0105.eurprd05.prod.outlook.com (10.169.113.159) To
	AM2PR07MB0579.eurprd07.prod.outlook.com (10.160.33.143)
X-MS-Office365-Filtering-Correlation-Id: 99a95388-595d-495a-c400-08d38d1976b1
X-Microsoft-Exchange-Diagnostics: 1; AM2PR07MB0579;
	2:SvEnZUPbr6mF8MPZPYrBYLjlsXYz9R7Wic45t35U4zHMggKqTSPYitiIMpVHv77OVDWn6Osp9ccL9cIDY94yd2WHYc16aTZM872SdoshJLCrM+Jo69sHkJafARL4nvKnHc5FI+R/+LhF/qv+ujaPgUXwT/D9cRwQKuot9jRPT9bXYjVGj3NbQ+rBGOcUo/ra;
	3:W+Eo+rd/UhdTxv0iMseteV8DeaNbXRaMnKiTD2sGCsmaWR0STjnCoq6bxPa/PL/xsEjII9oB+MznHVrv9E0Vr6sf5quI1Nt9r224FWMz3ci6p1bTOI2MD2GQIO5GR5jg
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:AM2PR07MB0579;
X-Microsoft-Exchange-Diagnostics: 1; AM2PR07MB0579;
	25:MoE5QvI3kjW2FZ8+C2MdVFxlF6DnNVMwALcerbnpOx//BKKfDbiUXpjGpDFBQlj+slYfabeCD111fef2cUS09d2HKNcrFrekj+IUGh0AljB+5MH/QlxyJpQgueUO6YS3Nq1pZqX7w48Z418+Oi1OStTqoXRt1HwWUVMecOcI5G5MJ4ztxb7ba0FWAqGDVoNAzpUh87EapiD296v0OlbXErEgolKgM3CGu2ctUgHuRtvSrM391UljNenhp3K6a1QhnMZuQCrpjHs/RWa4PEog3vynZkZheHvREN4vwIJ1a961xd3Dqry1z5MNySG4j4Wc18T1m/bhSGqubQksqczkeABlDtEAzDkA43TOaoCjrh1qq3V/t5uvG5l57QXhkJ5+0SUOMCXFxjvpngy6FrKML0nNpjZ3Qr8b93+t5ruSetMeGdeL9lzj/qC2wHcG4Cr04VOFd+LVOjx8CHiPn3bo7FKIV+QZEO5qt/cL2A/Qtx5A/Z5GIw9Es8sUCK45o/Ro2XOX67c0NlASiW0etz9DWBbSzdyKlfLbkytlnTVfnL588kg9D3DfrRGgsLWETVffvtWPYStvJc/tuLGv2u7chcqpQj64e33JV5ScJo2fZR2AkMSm3O8HmURVb1BIqVFo2tX0HLUjkvuZmF75cQ8C5ePhzz3gneRRbMnQ1VqFrK0PvXl8S+Z4nG0VMBKwDqhqjlEI4Rb0g6ekraufc3RtsA==
X-Microsoft-Antispam-PRVS: <AM2PR07MB05799F6D40B26DB3BB8E6F74E95B0@AM2PR07MB0579.eurprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040130)(601004)(2401047)(5005006)(8121501046)(3002001)(10201501046)(6041072)(6043046);
	SRVR:AM2PR07MB0579; BCL:0; PCL:0; RULEID:; SRVR:AM2PR07MB0579; 
X-Microsoft-Exchange-Diagnostics: 1; AM2PR07MB0579;
	4:ttjriPlbmd0ZycebmbBSVxstTCYGeLbvCwdaoG1S+wolHG9LNkxmSGFHcAzBrlqe0Rj7iaB2S41thR1aLXC5/NTDdw0UYWoK9b3iihAhpbjDIevRoq7tUyidvs+M05b9eCowGR6iYVChIsntrqw/MDxM8RVCfzqfGDUK3mCktJQLeMkOdrqaUUQGcLXgbwQc2Y8WLU4i+9xP3un3LRa6xcDqBK3HnHYrWYWtdEYyLQ+LfGG1UYz1nZw5hQ0bZE3PXAQ3/rbDtvf/lsbRKqMd7rjm3ReP56TrN+fltPhx2ggt76UJq3PmKcGChTmv8dGqmGbw7YgavmYibNsM5A8fvjY58hTCjiu+OfagVKLHu/wAYvp8+tjWHa3O+NiVAUSvScVmpQ4V5AQPO2VBQgReHiH5q50TwMWnrHOO8kjC7v4=
X-Forefront-PRVS: 09645BAC66
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6069001)(6009001)(76506005)(2351001)(92566002)(229853001)(42186005)(47776003)(33646002)(19580395003)(19580405001)(74482002)(86362001)(450100001)(77096005)(50466002)(48376002)(50226002)(189998001)(36756003)(5004730100002)(110136002)(5003940100001)(107886002)(4326007)(81166006)(2906002)(5008740100001)(8676002)(50986999)(1076002)(4001430100002)(586003)(6116002)(21314002)(3826002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:AM2PR07MB0579; H:localhost; FPR:;
	SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; AM2PR07MB0579;
	23:BXv14RGH0fT1pop6XVBEpcTDVOyoUZPUPcBPFJq5f?=
	=?us-ascii?Q?S5LM/gu261RVsbHOW+FBvb2Fwa516XliM3uuFkHd11usnRPhu6xOHuqtv9tL?=
	=?us-ascii?Q?OmZ47Y7vP7aA/D1DqlkIH8tNhL4SfEM1I2NIk+aWv046OHPN6iA6QYggRll7?=
	=?us-ascii?Q?EVgVBHZDDwMUbRZi+NBQbL8PwxuGA5gWjzYRT/oJDb53qyvmPrirKs7IZ1Ov?=
	=?us-ascii?Q?AEnVeCOhYcsuJxI9Ea3mdAT9ZNIh9WNB87jF0xXBY0o9Q03aYPIOs1z3t/ND?=
	=?us-ascii?Q?Jvg84mhDwWggIyI2H8+oi5/FmnmmMvTkI0BqGBcf+ly+jOL66pYCkvHB4auK?=
	=?us-ascii?Q?6xX8wqoWEWqTsdQBLlezcobyuhJjQqjPbBn1lIRzogC9cHKeyI+eLereo58q?=
	=?us-ascii?Q?OUEv/PNgOmirYx3/8OxLUIpdgO0oGc0H9unS91FIjAoRATo1GAZutQWlC6a/?=
	=?us-ascii?Q?sM0IZthmyDJQCKI8NPvjS0i7j3mNiHLXmqw1fgIh7n/QuLC/alZRMkg4mk20?=
	=?us-ascii?Q?fRdPrnONG9IC6KACPdVyQNnkyTZvzT2DWRXp/cPC+DQBo+AdE1uJC2kQgWUX?=
	=?us-ascii?Q?dOsDeb3BHqEFnJUfwljpUefL/XzE9WoJDY99rTJNJJilFi9xvziy+v7g17c5?=
	=?us-ascii?Q?vUqfG0WHhYx8bxK1jLblgA54RbHxC2MVsWJm0GyCUse6HwwL/InIp0jjAInc?=
	=?us-ascii?Q?91BaJnGUcX/UYE9m99GWF8kEWy4+xtuHztXE7FSaocUA1rGuEuhYNsPLnWcD?=
	=?us-ascii?Q?hMUMlQd0ZoVaFbqBC0uZI1lBSS7xWJ8yQVi7pgHltVA/hWpPISn8g8SmlbB4?=
	=?us-ascii?Q?D/MU+Pv8XQM78cQWmIcSy+7aXecSDlSJUEAPpqjErxZciKJApysgqmLNCWEx?=
	=?us-ascii?Q?nb1BuC6Bx0BTjz9gEO1d0AaWuuPEuCLqLJT996f4qfUQbvDK68MpIHGv0XDt?=
	=?us-ascii?Q?v0VekneXfwCj2eaGzQRzSzIz/Z21toR35CFhehUPtfH056a23Jde2q3SqqFs?=
	=?us-ascii?Q?iyfNbEjedZjp//7gwFCNWxH?=
X-Microsoft-Exchange-Diagnostics: 1; AM2PR07MB0579;
	5:s/HCZYQZBMMsDP9zMwCMgmZyKtVJf/9tF80/mIQI/OwmcnQi1YYSoCKUGC6XzGzVmOqe94ahnH8G8gMNUPr42eeqXhcGhS4G42b2BSr8pHfPj8qU4ctXMPIdThhtdWxiIeGBX3kvgEGXIkn677ShNw==;
	24:CGe72DnOVTrF9PpnLp1/AcvbkCMLhQy6bSfaP69q0osmWK0N+355MlCs79mTicgYNNdv+Sc5cFYW3j+G2jhYZ96cLai+dFkMC3CRNRNdoyU=;
	7:mWXIeDgaip4ncBd5dOc1E9RkCZuE6Jfs9Pu/NowNKgFE2obcfQw13HQOVu7VAMGX8aAPcRYIjwMSMMFKLA1zrJm5tyY1Kb3DfEKdWtCrH49Vgw38qvpDE4JN089COMqp2itD9nmxXK5EQW5oFhApxfajMdMddsbsj7FVU9oNuauUs1y4wTTdNH1aCunFeh3bnz2LISQyPAaU6AGJMcMhXzskD2OmarHwpheU42yeIOM=
SpamDiagnosticOutput: 1:23
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: epita.fr
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2016 08:14:49.2402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM2PR07MB0579
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.112.70
X-Mailman-Approved-At: Sun, 05 Jun 2016 09:30:58 -0400
Subject: [Qemu-trivial] [PATCH] hw/i386/pc: Use fstat in get_file_size()
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
X-List-Received-Date: Sun, 05 Jun 2016 08:14:56 -0000

As mentioned in the comment, fstat is quite simpler than playing with
ftell() and fseek()

Signed-off-by: Fabien Siron <fabien.siron@epita.fr>
---
 hw/i386/pc.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index e29ccc8..186dfe4 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -802,16 +802,9 @@ static FWCfgState *bochs_bios_init(AddressSpace *as, PCMachineState *pcms)
 
 static long get_file_size(FILE *f)
 {
-    long where, size;
+    struct stat st;
 
-    /* XXX: on Unix systems, using fstat() probably makes more sense */
-
-    where = ftell(f);
-    fseek(f, 0, SEEK_END);
-    size = ftell(f);
-    fseek(f, where, SEEK_SET);
-
-    return size;
+    return fstat(fileno(f), &st) < 0 ? -1: st.st_size;
 }
 
 static void load_linux(PCMachineState *pcms,
@@ -835,7 +828,7 @@ static void load_linux(PCMachineState *pcms,
 
     /* load the kernel header */
     f = fopen(kernel_filename, "rb");
-    if (!f || !(kernel_size = get_file_size(f)) ||
+    if (!f || (kernel_size = get_file_size(f)) <= 0 ||
         fread(header, 1, MIN(ARRAY_SIZE(header), kernel_size), f) !=
         MIN(ARRAY_SIZE(header), kernel_size)) {
         fprintf(stderr, "qemu: could not load kernel '%s': %s\n",
-- 
2.8.3


