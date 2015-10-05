Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zk5G6-0005Lg-KW
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2015 03:04:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45310)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1Zj3ZE-0000MR-Mo
	for qemu-trivial@nongnu.org; Mon, 05 Oct 2015 07:04:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1Zj3ZD-0000WG-II
	for qemu-trivial@nongnu.org; Mon, 05 Oct 2015 07:04:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60240)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1Zj3Z9-0000T9-8l; Mon, 05 Oct 2015 07:04:23 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id B45878EA27;
	Mon,  5 Oct 2015 11:04:22 +0000 (UTC)
Received: from dgilbert-t530.redhat.com (ovpn-116-104.ams2.redhat.com
	[10.36.116.104])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t95B4LxB021468; Mon, 5 Oct 2015 07:04:21 -0400
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 Oct 2015 12:04:20 +0100
Message-Id: <1444043060-22835-1-git-send-email-dgilbert@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, afaerber@suse.de
Subject: [Qemu-trivial] [PATCH] tests: Unique test path for
	/string-visitor/output
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
X-List-Received-Date: Mon, 05 Oct 2015 11:04:29 -0000

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Newer GLib's want unique test paths, and thus moan at dupes.
(Seen on Fedora 23 which has glib 2.46)

Uniqueify the paths.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tests/test-string-output-visitor.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/test-string-output-visitor.c b/tests/test-string-output-visitor.c
index 101fb27..fd5e67b 100644
--- a/tests/test-string-output-visitor.c
+++ b/tests/test-string-output-visitor.c
@@ -248,39 +248,39 @@ int main(int argc, char **argv)
 
     output_visitor_test_add("/string-visitor/output/int",
                             &out_visitor_data, test_visitor_out_int, false);
-    output_visitor_test_add("/string-visitor/output/int",
+    output_visitor_test_add("/string-visitor/output/int-human",
                             &out_visitor_data, test_visitor_out_int, true);
     output_visitor_test_add("/string-visitor/output/bool",
                             &out_visitor_data, test_visitor_out_bool, false);
-    output_visitor_test_add("/string-visitor/output/bool",
+    output_visitor_test_add("/string-visitor/output/bool-human",
                             &out_visitor_data, test_visitor_out_bool, true);
     output_visitor_test_add("/string-visitor/output/number",
                             &out_visitor_data, test_visitor_out_number, false);
-    output_visitor_test_add("/string-visitor/output/number",
+    output_visitor_test_add("/string-visitor/output/number-human",
                             &out_visitor_data, test_visitor_out_number, true);
     output_visitor_test_add("/string-visitor/output/string",
                             &out_visitor_data, test_visitor_out_string, false);
-    output_visitor_test_add("/string-visitor/output/string",
+    output_visitor_test_add("/string-visitor/output/string-human",
                             &out_visitor_data, test_visitor_out_string, true);
     output_visitor_test_add("/string-visitor/output/no-string",
                             &out_visitor_data, test_visitor_out_no_string,
                             false);
-    output_visitor_test_add("/string-visitor/output/no-string",
+    output_visitor_test_add("/string-visitor/output/no-string-human",
                             &out_visitor_data, test_visitor_out_no_string,
                             true);
     output_visitor_test_add("/string-visitor/output/enum",
                             &out_visitor_data, test_visitor_out_enum, false);
-    output_visitor_test_add("/string-visitor/output/enum",
+    output_visitor_test_add("/string-visitor/output/enum-human",
                             &out_visitor_data, test_visitor_out_enum, true);
     output_visitor_test_add("/string-visitor/output/enum-errors",
                             &out_visitor_data, test_visitor_out_enum_errors,
                             false);
-    output_visitor_test_add("/string-visitor/output/enum-errors",
+    output_visitor_test_add("/string-visitor/output/enum-errors-human",
                             &out_visitor_data, test_visitor_out_enum_errors,
                             true);
     output_visitor_test_add("/string-visitor/output/intList",
                             &out_visitor_data, test_visitor_out_intList, false);
-    output_visitor_test_add("/string-visitor/output/intList",
+    output_visitor_test_add("/string-visitor/output/intList-human",
                             &out_visitor_data, test_visitor_out_intList, true);
 
     g_test_run();
-- 
2.5.0


