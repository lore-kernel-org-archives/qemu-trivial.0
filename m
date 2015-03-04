Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTINJ-0006AG-SK
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 18:06:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52605)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTINC-00060a-Vr
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 18:06:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTINC-0005O0-7K
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 18:06:38 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:36608)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTIN7-0005Mb-Jy; Wed, 04 Mar 2015 18:06:33 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 33BC540965;
	Thu,  5 Mar 2015 02:06:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id E903D948;
	Wed,  4 Mar 2015 20:07:07 +0300 (MSK)
Received: (nullmailer pid 17554 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:52 +0300
Message-Id: <2f0dd110b31a7823e48906a5ee7c6666e567112d.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Cole Robinson <crobinso@redhat.com>
Subject: [Qemu-trivial] [PULL 35/47] gitignore: Track common.env in iotests
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
X-List-Received-Date: Wed, 04 Mar 2015 23:06:40 -0000

From: Cole Robinson <crobinso@redhat.com>

Rather than track it in the toplevel gitignore

Signed-off-by: Cole Robinson <crobinso@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.1.4


