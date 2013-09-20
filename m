Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VN4ei-0000rJ-MR
	for mharc-qemu-trivial@gnu.org; Fri, 20 Sep 2013 13:38:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59024)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN4ec-0000es-E2
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 13:38:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VN4eY-0003g2-AQ
	for qemu-trivial@nongnu.org; Fri, 20 Sep 2013 13:38:06 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34586)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VN4eM-0003dy-DJ; Fri, 20 Sep 2013 13:37:50 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 62BB2419D8;
	Fri, 20 Sep 2013 21:37:47 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 19B8C513;
	Fri, 20 Sep 2013 20:58:22 +0400 (MSK)
Received: (nullmailer pid 32175 invoked by uid 1000);
	Fri, 20 Sep 2013 16:58:20 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Fri, 20 Sep 2013 20:58:06 +0400
Message-Id: <1379696296-32105-8-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1379696296-32105-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 07/17] *-user: Improve documentation for
	lock_user function
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
X-List-Received-Date: Fri, 20 Sep 2013 17:38:10 -0000

From: Stefan Weil <sw@weilnetz.de>

Add a missing "function" and replace "and" by "any".
BSD and Linux use the same documentation here, so fix both.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 bsd-user/qemu.h   |    4 ++--
 linux-user/qemu.h |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 1f8ec6e..ddc74ed 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -323,9 +323,9 @@ abi_long copy_from_user(void *hptr, abi_ulong gaddr, size_t len);
 abi_long copy_to_user(abi_ulong gaddr, void *hptr, size_t len);
 
 /* Functions for accessing guest memory.  The tget and tput functions
-   read/write single values, byteswapping as necessary.  The lock_user
+   read/write single values, byteswapping as necessary.  The lock_user function
    gets a pointer to a contiguous area of guest memory, but does not perform
-   and byteswapping.  lock_user may return either a pointer to the guest
+   any byteswapping.  lock_user may return either a pointer to the guest
    memory, or a temporary buffer.  */
 
 /* Lock an area of guest memory into the host.  If copy is true then the
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 4422dfc..617cac1 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -380,9 +380,9 @@ abi_long copy_from_user(void *hptr, abi_ulong gaddr, size_t len);
 abi_long copy_to_user(abi_ulong gaddr, void *hptr, size_t len);
 
 /* Functions for accessing guest memory.  The tget and tput functions
-   read/write single values, byteswapping as necessary.  The lock_user
+   read/write single values, byteswapping as necessary.  The lock_user function
    gets a pointer to a contiguous area of guest memory, but does not perform
-   and byteswapping.  lock_user may return either a pointer to the guest
+   any byteswapping.  lock_user may return either a pointer to the guest
    memory, or a temporary buffer.  */
 
 /* Lock an area of guest memory into the host.  If copy is true then the
-- 
1.7.10.4


