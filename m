Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W3qy7-0000Rt-CE
	for mharc-qemu-trivial@gnu.org; Thu, 16 Jan 2014 12:43:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58945)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W3qxy-0000Ab-N9
	for qemu-trivial@nongnu.org; Thu, 16 Jan 2014 12:42:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W3qxt-00016X-QL
	for qemu-trivial@nongnu.org; Thu, 16 Jan 2014 12:42:54 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:45432)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W3qxj-0000xG-IZ; Thu, 16 Jan 2014 12:42:39 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D8CE4415D2;
	Thu, 16 Jan 2014 21:42:37 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 3C190638;
	Thu, 16 Jan 2014 21:35:26 +0400 (MSK)
Received: (nullmailer pid 16403 invoked by uid 1000);
	Thu, 16 Jan 2014 17:35:24 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Thu, 16 Jan 2014 21:35:16 +0400
Message-Id: <1389893719-16336-9-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389893719-16336-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1389893719-16336-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Pavel Zbitskiy <pavel.zbitskiy@gmail.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 08/11] linux-user: fixed getsockopt() optlen
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
X-List-Received-Date: Thu, 16 Jan 2014 17:43:00 -0000

From: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>

optlen parameter of getsockopt() of type socklen_t* was read into
variable of type socklen_t, that caused zeroing out of upper 4 bytes
when running s390x on top of x86_64. This patch changes optlen type
to abi_ulong.

Signed-off-by: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/syscall.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 0ac05b8..a9ce6ba 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -2406,7 +2406,7 @@ static abi_long do_socketcall(int num, abi_ulong vptr)
             abi_ulong level;
             abi_ulong optname;
             abi_ulong optval;
-            socklen_t optlen;
+            abi_ulong optlen;
 
             if (get_user_ual(sockfd, vptr)
                 || get_user_ual(level, vptr + n)
-- 
1.7.10.4


