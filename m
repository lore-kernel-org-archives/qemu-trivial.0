Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZkiOQ-0005EF-EQ
	for mharc-qemu-trivial@gnu.org; Fri, 09 Oct 2015 20:52:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52156)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkEbv-0006Ir-RN
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 13:05:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZkEal-0004j3-4g
	for qemu-trivial@nongnu.org; Thu, 08 Oct 2015 13:04:05 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:57999)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZkEZn-0002rH-RC; Thu, 08 Oct 2015 13:02:00 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 96B0740A5F;
	Thu,  8 Oct 2015 20:01:49 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 9EEBEA99;
	Thu,  8 Oct 2015 19:52:32 +0300 (MSK)
Received: (nullmailer pid 12015 invoked by uid 1000);
	Thu, 08 Oct 2015 16:52:30 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu,  8 Oct 2015 19:52:28 +0300
Message-Id: <deb847bfba7ee0ab8151842f5e9cb12d4daad3a3.1444323071.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
References: <cover.1444323071.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: [Qemu-trivial] [PULL 19/19] tests: Unique test path for
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
X-List-Received-Date: Thu, 08 Oct 2015 17:23:01 -0000

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Newer GLib's want unique test paths, and thus moan at dupes.
(Seen on Fedora 23 which has glib 2.46)

Uniquify the paths.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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
2.1.4


