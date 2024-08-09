Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1scHdJ-0002dy-3A
	for mharc-qemu-trivial@gnu.org; Fri, 09 Aug 2024 00:53:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1scHdG-0002bQ-V5
 for qemu-trivial@nongnu.org; Fri, 09 Aug 2024 00:53:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1scHdF-0008GS-E9
 for qemu-trivial@nongnu.org; Fri, 09 Aug 2024 00:53:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723179220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FfU6XyO2Jk8i4FOiwyJKt1ccqOlc2vNSvzjRNpOVJfs=;
 b=C/pVzW0P36GZJ8GxHZBaRSxMrky/DOTeO0k2v65JXK4SfDX29BfqBDkmxMCPf809w2cedT
 S+Jq0kf2gqXC6pW8lXtArgZkZPxSx4tEjsR4PlkEcJe/HjHOedHA+bahy708hjrUOMsvwx
 IkelIcFogyZJ+bcVhFJDPcs+VQ7SBpY=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-wHISfiEVOAaxdtkMQkrrcw-1; Fri, 09 Aug 2024 00:53:38 -0400
X-MC-Unique: wHISfiEVOAaxdtkMQkrrcw-1
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-7a30753fe30so1643552a12.3
 for <qemu-trivial@nongnu.org>; Thu, 08 Aug 2024 21:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723179218; x=1723784018;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FfU6XyO2Jk8i4FOiwyJKt1ccqOlc2vNSvzjRNpOVJfs=;
 b=Tti3nRBP9oB7xCTKsx6L7/nidEuglBFZmKKtoRIrD75K8I1VEU4zLzat9vm6iza5ti
 eXHCSTgyqmqujUsaE7wUuY6jjta+ZUX1C9F75fgcFlWKDMqfs/sd75PY/mFXAs0iTk8a
 z+vwsUVNvtLWXwf6jVr+ZfNP4icorETMzUTQpJNox+pxKOQFT8y9LvRWTZx6nVUvjTY+
 7hXHFM5tZy3lqt3wXEahfbxQC+nxkVBtaWxCx8Qk1A7uqfdGUNQt6SZWgkcNq/KFK+C+
 uUmGwl2PNQQqkovpUJZMJ1fYqczEtdC9Pqs4p0jElM5/YLDBuvJssm8XESSsTh00mdbp
 /HVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnepDwE8+eU4jCp8I5uS1uMOfQZVrsb+k431qyvtHnfD9mrtpKXD2H2kBVZkCtDaEn6ys2YeXeLcHbLRAnh4Rtt0S725nL6A==
X-Gm-Message-State: AOJu0YxsMGV/nHNKmf6wO2y6kNC23Qux/hknVG5N3ORDG0XbgPr2SE0r
 9C2BEwvq0qGuBZuCBd7dJzfjNFPlkUldw/nVf/F7zU6o7/b1MM4ZckmYCvrgn4ECwZaZlyJoVox
 lIpeVVIrVXAAsveZrEJrlzE3henN2iMZhElrfrNCuxChnTpaGjK8hFvU=
X-Received: by 2002:a05:6a21:3993:b0:1c0:f5fa:d1e9 with SMTP id
 adf61e73a8af0-1c89fce5652mr592194637.15.1723179217720; 
 Thu, 08 Aug 2024 21:53:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXIKuqH70u2Lx+GwuqOZ8MGvHc3rF9cXAtufWKuQhkfNhxF7aPPB1+YhD3cDXDoG1FQCrEFQ==
X-Received: by 2002:a05:6a21:3993:b0:1c0:f5fa:d1e9 with SMTP id
 adf61e73a8af0-1c89fce5652mr592182637.15.1723179217298; 
 Thu, 08 Aug 2024 21:53:37 -0700 (PDT)
Received: from localhost.localdomain ([115.96.114.241])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-1ff58f6a540sm133516895ad.118.2024.08.08.21.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 21:53:36 -0700 (PDT)
From: Ani Sinha <anisinha@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ani Sinha <anisinha@redhat.com>, qemu-trivial@nongnu.org,
 zhao1.liu@intel.com, kvm@vger.kernel.org, qemu-devel@nongnu.org
Subject: [PATCH 1/2] kvm: replace fprintf with error_report() in kvm_init()
 for error conditions
Date: Fri,  9 Aug 2024 10:21:52 +0530
Message-ID: <20240809045153.1744397-2-anisinha@redhat.com>
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
X-List-Received-Date: Fri, 09 Aug 2024 04:53:43 -0000

error_report() is more appropriate for error situations. Replace fprintf with
error_report. Cosmetic. No functional change.

CC: qemu-trivial@nongnu.org
CC: zhao1.liu@intel.com
Signed-off-by: Ani Sinha <anisinha@redhat.com>
---
 accel/kvm/kvm-all.c | 42 +++++++++++++++++++-----------------------
 1 file changed, 19 insertions(+), 23 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index 75d11a07b2..899b5264e3 100644
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
 
@@ -2488,30 +2488,26 @@ static int kvm_init(MachineState *ms)
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
-        goto err;
     }
+        goto err;
 
     s->vmfd = ret;
 
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


