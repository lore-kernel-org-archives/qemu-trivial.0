Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1scHuX-0002K5-CC
	for mharc-qemu-trivial@gnu.org; Fri, 09 Aug 2024 01:11:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1scHuW-0002Ez-7P
 for qemu-trivial@nongnu.org; Fri, 09 Aug 2024 01:11:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1scHuU-0002mV-OE
 for qemu-trivial@nongnu.org; Fri, 09 Aug 2024 01:11:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723180289;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VFVzUlNsVsXQ/Du+Ve53FGF58OzF7Hoq8mZruS9vw88=;
 b=cBvDQoD4lvD+ARIE/ueENAdgweO/aQ6Mn9uMwC8W0w2P3GXCdWPwEKVRl2NYM7F0sg6ic7
 Xh60HDEPYoZI5/wsh/YneNUAa088OwNVR3dpeGEDXq3YuyGBYbB7GU3ninBTXVxTVm7mdN
 OqcLd8IZmGlSsEMtVvRxTPcSnr0vMxQ=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-DcL_NwwqOv-ZCcxJx3XgFg-1; Fri, 09 Aug 2024 01:11:26 -0400
X-MC-Unique: DcL_NwwqOv-ZCcxJx3XgFg-1
Received: by mail-yw1-f198.google.com with SMTP id
 00721157ae682-6698f11853aso33917907b3.0
 for <qemu-trivial@nongnu.org>; Thu, 08 Aug 2024 22:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723180285; x=1723785085;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VFVzUlNsVsXQ/Du+Ve53FGF58OzF7Hoq8mZruS9vw88=;
 b=sFyYJb4xhoc9qmoNPK8WsrXfRL6NbrO1TsnhQsZse9y4jcoF5hlbACv4DG11/4w2vD
 Q7X8JvZ4LRKrtYLir+ZjTJxcpj9DO+Ve+UV9cYAHLM1Uw6itjNqAYZyC7unD2AwG8Hhy
 7CvE81a+iqleamV6AGCmcigWnOOyN2xtyQXHmeJ9H+iRQMT9qKG14tGIvcaee0mfvPRw
 pjDm+kA+i6gAVqsUJxlySUYIbS1LCK6Jxh8oPrlY+YLlvbMw7dH6WDbtQIk6Uzj4mPtj
 zw4gM9BvVOT5gvKPYZfiSxhNjFo62gpcOwsHGviTw54USSKtDEO85ucAMv9/CEyX6+ih
 fWRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsvZO/BsFC0en9OBoAgQbGt5YaHOhc4lfTGuFiCAYmqkipNqurLTUHtwXqjTYA7yQsNMKYldgvgNDLnaWQ8A4e2nmv6IA2Ow==
X-Gm-Message-State: AOJu0YwRNbnNPPvNhpYHyZ9gvHcR++TgA5Evz0BYDb91de+GMjZ09NzA
 /y83gG2ZSHGRuVGsxoJ3+MMeSMVmlXWWNxOPXUw3jvjY+fkH6smDdbkUS1QvrggJOh/wCiqWPiO
 w2MmRlyQVPGVD+Ok15Hwqd8FIJSuJzJRaYlUGlEctTJRaNnIf6K6Oz54=
X-Received: by 2002:a05:690c:4292:b0:651:6888:a018 with SMTP id
 00721157ae682-69ec5f414d7mr4786107b3.26.1723180285576; 
 Thu, 08 Aug 2024 22:11:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESxQ+gkuExf9qc7vHUqL759aFOHOfgP2U0oqXC1HAlKJzIsPV8FKQvsxiLnMad+g7fVVCucA==
X-Received: by 2002:a05:690c:4292:b0:651:6888:a018 with SMTP id
 00721157ae682-69ec5f414d7mr4785867b3.26.1723180285247; 
 Thu, 08 Aug 2024 22:11:25 -0700 (PDT)
Received: from localhost.localdomain ([115.96.114.241])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-710cb2e52bfsm1961777b3a.145.2024.08.08.22.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 22:11:24 -0700 (PDT)
From: Ani Sinha <anisinha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ani Sinha <anisinha@redhat.com>, zhao1.liu@intel.com, cfontana@suse.de,
 qemu-trivial@nongnu.org, kvm@vger.kernel.org, qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] kvm: refactor core virtual machine creation into its
 own function
Date: Fri,  9 Aug 2024 10:40:54 +0530
Message-ID: <20240809051054.1745641-3-anisinha@redhat.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240809051054.1745641-1-anisinha@redhat.com>
References: <20240809051054.1745641-1-anisinha@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 09 Aug 2024 05:11:32 -0000

Refactoring the core logic around KVM_CREATE_VM into its own separate function
so that it can be called from other functions in subsequent patches. There is
no functional change in this patch.

CC: pbonzini@redhat.com
CC: zhao1.liu@intel.com
CC: cfontana@suse.de
CC: qemu-trivial@nongnu.org
Signed-off-by: Ani Sinha <anisinha@redhat.com>
---
 accel/kvm/kvm-all.c | 86 ++++++++++++++++++++++++++++-----------------
 1 file changed, 53 insertions(+), 33 deletions(-)

changelog:
v2: s/fprintf/warn_report as suggested by zhao
v3: s/warn_report/error_report. function names adjusted to conform to
other names. fprintf -> error_report() moved to its own patch.

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index ac168b9663..610b3ead32 100644
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
         goto err;
     }
 
-- 
2.45.2


