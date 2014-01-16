Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W3qrE-0005HS-AO
	for mharc-qemu-trivial@gnu.org; Thu, 16 Jan 2014 12:35:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56264)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W3qr8-00059V-6u
	for qemu-trivial@nongnu.org; Thu, 16 Jan 2014 12:35:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W3qr3-0006i4-Ny
	for qemu-trivial@nongnu.org; Thu, 16 Jan 2014 12:35:50 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:47724)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W3qqs-0006cK-2x; Thu, 16 Jan 2014 12:35:34 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 785B8415C5;
	Thu, 16 Jan 2014 21:35:24 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 596AF634;
	Thu, 16 Jan 2014 21:35:24 +0400 (MSK)
Received: (nullmailer pid 16401 invoked by uid 1000);
	Thu, 16 Jan 2014 17:35:24 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Thu, 16 Jan 2014 21:35:15 +0400
Message-Id: <1389893719-16336-8-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389893719-16336-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1389893719-16336-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Pavel Zbitskiy <pavel.zbitskiy@gmail.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 07/11] linux-user: fixed s390x clone()
	argument order
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
X-List-Received-Date: Thu, 16 Jan 2014 17:35:54 -0000

From: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>

It was broken by 4ce6243dc6216e35b5b691078ffa856463bfa8db,
where TARGET_CLONE_BACKWARDS was specified instead of
TARGET_CLONE_BACKWARDS2.

Signed-off-by: Pavel Zbitskiy <pavel.zbitskiy@gmail.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/s390x/syscall.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/s390x/syscall.h b/linux-user/s390x/syscall.h
index ea8c304..e5ce30b 100644
--- a/linux-user/s390x/syscall.h
+++ b/linux-user/s390x/syscall.h
@@ -22,4 +22,4 @@ struct target_pt_regs {
 
 #define UNAME_MACHINE "s390x"
 
-#define TARGET_CLONE_BACKWARDS
+#define TARGET_CLONE_BACKWARDS2
-- 
1.7.10.4


