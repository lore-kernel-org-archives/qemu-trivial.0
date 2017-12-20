Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRi9Q-0006F9-KZ
	for mharc-qemu-trivial@gnu.org; Wed, 20 Dec 2017 12:27:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60014)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRi9O-0006Cs-4r
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:27:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistai@xilinx.com>) id 1eRi9L-00054e-4u
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 12:27:26 -0500
Received: from mail-cys01nam02on0046.outbound.protection.outlook.com
	([104.47.37.46]:44491
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alistai@xilinx.com>)
	id 1eRi9K-00054C-Ri; Wed, 20 Dec 2017 12:27:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=Ar9T/gbxE4P58QM9LI3LmU5IEjU46ANs9gl0qK85TGo=;
	b=w649mrtKzui4OedalQi4fmk2P0Lf0kWGCUda82Q33/gu72kTKPItg/hGYmeFNuu/FB6fJIw4z1QaVncAZZ3KenD0XIcKomQYNMrlcDQeStdp5/FuAdBgGRqbJ0FpMBKTcJEnLdp9gTaXxw2J8pDGkYxDqdkXvvJ5zVk6intRYhU=
Received: from SN4PR0201CA0011.namprd02.prod.outlook.com (10.161.238.149) by
	BN6PR02MB3378.namprd02.prod.outlook.com (10.161.152.166) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.323.15; Wed, 20 Dec 2017 17:27:20 +0000
Received: from BL2NAM02FT050.eop-nam02.prod.protection.outlook.com
	(2a01:111:f400:7e46::207) by SN4PR0201CA0011.outlook.office365.com
	(2603:10b6:803:2b::21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.345.14 via
	Frontend Transport; Wed, 20 Dec 2017 17:27:20 +0000
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=xilinx.com; redhat.com; dkim=none (message not signed)
	header.d=none;redhat.com; dmarc=bestguesspass action=none
	header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2NAM02FT050.mail.protection.outlook.com (10.152.77.101) with
	Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.20.302.6
	via Frontend Transport; Wed, 20 Dec 2017 17:27:19 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRi9H-0004rf-4u; Wed, 20 Dec 2017 09:27:19 -0800
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRi9H-0003VY-2V; Wed, 20 Dec 2017 09:27:19 -0800
Received: from xsj-pvapsmtp01 (mailman.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp2.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	vBKHREbC019489; Wed, 20 Dec 2017 09:27:14 -0800
Received: from [172.19.2.220] (helo=xsjalistai50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1eRi9C-0003V8-0q; Wed, 20 Dec 2017 09:27:14 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>, <qemu-trivial@nongnu.org>
CC: <alistair.francis@xilinx.com>, <alistair23@gmail.com>,
	<armbru@redhat.com>, Eric Blake <eblake@redhat.com>
Date: Wed, 20 Dec 2017 09:22:58 -0800
Message-ID: <dec729793a89ca35c725207d1b62d3b8cff6904a.1513790495.git.alistair.francis@xilinx.com>
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
	SFS:(10009020)(376002)(346002)(396003)(39860400002)(39380400002)(2980300002)(438002)(189003)(199004)(81156014)(47776003)(118296001)(50466002)(48376002)(50226002)(8936002)(7696005)(478600001)(8676002)(36756003)(356003)(2906002)(51416003)(305945005)(2950100002)(6666003)(76176011)(63266004)(59450400001)(36386004)(5660300001)(4326008)(77096006)(39060400002)(81166006)(106466001)(16586007)(316002)(106002)(54906003)(9786002)(110136005)(107986001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR02MB3378; H:xsj-pvapsmtpgw01;
	FPR:; SPF:Pass; PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en;
X-Microsoft-Exchange-Diagnostics: 1; BL2NAM02FT050;
	1:4HHAn8BxhPbRyyZ39hgt9Q9of/i94Ij1imuyYCTgZ7CJ8xRJUbtUtVENLXJPyX6UXjSHStN49MPjII6CHkCmqVX9u4rVT/dlD8+0BGwo+7k/fCj/z2Pp1G/K152kMIaj
MIME-Version: 1.0
Content-Type: text/plain
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 436c4dc1-7062-45c6-36a8-08d547ceec73
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(5600026)(4604075)(4608076)(4534020)(4602075)(4627115)(201703031133081)(201702281549075)(2017052603307)(7153060);
	SRVR:BN6PR02MB3378; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3378;
	3:RKZ51dIsSdvwlL7jYCcrCx9W3j7QkqBAWV5l45TI8R8BCxV8B5whdAXVVysm3Nq7QebM3qx+eXH3kRivmSPHsuGYBRna1nKyKJj3UiX6CbmI/spGDnvs8an3vTS61+w2NPwhlPQjrjp+OMu0bXnTF/zdqMkQSsWW4cHTB8XIZi5J6WcsX7YIoazscAnUPPjvvaHtP3/Y2U/tGv4whgIbSBkkUeE5mC5r4Ij1ZY6VJwrezJLbpz+H+huPh6HvNZTyqwrKLg2oguZAIxVWEXInCDpUJOmu4mJpZ458VJfRI0CXNwAJg3Q17NdZJoirqwhxLud6TpGAYSky1iS+G2E8OdXu8QjVlYuhOXu7nVIeqfE=;
	25:9AWdqDlg+dLaoUKcPkzJ9pL2W2mhCd+9+w+dSYhPrNAfQWAwnRY6/JP/V3WcuZpWDVPCtfTJLeDBvT2KhqvByAMA4xxzm08MrEsujtrtevJWkBk3EMjO/EOqgViQdKMLYsituzDjIRAdTkg5xyOGOYql7nvD2zL5dcUORCrozN6ui7csxJ5yIevcgCq9VwNVKUJKxR9VOEmRESys9xmoP4P5kibKC8OaufSDIrov5mxfiUZbd7GY4vql6w4MbC7XA8wrPCAmwADCpx/cuVFxYfJ1WZuUGAgLAUTGETHrMo74A3wV3o+YCuTRwPy7ifZDfHHmyoCWJnJ6qPRTGC5K/g==
X-MS-TrafficTypeDiagnostic: BN6PR02MB3378:
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3378;
	31:qjmX3ms8yH5FBRwLYB8afZsQcyFR38PIWhSUPl/L6GRcyGAHIKNl77gn2zCTWDFy5xnuZ0tkhq2x1JY7eP1dtcnBsYOsu9SjZu85zazbPsQlI4WqYSvHSvzIQYJU3bvX0y5lRttbCe3wQtu642QSM5vzt0ujqI1XQ8MgcP1KkR5ROLei5NWR8hhj90ksbO2aZrPjbpHGNotmRFfrdZRPKySqBLredxKEamezD78wSd8=;
	20:1GPWJuU29J6LeSLHzlb1j8n2/FDU6SPSBjUUB9Kc9NKw8tm10MWWncaViTSwjwMDl+fKTKaDyoDNthFJ1LZ/9Z4XPYnLpI3TPZfRRg5wSKBQTrHmUgIP91QdBivjIXcINH40KjXImIO+thQFIc8VYGgmwj8BRK8ayoaLbzyyXoX9pjwwVchdf9xk6M/v++Pt7wkKeMXLpDsw63IqZ4Mfg34J9IXwyNeSRl1V87VJn0ouYLmiQMre9Gc0deRklluAO7X3DOiVrZOsZnO0x08Dy9Jps6KVbo6XXFH1ruW6KzH378PGVCWkogoiwr/TpgGgme47LSYm7tffNuoGkspkZ3Dx+sG9DuCgo3z+INI2Jx1rc/UL0k5HJqyXWWNewmxS9kiN5O5Gw4Ffnsj1NVaASjG3alzVDL1SWwwM1hL5Te8mwhxZ9FCsIWe6tJTrQZY6oi3s2rjNUuKc17ZhJNeOsPGExpVQoGtqmVXfqzDLNwM9dO20xuNKiChq5bFrC/CP
X-Microsoft-Antispam-PRVS: <BN6PR02MB337888495930EA537F732D8BDC0C0@BN6PR02MB3378.namprd02.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(192813158149592);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(6040470)(2401047)(5005006)(8121501046)(93006095)(93004095)(3231023)(10201501046)(3002001)(6055026)(6041268)(20161123560045)(20161123564045)(20161123562045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:BN6PR02MB3378; BCL:0; PCL:0;
	RULEID:(100000803101)(100110400095); SRVR:BN6PR02MB3378; 
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3378;
	4:d0GKGcqCO9jTsUeSHJqAfWHOd8FX2v/oBHxLTSKa2Lkh+zo+L+DKg+2/5PwTv8Ba5aftP2VXIXpOtbv4ZCcvTnDpkZczwHmNgoflQ53ashEhJVn0XqjSfsoEBtx7aAO2DZ80hcpWRMfTaJBt8A2R0PUFtjoE8ywMyV6P6SXc+aUYxhUiHdUXXfG4a8A33BsGaWrHk0d6yP9JFqUzZk+rLab5E0kJoawplHPQLFsZvhAC2aNTtu/Rl66yo054CtLCTd3rzZVqfBkYRXWFahvA7ZBRFMaYi4DQChHKI3iXjsLypYy1e6iIrF7P5Tocxr4d
X-Forefront-PRVS: 0527DFA348
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BN6PR02MB3378;
	23:alBA+ejPKUSYVCDB3OLdYjJ0llTaxXIxxSnUtsacC?=
	=?us-ascii?Q?X0SmaVofiuQ5L24XO7CwU5eA2M4/EpfvFvb8WX27R84SO9vZvIM+BvhCbnCE?=
	=?us-ascii?Q?Y7vtjA4HxeJZTu0CQ/Vnynnt4CY7FFMykVgGM3ts6Yx8kg9/++ficXCruEIX?=
	=?us-ascii?Q?AMO/wv7QjhSoZf08f1hsCyYcXgLkMsYsngTiiK/OGz+IOjIPAuN/3C4S2G3h?=
	=?us-ascii?Q?rF2zJkU6SRSFzlZstcKR7oAHxQRZbiYhsiJ2Homju0UPik77Xh97oyl7qen5?=
	=?us-ascii?Q?uwFEq6USaNtEy+VgGLfoOOcL/Q08nyGamVUskjopDCGO0hg8FdcCLawno06S?=
	=?us-ascii?Q?Xhbet/umk994tH43sruWuyKKfLuEKd5QTrtksCn9F7Q9B8fBrSLAEHwG1i6h?=
	=?us-ascii?Q?1+X9dqORyuGoVKeDc2c3hkxdfaFrrGkv6SghwihTlVEPL5YfB6nmCzIX+cgH?=
	=?us-ascii?Q?Hn2UImh3NI5TLfBtTxvYFo210RzxwAo5I1dqoqQVykjaslfH+0dihLY3ZIeO?=
	=?us-ascii?Q?mdX4ZmXJzlkwinkrSzosGRayXXzBILhR1imfiSx5p+QcNeAe0mUb7BLvRUf0?=
	=?us-ascii?Q?I/dAI3Cm4m1wXWczksxn1rz8ypLk2q4OO2rDfzsKoGO8/jKE2wBc8MQpEOBO?=
	=?us-ascii?Q?nf62lTxz66FjNYwBouZS0Qe90uP+CSCw4+6BLMZZ91VSUM6/PPNIjG+L+6sG?=
	=?us-ascii?Q?rBDyFOjEkjnSZnPq2qBqrXj4dPE9jF2YnL4Y8VD3s4dYMPORyTFFJ4YOunxo?=
	=?us-ascii?Q?jqJe0bUuyozkrgeW+Yx4C29jt8NWM2VN+FPHoqlLAX9ym8aCuIB7g4oukhWy?=
	=?us-ascii?Q?sBQyqcT2fP186aTF0Ina5ikKjM68ng1+k08DAPRgP20Aya7yFQ+4jxm5q3Au?=
	=?us-ascii?Q?NMCk/TZHhevvd/zqNOj4YB41xisUZ0IL+QMJ8oWuPSR6RPG0vAvvyZk/EaUk?=
	=?us-ascii?Q?LNCpOtGimmuS2sZ1aiDKwypLG7FuMS9JwJ2L/H6pjzOUQ9v6i2SADCMBC/R2?=
	=?us-ascii?Q?6916FDH+N/HT+DG//BiYb6vuvNxycDSNA0LVs6lS7ikCQ=3D=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BN6PR02MB3378;
	6:VtOE62FD9AhSxXFX5VhG4fuydFzxzUQf8a4qm2yBCY2AMdm5TrF7rj7I/Ux9hFCaUXml/OFz4iGa4ujaCJGTi7TGMxPr59ufZVnYMd2MYT5nLFW9V6Emkm13MppeZCC53HxH4heuJX/N7eddcDgiv4LIs2DNdVPWA6OP5UPZ2LNLpvetMCFnkgoLD/MkaiQJbop2idkaBwiV+Cv9LcCA+iuQuGd5vWq63GnriEKgAA7a0/h543IxMkJmnTKimHcanTmCJhZ9uuTEofLz/ffrXW6rC+078MvRB50SaisBX/L5v88kbJxwlsPEuoL6E+j7QRq++g8/r+uW6QIGlOMbIc2j4+TrkugLx87SQN/obC4=;
	5:wNMGKFJk4aLUUGWFGu8iwy5KEAVFmbnBOzkUqiqlWHSjWSL0y8iCMUSrnuoRNG5Eaq5/cc9pCjcjcns5tILHayW9nCybB43o9pYE8izV2xOdkL/gEzjh3IW7HRaI98FWOfpPQOoh3ItnOGjGaw4218y6TP9kzMSlmExu2vNq/1A=;
	24:xaZTkOSivD5r0IQaa8MNHzvmUsHE3L0P5+1DqeO6hTBn01dfU9T4755oWDpWySE3f5DUIYRb50nLzMIAtzDnPCqMpcjbE98iMokYC2IO9X8=;
	7:DXLk6vxC07j5o7GxZXqWdMhZMipwu6obbNwp4Sa8/9N2JtURJY/9wVeeejKT6n4a+5A41jNEucExcT4S8J05uIBAAAL7tjdIVDpd+G9FVZtwSMMGnA2RWaZwfRFXW0u3/J5F5T7YYXg49/HWU8QbkmbZ+DaaFXP/Z/nWGVvt/LNPe3cbk3BFBztoDFRb1olfTPeU/bp6+XwTAt5nze6vXSiegIwYqwFjFPMLF8pbyEVIyYPHF//g8kmU/8pELMF1
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2017 17:27:19.6726 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 436c4dc1-7062-45c6-36a8-08d547ceec73
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.83]; Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB3378
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.46
Subject: [Qemu-trivial] [PATCH v6 03/29] Fixes after renaming __FUNCTION__
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
X-List-Received-Date: Wed, 20 Dec 2017 17:27:27 -0000

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


