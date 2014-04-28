Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wee3v-0002Zl-A1
	for mharc-qemu-trivial@gnu.org; Mon, 28 Apr 2014 01:25:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wee3p-0002Ke-2r
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:25:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Wee3k-0005JP-L2
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 01:25:00 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:51385)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Wee3V-0005Ft-GX; Mon, 28 Apr 2014 01:24:41 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D14D24303D;
	Mon, 28 Apr 2014 09:24:40 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 720F66AF;
	Mon, 28 Apr 2014 09:08:28 +0400 (MSK)
Received: (nullmailer pid 19161 invoked by uid 1000);
	Mon, 28 Apr 2014 05:08:26 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Mon, 28 Apr 2014 09:08:01 +0400
Message-Id: <1398661684-19059-16-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1398661684-19059-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Kirill Batuzov <batuzovk@ispras.ru>
Subject: [Qemu-trivial] [PULL 15/18] init_paths: fix minor memory leak
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
X-List-Received-Date: Mon, 28 Apr 2014 05:25:05 -0000

From: Kirill Batuzov <batuzovk@ispras.ru>

Fields "name" (created with strdup in new_entry) and "pathname"
(created with g_strdup_printf in new_entry) of pathelem struct should
be freed before the whole struct is.

Signed-off-by: Kirill Batuzov <batuzovk@ispras.ru>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/path.c |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/util/path.c b/util/path.c
index 623219e..5c59d9f 100644
--- a/util/path.c
+++ b/util/path.c
@@ -160,7 +160,9 @@ void init_paths(const char *prefix)
     base = new_entry("", NULL, pref_buf);
     base = add_dir_maybe(base);
     if (base->num_entries == 0) {
-        free (base);
+        g_free(base->pathname);
+        free(base->name);
+        free(base);
         base = NULL;
     } else {
         set_parents(base, base);
-- 
1.7.10.4


