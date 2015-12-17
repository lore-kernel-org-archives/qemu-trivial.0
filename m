Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a9ZUq-000670-VL
	for mharc-qemu-trivial@gnu.org; Thu, 17 Dec 2015 09:25:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47315)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1a9ZUk-00064a-NX
	for qemu-trivial@nongnu.org; Thu, 17 Dec 2015 09:25:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1a9ZUj-0003dE-Gn
	for qemu-trivial@nongnu.org; Thu, 17 Dec 2015 09:25:26 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38594)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1a9ZUZ-0003bs-M8; Thu, 17 Dec 2015 09:25:15 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 21FD537C832;
	Thu, 17 Dec 2015 14:25:15 +0000 (UTC)
Received: from thh440s.redhat.com (vpn1-6-136.ams2.redhat.com [10.36.6.136])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBHEPCwZ009710; Thu, 17 Dec 2015 09:25:13 -0500
From: Thomas Huth <thuth@redhat.com>
To: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org
Date: Thu, 17 Dec 2015 15:25:12 +0100
Message-Id: <1450362312-7228-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] MAINTAINERS: Add the correct device_tree.h
	file
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
X-List-Received-Date: Thu, 17 Dec 2015 14:25:31 -0000

device_tree.h is not in the main directory, but under
include/sysemu/ nowadays.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e8cee1e..a341818 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1029,7 +1029,8 @@ Device Tree
 M: Peter Crosthwaite <crosthwaite.peter@gmail.com>
 M: Alexander Graf <agraf@suse.de>
 S: Maintained
-F: device_tree.[ch]
+F: device_tree.c
+F: include/sysemu/device_tree.h
 
 Error reporting
 M: Markus Armbruster <armbru@redhat.com>
-- 
1.8.3.1


