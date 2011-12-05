Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RXhhZ-0000EO-Pe
	for mharc-qemu-trivial@gnu.org; Mon, 05 Dec 2011 18:12:01 -0500
Received: from eggs.gnu.org ([140.186.70.92]:58612)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1RXhhW-0008UE-M9
	for qemu-trivial@nongnu.org; Mon, 05 Dec 2011 18:11:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1RXhhV-0001LC-N8
	for qemu-trivial@nongnu.org; Mon, 05 Dec 2011 18:11:58 -0500
Received: from mnementh.archaic.org.uk ([81.2.115.146]:44924)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1RXhhT-0001Kw-A0; Mon, 05 Dec 2011 18:11:55 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1RXhhO-0000ab-0j; Mon, 05 Dec 2011 23:11:50 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon,  5 Dec 2011 23:11:50 +0000
Message-Id: <1323126710-2242-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	Alexander Graf <agraf@suse.de>, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] linux-user/syscall.c: Don't skip stracing
	for fcntl64 failure case
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
X-List-Received-Date: Mon, 05 Dec 2011 23:11:59 -0000

In an fcntl64 failure path, we were returning directly rather than
simply breaking out of the switch statement. This skips the strace
code for printing the syscall return value, so don't do that.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Alex Graf spotted this one...

 linux-user/syscall.c |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index f227097..4846b41 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7521,8 +7521,10 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
 #endif
 
 	cmd = target_to_host_fcntl_cmd(arg2);
-	if (cmd == -TARGET_EINVAL)
-		return cmd;
+        if (cmd == -TARGET_EINVAL) {
+            ret = cmd;
+            break;
+        }
 
         switch(arg2) {
         case TARGET_F_GETLK64:
-- 
1.7.5.4


