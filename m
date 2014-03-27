Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WTCEf-0001R5-0J
	for mharc-qemu-trivial@gnu.org; Thu, 27 Mar 2014 11:28:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35814)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCEY-0001F6-Fv
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 11:28:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WTCEU-0002eO-44
	for qemu-trivial@nongnu.org; Thu, 27 Mar 2014 11:28:46 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:44606)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WTCEJ-0002bS-TC; Thu, 27 Mar 2014 11:28:32 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 8E16443722;
	Thu, 27 Mar 2014 19:28:30 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 715FA634;
	Thu, 27 Mar 2014 19:28:30 +0400 (MSK)
Received: (nullmailer pid 1775 invoked by uid 1000);
	Thu, 27 Mar 2014 15:28:29 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 27 Mar 2014 19:28:10 +0400
Message-Id: <1395934108-1694-6-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1395934108-1694-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 05/23] target-i386: Add missing 'static' and
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
X-List-Received-Date: Thu, 27 Mar 2014 15:28:51 -0000

From: Stefan Weil <sw@weilnetz.de>

This fixes warnings from the static code analysis (smatch).

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
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


