Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iCfYL-0005Lo-Vd
	for mharc-qemu-trivial@gnu.org; Tue, 24 Sep 2019 03:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42412)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iCfYI-0005I0-3O
 for qemu-trivial@nongnu.org; Tue, 24 Sep 2019 03:48:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iCfYF-00077d-Ug
 for qemu-trivial@nongnu.org; Tue, 24 Sep 2019 03:48:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47268)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1iCfY4-0006zL-Jf; Tue, 24 Sep 2019 03:47:50 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EA4227E421;
 Tue, 24 Sep 2019 07:47:45 +0000 (UTC)
Received: from thuth.com (ovpn-116-95.ams2.redhat.com [10.36.116.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14C566017E;
 Tue, 24 Sep 2019 07:47:43 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Marcelo Tosatti <mtosatti@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-trivial@nongnu.org
Subject: [PATCH] target/i386/kvm: Silence warning from Valgrind about
 uninitialized bytes
Date: Tue, 24 Sep 2019 09:47:38 +0200
Message-Id: <20190924074738.13104-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Tue, 24 Sep 2019 07:47:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Sep 2019 07:48:04 -0000

When I run QEMU with KVM under Valgrind, I currently get this warning:

 Syscall param ioctl(generic) points to uninitialised byte(s)
    at 0x95BA45B: ioctl (in /usr/lib64/libc-2.28.so)
    by 0x429DC3: kvm_ioctl (kvm-all.c:2365)
    by 0x51B249: kvm_arch_get_supported_msr_feature (kvm.c:469)
    by 0x4C2A49: x86_cpu_get_supported_feature_word (cpu.c:3765)
    by 0x4C4116: x86_cpu_expand_features (cpu.c:5065)
    by 0x4C7F8D: x86_cpu_realizefn (cpu.c:5242)
    by 0x5961F3: device_set_realized (qdev.c:835)
    by 0x7038F6: property_set_bool (object.c:2080)
    by 0x707EFE: object_property_set_qobject (qom-qobject.c:26)
    by 0x705814: object_property_set_bool (object.c:1338)
    by 0x498435: pc_new_cpu (pc.c:1549)
    by 0x49C67D: pc_cpus_init (pc.c:1681)
  Address 0x1ffeffee74 is on thread 1's stack
  in frame #2, created by kvm_arch_get_supported_msr_feature (kvm.c:445)

It's harmless, but a little bit annoying, so silence it by properly
initializing the whole structure with zeroes.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 target/i386/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index 92069099ab..bd92dabea6 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -447,7 +447,7 @@ uint32_t kvm_arch_get_supported_msr_feature(KVMState *s, uint32_t index)
     struct {
         struct kvm_msrs info;
         struct kvm_msr_entry entries[1];
-    } msr_data;
+    } msr_data = {};
     uint32_t ret;
 
     if (kvm_feature_msrs == NULL) { /* Host doesn't support feature MSRs */
-- 
2.18.1


