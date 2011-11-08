Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RNmnZ-0004Ml-LV
	for mharc-qemu-trivial@gnu.org; Tue, 08 Nov 2011 09:37:13 -0500
Received: from eggs.gnu.org ([140.186.70.92]:49294)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RNmnR-0003oC-0f
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 09:37:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1RNmnQ-0006b3-4F
	for qemu-trivial@nongnu.org; Tue, 08 Nov 2011 09:37:04 -0500
Received: from oxygen.pond.sub.org ([78.46.104.156]:46457)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1RNmnF-0006WP-9l; Tue, 08 Nov 2011 09:36:53 -0500
Received: from blackfin.pond.sub.org (p5B32AA7E.dip.t-dialin.net
	[91.50.170.126])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 3D4E3A246E;
	Tue,  8 Nov 2011 15:36:51 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 500)
	id AC5476006F; Tue,  8 Nov 2011 15:36:50 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  8 Nov 2011 15:36:48 +0100
Message-Id: <1320763010-10024-2-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1320763010-10024-1-git-send-email-armbru@redhat.com>
References: <1320763010-10024-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 78.46.104.156
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 1/3] x86/cpuid: Convert remaining strdup() to
	g_strdup()
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
X-List-Received-Date: Tue, 08 Nov 2011 14:37:11 -0000

Fixes missing error checking.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 target-i386/cpuid.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target-i386/cpuid.c b/target-i386/cpuid.c
index 1e8bcff..7c8f1be 100644
--- a/target-i386/cpuid.c
+++ b/target-i386/cpuid.c
@@ -600,7 +600,7 @@ static int cpu_x86_find_by_name(x86_def_t *x86_cpu_def, const char *cpu_model)
     unsigned int i;
     x86_def_t *def;
 
-    char *s = strdup(cpu_model);
+    char *s = g_strdup(cpu_model);
     char *featurestr, *name = strtok(s, ",");
     /* Features to be added*/
     uint32_t plus_features = 0, plus_ext_features = 0;
@@ -746,11 +746,11 @@ static int cpu_x86_find_by_name(x86_def_t *x86_cpu_def, const char *cpu_model)
         if (check_features_against_host(x86_cpu_def) && enforce_cpuid)
             goto error;
     }
-    free(s);
+    g_free(s);
     return 0;
 
 error:
-    free(s);
+    g_free(s);
     return -1;
 }
 
@@ -969,7 +969,7 @@ static int cpudef_setfield(const char *name, const char *str, void *opaque)
     int err = 0;
 
     if (!strcmp(name, "name")) {
-        def->name = strdup(str);
+        def->name = g_strdup(str);
     } else if (!strcmp(name, "model_id")) {
         strncpy(def->model_id, str, sizeof (def->model_id));
     } else if (!strcmp(name, "level")) {
-- 
1.7.6.4


