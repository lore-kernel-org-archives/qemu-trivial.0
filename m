Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bktni-0003Px-Qg
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 10:07:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bktnb-0003Iu-05
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 10:07:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bktnV-000068-TL
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 10:07:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46056)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bktnK-0008Lr-GW; Fri, 16 Sep 2016 10:07:10 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 237866CB4B;
	Fri, 16 Sep 2016 13:56:53 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GDuHkI024127; Fri, 16 Sep 2016 09:56:51 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
	Cornelia Huck <cornelia.huck@de.ibm.com>
Date: Fri, 16 Sep 2016 15:56:07 +0200
Message-Id: <1474034177-17663-17-git-send-email-lvivier@redhat.com>
In-Reply-To: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 16 Sep 2016 13:56:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 16/26] s390: use exit(EXIT_SUCCESS) and
 exit(EXIT_FAILURE)
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
X-List-Received-Date: Fri, 16 Sep 2016 14:07:34 -0000

This patch is the result of coccinelle script
scripts/coccinelle/exit.cocci

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
CC: Cornelia Huck <cornelia.huck@de.ibm.com>
---
 target-s390x/cpu.c        |  2 +-
 target-s390x/kvm.c        | 18 +++++++++---------
 target-s390x/mmu_helper.c |  2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/target-s390x/cpu.c b/target-s390x/cpu.c
index 2f3c8e2..d4ca6af 100644
--- a/target-s390x/cpu.c
+++ b/target-s390x/cpu.c
@@ -385,7 +385,7 @@ unsigned int s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu)
     default:
         error_report("Requested CPU state is not a valid S390 CPU state: %u",
                      cpu_state);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     if (kvm_enabled() && cpu->env.cpu_state != cpu_state) {
         kvm_s390_set_cpu_state(cpu, cpu_state);
diff --git a/target-s390x/kvm.c b/target-s390x/kvm.c
index dfaf1ca..2b1b908 100644
--- a/target-s390x/kvm.c
+++ b/target-s390x/kvm.c
@@ -920,13 +920,13 @@ static void inject_vcpu_irq_legacy(CPUState *cs, struct kvm_s390_irq *irq)
     r = s390_kvm_irq_to_interrupt(irq, &kvmint);
     if (r < 0) {
         fprintf(stderr, "%s called with bogus interrupt\n", __func__);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     r = kvm_vcpu_ioctl(cs, KVM_S390_INTERRUPT, &kvmint);
     if (r < 0) {
         fprintf(stderr, "KVM failed to inject interrupt\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 }
 
@@ -941,7 +941,7 @@ void kvm_s390_vcpu_interrupt(S390CPU *cpu, struct kvm_s390_irq *irq)
             return;
         }
         error_report("KVM failed to inject interrupt %llx", irq->type);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     inject_vcpu_irq_legacy(cs, irq);
@@ -955,13 +955,13 @@ static void __kvm_s390_floating_interrupt(struct kvm_s390_irq *irq)
     r = s390_kvm_irq_to_interrupt(irq, &kvmint);
     if (r < 0) {
         fprintf(stderr, "%s called with bogus interrupt\n", __func__);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     r = kvm_vm_ioctl(kvm_state, KVM_S390_INTERRUPT, &kvmint);
     if (r < 0) {
         fprintf(stderr, "KVM failed to inject interrupt\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 }
 
@@ -1905,15 +1905,15 @@ static int handle_intercept(S390CPU *cpu)
             break;
         case ICPT_SOFT_INTERCEPT:
             fprintf(stderr, "KVM unimplemented icpt SOFT\n");
-            exit(1);
+            exit(EXIT_FAILURE);
             break;
         case ICPT_IO:
             fprintf(stderr, "KVM unimplemented icpt IO\n");
-            exit(1);
+            exit(EXIT_FAILURE);
             break;
         default:
             fprintf(stderr, "Unknown intercept code: %d\n", icpt_code);
-            exit(1);
+            exit(EXIT_FAILURE);
             break;
     }
 
@@ -2222,7 +2222,7 @@ int kvm_s390_set_cpu_state(S390CPU *cpu, uint8_t cpu_state)
     default:
         error_report("Requested CPU state is not a valid S390 CPU state: %u",
                      cpu_state);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     ret = kvm_vcpu_ioctl(CPU(cpu), KVM_SET_MP_STATE, &mp_state);
diff --git a/target-s390x/mmu_helper.c b/target-s390x/mmu_helper.c
index b11a027..dc9960a 100644
--- a/target-s390x/mmu_helper.c
+++ b/target-s390x/mmu_helper.c
@@ -414,7 +414,7 @@ static bool lowprot_enabled(const CPUS390XState *env)
     default:
         /* We don't support access register mode */
         error_report("unsupported addressing mode");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 }
 
-- 
2.5.5


