Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dYAhR-0006Ct-J4
	for mharc-qemu-trivial@gnu.org; Thu, 20 Jul 2017 08:37:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sf@sfritsch.de>) id 1dY6bn-0003lJ-9C
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 04:14:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sf@sfritsch.de>) id 1dY6bi-0006R7-Ck
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 04:14:55 -0400
Received: from manul.sfritsch.de ([138.201.64.112]:37659)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sf@sfritsch.de>) id 1dY6bi-0006QW-5t
	for qemu-trivial@nongnu.org; Thu, 20 Jul 2017 04:14:50 -0400
From: Stefan Fritsch <sf@sfritsch.de>
To: qemu-trivial@nongnu.org
Cc: Stefan Fritsch <stefan_fritsch@genua.de>,
	qemu-devel@nongnu.org (open list:All patches CC here)
Date: Thu, 20 Jul 2017 10:14:46 +0200
Message-Id: <1500538486-23453-1-git-send-email-sf@sfritsch.de>
X-Mailer: git-send-email 2.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 138.201.64.112
X-Mailman-Approved-At: Thu, 20 Jul 2017 08:37:00 -0400
Subject: [Qemu-trivial] [PATCH] vmxcap: Fix output formatting
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 20 Jul 2017 08:14:56 -0000

From: Stefan Fritsch <stefan_fritsch@genua.de>

One string is longer than 40 chars. Set the field width to 50.

Signed-off-by: Stefan Fritsch <stefan_fritsch@genua.de>
---
 scripts/kvm/vmxcap | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kvm/vmxcap b/scripts/kvm/vmxcap
index d9a6db0bb7..19506f45bf 100755
--- a/scripts/kvm/vmxcap
+++ b/scripts/kvm/vmxcap
@@ -69,7 +69,7 @@ class Control(object):
                 s = 'forced'
             elif one and zero:
                 s = 'yes'
-            print('  %-40s %s' % (self.bits[bit], s))
+            print('  %-50s %s' % (self.bits[bit], s))
 
 class Misc(object):
     def __init__(self, name, bits, msr):
@@ -94,7 +94,7 @@ class Misc(object):
                 def fmt(x):
                     return { True: 'yes', False: 'no' }[x]
             v = (value >> lo) & ((1 << (hi - lo + 1)) - 1)
-            print('  %-40s %s' % (self.bits[bits], fmt(v)))
+            print('  %-50s %s' % (self.bits[bits], fmt(v)))
 
 controls = [
     Misc(
-- 
2.11.0


