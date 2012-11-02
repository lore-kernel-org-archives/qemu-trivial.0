Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TUA2Q-0006Un-SX
	for mharc-qemu-trivial@gnu.org; Fri, 02 Nov 2012 01:43:26 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1TUA2O-0006OF-Nl
	for qemu-trivial@nongnu.org; Fri, 02 Nov 2012 01:43:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1TUA2N-0006RG-Np
	for qemu-trivial@nongnu.org; Fri, 02 Nov 2012 01:43:24 -0400
Received: from [222.73.24.84] (port=13572 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1TUA2N-0006Qi-As
	for qemu-trivial@nongnu.org; Fri, 02 Nov 2012 01:43:23 -0400
X-IronPort-AV: E=Sophos;i="4.80,697,1344182400"; 
   d="scan'208";a="6121966"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 02 Nov 2012 13:10:46 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id qA25CKQV007307;
	Fri, 2 Nov 2012 13:12:21 +0800
Received: from liguang.fnst.cn.fujitsu.com ([10.167.225.128])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2012110213113456-927627 ;
	Fri, 2 Nov 2012 13:11:34 +0800 
From: liguang <lig.fnst@cn.fujitsu.com>
To: qemu-devel@nongnu.org
Date: Fri, 2 Nov 2012 13:11:22 +0800
Message-Id: <1351833082-26633-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.2.5
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2012/11/02 13:11:34,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2012/11/02 13:11:35,
	Serialize complete at 2012/11/02 13:11:35
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: qemu-trivial@nongnu.org, liguang <lig.fnst@cn.fujitsu.com>
Subject: [Qemu-trivial] [Qemu-devel][PATCH v3] correct error message
	qemu-img reported
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
X-List-Received-Date: Fri, 02 Nov 2012 05:43:25 -0000

qemu-img will complain when qcow or qcow2
size overflow for 64 bits, report the right
message in this condition.

Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
---
 qemu-img.c |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index b41e670..d4ea800 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -337,10 +337,15 @@ static int img_create(int argc, char **argv)
 
     /* Get image size, if specified */
     if (optind < argc) {
-        int64_t sval;
+        int64_t sval = 0;
         char *end;
         sval = strtosz_suffix(argv[optind++], &end, STRTOSZ_DEFSUFFIX_B);
-        if (sval < 0 || *end) {
+        if (sval < 0) {
+            error_report("image size is too large!");
+            ret = -1;
+            goto out;
+        }
+        if (*end) {
             error_report("Invalid image size specified! You may use k, M, G or "
                   "T suffixes for ");
             error_report("kilobytes, megabytes, gigabytes and terabytes.");
-- 
1.7.1


