Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RSo4Z-0003bA-7Z
	for mharc-qemu-trivial@gnu.org; Tue, 22 Nov 2011 05:59:31 -0500
Received: from eggs.gnu.org ([140.186.70.92]:47553)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RSo4S-0003B4-TZ
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:59:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RSo4O-00087F-R3
	for qemu-trivial@nongnu.org; Tue, 22 Nov 2011 05:59:24 -0500
Received: from oxygen.pond.sub.org ([78.46.104.156]:58515)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1RSo4J-000859-2W; Tue, 22 Nov 2011 05:59:15 -0500
Received: from blackfin.pond.sub.org (p5B32D94C.dip.t-dialin.net
	[91.50.217.76])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id DB3F6A22CD;
	Tue, 22 Nov 2011 11:59:08 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id CDD0660070; Tue, 22 Nov 2011 11:59:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 22 Nov 2011 11:59:06 +0100
Message-Id: <1321959547-2602-2-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1321959547-2602-1-git-send-email-armbru@redhat.com>
References: <1321959547-2602-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.46.104.156
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 1/2] console: Clean up confusing indentation
	in console_putchar()
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
X-List-Received-Date: Tue, 22 Nov 2011 10:59:29 -0000


Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 console.c |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/console.c b/console.c
index f6fe441..374fcba 100644
--- a/console.c
+++ b/console.c
@@ -1009,16 +1009,16 @@ static void console_putchar(TextConsole *s, int ch)
                             console_clear_xy(s, x, y);
                         }
                     }
-                break;
+                    break;
                 }
             case 'K':
                 switch (s->esc_params[0]) {
                 case 0:
-                /* clear to eol */
-                for(x = s->x; x < s->width; x++) {
+                    /* clear to eol */
+                    for(x = s->x; x < s->width; x++) {
                         console_clear_xy(s, x, s->y);
-                }
-                break;
+                    }
+                    break;
                 case 1:
                     /* clear from beginning of line */
                     for (x = 0; x <= s->x; x++) {
@@ -1030,12 +1030,12 @@ static void console_putchar(TextConsole *s, int ch)
                     for(x = 0; x < s->width; x++) {
                         console_clear_xy(s, x, s->y);
                     }
-                break;
-            }
+                    break;
+                }
                 break;
             case 'm':
-            console_handle_escape(s);
-            break;
+                console_handle_escape(s);
+                break;
             case 'n':
                 /* report cursor position */
                 /* TODO: send ESC[row;colR */
-- 
1.7.6.4


