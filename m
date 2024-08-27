Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sixqH-0004WF-QC
	for mharc-qemu-trivial@gnu.org; Tue, 27 Aug 2024 11:10:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1sixqF-0004OC-B3
 for qemu-trivial@nongnu.org; Tue, 27 Aug 2024 11:10:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1sixqB-0000Vj-HA
 for qemu-trivial@nongnu.org; Tue, 27 Aug 2024 11:10:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724771438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M8CF5R5awVwAxYxGrhoKMF7ffh+xm8TgWTdEgRArz0g=;
 b=gFyUu8vf/eAW8fuq8iUE5JPelkCDBvfvU0mYiSgZaKHjBvSE8oOOS+gkKsbZ6tmMrDfZ66
 0yfBdO8HnB+DLiM1i9QauXYclycYkLhBl8a7DAyrn4rF3OT0rF7yALwTnqLHcCKhhkH0zL
 w0waoWMLIYeNWr34RZ+6Qwdyw6eH+Bk=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-hUDNA6dENZ-xANbQU0J3AA-1; Tue, 27 Aug 2024 11:10:37 -0400
X-MC-Unique: hUDNA6dENZ-xANbQU0J3AA-1
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-70eebc3daf9so2913404b3a.1
 for <qemu-trivial@nongnu.org>; Tue, 27 Aug 2024 08:10:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724771436; x=1725376236;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M8CF5R5awVwAxYxGrhoKMF7ffh+xm8TgWTdEgRArz0g=;
 b=ao//py5u4J/UKpdmxw9+wd26LCAx3zXKq/yHmZXTWmyBFxEhzWKB8jM15M8AdiFx2J
 lByOyNwrJHG/Zp+Vgldg/1R0TVr1tjfX59tRl6AojlAsNygBbYBTFV6xJGUS9tGFYUK+
 qz/XF01+NPFuXOCoFbSHgl9T52Aj0hFKupRtvlXlEoEBx6c6WgMCglakY0N81Vya7EWK
 y7+qOGnljZcEo1UB1bEqhUt3F3KsR1HzKClsAe5eiXmfYWDFbxZTJzHFOhtaxDwqGlPe
 +Or5q2+MhzevkuCN10ZywgfXlyXhvhnE3l0c6pSOPMipuL7RciIxdi4PfUfgVRp0Aed2
 50aA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn72Fb1kP1xVgIK8Fs7sPWk5xmnz+GJc5DrzxQYzwGrBDFaWfuuErG//xAXmJNHkArMOPOR661upqIE0g=@nongnu.org
X-Gm-Message-State: AOJu0Yx13LrohcW4No3bKp5Kax4TtrzmMalo3dIj3D+cdEi216vRKwNe
 Q69fvf6v3P65Nc4hOH7Ns2eJR1k5IsMH7rVKJc5bXFlPvZw2U0RHSYUzsqeI7Gmu5uqJFizEEdO
 pnWSk264Sf8ZXCTz5onFLZMJaX6b2C7bZRS1sH+SufSRuH8IdvJEP35M=
X-Received: by 2002:a05:6a00:4f94:b0:714:2d92:39db with SMTP id
 d2e1a72fcca58-715bfff985bmr3440378b3a.16.1724771436492; 
 Tue, 27 Aug 2024 08:10:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmiDJHM76Y13C5DYfMIOZ/jwgV5kOIAra5Gn0srPjDkXgH00hJlfr7+YaxSbfw7ucDvYkfqg==
X-Received: by 2002:a05:6a00:4f94:b0:714:2d92:39db with SMTP id
 d2e1a72fcca58-715bfff985bmr3440342b3a.16.1724771436112; 
 Tue, 27 Aug 2024 08:10:36 -0700 (PDT)
Received: from localhost.localdomain ([115.96.30.188])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7143430636esm8679062b3a.165.2024.08.27.08.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 08:10:35 -0700 (PDT)
From: Ani Sinha <anisinha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ani Sinha <anisinha@redhat.com>, qemu-trivial@nongnu.org,
 zhao1.liu@intel.com, armbru@redhat.com, kvm@vger.kernel.org,
 qemu-devel@nongnu.org
Subject: [PATCH v4 1/2] kvm: replace fprintf with error_report/printf() in
 kvm_init()
Date: Tue, 27 Aug 2024 20:40:21 +0530
Message-ID: <20240827151022.37992-2-anisinha@redhat.com>
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
X-List-Received-Date: Tue, 27 Aug 2024 15:10:43 -0000

error_report() is more appropriate for error situations. Replace fprintf with
error_report. Cosmetic. No functional change.

CC: qemu-trivial@nongnu.org
CC: zhao1.liu@intel.com
CC: armbru@redhat.com
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Signed-off-by: Ani Sinha <anisinha@redhat.com>
---
 accel/kvm/kvm-all.c | 40 ++++++++++++++++++----------------------
 1 file changed, 18 insertions(+), 22 deletions(-)

changelog:
v2: fix a bug.
v3: replace one instance of error_report() with error_printf(). added tags.
v4: changes suggested by Markus.

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 75d11a07b2..d9f477bb06 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2427,7 +2427,7 @@ static int kvm_init(MachineState *ms)
     QLIST_INIT(&s->kvm_parked_vcpus);
     s->fd = qemu_open_old(s->device ?: "/dev/kvm", O_RDWR);
     if (s->fd == -1) {
-        fprintf(stderr, "Could not access KVM kernel module: %m\n");
+        error_report("Could not access KVM kernel module: %m");
         ret = -errno;
         goto err;
     }
@@ -2437,13 +2437,13 @@ static int kvm_init(MachineState *ms)
         if (ret >= 0) {
             ret = -EINVAL;
         }
-        fprintf(stderr, "kvm version too old\n");
+        error_report("kvm version too old");
         goto err;
     }
 
     if (ret > KVM_API_VERSION) {
         ret = -EINVAL;
-        fprintf(stderr, "kvm version not supported\n");
+        error_report("kvm version not supported");
         goto err;
     }
 
@@ -2488,26 +2488,22 @@ static int kvm_init(MachineState *ms)
     } while (ret == -EINTR);
 
     if (ret < 0) {
-        fprintf(stderr, "ioctl(KVM_CREATE_VM) failed: %d %s\n", -ret,
-                strerror(-ret));
+        error_report("ioctl(KVM_CREATE_VM) failed: %d %s", -ret,
+                    strerror(-ret));
 
 #ifdef TARGET_S390X
         if (ret == -EINVAL) {
-            fprintf(stderr,
-                    "Host kernel setup problem detected. Please verify:\n");
-            fprintf(stderr, "- for kernels supporting the switch_amode or"
-                    " user_mode parameters, whether\n");
-            fprintf(stderr,
-                    "  user space is running in primary address space\n");
-            fprintf(stderr,
-                    "- for kernels supporting the vm.allocate_pgste sysctl, "
-                    "whether it is enabled\n");
+            error_printf("Host kernel setup problem detected. Please verify:");
+            error_printf("\n- for kernels supporting the"
+                        " switch_amode or user_mode parameters, whether");
+            error_printf(" user space is running in primary address space\n");
+            error_printf("- for kernels supporting the vm.allocate_pgste "
+                         "sysctl, whether it is enabled\n");
         }
 #elif defined(TARGET_PPC)
         if (ret == -EINVAL) {
-            fprintf(stderr,
-                    "PPC KVM module is not loaded. Try modprobe kvm_%s.\n",
-                    (type == 2) ? "pr" : "hv");
+            error_printf("PPC KVM module is not loaded. Try modprobe kvm_%s.\n",
+                        (type == 2) ? "pr" : "hv");
         }
 #endif
         goto err;
@@ -2526,9 +2522,9 @@ static int kvm_init(MachineState *ms)
                         nc->name, nc->num, soft_vcpus_limit);
 
             if (nc->num > hard_vcpus_limit) {
-                fprintf(stderr, "Number of %s cpus requested (%d) exceeds "
-                        "the maximum cpus supported by KVM (%d)\n",
-                        nc->name, nc->num, hard_vcpus_limit);
+                error_report("Number of %s cpus requested (%d) exceeds "
+                             "the maximum cpus supported by KVM (%d)",
+                             nc->name, nc->num, hard_vcpus_limit);
                 exit(1);
             }
         }
@@ -2542,8 +2538,8 @@ static int kvm_init(MachineState *ms)
     }
     if (missing_cap) {
         ret = -EINVAL;
-        fprintf(stderr, "kvm does not support %s\n%s",
-                missing_cap->name, upgrade_note);
+        error_printf("kvm does not support %s\n%s",
+                     missing_cap->name, upgrade_note);
         goto err;
     }
 
-- 
2.42.0


