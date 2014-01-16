Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W3qyA-0000Wx-68
	for mharc-qemu-trivial@gnu.org; Thu, 16 Jan 2014 12:43:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58953)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W3qy0-0000C3-2z
	for qemu-trivial@nongnu.org; Thu, 16 Jan 2014 12:43:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W3qxv-000172-5z
	for qemu-trivial@nongnu.org; Thu, 16 Jan 2014 12:42:56 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:60574)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W3qxj-0000xH-Id; Thu, 16 Jan 2014 12:42:39 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 13F77415D4;
	Thu, 16 Jan 2014 21:42:38 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 6F75B63D;
	Thu, 16 Jan 2014 21:35:26 +0400 (MSK)
Received: (nullmailer pid 16411 invoked by uid 1000);
	Thu, 16 Jan 2014 17:35:24 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Thu, 16 Jan 2014 21:35:19 +0400
Message-Id: <1389893719-16336-12-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389893719-16336-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1389893719-16336-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 11/11] vl: Add a blank space between the
	variable and '='
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
X-List-Received-Date: Thu, 16 Jan 2014 17:43:01 -0000

From: Kewei Yu <keweihk@gmail.com>

Signed-off-by: Kewei Yu <keweihk@gmail.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 vl.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/vl.c b/vl.c
index 7f4fe0d..2b47866 100644
--- a/vl.c
+++ b/vl.c
@@ -2925,7 +2925,7 @@ int main(int argc, char **argv, char **envp)
 
     bdrv_init_with_whitelist();
 
-    autostart= 1;
+    autostart = 1;
 
     /* first pass of option parsing */
     optind = 1;
-- 
1.7.10.4


