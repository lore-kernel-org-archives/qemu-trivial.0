Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U3msK-0001FL-7p
	for mharc-qemu-trivial@gnu.org; Fri, 08 Feb 2013 07:16:16 -0500
Received: from eggs.gnu.org ([208.118.235.92]:33391)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1U3ms5-0000We-Pn
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 07:16:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>) id 1U3ms2-0007CR-Gt
	for qemu-trivial@nongnu.org; Fri, 08 Feb 2013 07:16:01 -0500
Received: from oxygen.pond.sub.org ([2a01:4f8:121:10e4::3]:38999)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@pond.sub.org>)
	id 1U3mrw-00079m-NV; Fri, 08 Feb 2013 07:15:52 -0500
Received: from blackfin.pond.sub.org (p5B32B25A.dip.t-dialin.net
	[91.50.178.90])
	by oxygen.pond.sub.org (Postfix) with ESMTPA id 40B3BA2C77;
	Fri,  8 Feb 2013 13:15:50 +0100 (CET)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 81E15200AD; Fri,  8 Feb 2013 13:15:49 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  8 Feb 2013 13:15:47 +0100
Message-Id: <1360325749-1989-5-git-send-email-armbru@redhat.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <1360325749-1989-1-git-send-email-armbru@redhat.com>
References: <1360325749-1989-1-git-send-email-armbru@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a01:4f8:121:10e4::3
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH for-1.4 4/6] qemu-option: Disable two helpful
	messages that got broken recently
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
X-List-Received-Date: Fri, 08 Feb 2013 12:16:08 -0000

commit 8be7e7e4 and commit ec7b2ccb messed up the ordering of error
message and the helpful explanation that should follow it, like this:

    $ qemu-system-x86_64 --nodefaults -S --vnc :0 --chardev null,id=,
    Identifiers consist of letters, digits, '-', '.', '_', starting with a letter.
    qemu-system-x86_64: -chardev null,id=,: Parameter 'id' expects an identifier

    $ qemu-system-x86_64 --nodefaults -S --vnc :0 --machine kvm_shadow_mem=dunno
    You may use k, M, G or T suffixes for kilobytes, megabytes, gigabytes and terabytes.
    qemu-system-x86_64: -machine kvm_shadow_mem=dunno: Parameter 'kvm_shadow_mem' expects a size

Pity.  Disable them for now.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 util/qemu-option.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/util/qemu-option.c b/util/qemu-option.c
index c12e724..5a1d03c 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -231,8 +231,10 @@ static void parse_option_size(const char *name, const char *value,
             break;
         default:
             error_set(errp, QERR_INVALID_PARAMETER_VALUE, name, "a size");
+#if 0 /* conversion from qerror_report() to error_set() broke this: */
             error_printf_unless_qmp("You may use k, M, G or T suffixes for "
                     "kilobytes, megabytes, gigabytes and terabytes.\n");
+#endif
             return;
         }
     } else {
@@ -771,7 +773,9 @@ QemuOpts *qemu_opts_create(QemuOptsList *list, const char *id,
     if (id) {
         if (!id_wellformed(id)) {
             error_set(errp,QERR_INVALID_PARAMETER_VALUE, "id", "an identifier");
+#if 0 /* conversion from qerror_report() to error_set() broke this: */
             error_printf_unless_qmp("Identifiers consist of letters, digits, '-', '.', '_', starting with a letter.\n");
+#endif
             return NULL;
         }
         opts = qemu_opts_find(list, id);
-- 
1.7.11.7


