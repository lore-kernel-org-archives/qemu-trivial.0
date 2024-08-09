Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1scHdL-0002jz-89
	for mharc-qemu-trivial@gnu.org; Fri, 09 Aug 2024 00:53:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1scHdK-0002fA-3n
 for qemu-trivial@nongnu.org; Fri, 09 Aug 2024 00:53:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1scHdI-0008H6-Do
 for qemu-trivial@nongnu.org; Fri, 09 Aug 2024 00:53:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723179223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6y/Dx9WfBuoEyBP+LUel142LcScGzpkHOUr2wWRP0X0=;
 b=VTV+HO4KnzXV50+ksffDjc2nwdIKFD08ZB7Cll107W3pEvd4L/tEf0deVE4AIeg+Nbqf8C
 aQEylRedagueGSFvRjJHu5LQDz9oCOCLXgV0IBsH6OdgwswgOCETEA2gWx5XHXYVbi6Lvv
 D4HpiXSa4KTpt62V6qnwzA8SEKQUXAM=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-qLCEup-lPuu7TMLioerPZA-1; Fri, 09 Aug 2024 00:53:42 -0400
X-MC-Unique: qLCEup-lPuu7TMLioerPZA-1
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7104f37771eso2025692b3a.2
 for <qemu-trivial@nongnu.org>; Thu, 08 Aug 2024 21:53:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723179221; x=1723784021;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6y/Dx9WfBuoEyBP+LUel142LcScGzpkHOUr2wWRP0X0=;
 b=TIvVKyxLkoVylXV0z9UEWIF3zRITvMhlLb4DOqlROhNUYXedLPEuKIQc442NcbonW7
 xqamZ9uLetHfebA9+jj9DHsP2u/2qIKEQvRNYPRXs+SYd3Y/G2Vv14DqOIMa8ze5yuRh
 /0SjjITb2y/u6kjx5DCU8dbQ56uUGtw2N/p6iTT6WO1zGQ3SowqCnAHEhBGr3NQJb1Wz
 VXfX7f0h72l9pkx8WTGCeaA4yCdEL4stSIjlHJbg/fCeOP1bQX8nuZTyO/Nl+CFE66xK
 X7XaBiARUYljn7HtlKYpyQT2za3j6bQfC4P7lg/Wg64DCeb7LNNDQRMKFcIv15z9Bb1B
 zZGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWv2T3y5/xTUvT4MlKwahNo6ljZmCMJtRIKCKrNPbaqqDatOERKqnDd72eH7bo+NqTVk7LBW1PmVtgJZZvbVGpSqpF6EWDGKA==
X-Gm-Message-State: AOJu0YxPF2JoubyNVRb31ITpjXoLnFy+t1iUscarkfbElVB3wI4+Y6HI
 VBKEk0VxLQWSEAay3o+YcPAtnpp3oVNh17YLRC1KUKibTqBtKPTnQdzGWSmdFgjClDu66rAczM7
 J3sXb6nEufqUtRJA1CVLnyUXzMAkfNPk9L3ejb91KA0FdS2kv0wdCZmE=
X-Received: by 2002:a05:6a21:458a:b0:1c4:8650:d6d7 with SMTP id
 adf61e73a8af0-1c89fec2cd2mr507348637.16.1723179221104; 
 Thu, 08 Aug 2024 21:53:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7CZUoFnBycRjnM0orNNjv+/SuxPUpkqJGSE9wtp9gfcdEF73syhQeo7PZom0vG5inUvKBJQ==
X-Received: by 2002:a05:6a21:458a:b0:1c4:8650:d6d7 with SMTP id
 adf61e73a8af0-1c89fec2cd2mr507328637.16.1723179220671; 
 Thu, 08 Aug 2024 21:53:40 -0700 (PDT)
Received: from localhost.localdomain ([115.96.114.241])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-1ff58f6a540sm133516895ad.118.2024.08.08.21.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 21:53:40 -0700 (PDT)
From: Ani Sinha <anisinha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ani Sinha <anisinha@redhat.com>, zhao1.liu@intel.com, cfontana@suse.de,
 qemu-trivial@nongnu.org, kvm@vger.kernel.org, qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] kvm: refactor core virtual machine creation into its
 own function
Date: Fri,  9 Aug 2024 10:21:53 +0530
Message-ID: <20240809045153.1744397-3-anisinha@redhat.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240809045153.1744397-1-anisinha@redhat.com>
References: <20240809045153.1744397-1-anisinha@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 09 Aug 2024 04:53:46 -0000

Refactoring the core logic around KVM_CREATE_VM into its own separate function
so that it can be called from other functions in subsequent patches. There is
no functional change in this patch.

CC: pbonzini@redhat.com
CC: zhao1.liu@intel.com
CC: cfontana@suse.de
CC: qemu-trivial@nongnu.org
Signed-off-by: Ani Sinha <anisinha@redhat.com>
---
 accel/kvm/kvm-all.c | 88 +++++++++++++++++++++++++++------------------
 1 file changed, 54 insertions(+), 34 deletions(-)

changelog:
v2: s/fprintf/warn_report as suggested by zhao
v3: s/warn_report/error_report. function names adjusted to conform to
other names. fprintf -> error_report() moved to its own patch.

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 899b5264e3..610b3ead32 100644
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
+            error_report("Host kernel setup problem detected. Please verify:");
+            error_report("- for kernels supporting the switch_amode or"
+                        " user_mode parameters, whether");
+            error_report("  user space is running in primary address space");
+            error_report("- for kernels supporting the vm.allocate_pgste "
+                        "sysctl, whether it is enabled");
+        }
+#elif defined(TARGET_PPC)
+        if (ret == -EINVAL) {
+            error_report("PPC KVM module is not loaded. Try modprobe kvm_%s.",
+                        (type == 2) ? "pr" : "hv");
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
@@ -2467,47 +2518,16 @@ static int kvm_init(MachineState *ms)
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
-            error_report("Host kernel setup problem detected. Please verify:");
-            error_report("- for kernels supporting the switch_amode or"
-                        " user_mode parameters, whether");
-            error_report("  user space is running in primary address space");
-            error_report("- for kernels supporting the vm.allocate_pgste "
-                        "sysctl, whether it is enabled");
-        }
-#elif defined(TARGET_PPC)
-        if (ret == -EINVAL) {
-            error_report("PPC KVM module is not loaded. Try modprobe kvm_%s.",
-                        (type == 2) ? "pr" : "hv");
-        }
-#endif
-    }
         goto err;
+    }
 
     s->vmfd = ret;
 
-- 
2.45.2


