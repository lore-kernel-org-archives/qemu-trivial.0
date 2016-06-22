Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bKB1S-0002gI-BT
	for mharc-qemu-trivial@gnu.org; Mon, 04 Jul 2016 17:03:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39659)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1bK9NJ-0002Jd-Hg
	for qemu-trivial@nongnu.org; Mon, 04 Jul 2016 15:17:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1bK9NF-0003Xp-AC
	for qemu-trivial@nongnu.org; Mon, 04 Jul 2016 15:17:44 -0400
Received: from hera.aquilenet.fr ([141.255.128.1]:40286)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1bK9NE-0003Xk-UQ
	for qemu-trivial@nongnu.org; Mon, 04 Jul 2016 15:17:41 -0400
Received: from localhost (localhost [127.0.0.1])
	by hera.aquilenet.fr (Postfix) with ESMTP id 95F288B4F
	for <qemu-trivial@nongnu.org>; Mon,  4 Jul 2016 21:17:35 +0200 (CEST)
Received: from hera.aquilenet.fr ([127.0.0.1])
	by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 74whRqldKV-H for <qemu-trivial@nongnu.org>;
	Mon,  4 Jul 2016 21:17:35 +0200 (CEST)
Received: from var.youpi.perso.aquilenet.fr (unknown
	[IPv6:2a01:cb19:1af:4600:3602:86ff:fe2c:6a19])
	by hera.aquilenet.fr (Postfix) with ESMTPSA id 4A04A82E6
	for <qemu-trivial@nongnu.org>; Mon,  4 Jul 2016 21:17:35 +0200 (CEST)
Received: from samy by var.youpi.perso.aquilenet.fr with local (Exim 4.87)
	(envelope-from <samuel.thibault@ens-lyon.org>) id 1bK9NC-0002fI-Ms
	for qemu-trivial@nongnu.org; Mon, 04 Jul 2016 21:17:38 +0200
Resent-From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Resent-Date: Mon, 4 Jul 2016 21:17:38 +0200
Resent-Message-ID: <20160704191738.GC3004@var.home>
Resent-To: qemu-trivial@nongnu.org
Received: from iona.labri.fr [147.210.8.143]
	by var.youpi.perso.aquilenet.fr with IMAP (fetchmail-6.3.26)
	for <samy@localhost> (single-drop);
	Wed, 22 Jun 2016 18:11:21 +0200 (CEST)
Received: from iona.labri.fr ([unix socket]) by iona.labri.fr with LMTPA;
	Wed, 22 Jun 2016 18:11:26 +0200
X-Sieve: CMU Sieve 2.3
Received: from localhost (localhost [127.0.0.1])
	by iona.labri.fr (Postfix) with ESMTP id 2425F57B0
	for <samuel.thibault@labri.fr>; Wed, 22 Jun 2016 18:11:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at labri.fr
X-Amavis-OS-Fingerprint: UNKNOWN [S20:53:1:60:M1460, S, T, N,
	W7:.:?:?] (up: 3080
	hrs), (link: ethernet/modem), [140.77.166.138]:43486
Received: from iona.labri.fr ([127.0.0.1])
	by localhost (iona.labri.fr [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id PcJAZaEXdFlJ for <samuel.thibault@labri.fr>;
	Wed, 22 Jun 2016 18:11:25 +0200 (CEST)
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by iona.labri.fr (Postfix) with ESMTPS id E39FA2758
	for <samuel.thibault@labri.fr>; Wed, 22 Jun 2016 18:11:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by sonata.ens-lyon.org (Postfix) with ESMTP id 6BB9E20196
	for <samuel.thibault@labri.fr>; Wed, 22 Jun 2016 18:11:15 +0200 (CEST)
Received: from sonata.ens-lyon.org ([127.0.0.1])
	by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qvJJPbf3vuGb for <samuel.thibault@labri.fr>;
	Wed, 22 Jun 2016 18:11:15 +0200 (CEST)
X-policyd-weight: using cached result; rate: -4
Received: from hera.aquilenet.fr (hera.aquilenet.fr [141.255.128.1])
	by sonata.ens-lyon.org (Postfix) with ESMTP id 304EB20195
	for <samuel.thibault@ens-lyon.org>;
	Wed, 22 Jun 2016 18:11:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hera.aquilenet.fr (Postfix) with ESMTP id B6F558A78;
	Wed, 22 Jun 2016 18:11:10 +0200 (CEST)
Received: from hera.aquilenet.fr ([127.0.0.1])
	by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DkbO1z5l-fxl; Wed, 22 Jun 2016 18:11:10 +0200 (CEST)
Received: from var.youpi.perso.aquilenet.fr (unknown [82.98.7.198])
	by hera.aquilenet.fr (Postfix) with ESMTPSA id 82708895A;
	Wed, 22 Jun 2016 18:11:10 +0200 (CEST)
Received: from samy by var.youpi.perso.aquilenet.fr with local (Exim 4.87)
	(envelope-from <samuel.thibault@ens-lyon.org>)
	id 1bFkKY-0005uJ-R3; Wed, 22 Jun 2016 17:44:42 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: qemu-devel@nongnu.org,
	kraxel@redhat.com
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>
Date: Wed, 22 Jun 2016 17:44:38 +0200
Message-Id: <1466610278-22670-1-git-send-email-samuel.thibault@ens-lyon.org>
X-Mailer: git-send-email 2.8.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 141.255.128.1
X-Mailman-Approved-At: Mon, 04 Jul 2016 17:03:17 -0400
Subject: [Qemu-trivial] [PATCH] Reduce curses escdelay from 1s to 0.2s
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
X-List-Received-Date: Mon, 04 Jul 2016 19:17:46 -0000

By default, curses will only report single ESC key event after 1s delay,
since ESC is also used for keypad escape sequences. This however makes users
believe that ESC is not working. Reducing to 0.2s provides good enough user
experience, while still allowing 200ms for keypad sequences to get in, which
should be more than enough.

Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
---
 ui/curses.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/ui/curses.c b/ui/curses.c
index b475589..49d3ce6 100644
--- a/ui/curses.c
+++ b/ui/curses.c
@@ -222,7 +222,7 @@ static void curses_refresh(DisplayChangeListener *dcl)
         keycode = curses2keycode[chr];
         keycode_alt = 0;
 
-        /* alt key */
+        /* alt or esc key */
         if (keycode == 1) {
             nextchr = getch();
 
@@ -349,6 +349,7 @@ static void curses_setup(void)
     initscr(); noecho(); intrflush(stdscr, FALSE);
     nodelay(stdscr, TRUE); nonl(); keypad(stdscr, TRUE);
     start_color(); raw(); scrollok(stdscr, FALSE);
+    set_escdelay(200);
 
     /* Make color pair to match color format (3bits bg:3bits fg) */
     for (i = 0; i < 64; i++) {
-- 
2.8.1


