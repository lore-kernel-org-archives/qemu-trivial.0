Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YRMjr-0003im-K2
	for mharc-qemu-trivial@gnu.org; Fri, 27 Feb 2015 10:22:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43163)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1YRMjp-0003gO-FF
	for qemu-trivial@nongnu.org; Fri, 27 Feb 2015 10:22:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1YRMjo-0003Be-Mg
	for qemu-trivial@nongnu.org; Fri, 27 Feb 2015 10:22:01 -0500
Received: from mx1.redhat.com ([209.132.183.28]:47495)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>)
	id 1YRMji-00039S-Hj; Fri, 27 Feb 2015 10:21:54 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1RFLrcb002718
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Fri, 27 Feb 2015 10:21:53 -0500
Received: from colepc.redhat.com (ovpn-113-120.phx2.redhat.com [10.3.113.120])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id t1RFLqBG016521; Fri, 27 Feb 2015 10:21:53 -0500
From: Cole Robinson <crobinso@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 Feb 2015 10:21:21 -0500
Message-Id: <60b9a8741264d4fc7042ae560ea859cd62babd1e.1425050482.git.crobinso@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Cole Robinson <crobinso@redhat.com>
Subject: [Qemu-trivial] [PATCH] gitignore: Track common.env in iotests
	gitignore
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
X-List-Received-Date: Fri, 27 Feb 2015 15:22:02 -0000

Rather than track it in the toplevel gitignore

Signed-off-by: Cole Robinson <crobinso@redhat.com>
---
 .gitignore                    | 1 -
 tests/qemu-iotests/.gitignore | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index 090f974..e32a584 100644
--- a/.gitignore
+++ b/.gitignore
@@ -109,4 +109,3 @@ cscope.*
 tags
 TAGS
 *~
-/tests/qemu-iotests/common.env
diff --git a/tests/qemu-iotests/.gitignore b/tests/qemu-iotests/.gitignore
index 0541f80..0711cbd 100644
--- a/tests/qemu-iotests/.gitignore
+++ b/tests/qemu-iotests/.gitignore
@@ -1,5 +1,6 @@
 check.log
 check.time
+common.env
 *.out.bad
 *.notrun
 socket_scm_helper
-- 
2.1.0


