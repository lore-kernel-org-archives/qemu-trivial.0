Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qt6Wh-0003d7-CF
	for mharc-qemu-trivial@gnu.org; Mon, 15 Aug 2011 19:24:59 -0400
Received: from eggs.gnu.org ([140.186.70.92]:32878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1Qt6We-0003UL-IQ
	for qemu-trivial@nongnu.org; Mon, 15 Aug 2011 19:24:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>) id 1Qt6Wd-0003pZ-8J
	for qemu-trivial@nongnu.org; Mon, 15 Aug 2011 19:24:56 -0400
Received: from fmmailgate03.web.de ([217.72.192.234]:38867)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@web.de>)
	id 1Qt6Wa-0003p0-He; Mon, 15 Aug 2011 19:24:52 -0400
Received: from smtp05.web.de  ( [172.20.4.166])
	by fmmailgate03.web.de (Postfix) with ESMTP id 8DC791978E018;
	Tue, 16 Aug 2011 01:24:51 +0200 (CEST)
Received: from [216.123.155.199] (helo=mchn199C.mchp.siemens.de)
	by smtp05.web.de with asmtp (TLSv1:AES256-SHA:256) (WEB.DE 4.110 #2)
	id 1Qt6WZ-0000Ln-00; Tue, 16 Aug 2011 01:24:51 +0200
Message-ID: <4E49AAC0.1090508@web.de>
Date: Mon, 15 Aug 2011 16:24:48 -0700
From: Jan Kiszka <jan.kiszka@web.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
X-Enigmail-Version: 1.2
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Sender: jan.kiszka@web.de
X-Sender: jan.kiszka@web.de
X-Provags-ID: V01U2FsdGVkX18yN5JbZbIiJxVFzgjrljKVme6TrEyQS2Fgr591
	ULbwtCJnCbViISWugx7Id/ESt+qYupOQHDAHVgixvd4PhruARI oOQoAX1Ac=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4-2.6
X-Received-From: 217.72.192.234
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] Fix up some style nits of last uq/master
	merge
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
X-List-Received-Date: Mon, 15 Aug 2011 23:24:57 -0000

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 cutils.c          |    2 +-
 target-i386/kvm.c |    5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/cutils.c b/cutils.c
index 28049e0..92c26a6 100644
--- a/cutils.c
+++ b/cutils.c
@@ -408,7 +408,7 @@ fail:
 
 int64_t strtosz_suffix(const char *nptr, char **end, const char default_suffix)
 {
-        return strtosz_suffix_unit(nptr, end, default_suffix, 1024);
+    return strtosz_suffix_unit(nptr, end, default_suffix, 1024);
 }
 
 int64_t strtosz(const char *nptr, char **end)
diff --git a/target-i386/kvm.c b/target-i386/kvm.c
index 31b88b7..5144447 100644
--- a/target-i386/kvm.c
+++ b/target-i386/kvm.c
@@ -501,8 +501,9 @@ int kvm_arch_init_vcpu(CPUState *env)
     qemu_add_vm_change_state_handler(cpu_update_state, env);
 
     r = kvm_vcpu_ioctl(env, KVM_SET_CPUID2, &cpuid_data);
-    if (r)
-	    return r;
+    if (r) {
+        return r;
+    }
 
     r = kvm_check_extension(env->kvm_state, KVM_CAP_TSC_CONTROL);
     if (r && env->tsc_khz) {

