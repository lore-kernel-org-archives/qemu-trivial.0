Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TgmLw-0000uS-3V
	for mharc-qemu-trivial@gnu.org; Thu, 06 Dec 2012 20:03:44 -0500
Received: from eggs.gnu.org ([208.118.235.92]:59615)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1TgmLt-0000nc-6B
	for qemu-trivial@nongnu.org; Thu, 06 Dec 2012 20:03:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1TgmLs-0003lq-7n
	for qemu-trivial@nongnu.org; Thu, 06 Dec 2012 20:03:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:10840)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>)
	id 1TgmLp-0003lG-MO; Thu, 06 Dec 2012 20:03:37 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qB713ZFm029423
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 6 Dec 2012 20:03:35 -0500
Received: from colepc.redhat.com (ovpn-113-169.phx2.redhat.com [10.3.113.169])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id qB713YPp018457; Thu, 6 Dec 2012 20:03:34 -0500
From: Cole Robinson <crobinso@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  6 Dec 2012 20:03:26 -0500
Message-Id: <8b94a7004b9d169a579a9ee1a9513e6cb212690f.1354842199.git.crobinso@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Cole Robinson <crobinso@redhat.com>
Subject: [Qemu-trivial] [PATCH] gitignore: Add virtfs-proxy-helper
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
X-List-Received-Date: Fri, 07 Dec 2012 01:03:42 -0000


Signed-off-by: Cole Robinson <crobinso@redhat.com>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index bd6ba1c..3ce57cc 100644
--- a/.gitignore
+++ b/.gitignore
@@ -47,6 +47,7 @@ test-qmp-output-visitor
 test-string-input-visitor
 test-string-output-visitor
 test-visitor-serialization
+fsdev/virtfs-proxy-helper
 fsdev/virtfs-proxy-helper.1
 fsdev/virtfs-proxy-helper.pod
 .gdbinit
-- 
1.8.0


