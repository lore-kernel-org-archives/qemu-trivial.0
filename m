Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sixqM-0004gD-1n
	for mharc-qemu-trivial@gnu.org; Tue, 27 Aug 2024 11:10:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1sixqK-0004aY-79
 for qemu-trivial@nongnu.org; Tue, 27 Aug 2024 11:10:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1sixqI-0000Wf-Ac
 for qemu-trivial@nongnu.org; Tue, 27 Aug 2024 11:10:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724771443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M4c8TB2xHXASJ1uR1do61nTZjlIA4R+OAlBc+Ffu1q0=;
 b=X7vEgDQt23XQ4WGl5QeRSllhEh90BCQfeS9s7HiRn9CX6HPN0BN6BVK/GsFars6oxlXvU2
 mE+AY0c5cvdhfWU0v9WFnQsnWm4c85tIyn2D+VqPVjbC0BtyafhLUUEyiDG79PvKizTrWQ
 UGeOlFHkmLE/d7KTYDjUrHkq+C7B5/4=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-137-Tdp3PoS7M1awPdahblO93w-1; Tue, 27 Aug 2024 11:10:42 -0400
X-MC-Unique: Tdp3PoS7M1awPdahblO93w-1
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-71439227092so6005890b3a.3
 for <qemu-trivial@nongnu.org>; Tue, 27 Aug 2024 08:10:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724771441; x=1725376241;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M4c8TB2xHXASJ1uR1do61nTZjlIA4R+OAlBc+Ffu1q0=;
 b=ht/0JOfGqlsmB42tCcBz68b1qZfSW+eyPilMad2BqLy3BbWaekRw9LwCdjcpXSRyFK
 5qeIJ1LgyiqQgRekCpp2Wlr8fJzu/6Uu14TrJlzdXaZ44mMDceC/BHb4LGcXSj5gesc+
 EyD18JH/A/x2/y4ad0Mz1H/CVduthvxVsAa4L1A1z0ZfUiqwNOVeguuZhe3JsHr84MR6
 rTYNp2VlncpfojrqSFZzcUadowe+bLvwb2ROT10nT6SkVCaOgm5O0sR23BBp28Eegl3q
 vUn2hLr0nNiCNBXVsYK6JEafn+1EBSS7sKlGjXISuRsGGTgC13yByv9erAwu/YhkbZC5
 x0ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUWFZzEoaaxMv8FNJ1nl5VrRR6/QZLH6uaAtOQiKkLOGG0X2z7IQotTfIkQIKQwcndPcXeMcumTs6c6qtY=@nongnu.org
X-Gm-Message-State: AOJu0YyjoBZx1RRLNJlh62s/DId3R56/5uxbIYHvaByATB13LNLGFa02
 AOX9wHMY96lI4bBmRz5jviSXOfeR9EONty/F5hmrr9mkYsi4YftUjTMThyZ5ouXpjNik9sbQbCy
 oo7NZFgKTU1BsXQwqFGFXO97fJRwTHxy0JamstlXe/HmV9C8XM6v21eM=
X-Received: by 2002:a05:6a00:1805:b0:714:3325:d8e9 with SMTP id
 d2e1a72fcca58-71445e1153fmr16802219b3a.22.1724771441561; 
 Tue, 27 Aug 2024 08:10:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUEAqtApzRiyNS0JKuFBiyF3z3Asq7TBCcUFBE8fW8JjKPSqwZF7934+py5nk9lIIjydb91g==
X-Received: by 2002:a05:6a00:1805:b0:714:3325:d8e9 with SMTP id
 d2e1a72fcca58-71445e1153fmr16802090b3a.22.1724771439974; 
 Tue, 27 Aug 2024 08:10:39 -0700 (PDT)
Received: from localhost.localdomain ([115.96.30.188])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7143430636esm8679062b3a.165.2024.08.27.08.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 08:10:39 -0700 (PDT)
From: Ani Sinha <anisinha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ani Sinha <anisinha@redhat.com>, zhao1.liu@intel.com, cfontana@suse.de,
 armbru@redhat.com, qemu-trivial@nongnu.org, kvm@vger.kernel.org,
 qemu-devel@nongnu.org
Subject: [PATCH v4 2/2] kvm: refactor core virtual machine creation into its
 own function
Date: Tue, 27 Aug 2024 20:40:22 +0530
Message-ID: <20240827151022.37992-3-anisinha@redhat.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240827151022.37992-1-anisinha@redhat.com>
References: <20240827151022.37992-1-anisinha@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Aug 2024 15:10:48 -0000

Refactoring the core logic around KVM_CREATE_VM into its own separate function
so that it can be called from other functions in subsequent patches. There is
no functional change in this patch.

CC: pbonzini@redhat.com
CC: zhao1.liu@intel.com
CC: cfontana@suse.de
CC: armbru@redhat.com
CC: qemu-trivial@nongnu.org
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Ani Sinha <anisinha@redhat.com>
---
 accel/kvm/kvm-all.c | 86 ++++++++++++++++++++++++++++-----------------
 1 file changed, 53 insertions(+), 33 deletions(-)

changelog:
v2: s/fprintf/warn_report as suggested by zhao
v3: s/warn_report/error_report. function names adjusted to conform to
other names. fprintf -> error_report() moved to its own patch.
v4: added tags and rebased.

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index d9f477bb06..391279c995 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2385,6 +2385,57 @@ uint32_t kvm_dirty_ring_size(void)
     return kvm_state->kvm_dirty_ring_size;
 }
 
+static int kvm_create_vm(MachineState *ms, KVMState *s, int type)
+{
+    int ret;
+
+    do {
+        ret = kvm_ioctl(s, KVM_CREATE_VM, type);
+    } while (ret == -EINTR);
+
+    if (ret < 0) {
+        error_report("ioctl(KVM_CREATE_VM) failed: %d %s", -ret,
+                    strerror(-ret));
+
+#ifdef TARGET_S390X
+        if (ret == -EINVAL) {
+            error_printf("Host kernel setup problem detected. Please verify:");
+            error_printf("\n- for kernels supporting the"
+                        " switch_amode or user_mode parameters, whether");
+            error_printf(" user space is running in primary address space\n");
+            error_printf("- for kernels supporting the vm.allocate_pgste "
+                         "sysctl, whether it is enabled\n");
+        }
+#elif defined(TARGET_PPC)
+        if (ret == -EINVAL) {
+            error_printf("PPC KVM module is not loaded. Try modprobe kvm_%s.\n",
+                         (type == 2) ? "pr" : "hv");
+        }
+#endif
+    }
+
+    return ret;
+}
+
+static int kvm_machine_type(MachineState *ms)
+{
+    MachineClass *mc = MACHINE_GET_CLASS(ms);
+    int type;
+
+    if (object_property_find(OBJECT(current_machine), "kvm-type")) {
+        g_autofree char *kvm_type;
+        kvm_type = object_property_get_str(OBJECT(current_machine),
+                                           "kvm-type",
+                                           &error_abort);
+        type = mc->kvm_type(ms, kvm_type);
+    } else if (mc->kvm_type) {
+        type = mc->kvm_type(ms, NULL);
+    } else {
+        type = kvm_arch_get_default_type(ms);
+    }
+    return type;
+}
+
 static int kvm_init(MachineState *ms)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
@@ -2467,45 +2518,14 @@ static int kvm_init(MachineState *ms)
     }
     s->as = g_new0(struct KVMAs, s->nr_as);
 
-    if (object_property_find(OBJECT(current_machine), "kvm-type")) {
-        g_autofree char *kvm_type = object_property_get_str(OBJECT(current_machine),
-                                                            "kvm-type",
-                                                            &error_abort);
-        type = mc->kvm_type(ms, kvm_type);
-    } else if (mc->kvm_type) {
-        type = mc->kvm_type(ms, NULL);
-    } else {
-        type = kvm_arch_get_default_type(ms);
-    }
-
+    type = kvm_machine_type(ms);
     if (type < 0) {
         ret = -EINVAL;
         goto err;
     }
 
-    do {
-        ret = kvm_ioctl(s, KVM_CREATE_VM, type);
-    } while (ret == -EINTR);
-
+    ret = kvm_create_vm(ms, s, type);
     if (ret < 0) {
-        error_report("ioctl(KVM_CREATE_VM) failed: %d %s", -ret,
-                    strerror(-ret));
-
-#ifdef TARGET_S390X
-        if (ret == -EINVAL) {
-            error_printf("Host kernel setup problem detected. Please verify:");
-            error_printf("\n- for kernels supporting the"
-                        " switch_amode or user_mode parameters, whether");
-            error_printf(" user space is running in primary address space\n");
-            error_printf("- for kernels supporting the vm.allocate_pgste "
-                         "sysctl, whether it is enabled\n");
-        }
-#elif defined(TARGET_PPC)
-        if (ret == -EINVAL) {
-            error_printf("PPC KVM module is not loaded. Try modprobe kvm_%s.\n",
-                        (type == 2) ? "pr" : "hv");
-        }
-#endif
         goto err;
     }
 
-- 
2.42.0


