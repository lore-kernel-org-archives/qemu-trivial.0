Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uh4Ou-0006Wg-Lo
	for mharc-qemu-trivial@gnu.org; Mon, 27 May 2013 16:52:16 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47956)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uh4Op-0006RD-SA
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 16:52:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Uh4Om-0003Km-JO
	for qemu-trivial@nongnu.org; Mon, 27 May 2013 16:52:11 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:48145)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Uh4Of-0003Iw-QC; Mon, 27 May 2013 16:52:01 -0400
Received: from gandalf.tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 5348041D10;
	Tue, 28 May 2013 00:52:00 +0400 (MSK)
Received: by gandalf.tls.msk.ru (Postfix, from userid 1000)
	id 71C0047A; Tue, 28 May 2013 00:51:59 +0400 (MSK)
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 28 May 2013 00:51:51 +0400
Message-Id: <1369687911-9731-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Jan Kiszka <jan.kiszka@siemens.com>
Subject: [Qemu-trivial] [PATCH trivial] slirp: cleanup leftovers from misc.h
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
X-List-Received-Date: Mon, 27 May 2013 20:52:15 -0000

There are quite a few leftover declarations in slirp/misc.h.
Remove them.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 slirp/misc.h |   14 --------------
 1 file changed, 14 deletions(-)

I'm not entirely sure we should do this, since this kind of
changes just moves us more and more away from the upstream, but...

diff --git a/slirp/misc.h b/slirp/misc.h
index cc36aeb..ba8beb1 100644
--- a/slirp/misc.h
+++ b/slirp/misc.h
@@ -20,8 +20,6 @@ struct ex_list {
 char *strdup(const char *);
 #endif
 
-void do_wait(int);
-
 #define EMU_NONE 0x0
 
 /* TCP emulations */
@@ -51,21 +49,9 @@ struct emu_t {
     struct emu_t *next;
 };
 
-extern int x_port, x_server, x_display;
-
-int show_x(char *, struct socket *);
-void redir_x(uint32_t, int, int, int);
 void slirp_insque(void *, void *);
 void slirp_remque(void *);
 int add_exec(struct ex_list **, int, char *, struct in_addr, int);
-int slirp_openpty(int *, int *);
 int fork_exec(struct socket *so, const char *ex, int do_pty);
-void snooze_hup(int);
-void snooze(void);
-void relay(int);
-void add_emu(char *);
-void fd_nonblock(int);
-void fd_block(int);
-int rsh_exec(struct socket *, struct socket *, char *, char *, char *);
 
 #endif
-- 
1.7.10.4


