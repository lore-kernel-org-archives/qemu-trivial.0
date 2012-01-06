Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RjD7l-0002kE-62
	for mharc-qemu-trivial@gnu.org; Fri, 06 Jan 2012 11:58:37 -0500
Received: from eggs.gnu.org ([140.186.70.92]:39665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1RjD7h-0002e0-AC
	for qemu-trivial@nongnu.org; Fri, 06 Jan 2012 11:58:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1RjD7g-00022q-1B
	for qemu-trivial@nongnu.org; Fri, 06 Jan 2012 11:58:33 -0500
Received: from e06smtp14.uk.ibm.com ([195.75.94.110]:57558)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1RjD7f-00022b-Oq
	for qemu-trivial@nongnu.org; Fri, 06 Jan 2012 11:58:31 -0500
Received: from /spool/local
	by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanha@linux.vnet.ibm.com>;
	Fri, 6 Jan 2012 16:58:30 -0000
Received: from d06nrmr1307.portsmouth.uk.ibm.com ([9.149.38.129])
	by e06smtp14.uk.ibm.com ([192.168.101.144]) with IBM ESMTP SMTP
	Gateway: Authorized Use Only! Violators will be prosecuted; 
	Fri, 6 Jan 2012 16:57:59 -0000
Received: from d06av08.portsmouth.uk.ibm.com (d06av08.portsmouth.uk.ibm.com
	[9.149.37.249])
	by d06nrmr1307.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with
	ESMTP id q06Gvxex2412736; Fri, 6 Jan 2012 16:57:59 GMT
Received: from d06av08.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av08.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with
	ESMTP id q06GvwDX029331; Fri, 6 Jan 2012 16:57:59 GMT
Received: from localhost (stefanha-thinkpad.manchester-maybrook.uk.ibm.com
	[9.174.219.31])
	by d06av08.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with
	ESMTP id q06GvwOo029324; Fri, 6 Jan 2012 16:57:58 GMT
From: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
To: <qemu-devel@nongnu.org>
Date: Fri,  6 Jan 2012 16:57:44 +0000
Message-Id: <1325869065-32182-2-git-send-email-stefanha@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.7.3
In-Reply-To: <1325869065-32182-1-git-send-email-stefanha@linux.vnet.ibm.com>
References: <1325869065-32182-1-git-send-email-stefanha@linux.vnet.ibm.com>
x-cbid: 12010616-1948-0000-0000-000000925686
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 195.75.94.110
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH 1/2] vvfat: avoid leaking file descriptor in
	commit_one_file()
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
X-List-Received-Date: Fri, 06 Jan 2012 16:58:34 -0000

Reported-by: Dr David Alan Gilbert <davidagilbert@uk.ibm.com>
Signed-off-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
---
 block/vvfat.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/block/vvfat.c b/block/vvfat.c
index eeffc4a..9ef21dd 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -2218,6 +2218,7 @@ static int commit_one_file(BDRVVVFATState* s,
     }
     if (offset > 0) {
         if (lseek(fd, offset, SEEK_SET) != offset) {
+            close(fd);
             g_free(cluster);
             return -3;
         }
@@ -2238,11 +2239,13 @@ static int commit_one_file(BDRVVVFATState* s,
 	    (uint8_t*)cluster, (rest_size + 0x1ff) / 0x200);
 
         if (ret < 0) {
+            close(fd);
             g_free(cluster);
             return ret;
         }
 
         if (write(fd, cluster, rest_size) < 0) {
+            close(fd);
             g_free(cluster);
             return -2;
         }
-- 
1.7.7.3


