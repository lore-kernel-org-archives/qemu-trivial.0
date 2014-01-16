Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W3qyA-0000Xr-KC
	for mharc-qemu-trivial@gnu.org; Thu, 16 Jan 2014 12:43:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W3qy1-0000Ep-8Y
	for qemu-trivial@nongnu.org; Thu, 16 Jan 2014 12:43:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W3qxw-00017T-34
	for qemu-trivial@nongnu.org; Thu, 16 Jan 2014 12:42:57 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:36786)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W3qxj-0000xD-Ik; Thu, 16 Jan 2014 12:42:39 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D6BB2415CA;
	Thu, 16 Jan 2014 21:42:37 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 5437F63A;
	Thu, 16 Jan 2014 21:35:26 +0400 (MSK)
Received: (nullmailer pid 16406 invoked by uid 1000);
	Thu, 16 Jan 2014 17:35:24 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Thu, 16 Jan 2014 21:35:17 +0400
Message-Id: <1389893719-16336-10-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389893719-16336-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1389893719-16336-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Pavel Zbitskiy <pavel.zbitskiy@gmail.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 09/11] linux-user: fixed recvfrom() addrlen
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
X-List-Received-Date: Thu, 16 Jan 2014 17:43:02 -0000

From: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>

addrlen parameter of recvfrom() of type socklen_t* was read into
variable of type socklen_t, that caused zeroing out of upper 4 bytes
when running s390x on top of x86_64. This patch changes addrlen type
to abi_ulong.

Signed-off-by: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/syscall.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index a9ce6ba..bc0ac98 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -2340,7 +2340,7 @@ static abi_long do_socketcall(int num, abi_ulong vptr)
             size_t len;
             abi_ulong flags;
             abi_ulong addr;
-            socklen_t addrlen;
+            abi_ulong addrlen;
 
             if (get_user_ual(sockfd, vptr)
                 || get_user_ual(msg, vptr + n)
-- 
1.7.10.4


