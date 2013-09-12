Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VKB93-0004yD-Or
	for mharc-qemu-trivial@gnu.org; Thu, 12 Sep 2013 13:57:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48854)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VKB90-0004tq-R2
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 13:57:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VKB8z-0006KH-JC
	for qemu-trivial@nongnu.org; Thu, 12 Sep 2013 13:57:30 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:50165
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VKB8s-00063k-Sq; Thu, 12 Sep 2013 13:57:23 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 88B1E180651; Thu, 12 Sep 2013 19:57:18 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel <qemu-devel@nongnu.org>
Date: Thu, 12 Sep 2013 19:57:15 +0200
Message-Id: <1379008635-17714-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial@nongnu.org, Blue Swirl <blauwirbel@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] *-user: Improve documentation for lock_user
	function
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
X-List-Received-Date: Thu, 12 Sep 2013 17:57:32 -0000

Add a missing "function" and replace "and" by "any".
BSD und Linux use the same documentation here, so fix both.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 bsd-user/qemu.h   |    4 ++--
 linux-user/qemu.h |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 325f564..1998af6 100644
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
index 6ffe5a2..974c239 100644
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
1.7.9.5


