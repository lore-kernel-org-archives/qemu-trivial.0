Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNmnX-0004Dz-HC
	for mharc-qemu-trivial@gnu.org; Tue, 08 Nov 2011 09:37:11 -0500
Received: from eggs.gnu.org ([140.186.70.92]:49315)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RNmnU-00041I-DH
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 09:37:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RNmnO-0006ae-RI
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 09:37:08 -0500
Received: from oxygen.pond.sub.org ([78.46.104.156]:46458)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1RNmnF-0006WQ-9g; Tue, 08 Nov 2011 09:36:53 -0500
Received: from blackfin.pond.sub.org (p5B32AA7E.dip.t-dialin.net
	[91.50.170.126])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 5A69AA3DE9;
	Tue,  8 Nov 2011 15:36:51 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id BB1456006E; Tue,  8 Nov 2011 15:36:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  8 Nov 2011 15:36:49 +0100
Message-Id: <1320763010-10024-3-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1320763010-10024-1-git-send-email-armbru@redhat.com>
References: <1320763010-10024-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.46.104.156
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 2/3] x86/cpuid: Plug memory leak in
	cpudef_setfield()
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
X-List-Received-Date: Tue, 08 Nov 2011 14:37:10 -0000

To reproduce the leak, put two name options into the same [cpudef]
section of target-x86_64.conf.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 target-i386/cpuid.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/target-i386/cpuid.c b/target-i386/cpuid.c
index 7c8f1be..0fce752 100644
--- a/target-i386/cpuid.c
+++ b/target-i386/cpuid.c
@@ -969,6 +969,7 @@ static int cpudef_setfield(const char *name, const char *str, void *opaque)
     int err = 0;
 
     if (!strcmp(name, "name")) {
+        g_free((void *)def->name);
         def->name = g_strdup(str);
     } else if (!strcmp(name, "model_id")) {
         strncpy(def->model_id, str, sizeof (def->model_id));
-- 
1.7.6.4


