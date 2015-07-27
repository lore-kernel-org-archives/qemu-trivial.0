Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZJoTr-0003M3-SI
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jul 2015 15:54:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJoTk-00034J-Nn
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 15:54:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZJoTj-0002bx-Ik
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 15:54:28 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41273)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZJoTe-0002a5-EJ; Mon, 27 Jul 2015 15:54:22 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 001C8425B4;
	Mon, 27 Jul 2015 22:54:21 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id E05DCA65;
	Mon, 27 Jul 2015 22:54:20 +0300 (MSK)
Received: (nullmailer pid 9529 invoked by uid 1000);
	Mon, 27 Jul 2015 19:54:20 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 27 Jul 2015 22:54:10 +0300
Message-Id: <7e71e111e0544ec35af40c3dc29f21697c8f17bf.1438026619.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438026619.git.mjt@msgid.tls.msk.ru>
References: <cover.1438026619.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michal Privoznik <mprivozn@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 07/10] gitignore: Ignore shader generated files
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
X-List-Received-Date: Mon, 27 Jul 2015 19:54:34 -0000

From: Michal Privoznik <mprivozn@redhat.com>

As of d98bc0b65 there are two files that are automatically generated:
ui/shader/texture-blit-frag.h and /ui/shader/texture-blit-vert.h. None
of them is wanted to be tracked by git. Put them into the ignore file
then.

Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 .gitignore | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitignore b/.gitignore
index aed0e1f..61bc492 100644
--- a/.gitignore
+++ b/.gitignore
@@ -17,6 +17,8 @@
 /trace/generated-tcg-tracers.h
 /trace/generated-ust-provider.h
 /trace/generated-ust.c
+/ui/shader/texture-blit-frag.h
+/ui/shader/texture-blit-vert.h
 /libcacard/trace/generated-tracers.c
 *-timestamp
 /*-softmmu
-- 
2.1.4


