Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bjqFd-0000bU-In
	for mharc-qemu-trivial@gnu.org; Tue, 13 Sep 2016 12:08:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bjqFY-0000VR-Iv
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 12:08:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bjqFU-0004MI-Oz
	for qemu-trivial@nongnu.org; Tue, 13 Sep 2016 12:07:56 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35303)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bjqFL-0003wz-Pl; Tue, 13 Sep 2016 12:07:43 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id A9FEE416DB;
	Tue, 13 Sep 2016 19:07:40 +0300 (MSK)
Received: from gandalf (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 6AC61AFD;
	Tue, 13 Sep 2016 19:07:39 +0300 (MSK)
Received: (nullmailer pid 31904 invoked by uid 1000);
	Tue, 13 Sep 2016 16:07:39 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 13 Sep 2016 19:04:49 +0300
Message-Id: <32945472cef09306c96635cb030704d5bd8f85be.1473782118.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473782118.git.mjt@tls.msk.ru>
References: <cover.1473782118.git.mjt@tls.msk.ru>
In-Reply-To: <cover.1473782118.git.mjt@tls.msk.ru>
References: <cover.1473782118.git.mjt@tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 10/16] Document that curses usually needs -k
 option too
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Sep 2016 16:08:00 -0000

From: Samuel Thibault <samuel.thibault@ens-lyon.org>

Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 70dfe98..cde4a05 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -303,7 +303,7 @@ STEXI
 @findex -k
 Use keyboard layout @var{language} (for example @code{fr} for
 French). This option is only needed where it is not easy to get raw PC
-keycodes (e.g. on Macs, with some X11 servers or with a VNC
+keycodes (e.g. on Macs, with some X11 servers or with a VNC or curses
 display). You don't normally need to use it on PC/Linux or PC/Windows
 hosts.
 
-- 
2.1.4


