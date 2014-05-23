Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WnwXK-0006D9-Iz
	for mharc-qemu-trivial@gnu.org; Fri, 23 May 2014 16:57:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48537)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WnwXD-000644-UU
	for qemu-trivial@nongnu.org; Fri, 23 May 2014 16:57:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WnwX8-0006rB-Tx
	for qemu-trivial@nongnu.org; Fri, 23 May 2014 16:57:47 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:50619)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WnwWw-0006op-FG; Fri, 23 May 2014 16:57:30 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 5F8A242B94;
	Sat, 24 May 2014 00:57:28 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 451D7644;
	Sat, 24 May 2014 00:57:28 +0400 (MSK)
Received: (nullmailer pid 22211 invoked by uid 1000);
	Fri, 23 May 2014 20:57:28 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat, 24 May 2014 00:57:27 +0400
Message-Id: <1400878647-22176-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>, alevy@redhat.com,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PATCH] libcacard: fix wrong array expansion logic
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
X-List-Received-Date: Fri, 23 May 2014 20:57:53 -0000

The currrent code in libcacard/vcard_emul_nss.c:vcard_emul_options()
has a weird bug in variable usage around expanding opts->vreader
array.

There's a helper variable, vreaderOpt, which is first needlessly
initialized to NULL, next, conditionally, only we have to expand
opts->vreader, receives array expansion from g_renew() (initially
realloc), and next, even if we don't actually perform expansion,
the value of this variable is assigned to the actual array,
opts->vreader, which was supposed to be expanded.

So, since we expand the array by READER_STEP increments, only
once in READER_STEP (=4) the code will work, in other 3/4 times
it will fail badly.

Fix this by not using this temp variable when expanding the
array, and by dropping the useless =NULL initializer too -
if it wasn't in place initially, compiler warned us about
this problem at the beginning.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 libcacard/vcard_emul_nss.c |    9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/libcacard/vcard_emul_nss.c b/libcacard/vcard_emul_nss.c
index b7db51d..8462aef 100644
--- a/libcacard/vcard_emul_nss.c
+++ b/libcacard/vcard_emul_nss.c
@@ -1149,7 +1149,7 @@ vcard_emul_options(const char *args)
             char type_str[100];
             VCardEmulType type;
             int count, i;
-            VirtualReaderOptions *vreaderOpt = NULL;
+            VirtualReaderOptions *vreaderOpt;
 
             args = strip(args + 5);
             if (*args != '(') {
@@ -1173,11 +1173,10 @@ vcard_emul_options(const char *args)
 
             if (opts->vreader_count >= reader_count) {
                 reader_count += READER_STEP;
-                vreaderOpt = g_renew(VirtualReaderOptions, opts->vreader,
-                                     reader_count);
+                opts->vreader = g_renew(VirtualReaderOptions, opts->vreader,
+                                        reader_count);
             }
-            opts->vreader = vreaderOpt;
-            vreaderOpt = &vreaderOpt[opts->vreader_count];
+            vreaderOpt = &opts->vreader[opts->vreader_count];
             vreaderOpt->name = g_strndup(name, name_length);
             vreaderOpt->vname = g_strndup(vname, vname_length);
             vreaderOpt->card_type = type;
-- 
1.7.10.4


