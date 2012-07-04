Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SmV0G-0006Ml-27
	for mharc-qemu-trivial@gnu.org; Wed, 04 Jul 2012 15:12:44 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33503)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1SmV0D-0006CG-33
	for qemu-trivial@nongnu.org; Wed, 04 Jul 2012 15:12:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1SmV0B-0007wv-FF
	for qemu-trivial@nongnu.org; Wed, 04 Jul 2012 15:12:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:22774)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1SmV08-0007wK-Bj; Wed, 04 Jul 2012 15:12:36 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q64JA3vf018953
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 4 Jul 2012 15:10:03 -0400
Received: from blackpad.lan.raisama.net (vpn1-4-145.gru2.redhat.com
	[10.97.4.145])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q64JA2Tl026299; Wed, 4 Jul 2012 15:10:02 -0400
Received: by blackpad.lan.raisama.net (Postfix, from userid 500)
	id EDEBE20053A; Wed,  4 Jul 2012 16:10:53 -0300 (BRT)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  4 Jul 2012 16:10:47 -0300
Message-Id: <1341429047-17470-1-git-send-email-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH RESEND] .gitignore update
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
X-List-Received-Date: Wed, 04 Jul 2012 19:12:42 -0000

Makes sure the following files are ignored:

  libcacard/.libs/
  libcacard/libcacard.la
  libcacard/libcacard.pc
  libcacard/libcacard/
  libcacard/osdep.lo
  libcacard/oslib-posix.lo
  libcacard/qemu-thread-posix.lo
  libcacard/qemu-timer-common.lo
  libcacard/trace.lo
  libcacard/trace/
  tests/test-visitor-serialization
  vscclient

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 .gitignore |    6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/.gitignore b/.gitignore
index 9859c7d..824c0d2 100644
--- a/.gitignore
+++ b/.gitignore
@@ -41,12 +41,14 @@ qemu-io
 qemu-ga
 qemu-bridge-helper
 qemu-monitor.texi
+vscclient
 QMP/qmp-commands.txt
 test-coroutine
 test-qmp-input-visitor
 test-qmp-output-visitor
 test-string-input-visitor
 test-string-output-visitor
+test-visitor-serialization
 fsdev/virtfs-proxy-helper.1
 fsdev/virtfs-proxy-helper.pod
 .gdbinit
@@ -69,6 +71,10 @@ fsdev/virtfs-proxy-helper.pod
 *.vr
 *.d
 *.o
+*.lo
+*.la
+*.pc
+.libs
 *.swp
 *.orig
 .pc
-- 
1.7.10.4


