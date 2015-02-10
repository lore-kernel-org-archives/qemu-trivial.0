Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL7mu-0005Ys-Dc
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 05:11:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47408)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL7mo-0005Oj-3C
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 05:11:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL7mj-0003uN-2E
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 05:11:18 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:57809)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL7ma-0003pq-M8; Tue, 10 Feb 2015 05:11:04 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 56273418A7;
	Tue, 10 Feb 2015 13:11:03 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2559294C;
	Tue, 10 Feb 2015 09:34:46 +0300 (MSK)
Received: (nullmailer pid 9379 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:34:12 +0300
Message-Id: <c0462f6d75fa481f7660c15a5ca3a60205aa4eca.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 23/46] qemu-option: Pair g_malloc() with
	g_free(), not free()
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
X-List-Received-Date: Tue, 10 Feb 2015 10:11:22 -0000

From: Markus Armbruster <armbru@redhat.com>

Spotted by Coverity with preview checker ALLOC_FREE_MISMATCH enabled
and my "coverity: Model g_free() isn't necessarily free()" model patch
applied.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Gonglei <arei.gonglei@huawei.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 util/qemu-option.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/util/qemu-option.c b/util/qemu-option.c
index c779150..d3ab65d 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -230,7 +230,7 @@ bool has_help_option(const char *param)
     }
 
 out:
-    free(buf);
+    g_free(buf);
     return result;
 }
 
@@ -255,7 +255,7 @@ bool is_valid_option_list(const char *param)
     }
 
 out:
-    free(buf);
+    g_free(buf);
     return result;
 }
 
-- 
2.1.4


