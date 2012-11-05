Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TVHL6-00027D-33
	for mharc-qemu-trivial@gnu.org; Mon, 05 Nov 2012 02:43:20 -0500
Received: from eggs.gnu.org ([208.118.235.92]:43805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1TVHL4-00021O-7n
	for qemu-trivial@nongnu.org; Mon, 05 Nov 2012 02:43:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1TVHL3-000870-8t
	for qemu-trivial@nongnu.org; Mon, 05 Nov 2012 02:43:18 -0500
Received: from [222.73.24.84] (port=56028 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1TVHL2-00086r-Rs; Mon, 05 Nov 2012 02:43:17 -0500
X-IronPort-AV: E=Sophos;i="4.80,713,1344182400"; 
   d="scan'208";a="6138919"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 05 Nov 2012 15:41:10 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id qA57gd1G015852;
	Mon, 5 Nov 2012 15:42:46 +0800
Received: from liguang.fnst.cn.fujitsu.com ([10.167.225.128])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2012110515414941-958055 ;
	Mon, 5 Nov 2012 15:41:49 +0800 
From: liguang <lig.fnst@cn.fujitsu.com>
To: qemu-devel@nongnu.org
Date: Mon, 5 Nov 2012 15:41:40 +0800
Message-Id: <1352101300-12060-1-git-send-email-lig.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.2.5
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2012/11/05 15:41:49,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2012/11/05 15:41:55,
	Serialize complete at 2012/11/05 15:41:55
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: qemu-trivial@nongnu.org, liguang <lig.fnst@cn.fujitsu.com>
Subject: [Qemu-trivial] [Qemu-devel][PATCH v4] correct error message
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
X-List-Received-Date: Mon, 05 Nov 2012 07:43:19 -0000

qemu-img will complain when qcow or qcow2
size overflow for 64 bits, report the right
message in this condition.

Signed-off-by: liguang <lig.fnst@cn.fujitsu.com>
---
 qemu-img.c |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index b41e670..d9434ad 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -340,7 +340,12 @@ static int img_create(int argc, char **argv)
         int64_t sval;
         char *end;
         sval = strtosz_suffix(argv[optind++], &end, STRTOSZ_DEFSUFFIX_B);
-        if (sval < 0 || *end) {
+        if (sval < 0) {
+            error_report("Image size must be less than 8 exabytes!");
+            ret = -1;
+            goto out;
+        }
+        if (*end) {
             error_report("Invalid image size specified! You may use k, M, G or "
                   "T suffixes for ");
             error_report("kilobytes, megabytes, gigabytes and terabytes.");
-- 
1.7.1


