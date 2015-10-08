Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkddG-00041d-8i
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2015 15:47:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49557)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkLFs-0004Aw-81
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 20:09:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkLFr-0006En-GI
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 20:09:48 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51809)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZkEQy-0000sL-SD; Thu, 08 Oct 2015 12:52:49 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5A6F940A5C;
	Thu,  8 Oct 2015 19:52:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 39813A83;
	Thu,  8 Oct 2015 19:52:30 +0300 (MSK)
Received: (nullmailer pid 11988 invoked by uid 1000);
	Thu, 08 Oct 2015 16:52:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu,  8 Oct 2015 19:52:15 +0300
Message-Id: <16033ba577059c5675e4c786234c46027380c29b.1444323071.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
References: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 06/19] pci-assign: do not include sys/io.h
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
X-List-Received-Date: Fri, 09 Oct 2015 00:09:49 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

This file does not exist on bionic libc and the functions it defines
are in fact not used by pci-assign.c.  Remove it.

Reported-by: Houcheng Lin <houcheng@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 hw/i386/kvm/pci-assign.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/i386/kvm/pci-assign.c b/hw/i386/kvm/pci-assign.c
index b1beaa6..44beee3 100644
--- a/hw/i386/kvm/pci-assign.c
+++ b/hw/i386/kvm/pci-assign.c
@@ -22,7 +22,6 @@
  */
 #include <stdio.h>
 #include <unistd.h>
-#include <sys/io.h>
 #include <sys/mman.h>
 #include <sys/types.h>
 #include <sys/stat.h>
-- 
2.1.4


