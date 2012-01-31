Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RsC89-0006VQ-HG
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jan 2012 06:44:09 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54896)
	by lists.gnu.org with esmtp (Exim 4.71) (envelope-from <uli@suse.de>)
	id 1RsC83-0006UT-ML
	for qemu-trivial@nongnu.org; Tue, 31 Jan 2012 06:44:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <uli@suse.de>) id 1RsC7y-0005rD-3z
	for qemu-trivial@nongnu.org; Tue, 31 Jan 2012 06:44:03 -0500
Received: from cantor2.suse.de ([195.135.220.15]:38004 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71) (envelope-from <uli@suse.de>)
	id 1RsC7q-0005lD-JR; Tue, 31 Jan 2012 06:43:50 -0500
Received: from relay1.suse.de (unknown [195.135.220.254])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx2.suse.de (Postfix) with ESMTP id E85C08FC92;
	Tue, 31 Jan 2012 12:43:47 +0100 (CET)
From: Ulrich Hecht <uli@suse.de>
To: qemu-devel@nongnu.org
Date: Tue, 31 Jan 2012 12:43:16 +0100
Message-Id: <1328010196-32134-1-git-send-email-uli@suse.de>
X-Mailer: git-send-email 1.7.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, Ulrich Hecht <uli@suse.de>
Subject: [Qemu-trivial] [PATCH] linux-user: fail execve() if env/args too big
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
X-List-Received-Date: Tue, 31 Jan 2012 11:44:08 -0000

If the host's page size is equal to or smaller than the target's, native
execve() will fail appropriately with E2BIG if called with too big an
environment for the target to handle. It may falsely succeed, however, if
the host's page size is bigger, and feed the executed target process an
environment that is too big for it to handle, at which point QEMU barfs and
exits, confusing procmail's autoconf script and causing the build to fail.

This patch makes sure that execve() will return E2BIG if the environment is
too large for the target.

Signed-off-by: Ulrich Hecht <uli@suse.de>
---
 linux-user/syscall.c |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 2bf9e7e..fba3f29 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -4797,6 +4797,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
             abi_ulong guest_envp;
             abi_ulong addr;
             char **q;
+            int total_size = 0;
 
             argc = 0;
             guest_argp = arg2;
@@ -4828,6 +4829,7 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
                     break;
                 if (!(*q = lock_user_string(addr)))
                     goto execve_efault;
+                total_size += strlen(*q) + 1;
             }
             *q = NULL;
 
@@ -4839,9 +4841,16 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
                     break;
                 if (!(*q = lock_user_string(addr)))
                     goto execve_efault;
+                total_size += strlen(*q) + 1;
             }
             *q = NULL;
 
+            /* This case will not be caught by the host's execve() if its
+               page size is bigger than the target's. */
+            if (total_size > MAX_ARG_PAGES * TARGET_PAGE_SIZE) {
+                ret = -TARGET_E2BIG;
+                goto execve_end;
+            }
             if (!(p = lock_user_string(arg1)))
                 goto execve_efault;
             ret = get_errno(execve(p, argp, envp));
-- 
1.7.1


