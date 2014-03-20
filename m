Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQkY1-00050a-Qd
	for mharc-qemu-trivial@gnu.org; Thu, 20 Mar 2014 17:30:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35154)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WQkXz-0004za-3o
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 17:30:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WQkXx-0005iH-Mw
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 17:30:42 -0400
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:59302
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WQkXv-0005hx-2E; Thu, 20 Mar 2014 17:30:39 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 2C4F817F59C; Thu, 20 Mar 2014 22:30:35 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Thu, 20 Mar 2014 22:30:32 +0100
Message-Id: <1395351032-11920-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
	qemu-devel@nongnu.org, kvm@vger.kernel.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] target-i386: Remove unused data from local
	array
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
X-List-Received-Date: Thu, 20 Mar 2014 21:30:44 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

This patch is based on a previous patch for the same file,
see http://patchwork.ozlabs.org/patch/330708/.

Regards
Stefan W.

 target-i386/kvm.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target-i386/kvm.c b/target-i386/kvm.c
index 4389959..d17eea3 100644
--- a/target-i386/kvm.c
+++ b/target-i386/kvm.c
@@ -130,14 +130,13 @@ static const struct kvm_para_features {
     { KVM_CAP_NOP_IO_DELAY, KVM_FEATURE_NOP_IO_DELAY },
     { KVM_CAP_PV_MMU, KVM_FEATURE_MMU_OP },
     { KVM_CAP_ASYNC_PF, KVM_FEATURE_ASYNC_PF },
-    { -1, -1 }
 };
 
 static int get_para_features(KVMState *s)
 {
     int i, features = 0;
 
-    for (i = 0; i < ARRAY_SIZE(para_features) - 1; i++) {
+    for (i = 0; i < ARRAY_SIZE(para_features); i++) {
         if (kvm_check_extension(s, para_features[i].cap)) {
             features |= (1 << para_features[i].feature);
         }
-- 
1.7.10.4


