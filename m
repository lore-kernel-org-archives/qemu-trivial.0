Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Va0Kl-0006iG-Mi
	for mharc-qemu-trivial@gnu.org; Sat, 26 Oct 2013 05:39:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32992)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Va0Kf-0006V7-Kv
	for qemu-trivial@nongnu.org; Sat, 26 Oct 2013 05:39:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Va0Kb-0001Cq-CF
	for qemu-trivial@nongnu.org; Sat, 26 Oct 2013 05:38:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54085)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Va0KM-00014H-Pi; Sat, 26 Oct 2013 05:38:38 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 962B243918;
	Sat, 26 Oct 2013 13:38:37 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 7B387213;
	Sat, 26 Oct 2013 13:32:27 +0400 (MSK)
Received: (nullmailer pid 19536 invoked by uid 1000);
	Sat, 26 Oct 2013 09:32:26 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@amazon.com>
Date: Sat, 26 Oct 2013 13:31:25 +0400
Message-Id: <1382779887-15971-6-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1382779887-15971-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1382779887-15971-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, WengFan <wengfan-fnst@cn.fujitsu.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 5/7] docs/ccid.txt: fix the typo
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
X-List-Received-Date: Sat, 26 Oct 2013 09:39:02 -0000

From: WengFan <wengfan-fnst@cn.fujitsu.com>

Signed-off-by: WengFan <wengfan-fnst@cn.fujitsu.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 docs/ccid.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/ccid.txt b/docs/ccid.txt
index 8bbaa94..83c174d 100644
--- a/docs/ccid.txt
+++ b/docs/ccid.txt
@@ -52,7 +52,7 @@ Configuring and building:
 Assuming you have a working smartcard on the host with the current
 user, using NSS, qemu acts as another NSS client using ccid-card-emulated:
 
-    qemu -usb -device usb-ccid -device ccid-card-emualated
+    qemu -usb -device usb-ccid -device ccid-card-emulated
 
 4. Using ccid-card-emulated with certificates
 
-- 
1.7.10.4


