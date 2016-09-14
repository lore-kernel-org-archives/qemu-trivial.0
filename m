Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk5LA-0000uM-RU
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 04:14:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36454)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk5L9-0000rM-02
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 04:14:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk5L8-0000z5-1s
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 04:14:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41159)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk5L1-0000vk-GT; Wed, 14 Sep 2016 04:14:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 93D7F4183E;
	Wed, 14 Sep 2016 11:14:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 3F0B5AFD;
	Wed, 14 Sep 2016 10:58:59 +0300 (MSK)
Received: (nullmailer pid 17325 invoked by uid 1000);
	Wed, 14 Sep 2016 07:58:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 14 Sep 2016 10:58:33 +0300
Message-Id: <3a2d64091b8f7878f375976662b3a4f7882e60ef.1473839869.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 07/27] MAINTAINERS: Add include/sysemu/cpus.h
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Sep 2016 08:14:44 -0000

From: Thomas Huth <thuth@redhat.com>

This header seems to belong to the guest CPU section since it
contains prototypes for cpus.c.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3d3098c..635ca77 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -83,6 +83,7 @@ F: include/exec/cpu*.h
 F: include/exec/exec-all.h
 F: include/exec/helper*.h
 F: include/exec/tb-hash.h
+F: include/sysemu/cpus.h
 
 FPU emulation
 M: Aurelien Jarno <aurelien@aurel32.net>
-- 
2.1.4


