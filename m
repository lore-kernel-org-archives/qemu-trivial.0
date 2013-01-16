Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TvUJc-0001UP-G2
	for mharc-qemu-trivial@gnu.org; Wed, 16 Jan 2013 09:50:08 -0500
Received: from eggs.gnu.org ([208.118.235.92]:45016)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TvUJa-0001SE-9p
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 09:50:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1TvU6t-0002CN-Mf
	for qemu-trivial@nongnu.org; Wed, 16 Jan 2013 09:37:08 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:121:10e4::3]:41692)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1TvU6b-00025F-UC; Wed, 16 Jan 2013 09:36:42 -0500
Received: from blackfin.pond.sub.org (p5B32B5E9.dip.t-dialin.net
	[91.50.181.233])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id BF318A247E;
	Wed, 16 Jan 2013 15:36:39 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id F3C35200B1; Wed, 16 Jan 2013 15:36:38 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 16 Jan 2013 15:36:36 +0100
Message-Id: <1358346998-26328-10-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1358346998-26328-1-git-send-email-armbru@redhat.com>
References: <1358346998-26328-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:121:10e4::3
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 09/11] libcacard: Fix unchecked strdup() by
	converting to g_strdup()
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
X-List-Received-Date: Wed, 16 Jan 2013 14:50:07 -0000

Note that we already free with g_free().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 libcacard/vcard_emul_nss.c | 4 ++--
 libcacard/vreader.c        | 2 +-
 libcacard/vscclient.c      | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/libcacard/vcard_emul_nss.c b/libcacard/vcard_emul_nss.c
index 5f565e0..df79476 100644
--- a/libcacard/vcard_emul_nss.c
+++ b/libcacard/vcard_emul_nss.c
@@ -454,7 +454,7 @@ vreader_emul_new(PK11SlotInfo *slot, VCardEmulType type, const char *params)
 
     new_reader_emul->slot = PK11_ReferenceSlot(slot);
     new_reader_emul->default_type = type;
-    new_reader_emul->type_params = strdup(params);
+    new_reader_emul->type_params = g_strdup(params);
     new_reader_emul->present = PR_FALSE;
     new_reader_emul->series = 0;
     new_reader_emul->saved_vcard = NULL;
@@ -997,7 +997,7 @@ vcard_emul_init(const VCardEmulOptions *options)
     /* We should control this with options. For now we mirror out any
      * removable hardware slot */
     default_card_type = options->hw_card_type;
-    default_type_params = strdup(options->hw_type_params);
+    default_type_params = g_strdup(options->hw_type_params);
 
     SECMOD_GetReadLock(module_lock);
     for (mlp = module_list; mlp; mlp = mlp->next) {
diff --git a/libcacard/vreader.c b/libcacard/vreader.c
index 313349b..f3efc27 100644
--- a/libcacard/vreader.c
+++ b/libcacard/vreader.c
@@ -49,7 +49,7 @@ vreader_new(const char *name, VReaderEmul *private,
     reader = (VReader *)g_malloc(sizeof(VReader));
     qemu_mutex_init(&reader->lock);
     reader->reference_count = 1;
-    reader->name = name ? strdup(name) : NULL;
+    reader->name = g_strdup(name);
     reader->card = NULL;
     reader->id = (vreader_id_t)-1;
     reader->reader_private = private;
diff --git a/libcacard/vscclient.c b/libcacard/vscclient.c
index 2fce52b..9b744f2 100644
--- a/libcacard/vscclient.c
+++ b/libcacard/vscclient.c
@@ -503,8 +503,8 @@ main(
         command_line_options = vcard_emul_options(emul_args);
     }
 
-    qemu_host = strdup(argv[argc - 2]);
-    qemu_port = strdup(argv[argc - 1]);
+    qemu_host = g_strdup(argv[argc - 2]);
+    qemu_port = g_strdup(argv[argc - 1]);
     sock = connect_to_qemu(qemu_host, qemu_port);
     if (sock == -1) {
         fprintf(stderr, "error opening socket, exiting.\n");
-- 
1.7.11.7


