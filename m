Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VNj6n-00041W-7J
	for mharc-qemu-trivial@gnu.org; Sun, 22 Sep 2013 08:49:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1VNj6f-0003s2-Qm
	for qemu-trivial@nongnu.org; Sun, 22 Sep 2013 08:49:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1VNj6Z-0000LS-Jt
	for qemu-trivial@nongnu.org; Sun, 22 Sep 2013 08:49:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50818)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1VNj6N-0000Io-Dr; Sun, 22 Sep 2013 08:49:27 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8MCnOeB008102
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Sun, 22 Sep 2013 08:49:24 -0400
Received: from T430s.nay.redhat.com ([10.66.6.118])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r8MCnK9h030138; Sun, 22 Sep 2013 08:49:21 -0400
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Sun, 22 Sep 2013 20:49:19 +0800
Message-Id: <1379854159-27734-1-git-send-email-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, xiawenc@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH] .gitignore: ignore
	tests/qemu-iotests/socket_scm_helper
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
X-List-Received-Date: Sun, 22 Sep 2013 12:49:51 -0000

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 tests/qemu-iotests/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qemu-iotests/.gitignore b/tests/qemu-iotests/.gitignore
index 62b4002..0541f80 100644
--- a/tests/qemu-iotests/.gitignore
+++ b/tests/qemu-iotests/.gitignore
@@ -2,6 +2,7 @@ check.log
 check.time
 *.out.bad
 *.notrun
+socket_scm_helper
 
 # ignore everything in the scratch directory
 scratch/
-- 
1.8.3.1


