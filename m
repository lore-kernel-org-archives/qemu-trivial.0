Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QTAUr-0004mB-QE
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2011 06:23:53 -0400
Received: from eggs.gnu.org ([140.186.70.92]:36325)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1QTAUo-0004ki-1b
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2011 06:23:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1QTAUm-0001Nh-Pb
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2011 06:23:49 -0400
Received: from cantor2.suse.de ([195.135.220.15]:59509 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1QTAUi-0001MY-R2; Sun, 05 Jun 2011 06:23:44 -0400
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.221.2])
	by mx2.suse.de (Postfix) with ESMTP id D42C9867E2;
	Sun,  5 Jun 2011 12:23:43 +0200 (CEST)
From: Alexander Graf <agraf@suse.de>
To: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Date: Sat,  4 Jun 2011 07:25:59 +0200
Message-Id: <1307165159-29222-1-git-send-email-agraf@suse.de>
X-Mailer: git-send-email 1.6.0.2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] slirp: fix guestfwd id
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
X-List-Received-Date: Sun, 05 Jun 2011 10:23:51 -0000

When using -net user,guestfwd=... Qemu immediately complains about the id
being in invalid format. This is because we pass in an id that contains a
colon, while the id restrictions don't allow colons.

This patch changes the colon into a dot, making guestfwd work again.

Signed-off-by: Alexander Graf <agraf@suse.de>
---
 net/slirp.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/net/slirp.c b/net/slirp.c
index e387a11..e057a14 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -614,7 +614,7 @@ static int slirp_guestfwd(SlirpState *s, const char *config_str,
     }
 
     fwd = qemu_malloc(sizeof(struct GuestFwd));
-    snprintf(buf, sizeof(buf), "guestfwd.tcp:%d", port);
+    snprintf(buf, sizeof(buf), "guestfwd.tcp.%d", port);
     fwd->hd = qemu_chr_open(buf, p, NULL);
     if (!fwd->hd) {
         error_report("could not open guest forwarding device '%s'", buf);
-- 
1.6.0.2


