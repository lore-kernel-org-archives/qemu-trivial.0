Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U3msF-000108-92
	for mharc-qemu-trivial@gnu.org; Fri, 08 Feb 2013 07:16:11 -0500
Received: from eggs.gnu.org ([208.118.235.92]:33387)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1U3ms5-0000Uv-5V
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 07:16:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1U3ms2-0007Ca-Rl
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 07:16:01 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:121:10e4::3]:39007)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1U3mrx-0007AU-92; Fri, 08 Feb 2013 07:15:53 -0500
Received: from blackfin.pond.sub.org (p5B32B25A.dip.t-dialin.net
	[91.50.178.90])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 92C74A3E6F;
	Fri,  8 Feb 2013 13:15:51 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 907BB200AE; Fri,  8 Feb 2013 13:15:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  8 Feb 2013 13:15:48 +0100
Message-Id: <1360325749-1989-6-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1360325749-1989-1-git-send-email-armbru@redhat.com>
References: <1360325749-1989-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:121:10e4::3
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH for-1.4 5/6] vl: Drop redundant "parse error"
	reports
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
X-List-Received-Date: Fri, 08 Feb 2013 12:16:04 -0000

qemu_opts_parse() reports the error already, and in a much more useful
way.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 vl.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/vl.c b/vl.c
index a8dc73d..73122d8 100644
--- a/vl.c
+++ b/vl.c
@@ -3334,7 +3334,6 @@ int main(int argc, char **argv, char **envp)
                 }
                 opts = qemu_opts_parse(olist, optarg, 1);
                 if (!opts) {
-                    fprintf(stderr, "parse error: %s\n", optarg);
                     exit(1);
                 }
                 break;
@@ -3350,7 +3349,6 @@ int main(int argc, char **argv, char **envp)
                 }
                 opts = qemu_opts_parse(olist, optarg, 1);
                 if (!opts) {
-                    fprintf(stderr, "parse error: %s\n", optarg);
                     exit(1);
                 }
 
@@ -3521,7 +3519,6 @@ int main(int argc, char **argv, char **envp)
                 olist = qemu_find_opts("machine");
                 opts = qemu_opts_parse(olist, optarg, 1);
                 if (!opts) {
-                    fprintf(stderr, "parse error: %s\n", optarg);
                     exit(1);
                 }
                 optarg = qemu_opt_get(opts, "type");
@@ -3755,7 +3752,6 @@ int main(int argc, char **argv, char **envp)
                 }
                 opts = qemu_opts_parse(olist, optarg, 0);
                 if (!opts) {
-                    fprintf(stderr, "parse error: %s\n", optarg);
                     exit(1);
                 }
                 break;
-- 
1.7.11.7


