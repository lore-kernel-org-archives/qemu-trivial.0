Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bk5LD-0000xY-Bs
	for mharc-qemu-trivial@gnu.org; Wed, 14 Sep 2016 04:14:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36462)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk5L9-0000rw-9I
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 04:14:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1bk5L8-0000zB-5D
	for qemu-trivial@nongnu.org; Wed, 14 Sep 2016 04:14:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49059)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1bk5L1-0000vl-Ge; Wed, 14 Sep 2016 04:14:35 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id E2D4741847;
	Wed, 14 Sep 2016 11:14:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 70445AFF;
	Wed, 14 Sep 2016 10:58:59 +0300 (MSK)
Received: (nullmailer pid 17317 invoked by uid 1000);
	Wed, 14 Sep 2016 07:58:57 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 14 Sep 2016 10:58:29 +0300
Message-Id: <49635003ac0563974da76736c66f28bd29d3dedd.1473839869.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
References: <cover.1473839869.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 03/27] ui/console: Fix non-working backspace
 key in monitor of gtk UI
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
X-List-Received-Date: Wed, 14 Sep 2016 08:14:44 -0000

From: Thomas Huth <thuth@redhat.com>

In the QEMU monitor pane of the gtk user interface, the backspace
key is not working at all. This happens because of a missing mapping
of the key in the qcode_to_keysym[] table. Thus let's add an entry
there to get the backspace key working again.

Buglink: https://bugs.launchpad.net/qemu/+bug/1611979
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 ui/console.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ui/console.c b/ui/console.c
index c24bfe4..3940762 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1142,6 +1142,7 @@ static const int qcode_to_keysym[Q_KEY_CODE__MAX] = {
     [Q_KEY_CODE_PGUP]   = QEMU_KEY_PAGEUP,
     [Q_KEY_CODE_PGDN]   = QEMU_KEY_PAGEDOWN,
     [Q_KEY_CODE_DELETE] = QEMU_KEY_DELETE,
+    [Q_KEY_CODE_BACKSPACE] = QEMU_KEY_BACKSPACE,
 };
 
 bool kbd_put_qcode_console(QemuConsole *s, int qcode)
-- 
2.1.4


