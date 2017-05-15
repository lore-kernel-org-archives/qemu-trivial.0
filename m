Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dAM58-0007fS-UI
	for mharc-qemu-trivial@gnu.org; Mon, 15 May 2017 15:55:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dAM56-0007dG-AE
	for qemu-trivial@nongnu.org; Mon, 15 May 2017 15:55:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dAM55-0002GS-Cz
	for qemu-trivial@nongnu.org; Mon, 15 May 2017 15:55:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54690)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dAM4x-0002Bo-1a; Mon, 15 May 2017 15:54:51 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BF16820B1C;
	Mon, 15 May 2017 19:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com BF16820B1C
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com BF16820B1C
Received: from red.redhat.com (ovpn-123-244.rdu2.redhat.com [10.10.123.244])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9702E189A4;
	Mon, 15 May 2017 19:54:46 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, famz@redhat.com, armbru@redhat.com,
	qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>
Date: Mon, 15 May 2017 14:54:39 -0500
Message-Id: <20170515195439.17677-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 15 May 2017 19:54:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] block: Use QDict helpers for --force-share
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
X-List-Received-Date: Mon, 15 May 2017 19:55:01 -0000

Fam's addition of --force-share in commits 459571f7 and 335e9937
were developed prior to the addition of QDict scalar insertion
macros, but merged after the general cleanup in commit 46f5ac20.
Patch created mechanically by rerunning:

 spatch --sp-file scripts/coccinelle/qobject.cocci \
        --macro-file scripts/cocci-macro-file.h --dir . --in-place

Signed-off-by: Eric Blake <eblake@redhat.com>
---

This could go in through Markus' qapi tree (since he took the
original cleanup), a block maintainer (since it only touches block
files), or even the trivial patch queue (since it's so small and
mechanical) - I don't care which, as long as we don't drop it!

 qemu-img.c | 7 +++----
 qemu-io.c  | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index b506839..60f1784 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -296,7 +296,7 @@ static BlockBackend *img_open_opts(const char *optstr,
             error_report("--force-share/-U conflicts with image options");
             return NULL;
         }
-        qdict_put(options, BDRV_OPT_FORCE_SHARE, qbool_from_bool(true));
+        qdict_put_bool(options, BDRV_OPT_FORCE_SHARE, true);
     }
     blk = blk_new_open(NULL, NULL, options, flags, &local_err);
     if (!blk) {
@@ -326,7 +326,7 @@ static BlockBackend *img_open_file(const char *filename,
     }

     if (force_share) {
-        qdict_put(options, BDRV_OPT_FORCE_SHARE, qbool_from_bool(true));
+        qdict_put_bool(options, BDRV_OPT_FORCE_SHARE, true);
     }
     blk = blk_new_open(filename, NULL, options, flags, &local_err);
     if (!blk) {
@@ -3156,8 +3156,7 @@ static int img_rebase(int argc, char **argv)
             if (!options) {
                 options = qdict_new();
             }
-            qdict_put(options, BDRV_OPT_FORCE_SHARE,
-                      qbool_from_bool(true));
+            qdict_put_bool(options, BDRV_OPT_FORCE_SHARE, true);
         }
         bdrv_get_backing_filename(bs, backing_name, sizeof(backing_name));
         blk_old_backing = blk_new_open(backing_name, NULL,
diff --git a/qemu-io.c b/qemu-io.c
index 34fa8a1..8e38b28 100644
--- a/qemu-io.c
+++ b/qemu-io.c
@@ -76,7 +76,7 @@ static int openfile(char *name, int flags, bool writethrough, bool force_share,
             QDECREF(opts);
             return 1;
         }
-        qdict_put(opts, BDRV_OPT_FORCE_SHARE, qbool_from_bool(true));
+        qdict_put_bool(opts, BDRV_OPT_FORCE_SHARE, true);
     }
     qemuio_blk = blk_new_open(name, NULL, opts, flags, &local_err);
     if (!qemuio_blk) {
-- 
2.9.4


