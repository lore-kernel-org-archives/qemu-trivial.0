Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aLFJe-0004tt-Hl
	for mharc-qemu-trivial@gnu.org; Mon, 18 Jan 2016 14:18:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1aLFJb-0004rh-So
	for qemu-trivial@nongnu.org; Mon, 18 Jan 2016 14:18:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1aLFJX-0002vj-Tq
	for qemu-trivial@nongnu.org; Mon, 18 Jan 2016 14:18:11 -0500
Received: from mail-cys01nam02on0059.outbound.protection.outlook.com
	([104.47.37.59]:34036
	helo=NAM02-CY1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair.francis@xilinx.com>) id 1aLFJX-0002vT-M5
	for qemu-trivial@nongnu.org; Mon, 18 Jan 2016 14:18:07 -0500
Received: from SN1NAM02FT051.eop-nam02.prod.protection.outlook.com
	(10.152.72.55) by SN1NAM02HT227.eop-nam02.prod.protection.outlook.com
	(10.152.73.85) with Microsoft SMTP Server (TLS) id 15.1.355.15;
	Mon, 18 Jan 2016 18:44:29 +0000
Authentication-Results: spf=fail (sender IP is 149.199.60.96)
	smtp.mailfrom=xilinx.com; tls.msk.ru; dkim=none (message not signed)
	header.d=none; tls.msk.ru; dmarc=none action=none header.from=xilinx.com;
Received-SPF: Fail (protection.outlook.com: domain of xilinx.com does not
	designate 149.199.60.96 as permitted sender)
	receiver=protection.outlook.com; 
	client-ip=149.199.60.96; helo=xsj-tvapsmtpgw01;
Received: from xsj-tvapsmtpgw01 (149.199.60.96) by
	SN1NAM02FT051.mail.protection.outlook.com (10.152.73.103) with
	Microsoft SMTP Server (TLS) id 15.1.355.15 via Frontend Transport;
	Mon, 18 Jan 2016 18:44:27 +0000
Received: from 172-16-1-203.xilinx.com ([172.16.1.203]:54780
	helo=xsj-tvapsmtp02.xilinx.com)
	by xsj-tvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1aLEmx-0007cB-2L; Mon, 18 Jan 2016 10:44:27 -0800
Received: from [127.0.0.1] (port=33765 helo=tsj-smtp-dlp1.xlnx.xilinx.com)
	by xsj-tvapsmtp02.xilinx.com with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1aLEmw-00072h-Ru; Mon, 18 Jan 2016 10:44:26 -0800
Received: from xsj-tvapsmtp02 (xsj-tvapsmtp02.xilinx.com [172.16.1.203])
	by tsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id
	u0IIcrBc016588; Mon, 18 Jan 2016 10:38:54 -0800
Received: from [172.19.74.182] (port=58720 helo=xsjalistai50.xlnx.xilinx.com)
	by xsj-tvapsmtp02 with esmtp (Exim 4.63)
	(envelope-from <alistair.francis@xilinx.com>)
	id 1aLEmw-00072c-0k; Mon, 18 Jan 2016 10:44:26 -0800
From: Alistair Francis <alistair.francis@xilinx.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 18 Jan 2016 10:42:01 -0800
Message-ID: <9aab0156c2f307ece61c3d8106450d736553a0d5.1453141118.git.alistair.francis@xilinx.com>
X-Mailer: git-send-email 2.5.0
X-RCIS-Action: ALLOW
X-TM-AS-MML: disable
X-TM-AS-Product-Ver: IMSS-7.1.0.1679-8.0.0.1202-22054.006
X-TM-AS-Result: No--2.182-7.0-31-10
X-imss-scan-details: No--2.182-7.0-31-10
X-TMASE-MatchedRID: +UAJXFSZ3ayPo+6vQMop+tWcXTld/c2GWwKGivsEuI1NShtWKzkFv8Tr
	clOEW8K1o1rqzSpfPGfUNIzJSMoMMe/tdAbY/bO9KaMQ6tw7oDJMkOX0UoduuRc+nzs86r3GFqL
	6h0Wt9phmwACV8D/5JYAy6p60ZV62fJ5/bZ6npdiujVRFkkVsm0iOLJdsvGim/vJkuqB1nilg3g
	YMlFXz2Uy/mSCDBgIZRAYWtu5kd8+fxkMoKG9ToWyZqvkkAWWoUlNfK7m2m8lT0hTfQkGjXf6/2
	/nZkihaOgB/fz3EXdcVKT0eFRmfDs4YhafCzguj9Z1yWryVTWo=
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.96; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(979002)(6009001)(2980300002)(1110001)(1109001)(339900001)(189002)(199003)(189998001)(106466001)(50466002)(50226001)(92566002)(1096002)(5003600100002)(586003)(5008740100001)(36756003)(105606002)(33646002)(19580395003)(6806005)(19580405001)(1220700001)(85426001)(2906002)(47776003)(229853001)(2351001)(5001960100002)(118296001)(5003940100001)(48376002)(71366001)(81156007)(110136002)(87936001)(64026002)(86362001)(4326007)(50986999)(77096005)(107986001)(969003)(989001)(999001)(1009001)(1019001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:SN1NAM02HT227; H:xsj-tvapsmtpgw01;
	FPR:; SPF:Fail; PTR:unknown-60-96.xilinx.com; MX:1; A:1; LANG:en;
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 12b48331-2f9f-41d0-fcb1-08d320376517
X-Exchange-Antispam-Report-Test: UriScan:; BCL:0; PCL:0; RULEID:;
	SRVR:SN1NAM02HT227; UriScan:(192813158149592); 
X-Microsoft-Antispam-PRVS: <f109522c9c6345238714c9ad026c08f6@SN1NAM02HT227.eop-nam02.prod.protection.outlook.com>
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(13023025)(13018025)(520078)(13015025)(13017025)(3002001)(10201501046);
	SRVR:SN1NAM02HT227; BCL:0; PCL:0; RULEID:; SRVR:SN1NAM02HT227; 
X-Forefront-PRVS: 08252193F3
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2016 18:44:27.8232 (UTC)
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;
	Ip=[149.199.60.96]; Helo=[xsj-tvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1NAM02HT227
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 104.47.37.59
Cc: christian.liebhardt@arcor.de, qemu-trivial@nongnu.org,
	christian.liebhardt@keysight.com, mjt@tls.msk.ru,
	alistair.francis@xilinx.com
Subject: [Qemu-trivial] [PATCH v1 1/1] qom: Correct
	object_property_get_int() description
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jan 2016 19:18:13 -0000

The description of object_property_get_int() stated that on an error
it returns NULL. This is not the case and the function will return -1
if an error occurs. Update the commented documentation accordingly.

Reported-By: Christian Liebhardt <christian.liebhardt@keysight.com>
Signed-off-by: Christian Liebhardt <christian.liebhardt@keysight.com>
Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
 include/qom/object.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qom/object.h b/include/qom/object.h
index 4509166..2848f5e 100644
--- a/include/qom/object.h
+++ b/include/qom/object.h
@@ -1107,7 +1107,7 @@ void object_property_set_int(Object *obj, int64_t value,
  * @name: the name of the property
  * @errp: returns an error if this function fails
  *
- * Returns: the value of the property, converted to an integer, or NULL if
+ * Returns: the value of the property, converted to an integer, or negative if
  * an error occurs (including when the property value is not an integer).
  */
 int64_t object_property_get_int(Object *obj, const char *name,
-- 
2.5.0


