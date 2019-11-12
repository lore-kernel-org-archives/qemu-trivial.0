Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iUNDc-0006fo-Cm
	for mharc-qemu-trivial@gnu.org; Mon, 11 Nov 2019 22:51:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45108)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>) id 1iUNDY-0006cd-Sv
 for qemu-trivial@nongnu.org; Mon, 11 Nov 2019 22:51:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>) id 1iUNDX-0003hM-O8
 for qemu-trivial@nongnu.org; Mon, 11 Nov 2019 22:51:48 -0500
Received: from [107.174.27.60] (port=60824 helo=ozlabs.ru)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <aik@ozlabs.ru>)
 id 1iUNDR-0003f0-Oy; Mon, 11 Nov 2019 22:51:42 -0500
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id C5C73AE80382;
 Mon, 11 Nov 2019 22:44:40 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH qemu] scripts: Detect git worktrees for get_maintainer.pl --git
Date: Tue, 12 Nov 2019 14:45:32 +1100
Message-Id: <20191112034532.69079-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 107.174.27.60
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Nov 2019 03:51:50 -0000

Recent git versions support worktrees where .git is not a directory but
a file with a path to the .git repository; however the get_maintainer.pl
script only recognises the .git directory, let's fix it.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 scripts/get_maintainer.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index 71415e3c7061..27991eb1cfb4 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -81,7 +81,7 @@ my %VCS_cmds;
 
 my %VCS_cmds_git = (
     "execute_cmd" => \&git_execute_cmd,
-    "available" => '(which("git") ne "") && (-d ".git")',
+    "available" => '(which("git") ne "") && (-e ".git")',
     "find_signers_cmd" =>
 	"git log --no-color --follow --since=\$email_git_since " .
 	    '--format="GitCommit: %H%n' .
-- 
2.17.1


