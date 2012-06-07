Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Sckbh-00042x-7X
	for mharc-qemu-trivial@gnu.org; Thu, 07 Jun 2012 17:51:05 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55737)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <harsh@linux.vnet.ibm.com>) id 1Sckbf-00042Z-1k
	for qemu-trivial@nongnu.org; Thu, 07 Jun 2012 17:51:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <harsh@linux.vnet.ibm.com>) id 1Sckbd-0008An-4M
	for qemu-trivial@nongnu.org; Thu, 07 Jun 2012 17:51:02 -0400
Received: from e28smtp02.in.ibm.com ([122.248.162.2]:34786)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <harsh@linux.vnet.ibm.com>) id 1Sckbc-00085F-Fu
	for qemu-trivial@nongnu.org; Thu, 07 Jun 2012 17:51:01 -0400
Received: from /spool/local
	by e28smtp02.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <harsh@linux.vnet.ibm.com>;
	Fri, 8 Jun 2012 03:20:54 +0530
Received: from d28relay05.in.ibm.com (9.184.220.62)
	by e28smtp02.in.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 8 Jun 2012 03:20:51 +0530
Received: from d28av02.in.ibm.com (d28av02.in.ibm.com [9.184.220.64])
	by d28relay05.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	q57LooFb52428866; Fri, 8 Jun 2012 03:20:50 +0530
Received: from d28av02.in.ibm.com (loopback [127.0.0.1])
	by d28av02.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	q583LSG4007632; Fri, 8 Jun 2012 13:21:28 +1000
Received: from harshbora.in.ibm.com ([9.77.121.234])
	by d28av02.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	q583LRIR007597; Fri, 8 Jun 2012 13:21:27 +1000
From: Harsh Prateek Bora <harsh@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri,  8 Jun 2012 03:20:43 +0530
Message-Id: <1339105843-30064-3-git-send-email-harsh@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.10.2
In-Reply-To: <1339105843-30064-1-git-send-email-harsh@linux.vnet.ibm.com>
References: <1339105843-30064-1-git-send-email-harsh@linux.vnet.ibm.com>
x-cbid: 12060721-5816-0000-0000-0000030DADC8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 122.248.162.2
Cc: Harsh Prateek Bora <harsh@linux.vnet.ibm.com>, stefanha@linux.vnet.ibm.com,
	aneesh.kumar@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH 2/2] configure: report appropriate error on
	missing library
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
X-List-Received-Date: Thu, 07 Jun 2012 21:51:04 -0000


Signed-off-by: Harsh Prateek Bora <harsh@linux.vnet.ibm.com>
---
 configure |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 76dd57f..e8f0172 100755
--- a/configure
+++ b/configure
@@ -2915,7 +2915,8 @@ if test "$softmmu" = yes ; then
       tools="$tools fsdev/virtfs-proxy-helper\$(EXESUF)"
     else
       if test "$virtfs" = yes; then
-        feature_not_found "virtfs"
+        echo "VirtFS is supported only on Linux and requires libcap-devel and libattr-devel"
+        exit 1
       fi
       virtfs=no
     fi
-- 
1.7.10.2


