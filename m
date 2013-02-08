Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U3msE-0000y1-Mb
	for mharc-qemu-trivial@gnu.org; Fri, 08 Feb 2013 07:16:10 -0500
Received: from eggs.gnu.org ([208.118.235.92]:33380)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1U3ms4-0000TT-Qn
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 07:16:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1U3ms3-0007Cj-9d
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 07:16:00 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:121:10e4::3]:39006)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1U3mrx-0007AV-9M; Fri, 08 Feb 2013 07:15:53 -0500
Received: from blackfin.pond.sub.org (p5B32B25A.dip.t-dialin.net
	[91.50.178.90])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 8B2DEA2C87;
	Fri,  8 Feb 2013 13:15:51 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id A2858200AF; Fri,  8 Feb 2013 13:15:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  8 Feb 2013 13:15:49 +0100
Message-Id: <1360325749-1989-7-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1360325749-1989-1-git-send-email-armbru@redhat.com>
References: <1360325749-1989-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:121:10e4::3
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH for-1.4 6/6] vl: Exit unsuccessfully on
	option argument syntax error
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

We exit successfully after reporting syntax error for argument of
--sandbox and --add-fd.

We continue undaunted after reporting it for argument of --option-rom
and --object then.

Change all four to exit unsuccessfully, like the other options.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 vl.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/vl.c b/vl.c
index 73122d8..4245ccc 100644
--- a/vl.c
+++ b/vl.c
@@ -3623,6 +3623,9 @@ int main(int argc, char **argv, char **envp)
 		    exit(1);
 		}
                 opts = qemu_opts_parse(qemu_find_opts("option-rom"), optarg, 1);
+                if (!opts) {
+                    exit(1);
+                }
                 option_rom[nb_option_roms].name = qemu_opt_get(opts, "romfile");
                 option_rom[nb_option_roms].bootindex =
                     qemu_opt_get_number(opts, "bootindex", -1);
@@ -3780,14 +3783,14 @@ int main(int argc, char **argv, char **envp)
             case QEMU_OPTION_sandbox:
                 opts = qemu_opts_parse(qemu_find_opts("sandbox"), optarg, 1);
                 if (!opts) {
-                    exit(0);
+                    exit(1);
                 }
                 break;
             case QEMU_OPTION_add_fd:
 #ifndef _WIN32
                 opts = qemu_opts_parse(qemu_find_opts("add-fd"), optarg, 0);
                 if (!opts) {
-                    exit(0);
+                    exit(1);
                 }
 #else
                 error_report("File descriptor passing is disabled on this "
@@ -3797,6 +3800,9 @@ int main(int argc, char **argv, char **envp)
                 break;
             case QEMU_OPTION_object:
                 opts = qemu_opts_parse(qemu_find_opts("object"), optarg, 1);
+                if (!opts) {
+                    exit(1);
+                }
                 break;
             default:
                 os_parse_cmd_args(popt->index, optarg);
-- 
1.7.11.7


