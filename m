Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VVuqt-0004Kk-Oy
	for mharc-qemu-trivial@gnu.org; Mon, 14 Oct 2013 22:59:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1VVuql-00049s-Tc
	for qemu-trivial@nongnu.org; Mon, 14 Oct 2013 22:59:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1VVuqf-0007sX-VR
	for qemu-trivial@nongnu.org; Mon, 14 Oct 2013 22:59:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:28200)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1VVuqS-0007oc-Ah; Mon, 14 Oct 2013 22:58:52 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9F2woSu005303
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 14 Oct 2013 22:58:50 -0400
Received: from T430s.nay.redhat.com (vpn1-5-72.sin2.redhat.com [10.67.5.72])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r9F2wf0j001298; Mon, 14 Oct 2013 22:58:43 -0400
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 15 Oct 2013 10:58:39 +0800
Message-Id: <1381805919-11572-1-git-send-email-famz@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH] .gitignore: ignore qmp-commands.txt
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
X-List-Received-Date: Tue, 15 Oct 2013 02:59:18 -0000

This file is moved out from QMP/ to BUILD dir, change the ignore file
too.

Signed-off-by: Fam Zheng <famz@redhat.com>
---
 .gitignore | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index 8e1b73f..5584b5f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -44,7 +44,7 @@ qemu-ga
 qemu-bridge-helper
 qemu-monitor.texi
 vscclient
-QMP/qmp-commands.txt
+qmp-commands.txt
 test-bitops
 test-coroutine
 test-int128
-- 
1.8.3.1


