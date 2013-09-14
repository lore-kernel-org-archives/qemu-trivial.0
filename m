Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKvp6-0005Qa-JV
	for mharc-qemu-trivial@gnu.org; Sat, 14 Sep 2013 15:48:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48113)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKvp0-0005GF-T3
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 15:48:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VKvow-0006jq-Pg
	for qemu-trivial@nongnu.org; Sat, 14 Sep 2013 15:47:58 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49776)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VKvom-0006ce-Nf; Sat, 14 Sep 2013 15:47:44 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 01ABC411BF;
	Sat, 14 Sep 2013 23:47:44 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id DEEBE501;
	Sat, 14 Sep 2013 23:47:43 +0400 (MSK)
Received: (nullmailer pid 7704 invoked by uid 1000);
	Sat, 14 Sep 2013 19:47:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Sat, 14 Sep 2013 23:47:33 +0400
Message-Id: <1379188061-7634-8-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1379188061-7634-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1379188061-7634-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 07/15] *-user: Improve documentation for
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
X-List-Received-Date: Sat, 14 Sep 2013 19:48:03 -0000

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


