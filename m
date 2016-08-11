Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bXkIk-00028L-AP
	for mharc-qemu-trivial@gnu.org; Thu, 11 Aug 2016 03:21:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52925)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bXkIi-000273-AJ
	for qemu-trivial@nongnu.org; Thu, 11 Aug 2016 03:21:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bXkIh-00063b-7G
	for qemu-trivial@nongnu.org; Thu, 11 Aug 2016 03:21:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46486)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1bXkIb-00062m-3S; Thu, 11 Aug 2016 03:21:05 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 46F7A3DEF0;
	Thu, 11 Aug 2016 07:21:03 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-22.ams2.redhat.com [10.36.116.22])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u7B7L1DF019006; Thu, 11 Aug 2016 03:21:01 -0400
From: Thomas Huth <thuth@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Thu, 11 Aug 2016 09:21:00 +0200
Message-Id: <1470900060-25821-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 11 Aug 2016 07:21:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] ui/console: Fix non-working backspace key in
 monitor of gtk UI
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
X-List-Received-Date: Thu, 11 Aug 2016 07:21:13 -0000

In the QEMU monitor pane of the gtk user interface, the backspace
key is not working at all. This happens because of a missing mapping
of the key in the qcode_to_keysym[] table. Thus let's add an entry
there to get the backspace key working again.

Buglink: https://bugs.launchpad.net/qemu/+bug/1611979
Signed-off-by: Thomas Huth <thuth@redhat.com>
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
1.8.3.1


