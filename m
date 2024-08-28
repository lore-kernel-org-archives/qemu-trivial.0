Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sjDXx-0003tP-PR
	for mharc-qemu-trivial@gnu.org; Wed, 28 Aug 2024 03:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1sjDXw-0003mr-2W
 for qemu-trivial@nongnu.org; Wed, 28 Aug 2024 03:56:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1sjDXu-00063T-I5
 for qemu-trivial@nongnu.org; Wed, 28 Aug 2024 03:56:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724831809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zYl3uaCkxHjT2nDUPL1WDle3wL/fOkENv7M02v+JPJY=;
 b=T6QUMzPYnLMEXX1aZytzqkEk4TCmQ3ZCtF81NIRWE/qtdTwIIDNWFW5cunOUw99tbCOL8q
 P1K8MwkAipaUKkCREW7ss3OlhLqU3OBMOHsBqOrYonSgxbGEQ4HFBwVIuKyts0Uk9ti5wc
 wIvg3VXbFuwWHYV61IHK/EU/mscWnJE=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-6UNH-FGwOb-k08FKbyABEg-1; Wed, 28 Aug 2024 03:56:47 -0400
X-MC-Unique: 6UNH-FGwOb-k08FKbyABEg-1
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-2d5dafe951eso7298519a91.3
 for <qemu-trivial@nongnu.org>; Wed, 28 Aug 2024 00:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724831805; x=1725436605;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zYl3uaCkxHjT2nDUPL1WDle3wL/fOkENv7M02v+JPJY=;
 b=oU9svtxoapGNdX3JQOXYRe/TyqbdmRXNJABjajlP2U+JoavPj7n1qHLVADpGfHJAL8
 qCQlm2ZBK1V5SmQQodQqSae4QCors0ggZWkOhrEAyWnZ8B/p37GcTKgu3wWJGszMUiG5
 ISSi6igfiLcQbcTBdbrpzYPAfze0ZTNwAoVCAfEFoKvLyvmgyKXIA07wP1qpHOlBTMLD
 f7sbOTsPa+YeQN1dv8QOt7jOmG42Nu6TOPs4JYJLg0Svn5OhK7OjvO9V/Ow/KQm4tETe
 rMCRfZeQmVrFNKrnzqeQK0WjO3IldI2YP0Xkun2HE9H9LhywWIDazXNxWfA2hsZHaIcB
 mhBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVL1cqv1OfHRMB6f5cajh25UFgyufqDIQg+2o7F9tya4C28kNn2E5RsddoDYteSR2IS4LH/ZkbBNR0MvA=@nongnu.org
X-Gm-Message-State: AOJu0Yy9u6LZ22zfzhTCRyahZmFX67VAU/WcxLDgGZ6a6BowmyeQUPCy
 2ebkS7mdv7pSvSNv/tZAtzBXg9AaRp42TEptRJXtJXAsGHfE+R7Mstp+31dyUvMYJD+bCaaMFPA
 mTwVWYfZZJ8X2ayNUm5p11Z5i2+eCzJVzZwyZIcoimeQFO2qYN2lFr+e4ML1zyHIorQ==
X-Received: by 2002:a17:90a:7408:b0:2d3:cc3e:4d6d with SMTP id
 98e67ed59e1d1-2d646b91092mr14510029a91.9.1724831805448; 
 Wed, 28 Aug 2024 00:56:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnS9wmiNKpmg/gLxiSQVdrbd8UyjUO09X7ptuxTKXWPb9mBB1kZo5ol5VgojZc/qD+8UvY6w==
X-Received: by 2002:a17:90a:7408:b0:2d3:cc3e:4d6d with SMTP id
 98e67ed59e1d1-2d646b91092mr14510013a91.9.1724831805035; 
 Wed, 28 Aug 2024 00:56:45 -0700 (PDT)
Received: from localhost.localdomain ([115.96.157.236])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2d8445fbf0dsm1013534a91.19.2024.08.28.00.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 00:56:44 -0700 (PDT)
From: Ani Sinha <anisinha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ani Sinha <anisinha@redhat.com>, zhao1.liu@intel.com, cfontana@suse.de,
 armbru@redhat.com, qemu-trivial@nongnu.org, kvm@vger.kernel.org,
 qemu-devel@nongnu.org
Subject: [PATCH v5 2/2] kvm: refactor core virtual machine creation into its
 own function
Date: Wed, 28 Aug 2024 13:26:29 +0530
Message-ID: <20240828075630.7754-3-anisinha@redhat.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240828075630.7754-1-anisinha@redhat.com>
References: <20240828075630.7754-1-anisinha@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 28 Aug 2024 07:56:52 -0000

Refactoring the core logic around KVM_CREATE_VM into its own separate function
so that it can be called from other functions in future patches. There is
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

v2: s/fprintf/warn_report as suggested by zhao
v3: s/warn_report/error_report. function names adjusted to conform to
other names. fprintf -> error_report() moved to its own patch.
v4: added tags and rebased.
v5: rebased.

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index fcc157f0e6..cf3d820b94 100644
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
+        error_report("ioctl(KVM_CREATE_VM) failed: %s", strerror(-ret));
+
+#ifdef TARGET_S390X
+        if (ret == -EINVAL) {
+            error_printf("Host kernel setup problem detected."
+                         " Please verify:\n");
+            error_printf("- for kernels supporting the"
+                        " switch_amode or user_mode parameters, whether");
+            error_printf(" user space is running in primary address space\n");
+            error_printf("- for kernels supporting the vm.allocate_pgste"
+                         " sysctl, whether it is enabled\n");
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
-        error_report("ioctl(KVM_CREATE_VM) failed: %s", strerror(-ret));
-
-#ifdef TARGET_S390X
-        if (ret == -EINVAL) {
-            error_printf("Host kernel setup problem detected."
-                         " Please verify:\n");
-            error_printf("- for kernels supporting the"
-                        " switch_amode or user_mode parameters, whether");
-            error_printf(" user space is running in primary address space\n");
-            error_printf("- for kernels supporting the vm.allocate_pgste"
-                         " sysctl, whether it is enabled\n");
-        }
-#elif defined(TARGET_PPC)
-        if (ret == -EINVAL) {
-            error_printf("PPC KVM module is not loaded. Try modprobe kvm_%s.\n",
-                         (type == 2) ? "pr" : "hv");
-        }
-#endif
         goto err;
     }
 
-- 
2.42.0


