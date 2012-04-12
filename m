Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SIHBL-00033i-66
	for mharc-qemu-trivial@gnu.org; Thu, 12 Apr 2012 06:23:15 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45260)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1SIHBI-0002y6-Ul
	for qemu-trivial@nongnu.org; Thu, 12 Apr 2012 06:23:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1SIHBH-00035b-A8
	for qemu-trivial@nongnu.org; Thu, 12 Apr 2012 06:23:12 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:39682)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1SIHB6-00034D-Bh; Thu, 12 Apr 2012 06:23:00 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1SIHAq-0006gJ-Rh; Thu, 12 Apr 2012 11:22:44 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 12 Apr 2012 11:22:44 +0100
Message-Id: <1334226164-25658-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, Brad Smith <brad@comstyle.com>, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] bsd-user: fix compile failure
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
X-List-Received-Date: Thu, 12 Apr 2012 10:23:14 -0000

bsd-user doesn't actually support reserving a memory area for the
guest address space, but we need to at least define the reserved_va
global so that cpu-all.h's RESERVED_VA macro will work correctly.

This fixes a compilation error introduced in commit
which added a use of RESERVED_VA to h2g_valid().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 bsd-user/main.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/bsd-user/main.c b/bsd-user/main.c
index 48cb715..0689e38 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -41,6 +41,7 @@ int singlestep;
 unsigned long mmap_min_addr;
 unsigned long guest_base;
 int have_guest_base;
+unsigned long reserved_va;
 #endif
 
 static const char *interp_prefix = CONFIG_QEMU_INTERP_PREFIX;
-- 
1.7.1


