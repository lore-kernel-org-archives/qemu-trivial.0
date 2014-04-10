Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WYNqj-00054U-Pa
	for mharc-qemu-trivial@gnu.org; Thu, 10 Apr 2014 18:53:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36740)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <batuzovk@ispras.ru>) id 1WYFed-0006Ru-2A
	for qemu-trivial@nongnu.org; Thu, 10 Apr 2014 10:08:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <batuzovk@ispras.ru>) id 1WYFeX-0001Q3-06
	for qemu-trivial@nongnu.org; Thu, 10 Apr 2014 10:08:34 -0400
Received: from smtp.ispras.ru ([83.149.199.79]:38844)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <batuzovk@ispras.ru>)
	id 1WYFeK-0001NF-JM; Thu, 10 Apr 2014 10:08:16 -0400
Received: from bulbul.intra.ispras.ru (unknown [83.149.199.91])
	by smtp.ispras.ru (Postfix) with ESMTP id 0E88B224AB;
	Thu, 10 Apr 2014 18:08:12 +0400 (MSK)
From: Kirill Batuzov <batuzovk@ispras.ru>
To: qemu-devel@nongnu.org
Date: Thu, 10 Apr 2014 18:07:57 +0400
Message-Id: <1397138878-11770-1-git-send-email-batuzovk@ispras.ru>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 83.149.199.79
X-Mailman-Approved-At: Thu, 10 Apr 2014 18:53:36 -0400
Cc: qemu-trivial@nongnu.org, Kirill Batuzov <batuzovk@ispras.ru>
Subject: [Qemu-trivial] [PATCH trivial] init_paths: fix minor memory leak
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
X-List-Received-Date: Thu, 10 Apr 2014 14:08:41 -0000

Fields "name" (created with strdup in new_entry) and "pathname"
(created with g_strdup_printf in new_entry) of pathelem struct should
be freed before the whole struct is.

Signed-off-by: Kirill Batuzov <batuzovk@ispras.ru>
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


