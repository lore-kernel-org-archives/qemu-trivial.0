Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VEfwH-0006n7-3m
	for mharc-qemu-trivial@gnu.org; Wed, 28 Aug 2013 09:37:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45886)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <JKrupa@suse.com>) id 1VEKyu-0005TS-Uc
	for qemu-trivial@nongnu.org; Tue, 27 Aug 2013 11:15:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <JKrupa@suse.com>) id 1VEKyo-0006ur-Un
	for qemu-trivial@nongnu.org; Tue, 27 Aug 2013 11:14:56 -0400
Received: from cantor2.suse.de ([195.135.220.15]:46278 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <JKrupa@suse.com>)
	id 1VEKyY-0006rm-8f; Tue, 27 Aug 2013 11:14:34 -0400
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 5C59DA50DE;
	Tue, 27 Aug 2013 17:14:32 +0200 (CEST)
From: Jan Krupa <JKrupa@suse.com>
To: qemu-devel@nongnu.org
Date: Tue, 27 Aug 2013 17:14:46 +0200
Message-Id: <1377616488-16491-2-git-send-email-JKrupa@suse.com>
X-Mailer: git-send-email 1.6.0.2
In-Reply-To: <1377616488-16491-1-git-send-email-JKrupa@suse.com>
References: <1377616488-16491-1-git-send-email-JKrupa@suse.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 195.135.220.15
X-Mailman-Approved-At: Wed, 28 Aug 2013 09:37:34 -0400
Cc: qemu-trivial@nongnu.org, Jan Krupa <jkrupa@suse.com>, anthony@codemonkey.ws
Subject: [Qemu-trivial] [PATCH 1/3] qemu-char: add Czech characters to VNC
	keysyms
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
X-List-Received-Date: Tue, 27 Aug 2013 15:15:03 -0000

This patch adds missing Czech characters to VNC keysym table.

Signed-off-by: Jan Krupa <jkrupa@suse.com>
---
 ui/vnc_keysym.h |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/ui/vnc_keysym.h b/ui/vnc_keysym.h
index 6250bec..72c01d1 100644
--- a/ui/vnc_keysym.h
+++ b/ui/vnc_keysym.h
@@ -224,6 +224,14 @@ static const name2keysym_t name2keysym[]={
 { "odoubleacute",         0x1f5},
 { "udoubleacute",         0x1fb},
 
+/* Czech national characters */
+{ "ecaron",               0x1ec},
+{ "scaron",               0x1b9},
+{ "ccaron",               0x1e8},
+{ "rcaron",               0x1f8},
+{ "zcaron",               0x1be},
+{ "uring",                0x1f9},
+
     /* modifiers */
 {"ISO_Level3_Shift", 0xfe03}, /* XK_ISO_Level3_Shift */
 {"Control_L", 0xffe3}, /* XK_Control_L */
-- 
1.6.0.2


