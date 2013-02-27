Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UAUwt-000204-8D
	for mharc-qemu-trivial@gnu.org; Tue, 26 Feb 2013 19:32:43 -0500
Received: from eggs.gnu.org ([208.118.235.92]:50982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1UAUwn-0001kV-1z
	for qemu-trivial@nongnu.org; Tue, 26 Feb 2013 19:32:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crobinso@redhat.com>) id 1UAUwi-00021s-FO
	for qemu-trivial@nongnu.org; Tue, 26 Feb 2013 19:32:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:9928)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crobinso@redhat.com>)
	id 1UAUwe-0001y3-Rl; Tue, 26 Feb 2013 19:32:29 -0500
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r1R0WQ11013431
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 26 Feb 2013 19:32:26 -0500
Received: from colepc.redhat.com (ovpn-113-128.phx2.redhat.com [10.3.113.128])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with
	ESMTP id r1R0WPJN021261; Tue, 26 Feb 2013 19:32:25 -0500
From: Cole Robinson <crobinso@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 26 Feb 2013 19:31:32 -0500
Message-Id: <4cef3fca4cde08008905c89cc2b73069e67824bc.1361925092.git.crobinso@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-stable@nongnu.org,
	Cole Robinson <crobinso@redhat.com>
Subject: [Qemu-trivial] [PATCH] rtc-test: Fix test failures with recent glib
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
X-List-Received-Date: Wed, 27 Feb 2013 00:32:39 -0000

As of glib 2.35.4, glib changed its logic for ordering test cases:

https://bugzilla.gnome.org/show_bug.cgi?id=694487

This was causing failures in rtc-test. Group the reordered test
cases into their own suite, which maintains the original ordering.

CC: qemu-stable@nongnu.org
Signed-off-by: Cole Robinson <crobinso@redhat.com>
---
 tests/rtc-test.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/rtc-test.c b/tests/rtc-test.c
index c5fd042..9ab583b 100644
--- a/tests/rtc-test.c
+++ b/tests/rtc-test.c
@@ -565,8 +565,8 @@ int main(int argc, char **argv)
     qtest_add_func("/rtc/basic/bcd-12h", basic_12h_bcd);
     qtest_add_func("/rtc/set-year/20xx", set_year_20xx);
     qtest_add_func("/rtc/set-year/1980", set_year_1980);
-    qtest_add_func("/rtc/register_b_set_flag", register_b_set_flag);
-    qtest_add_func("/rtc/fuzz-registers", fuzz_registers);
+    qtest_add_func("/rtc/misc/register_b_set_flag", register_b_set_flag);
+    qtest_add_func("/rtc/misc/fuzz-registers", fuzz_registers);
     ret = g_test_run();
 
     if (s) {
-- 
1.8.1.2


