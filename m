Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UoU6z-0007Ag-T8
	for mharc-qemu-trivial@gnu.org; Mon, 17 Jun 2013 03:44:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52363)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UoU6x-00075f-Go
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 03:44:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UoU6w-0005SB-Li
	for qemu-trivial@nongnu.org; Mon, 17 Jun 2013 03:44:23 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:49830)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UoU6u-0005Rc-CP; Mon, 17 Jun 2013 03:44:20 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 78BBF418FC;
	Mon, 17 Jun 2013 11:44:19 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id BA1C051B; Mon, 17 Jun 2013 11:44:18 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@us.ibm.com>
Date: Mon, 17 Jun 2013 11:44:09 +0400
Message-Id: <1371455050-9523-2-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1371455050-9523-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1371455050-9523-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Wu <lekensteyn@gmail.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL trivial/urgent 1/2] vl: always define no_frame
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
X-List-Received-Date: Mon, 17 Jun 2013 07:44:24 -0000

Commit 047d4e151dd46 "Unbreak -no-quit for GTK, validate SDL options" broke
build of qemu without sdl, by referencing `no_frame' variable which is defined
inside #if SDL block.  Fix that by defining that variable unconditionally.

This is a better fix for the build issue introduced by that patch than
a revert.  This change keeps the new functinality introduced by that patch
and just fixes the compilation.  It still is not a complete fix around the
original issue (not working -no-frame et al with -display gtk), because it
makes only the legacy interface working, not the new suboption interface,
so a few more changes are needed.

Cc: Peter Wu <lekensteyn@gmail.com>
Cc: qemu-trivial@nongnu.org
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Reviewed-by: Peter Wu <lekensteyn@gmail.com>
---
 vl.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/vl.c b/vl.c
index 9f8fd6e..f94ec9c 100644
--- a/vl.c
+++ b/vl.c
@@ -199,9 +199,7 @@ static int rtc_date_offset = -1; /* -1 means no change */
 QEMUClock *rtc_clock;
 int vga_interface_type = VGA_NONE;
 static int full_screen = 0;
-#ifdef CONFIG_SDL
 static int no_frame = 0;
-#endif
 int no_quit = 0;
 CharDriverState *serial_hds[MAX_SERIAL_PORTS];
 CharDriverState *parallel_hds[MAX_PARALLEL_PORTS];
-- 
1.7.10.4


