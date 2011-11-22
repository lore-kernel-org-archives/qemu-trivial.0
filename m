Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RSo4R-00035K-HX
	for mharc-qemu-trivial@gnu.org; Tue, 22 Nov 2011 05:59:23 -0500
Received: from eggs.gnu.org ([140.186.70.92]:50125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RSo4L-0002mz-Pi
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:59:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RSo4K-00086M-6W
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:59:17 -0500
Received: from oxygen.pond.sub.org ([78.46.104.156]:58517)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1RSo4E-000857-Oc; Tue, 22 Nov 2011 05:59:10 -0500
Received: from blackfin.pond.sub.org (p5B32D94C.dip.t-dialin.net
	[91.50.217.76])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id E84DFA246D;
	Tue, 22 Nov 2011 11:59:08 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id 025346006D; Tue, 22 Nov 2011 11:59:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 22 Nov 2011 11:59:07 +0100
Message-Id: <1321959547-2602-3-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1321959547-2602-1-git-send-email-armbru@redhat.com>
References: <1321959547-2602-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.46.104.156
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 2/2] console: Fix console_putchar() for CSI J
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
X-List-Received-Date: Tue, 22 Nov 2011 10:59:22 -0000

It falls through to the code for CSI K.  "Erase Down" also does "Erase
End of Line", "Erase Up" also does "Erase Start of Line", and "Erase
Screen" also does "Erase Line".  Happens not to be visible.  Fix it
anyway.  Spotted by Coverity.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 console.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/console.c b/console.c
index 374fcba..ce0429d 100644
--- a/console.c
+++ b/console.c
@@ -1011,6 +1011,7 @@ static void console_putchar(TextConsole *s, int ch)
                     }
                     break;
                 }
+                break;
             case 'K':
                 switch (s->esc_params[0]) {
                 case 0:
-- 
1.7.6.4


