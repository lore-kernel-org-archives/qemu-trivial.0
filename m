Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNmnT-0003x6-8k
	for mharc-qemu-trivial@gnu.org; Tue, 08 Nov 2011 09:37:07 -0500
Received: from eggs.gnu.org ([140.186.70.92]:49218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RNmnK-0003QB-ER
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 09:37:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RNmnI-0006YZ-BM
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 09:36:58 -0500
Received: from oxygen.pond.sub.org ([78.46.104.156]:46459)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1RNmnF-0006WR-9e; Tue, 08 Nov 2011 09:36:53 -0500
Received: from blackfin.pond.sub.org (p5B32AA7E.dip.t-dialin.net
	[91.50.170.126])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 66C25A4111;
	Tue,  8 Nov 2011 15:36:51 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id D51FA60069; Tue,  8 Nov 2011 15:36:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  8 Nov 2011 15:36:50 +0100
Message-Id: <1320763010-10024-4-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1320763010-10024-1-git-send-email-armbru@redhat.com>
References: <1320763010-10024-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.46.104.156
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 3/3] x86/cpuid: Fix crash on -cpu ""
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
X-List-Received-Date: Tue, 08 Nov 2011 14:37:04 -0000

Spotted by Coverity.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 target-i386/cpuid.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target-i386/cpuid.c b/target-i386/cpuid.c
index 0fce752..9fc9769 100644
--- a/target-i386/cpuid.c
+++ b/target-i386/cpuid.c
@@ -613,9 +613,9 @@ static int cpu_x86_find_by_name(x86_def_t *x86_cpu_def, const char *cpu_model)
     uint32_t numvalue;
 
     for (def = x86_defs; def; def = def->next)
-        if (!strcmp(name, def->name))
+        if (name && !strcmp(name, def->name))
             break;
-    if (kvm_enabled() && strcmp(name, "host") == 0) {
+    if (kvm_enabled() && name && strcmp(name, "host") == 0) {
         cpu_x86_fill_host(x86_cpu_def);
     } else if (!def) {
         goto error;
-- 
1.7.6.4


