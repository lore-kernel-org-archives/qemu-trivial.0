Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1scHuT-000249-LK
	for mharc-qemu-trivial@gnu.org; Fri, 09 Aug 2024 01:11:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1scHuS-00022O-9z
 for qemu-trivial@nongnu.org; Fri, 09 Aug 2024 01:11:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1scHuQ-0002lx-Rj
 for qemu-trivial@nongnu.org; Fri, 09 Aug 2024 01:11:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723180285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cqMbqqTDoxkH4lSjzfRzKJ8KXs/o+RTOSJGbYKXw66A=;
 b=VA9AZunXKzoIsuaI9FJOmt9dYIn4JSTkb0HGhqzsSO1uUIhtPOqTa0OhB0e9YBPr51B+Do
 MosfEs/wCN0zBOCyCAbiQh25ZuKuq4t/4gvTxqlGilBCtWvXuMUU6pf/wn4t8hFdcNpLcH
 NRrQh6hcG7Vq2iRiUp9ZZDOdGcLhsjg=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-_52lQn1YMhOoZbjc9Wh96Q-1; Fri, 09 Aug 2024 01:11:23 -0400
X-MC-Unique: _52lQn1YMhOoZbjc9Wh96Q-1
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-70e923f6632so1808625b3a.3
 for <qemu-trivial@nongnu.org>; Thu, 08 Aug 2024 22:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723180282; x=1723785082;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cqMbqqTDoxkH4lSjzfRzKJ8KXs/o+RTOSJGbYKXw66A=;
 b=IHztxXvWXUxyIDP3VAo9EVZYNmyKgbyY0VKyrLWA2makHAJqmcXXrAHi1XVLAkEvZl
 Zuslbwd8ju7qgE+dX77sttfEWXjE8mbyL6WB/OskEcQ9wypVIlr4ObKJMeIbnt//ukO9
 3GKW9AsoDsJM51mmlW6DtjPvrmNKN1l77j8NRrQ/qIbII+lP9SVr2P7Zb70GE39DAipH
 z0J3Ys1gIvhCpyVo5SwlMzsz2+JAeVvSLWy1yCOPKbiYbalLt6oF0uEw9Dmaj32cyAy3
 JIrNZovrotOcc5JNFB4eyeakvx1vUR1bPUzksQUc7XDdUNA2QIOTQiXRjiAVyEb6zAWk
 J7iA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDmMJSBdWUbSQqV17fnnqeSmBXfSWbea2l1htEZuTVvYTZoK2Wk7JbwdDskKF4cLDdEPcMImRRPwBBN5JiXgjb1tvIkZGhJA==
X-Gm-Message-State: AOJu0YwI43eHlUOlHBr3W4KzeOqMl+Lvxp+Q6FUi3Ost7xLIy0uuu8sL
 izfsH1nw8ww8q30ykAm2E2EEp1eP8iGDtju06BFvj2/6wjBLW5yhQIt1GDJPqjcJ9vaSL7DUdqt
 IwBeQkfaaHgoIe5FJPi09WoqXV0oGnP3FPCNr5coXfFW3NHO7Mpaf5P0=
X-Received: by 2002:a05:6a00:855:b0:710:6e83:cd5e with SMTP id
 d2e1a72fcca58-710dc2ccebfmr516745b3a.0.1723180282431; 
 Thu, 08 Aug 2024 22:11:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8t0EAoP7cgCq1cRFAtmK6Tr42nsp3je6iK76kbLnen1NCNIOlxzNdQMxqQhXKXDPa/XxChA==
X-Received: by 2002:a05:6a00:855:b0:710:6e83:cd5e with SMTP id
 d2e1a72fcca58-710dc2ccebfmr516717b3a.0.1723180281966; 
 Thu, 08 Aug 2024 22:11:21 -0700 (PDT)
Received: from localhost.localdomain ([115.96.114.241])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-710cb2e52bfsm1961777b3a.145.2024.08.08.22.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 22:11:21 -0700 (PDT)
From: Ani Sinha <anisinha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ani Sinha <anisinha@redhat.com>, qemu-trivial@nongnu.org,
 zhao1.liu@intel.com, kvm@vger.kernel.org, qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] kvm: replace fprintf with error_report() in kvm_init()
 for error conditions
Date: Fri,  9 Aug 2024 10:40:53 +0530
Message-ID: <20240809051054.1745641-2-anisinha@redhat.com>
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
X-List-Received-Date: Fri, 09 Aug 2024 05:11:28 -0000

error_report() is more appropriate for error situations. Replace fprintf with
error_report. Cosmetic. No functional change.

CC: qemu-trivial@nongnu.org
CC: zhao1.liu@intel.com
Signed-off-by: Ani Sinha <anisinha@redhat.com>
---
 accel/kvm/kvm-all.c | 40 ++++++++++++++++++----------------------
 1 file changed, 18 insertions(+), 22 deletions(-)

changelog:
v2: fix a bug.

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 75d11a07b2..ac168b9663 100644
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
+            error_report("Host kernel setup problem detected. Please verify:");
+            error_report("- for kernels supporting the switch_amode or"
+                        " user_mode parameters, whether");
+            error_report("  user space is running in primary address space");
+            error_report("- for kernels supporting the vm.allocate_pgste "
+                        "sysctl, whether it is enabled");
         }
 #elif defined(TARGET_PPC)
         if (ret == -EINVAL) {
-            fprintf(stderr,
-                    "PPC KVM module is not loaded. Try modprobe kvm_%s.\n",
-                    (type == 2) ? "pr" : "hv");
+            error_report("PPC KVM module is not loaded. Try modprobe kvm_%s.",
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
+        error_report("kvm does not support %s", missing_cap->name);
+        error_report("%s", upgrade_note);
         goto err;
     }
 
-- 
2.45.2


