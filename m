Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VRRhU-0008Aj-5y
	for mharc-qemu-trivial@gnu.org; Wed, 02 Oct 2013 15:03:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50996)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VRRhM-0007z3-P1
	for qemu-trivial@nongnu.org; Wed, 02 Oct 2013 15:03:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VRRhG-00057Z-QV
	for qemu-trivial@nongnu.org; Wed, 02 Oct 2013 15:03:00 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:55564)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VRRh3-00056I-VF; Wed, 02 Oct 2013 15:02:42 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 63823405F1;
	Wed,  2 Oct 2013 23:02:40 +0400 (MSK)
Message-ID: <524C6DD0.9070605@msgid.tls.msk.ru>
Date: Wed, 02 Oct 2013 23:02:40 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1380469272-19230-1-git-send-email-sw@weilnetz.de>	<52488A00.6000405@msgid.tls.msk.ru>
	<52488E98.3060505@weilnetz.de>
	<871u46iq96.fsf@blackfin.pond.sub.org>
	<5249E4CD.1050605@weilnetz.de>
In-Reply-To: <5249E4CD.1050605@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] migration: Fix compiler
 warning ('caps' may be used uninitialized)
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
X-List-Received-Date: Wed, 02 Oct 2013 19:03:06 -0000

How about this:

diff --git a/migration.c b/migration.c
index b4f8462..6066ab4 100644
--- a/migration.c
+++ b/migration.c
@@ -146,22 +146,16 @@ uint64_t migrate_max_downtime(void)
  MigrationCapabilityStatusList *qmp_query_migrate_capabilities(Error **errp)
  {
      MigrationCapabilityStatusList *head = NULL;
-    MigrationCapabilityStatusList *caps;
+    MigrationCapabilityStatusList **capp = &head;
      MigrationState *s = migrate_get_current();
      int i;

      for (i = 0; i < MIGRATION_CAPABILITY_MAX; i++) {
-        if (head == NULL) {
-            head = g_malloc0(sizeof(*caps));
-            caps = head;
-        } else {
-            caps->next = g_malloc0(sizeof(*caps));
-            caps = caps->next;
-        }
-        caps->value =
-            g_malloc(sizeof(*caps->value));
-        caps->value->capability = i;
-        caps->value->state = s->enabled_capabilities[i];
+        *capp = g_malloc0(sizeof(*head));
+        (*capp)->value = g_malloc(sizeof(*head->value));
+        (*capp)->value->capability = i;
+        (*capp)->value->state = s->enabled_capabilities[i];
+       capp = &(*capp)->next;
      }

      return head;


This is what I had in mind at the very beginnig, but only now tried
to make a patch...

Thanks,

/mjt
Thanks,

