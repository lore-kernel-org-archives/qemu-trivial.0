Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bWrk3-0003vC-77
	for mharc-qemu-trivial@gnu.org; Mon, 08 Aug 2016 17:05:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41580)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1bWrk0-0003qp-Hp
	for qemu-trivial@nongnu.org; Mon, 08 Aug 2016 17:05:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1bWrjw-0005r7-BL
	for qemu-trivial@nongnu.org; Mon, 08 Aug 2016 17:05:43 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:27855
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1bWrjv-0005qr-TD
	for qemu-trivial@nongnu.org; Mon, 08 Aug 2016 17:05:40 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.11/8.16.0.11) with SMTP id
	u78KxlmC071835
	for <qemu-trivial@nongnu.org>; Mon, 8 Aug 2016 17:05:39 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
	by mx0b-001b2d01.pphosted.com with ESMTP id 24nc1q7uwu-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Mon, 08 Aug 2016 17:05:39 -0400
Received: from localhost
	by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <mdroth@linux.vnet.ibm.com>;
	Mon, 8 Aug 2016 17:05:38 -0400
Received: from d01dlp03.pok.ibm.com (9.56.250.168)
	by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 8 Aug 2016 17:05:37 -0400
X-IBM-Helo: d01dlp03.pok.ibm.com
X-IBM-MailFrom: mdroth@linux.vnet.ibm.com
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
	[9.57.198.26])
	by d01dlp03.pok.ibm.com (Postfix) with ESMTP id 6CA34C9003E;
	Mon,  8 Aug 2016 17:05:25 -0400 (EDT)
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
	[9.57.199.107])
	by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	u78L5awG58130686; Mon, 8 Aug 2016 21:05:36 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F197124011;
	Mon,  8 Aug 2016 17:05:36 -0400 (EDT)
Received: from localhost (unknown [9.80.86.168])
	by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id 05E2D34002;
	Mon,  8 Aug 2016 17:05:35 -0400 (EDT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Steven Luo <steven+qemu@steven676.net>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Mon,  8 Aug 2016 16:03:53 -0500
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1470690267-31454-1-git-send-email-mdroth@linux.vnet.ibm.com>
References: <1470690267-31454-1-git-send-email-mdroth@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16080821-0040-0000-0000-00000102682C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00005568; HX=3.00000240; KW=3.00000007;
	PH=3.00000004; SC=3.00000178; SDB=6.00741898; UDB=6.00349151;
	IPR=6.00514456; 
	BA=6.00004651; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009;
	ZB=6.00000000; 
	ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00012252;
	XFM=3.00000011; UTC=2016-08-08 21:05:38
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16080821-0041-0000-0000-000004DCCF4A
Message-Id: <1470690267-31454-23-git-send-email-mdroth@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-08-08_15:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=29
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1604210000
	definitions=main-1608080226
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: [Qemu-trivial] [PATCH 22/56] Fix configure test for PBKDF2 in nettle
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
X-List-Received-Date: Mon, 08 Aug 2016 21:05:45 -0000

From: Steven Luo <steven+qemu@steven676.net>

On my Debian jessie system, including nettle/pbkdf2.h does not cause
NULL to be defined, which causes the test to fail to compile.  Include
stddef.h to bring in a definition of NULL.

Cc: qemu-trivial@nongnu.org
Cc: qemu-stable@nongnu.org
Signed-off-by: Steven Luo <steven+qemu@steven676.net>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
(cherry picked from commit 9e87a691bd46846e2232f8c30605c491c85ac987)
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 configure | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index 49bdb4b..60e3c0d 100755
--- a/configure
+++ b/configure
@@ -2342,6 +2342,7 @@ if test "$nettle" != "no"; then
         nettle="yes"
 
         cat > $TMPC << EOF
+#include <stddef.h>
 #include <nettle/pbkdf2.h>
 int main(void) {
      pbkdf2_hmac_sha256(8, NULL, 1000, 8, NULL, 8, NULL);
-- 
1.9.1


