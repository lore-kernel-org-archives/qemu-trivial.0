Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Zmqeu-0007xD-Tr
	for mharc-qemu-trivial@gnu.org; Thu, 15 Oct 2015 18:06:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53686)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZmnIM-0001eF-Dk
	for qemu-trivial@nongnu.org; Thu, 15 Oct 2015 14:30:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZmnIL-00060Q-7G
	for qemu-trivial@nongnu.org; Thu, 15 Oct 2015 14:30:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38583)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1ZmnIG-0005zD-6R; Thu, 15 Oct 2015 14:30:24 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 9D4422653;
	Thu, 15 Oct 2015 18:30:23 +0000 (UTC)
Received: from thh440s.redhat.com (vpn1-4-90.ams2.redhat.com [10.36.4.90])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9FIULAb029561; Thu, 15 Oct 2015 14:30:21 -0400
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Thu, 15 Oct 2015 20:30:20 +0200
Message-Id: <1444933820-6968-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: pbonzini@redhat.com, mtosatti@redhat.com, ehabkost@redhat.com,
	rth@twiddle.net
Subject: [Qemu-trivial] [PATCH] kvm: Move x86-specific functions into
	target-i386/kvm.c
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
X-List-Received-Date: Thu, 15 Oct 2015 18:30:31 -0000

The functions for checking xcrs, xsave and pit_state2 are
only used on x86, so they should reside in target-i386/kvm.c.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/sysemu/kvm.h |  2 --
 kvm-all.c            | 29 -----------------------------
 kvm-stub.c           |  5 -----
 target-i386/kvm.c    | 31 ++++++++++++++++++++++++++-----
 4 files changed, 26 insertions(+), 41 deletions(-)

diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
index 2a58b4d..d26dfcb 100644
--- a/include/sysemu/kvm.h
+++ b/include/sysemu/kvm.h
@@ -182,8 +182,6 @@ int kvm_has_sync_mmu(void);
 int kvm_has_vcpu_events(void);
 int kvm_has_robust_singlestep(void);
 int kvm_has_debugregs(void);
-int kvm_has_xsave(void);
-int kvm_has_xcrs(void);
 int kvm_has_pit_state2(void);
 int kvm_has_many_ioeventfds(void);
 int kvm_has_gsi_routing(void);
diff --git a/kvm-all.c b/kvm-all.c
index 0be4615..9caab30 100644
--- a/kvm-all.c
+++ b/kvm-all.c
@@ -77,8 +77,6 @@ struct KVMState
 #ifdef KVM_CAP_SET_GUEST_DEBUG
     struct kvm_sw_breakpoint_head kvm_sw_breakpoints;
 #endif
-    int pit_state2;
-    int xsave, xcrs;
     int many_ioeventfds;
     int intx_set_mask;
     /* The man page (and posix) say ioctl numbers are signed int, but
@@ -1585,18 +1583,6 @@ static int kvm_init(MachineState *ms)
     s->debugregs = kvm_check_extension(s, KVM_CAP_DEBUGREGS);
 #endif
 
-#ifdef KVM_CAP_XSAVE
-    s->xsave = kvm_check_extension(s, KVM_CAP_XSAVE);
-#endif
-
-#ifdef KVM_CAP_XCRS
-    s->xcrs = kvm_check_extension(s, KVM_CAP_XCRS);
-#endif
-
-#ifdef KVM_CAP_PIT_STATE2
-    s->pit_state2 = kvm_check_extension(s, KVM_CAP_PIT_STATE2);
-#endif
-
 #ifdef KVM_CAP_IRQ_ROUTING
     s->direct_msi = (kvm_check_extension(s, KVM_CAP_SIGNAL_MSI) > 0);
 #endif
@@ -2062,21 +2048,6 @@ int kvm_has_debugregs(void)
     return kvm_state->debugregs;
 }
 
-int kvm_has_xsave(void)
-{
-    return kvm_state->xsave;
-}
-
-int kvm_has_xcrs(void)
-{
-    return kvm_state->xcrs;
-}
-
-int kvm_has_pit_state2(void)
-{
-    return kvm_state->pit_state2;
-}
-
 int kvm_has_many_ioeventfds(void)
 {
     if (!kvm_enabled()) {
diff --git a/kvm-stub.c b/kvm-stub.c
index d9ad624..a1d38f3 100644
--- a/kvm-stub.c
+++ b/kvm-stub.c
@@ -67,11 +67,6 @@ int kvm_has_many_ioeventfds(void)
     return 0;
 }
 
-int kvm_has_pit_state2(void)
-{
-    return 0;
-}
-
 void kvm_setup_guest_memory(void *start, size_t size)
 {
 }
diff --git a/target-i386/kvm.c b/target-i386/kvm.c
index 80d1a7e..1c33c6d 100644
--- a/target-i386/kvm.c
+++ b/target-i386/kvm.c
@@ -88,6 +88,15 @@ static bool has_msr_xss;
 static bool has_msr_architectural_pmu;
 static uint32_t num_architectural_pmu_counters;
 
+static int has_xsave;
+static int has_xcrs;
+static int has_pit_state2;
+
+int kvm_has_pit_state2(void)
+{
+    return has_pit_state2;
+}
+
 bool kvm_has_smm(void)
 {
     return kvm_check_extension(kvm_state, KVM_CAP_X86_SMM);
@@ -752,7 +761,7 @@ int kvm_arch_init_vcpu(CPUState *cs)
         }
     }
 
-    if (kvm_has_xsave()) {
+    if (has_xsave) {
         env->kvm_xsave_buf = qemu_memalign(4096, sizeof(struct kvm_xsave));
     }
 
@@ -908,6 +917,18 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     int ret;
     struct utsname utsname;
 
+#ifdef KVM_CAP_XSAVE
+    has_xsave = kvm_check_extension(s, KVM_CAP_XSAVE);
+#endif
+
+#ifdef KVM_CAP_XCRS
+    has_xcrs = kvm_check_extension(s, KVM_CAP_XCRS);
+#endif
+
+#ifdef KVM_CAP_PIT_STATE2
+    has_pit_state2 = kvm_check_extension(s, KVM_CAP_PIT_STATE2);
+#endif
+
     ret = kvm_get_supported_msrs(s);
     if (ret < 0) {
         return ret;
@@ -1116,7 +1137,7 @@ static int kvm_put_xsave(X86CPU *cpu)
     uint8_t *xmm, *ymmh, *zmmh;
     int i, r;
 
-    if (!kvm_has_xsave()) {
+    if (!has_xsave) {
         return kvm_put_fpu(cpu);
     }
 
@@ -1170,7 +1191,7 @@ static int kvm_put_xcrs(X86CPU *cpu)
     CPUX86State *env = &cpu->env;
     struct kvm_xcrs xcrs = {};
 
-    if (!kvm_has_xcrs()) {
+    if (!has_xcrs) {
         return 0;
     }
 
@@ -1495,7 +1516,7 @@ static int kvm_get_xsave(X86CPU *cpu)
     const uint8_t *xmm, *ymmh, *zmmh;
     uint16_t cwd, swd, twd;
 
-    if (!kvm_has_xsave()) {
+    if (!has_xsave) {
         return kvm_get_fpu(cpu);
     }
 
@@ -1554,7 +1575,7 @@ static int kvm_get_xcrs(X86CPU *cpu)
     int i, ret;
     struct kvm_xcrs xcrs;
 
-    if (!kvm_has_xcrs()) {
+    if (!has_xcrs) {
         return 0;
     }
 
-- 
1.8.3.1


