Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkI0x-0002qB-Bq
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 16:42:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkHwn-0002S2-Px
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 16:37:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkF41-00023y-1x
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 13:34:15 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:43752)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZkF2k-0007G4-Ou; Thu, 08 Oct 2015 13:31:51 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 49F9240A55;
	Thu,  8 Oct 2015 20:31:49 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id E9E0DAA3;
	Thu,  8 Oct 2015 19:52:32 +0300 (MSK)
Received: (nullmailer pid 12011 invoked by uid 1000);
	Thu, 08 Oct 2015 16:52:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu,  8 Oct 2015 19:52:26 +0300
Message-Id: <c78d65e8a7d87badf46eda3a0b41330f5d239132.1444323071.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
References: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 17/19] linux-user: Use g_new() & friends where
	that makes obvious sense
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
X-List-Received-Date: Thu, 08 Oct 2015 20:38:04 -0000

From: Markus Armbruster <armbru@redhat.com>

g_new(T, n) is neater than g_malloc(sizeof(T) * n).  It's also safer,
for two reasons.  One, it catches multiplication overflowing size_t.
Two, it returns T * rather than void *, which lets the compiler catch
more type errors.

This commit only touches allocations with size arguments of the form
sizeof(T).  Same Coccinelle semantic patch as in commit b45c03f.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/elfload.c | 2 +-
 linux-user/main.c    | 2 +-
 linux-user/syscall.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index fdae6a6..d68f5a1 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2853,7 +2853,7 @@ static int fill_note_info(struct elf_note_info *info,
     TaskState *ts = (TaskState *)cpu->opaque;
     int i;
 
-    info->notes = g_malloc0(NUMNOTES * sizeof (struct memelfnote));
+    info->notes = g_new0(struct memelfnote, NUMNOTES);
     if (info->notes == NULL)
         return (-ENOMEM);
     info->prstatus = g_malloc0(sizeof (*info->prstatus));
diff --git a/linux-user/main.c b/linux-user/main.c
index d6af7ca..8acfe0f 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -4270,7 +4270,7 @@ int main(int argc, char **argv, char **envp)
     }
     target_argv[target_argc] = NULL;
 
-    ts = g_malloc0 (sizeof(TaskState));
+    ts = g_new0(TaskState, 1);
     init_task_state(ts);
     /* build Task State */
     ts->info = info;
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 98b5766..b8ce208 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -4566,7 +4566,7 @@ static int do_fork(CPUArchState *env, unsigned int flags, abi_ulong newsp,
         new_thread_info info;
         pthread_attr_t attr;
 
-        ts = g_malloc0(sizeof(TaskState));
+        ts = g_new0(TaskState, 1);
         init_task_state(ts);
         /* we create a new CPU instance. */
         new_env = cpu_copy(env);
-- 
2.1.4


