Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WPBfl-00006B-Bz
	for mharc-qemu-trivial@gnu.org; Sun, 16 Mar 2014 10:04:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WPBfe-0008OH-Ee
	for qemu-trivial@nongnu.org; Sun, 16 Mar 2014 10:04:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WPBfZ-00026L-Bz
	for qemu-trivial@nongnu.org; Sun, 16 Mar 2014 10:04:10 -0400
Received: from qemu.weilnetz.de ([37.221.198.45]:57697
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1WPBfF-000231-Cq; Sun, 16 Mar 2014 10:03:45 -0400
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id 436B51800C1; Sun, 16 Mar 2014 15:03:42 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Sun, 16 Mar 2014 15:03:41 +0100
Message-Id: <1394978621-19738-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.221.198.45
Cc: kvm@vger.kernel.org, Stefan Weil <sw@weilnetz.de>,
	Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [Qemu-trivial] [PATCH] target-i386: Add missing 'static' and
	'const' attributes
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
X-List-Received-Date: Sun, 16 Mar 2014 14:04:15 -0000

This fixes warnings from the static code analysis (smatch).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---

Why is array para_features in kvm.c terminated by a dummy entry?
It is only used in a for loop with upper limit ARRAY_SIZE(para_features) - 1.

Regards
Stefan

 target-i386/cpu.c |    2 +-
 target-i386/kvm.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/target-i386/cpu.c b/target-i386/cpu.c
index e7e62c5..8fd1497 100644
--- a/target-i386/cpu.c
+++ b/target-i386/cpu.c
@@ -316,7 +316,7 @@ typedef struct X86RegisterInfo32 {
 
 #define REGISTER(reg) \
     [R_##reg] = { .name = #reg, .qapi_enum = X86_CPU_REGISTER32_##reg }
-X86RegisterInfo32 x86_reg_info_32[CPU_NB_REGS32] = {
+static const X86RegisterInfo32 x86_reg_info_32[CPU_NB_REGS32] = {
     REGISTER(EAX),
     REGISTER(ECX),
     REGISTER(EDX),
diff --git a/target-i386/kvm.c b/target-i386/kvm.c
index 7a295f6..4389959 100644
--- a/target-i386/kvm.c
+++ b/target-i386/kvm.c
@@ -122,7 +122,7 @@ static struct kvm_cpuid2 *get_supported_cpuid(KVMState *s)
     return cpuid;
 }
 
-struct kvm_para_features {
+static const struct kvm_para_features {
     int cap;
     int feature;
 } para_features[] = {
-- 
1.7.10.4


