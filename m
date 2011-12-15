Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RbBSA-0007cB-B4
	for mharc-qemu-trivial@gnu.org; Thu, 15 Dec 2011 08:34:30 -0500
Received: from eggs.gnu.org ([140.186.70.92]:38907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1RbBS3-00074Y-3y
	for qemu-trivial@nongnu.org; Thu, 15 Dec 2011 08:34:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1RbBRt-0005VY-Te
	for qemu-trivial@nongnu.org; Thu, 15 Dec 2011 08:34:17 -0500
Received: from mnementh.archaic.org.uk ([81.2.115.146]:51282)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1RbBRj-0005HT-Vg; Thu, 15 Dec 2011 08:34:04 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1RbBRa-0005ah-1z; Thu, 15 Dec 2011 13:33:54 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 15 Dec 2011 13:33:54 +0000
Message-Id: <1323956034-21468-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] HACKING: clarify allocation/free
	recommendations
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
X-List-Received-Date: Thu, 15 Dec 2011 13:34:28 -0000

Clarify the allocation/free recommendations; this is mostly
just tidying up following the global-search-and-replace done
with the conversion to the GLib g_malloc and friends.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 HACKING |   10 ++++++----
 1 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/HACKING b/HACKING
index 733eab2..471cf1d 100644
--- a/HACKING
+++ b/HACKING
@@ -77,11 +77,13 @@ avoided.
 
 Use of the malloc/free/realloc/calloc/valloc/memalign/posix_memalign
 APIs is not allowed in the QEMU codebase. Instead of these routines,
-use the replacement g_malloc/g_malloc0/g_realloc/g_free or
-qemu_vmalloc/qemu_memalign/qemu_vfree APIs.
+use the GLib memory allocation routines g_malloc/g_malloc0/g_new/
+g_new0/g_realloc/g_free or QEMU's qemu_vmalloc/qemu_memalign/qemu_vfree
+APIs.
 
-Please note that NULL check for the g_malloc result is redundant and
-that g_malloc() call with zero size is not allowed.
+Please note that g_malloc will exit on allocation failure, so there
+is no need to test for failure (as you would have to with malloc).
+Calling g_malloc with a zero size is valid and will return NULL.
 
 Memory allocated by qemu_vmalloc or qemu_memalign must be freed with
 qemu_vfree, since breaking this will cause problems on Win32 and user
-- 
1.7.5.4


