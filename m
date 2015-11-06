Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZugNP-0006xm-Sr
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2015 07:44:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58346)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZugNM-0006t5-F6
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 07:44:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZugNL-00009F-Lk
	for qemu-trivial@nongnu.org; Fri, 06 Nov 2015 07:44:16 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:33990)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZugNC-00005Z-Or; Fri, 06 Nov 2015 07:44:06 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E594640DD1;
	Fri,  6 Nov 2015 15:44:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id D1BF4AB7;
	Fri,  6 Nov 2015 15:44:03 +0300 (MSK)
Received: (nullmailer pid 31684 invoked by uid 1000);
	Fri, 06 Nov 2015 12:44:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  6 Nov 2015 15:43:43 +0300
Message-Id: <3cd01b6ed8a1ae472f09cbcc47b7cba4d732f94c.1446813769.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
References: <cover.1446813768.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Eric Blake <eblake@redhat.com>
Subject: [Qemu-trivial] [PULL 06/24] tests: ignore test-qga
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
X-List-Received-Date: Fri, 06 Nov 2015 12:44:17 -0000

From: Eric Blake <eblake@redhat.com>

Commit 62c39b30 added a new test, but did not mark it for
exclusion in .gitignore.

Signed-off-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 tests/.gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/.gitignore b/tests/.gitignore
index 65496aa..e96f569 100644
--- a/tests/.gitignore
+++ b/tests/.gitignore
@@ -30,6 +30,7 @@ test-qapi-types.[ch]
 test-qapi-visit.[ch]
 test-qdev-global-props
 test-qemu-opts
+test-qga
 test-qmp-commands
 test-qmp-commands.h
 test-qmp-event
-- 
2.1.4


