Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1s1Km7-0001wQ-Gn
	for mharc-qemu-trivial@gnu.org; Mon, 29 Apr 2024 02:46:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1s1Kls-0001rH-Sl; Mon, 29 Apr 2024 02:45:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1s1Klr-0006Xb-8P; Mon, 29 Apr 2024 02:45:52 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 1F9A662CB4;
 Mon, 29 Apr 2024 09:45:40 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 2AABAC33F7;
 Mon, 29 Apr 2024 09:45:37 +0300 (MSK)
Received: (nullmailer pid 238441 invoked by uid 1000);
 Mon, 29 Apr 2024 06:45:36 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PULL 5/9] scripts/checkpatch: Do not use mailmap
Date: Mon, 29 Apr 2024 09:45:32 +0300
Message-Id: <20240429064536.238392-6-mjt@tls.msk.ru>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240429064536.238392-1-mjt@tls.msk.ru>
References: <20240429064536.238392-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Apr 2024 06:46:00 -0000

From: Philippe Mathieu-Daudé <philmd@linaro.org>

The .mailmap file fixes mistake we already did.
Do not use it when running checkpatch.pl, otherwise
we might commit the very same mistakes.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Michael Tokarev <mjt@tls.msk.ru>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 scripts/checkpatch.pl | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 12e9028b10..76a0b79266 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -435,8 +435,8 @@ if ($chk_branch) {
 	my @patches;
 	my %git_commits = ();
 	my $HASH;
-	open($HASH, "-|", "git", "log", "--reverse", "--no-merges", "--format=%H %s", $ARGV[0]) ||
-		die "$P: git log --reverse --no-merges --format='%H %s' $ARGV[0] failed - $!\n";
+	open($HASH, "-|", "git", "log", "--reverse", "--no-merges", "--no-mailmap", "--format=%H %s", $ARGV[0]) ||
+		die "$P: git log --reverse --no-merges --no-mailmap --format='%H %s' $ARGV[0] failed - $!\n";
 
 	for my $line (<$HASH>) {
 		$line =~ /^([0-9a-fA-F]{40,40}) (.*)$/;
@@ -460,7 +460,7 @@ if ($chk_branch) {
                      "-c", "diff.renamelimit=0",
                      "-c", "diff.renames=True",
                      "-c", "diff.algorithm=histogram",
-                     "show",
+                     "show", "--no-mailmap",
                      "--patch-with-stat", $hash) ||
 			die "$P: git show $hash - $!\n";
 		while (<$FILE>) {
-- 
2.39.2


