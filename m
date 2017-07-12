Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVHyT-0006p2-VX
	for mharc-qemu-trivial@gnu.org; Wed, 12 Jul 2017 09:46:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35771)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dVHyR-0006mP-Hg
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 09:46:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dVHyQ-0003T7-S3
	for qemu-trivial@nongnu.org; Wed, 12 Jul 2017 09:46:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:47379)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dVHyL-0003Nx-4E; Wed, 12 Jul 2017 09:46:33 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4585040F69;
	Wed, 12 Jul 2017 16:46:31 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 02A6FACD;
	Wed, 12 Jul 2017 16:38:14 +0300 (MSK)
Received: (nullmailer pid 29055 invoked by uid 1000);
	Wed, 12 Jul 2017 13:38:12 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Wed, 12 Jul 2017 16:38:08 +0300
Message-Id: <9f98da52e8bf0515d204861bbef2bf4d5abb618f.1499866676.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
References: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
References: <cover.1499866676.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 12/13] qobject: Catch another straggler for
 use of qdict_put_str()
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
X-List-Received-Date: Wed, 12 Jul 2017 13:46:41 -0000

From: Eric Blake <eblake@redhat.com>

Dan's addition of key-secret improvements in commit 29cf9336 was
developed prior to the addition of QDict scalar insertion macros,
but merged after the general cleanup in commit 46f5ac20.
Patch created mechanically by rerunning:
  spatch --sp-file scripts/coccinelle/qobject.cocci \
         --macro-file scripts/cocci-macro-file.h --dir . --in-place

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-img.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-img.c b/qemu-img.c
index f7ffb79db6..02900ce1d1 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -355,7 +355,7 @@ static int img_add_key_secrets(void *opaque,
     QDict *options = opaque;
 
     if (g_str_has_suffix(name, "key-secret")) {
-        qdict_put(options, name, qstring_from_str(value));
+        qdict_put_str(options, name, value);
     }
 
     return 0;
-- 
2.11.0


