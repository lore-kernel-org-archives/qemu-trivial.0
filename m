Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SIhJs-0000O4-TS
	for mharc-qemu-trivial@gnu.org; Fri, 13 Apr 2012 10:17:48 -0400
Received: from eggs.gnu.org ([208.118.235.92]:54378)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1SIhJn-0000N8-UI
	for qemu-trivial@nongnu.org; Fri, 13 Apr 2012 10:17:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1SIhJh-0003y3-Ri
	for qemu-trivial@nongnu.org; Fri, 13 Apr 2012 10:17:43 -0400
Received: from e06smtp14.uk.ibm.com ([195.75.94.110]:51177)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@linux.vnet.ibm.com>) id 1SIhJh-0003xS-JB
	for qemu-trivial@nongnu.org; Fri, 13 Apr 2012 10:17:37 -0400
Received: from /spool/local
	by e06smtp14.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanha@linux.vnet.ibm.com>;
	Fri, 13 Apr 2012 15:17:33 +0100
Received: from d06nrmr1307.portsmouth.uk.ibm.com (9.149.38.129)
	by e06smtp14.uk.ibm.com (192.168.101.144) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Fri, 13 Apr 2012 15:17:31 +0100
Received: from d06av12.portsmouth.uk.ibm.com (d06av12.portsmouth.uk.ibm.com
	[9.149.37.247])
	by d06nrmr1307.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v10.0) with
	ESMTP id q3DEHUsB2347188; Fri, 13 Apr 2012 15:17:30 +0100
Received: from d06av12.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av12.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with
	ESMTP id q3DEHTLp014443; Fri, 13 Apr 2012 08:17:29 -0600
Received: from localhost (dyn-9-174-219-44.manchester-maybrook.uk.ibm.com
	[9.174.219.44])
	by d06av12.portsmouth.uk.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with
	ESMTP id q3DEHTxL014414; Fri, 13 Apr 2012 08:17:29 -0600
From: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
To: <qemu-devel@nongnu.org>
Date: Fri, 13 Apr 2012 15:17:21 +0100
Message-Id: <1334326641-30837-1-git-send-email-stefanha@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.9.5
x-cbid: 12041314-1948-0000-0000-00000183F40D
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 195.75.94.110
Cc: qemu-trivial@nongnu.org, Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH] gitignore: ignore qtest binaries
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
X-List-Received-Date: Fri, 13 Apr 2012 14:17:48 -0000

Signed-off-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>
---
 .gitignore |    1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 9859c7d..db74219 100644
--- a/.gitignore
+++ b/.gitignore
@@ -89,3 +89,4 @@ cscope.*
 tags
 TAGS
 *~
+tests/*-test
-- 
1.7.9.5


