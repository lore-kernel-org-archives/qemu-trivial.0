Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1swlGs-0007R9-6z
	for mharc-qemu-trivial@gnu.org; Fri, 04 Oct 2024 12:35:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1swlGS-0006XS-N9
 for qemu-trivial@nongnu.org; Fri, 04 Oct 2024 12:34:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1swlGQ-0006Ac-I9
 for qemu-trivial@nongnu.org; Fri, 04 Oct 2024 12:34:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728059685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VosZkryxUSxT370xwj32ayTSBQobfpGY1xY5tUlU3gw=;
 b=HsUOG/JbhoxDMQweTK39FBweJc32ZlqfAZiny/XurBb53KygnhWV3y9OnmI6FY1pVBfKjR
 t2Fy17vl9i3dhUKfzoA/F+yAuO2S5U8CfrRC0cin4e98kP0kttN3qZBVYTQE8jS2AekxM3
 zQKIFrfHDFaeyO68v0wjlIohm1ePp38=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-SzRenVYtN5m-JxbVvEeB0g-1; Fri, 04 Oct 2024 12:34:44 -0400
X-MC-Unique: SzRenVYtN5m-JxbVvEeB0g-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-37cda7514f8so1225953f8f.0
 for <qemu-trivial@nongnu.org>; Fri, 04 Oct 2024 09:34:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728059683; x=1728664483;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VosZkryxUSxT370xwj32ayTSBQobfpGY1xY5tUlU3gw=;
 b=VCvvinUnFpZZhWUPS7pHepF49+fgjfs5x8+wTpo4HNl31FIcSeyENyZaXOmS2MjsSc
 ++TNBAZoZ96MKLoXMKuXqZyGT/UsJRIHj/ehWDRREjwUj8ImoaxCliNPOygngLRnZscF
 VpD4Z5TgKn4c4pQbc0gUBi+Qyf4/DdwRdoUluWe2EL60tM+bqqWlQYthyr8xzqx0Jjej
 ISK3HLq/0HUmkX/oG9AXOyU0vU9T8ibSbRMxoNPe2LNDO0sBx+apLnpaQ44M0LKDWtV1
 rmc4v3ShTibxI65tOWV9orIZ/hGqfg2Tyr0GTthHflkjmrKJjKmKXnAqZpV+MitKdnyg
 rviw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWESa/0Er8z1oGcj3QQ6/Gl/tM8GMnZLjdSunzCyoaLRuP5NpSNLXi0zuh6dZJu9y2Y10WA6Nwc+HFeq+I=@nongnu.org
X-Gm-Message-State: AOJu0YxMbq1EH5+AF36YiJ2YzXDhCO2ycwACJxRvci2BXKzNHVutQGW9
 L0QYRTEwniUHaoL7k2tMJpP0oqThsNKIQUTz81gwzO4PYfase/Pq1ea71Hb4TAcI6/LzXs72iFk
 eaKkmemt79xB70esD6H/xExbl9c8saRho5jhqiwiN3+vJ4c4pXmOhJPM=
X-Received: by 2002:adf:e412:0:b0:37c:fee5:bfc7 with SMTP id
 ffacd0b85a97d-37d049ef115mr5009000f8f.15.1728059683261; 
 Fri, 04 Oct 2024 09:34:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHt/dY/luTgOjLNty7OoWj/vwXkvJeOQCoUWpgNv4LcozFxRBS5GCivVI8McZeiBBDzVYoZLQ==
X-Received: by 2002:adf:e412:0:b0:37c:fee5:bfc7 with SMTP id
 ffacd0b85a97d-37d049ef115mr5008985f8f.15.1728059682812; 
 Fri, 04 Oct 2024 09:34:42 -0700 (PDT)
Received: from avogadro.local ([151.95.43.71])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f86a20537sm19461625e9.15.2024.10.04.09.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 09:34:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Ani Sinha <anisinha@redhat.com>, qemu-trivial@nongnu.org,
 zhao1.liu@intel.com, armbru@redhat.com
Subject: [PULL 08/23] kvm: replace fprintf with error_report()/printf() in
 kvm_init()
Date: Fri,  4 Oct 2024 18:34:00 +0200
Message-ID: <20241004163415.951106-9-pbonzini@redhat.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20241004163415.951106-1-pbonzini@redhat.com>
References: <20241004163415.951106-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.146,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-List-Received-Date: Fri, 04 Oct 2024 16:34:51 -0000

From: Ani Sinha <anisinha@redhat.com>

error_report() is more appropriate for error situations. Replace fprintf with
error_report() and error_printf() as appropriate. Some improvement in error
reporting also happens as a part of this change. For example:

From:
$ ./qemu-system-x86_64 --accel kvm
Could not access KVM kernel module: No such file or directory

To:
$ ./qemu-system-x86_64 --accel kvm
qemu-system-x86_64: --accel kvm: Could not access KVM kernel module: No such file or directory

CC: qemu-trivial@nongnu.org
CC: zhao1.liu@intel.com
CC: armbru@redhat.com
Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Ani Sinha <anisinha@redhat.com>
Link: https://lore.kernel.org/r/20240828124539.62672-1-anisinha@redhat.com
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 accel/kvm/kvm-all.c | 40 ++++++++++++++++++----------------------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
index fe4cd721d9b..4c920b7bfe7 100644
--- a/accel/kvm/kvm-all.c
+++ b/accel/kvm/kvm-all.c
@@ -2423,7 +2423,7 @@ static int kvm_init(MachineState *ms)
     QLIST_INIT(&s->kvm_parked_vcpus);
     s->fd = qemu_open_old(s->device ?: "/dev/kvm", O_RDWR);
     if (s->fd == -1) {
-        fprintf(stderr, "Could not access KVM kernel module: %m\n");
+        error_report("Could not access KVM kernel module: %m");
         ret = -errno;
         goto err;
     }
@@ -2433,13 +2433,13 @@ static int kvm_init(MachineState *ms)
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
 
@@ -2484,26 +2484,22 @@ static int kvm_init(MachineState *ms)
     } while (ret == -EINTR);
 
     if (ret < 0) {
-        fprintf(stderr, "ioctl(KVM_CREATE_VM) failed: %d %s\n", -ret,
-                strerror(-ret));
+        error_report("ioctl(KVM_CREATE_VM) failed: %s", strerror(-ret));
 
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
+            error_printf("Host kernel setup problem detected."
+                         " Please verify:\n");
+            error_printf("- for kernels supporting the"
+                        " switch_amode or user_mode parameters, whether");
+            error_printf(" user space is running in primary address space\n");
+            error_printf("- for kernels supporting the vm.allocate_pgste"
+                         " sysctl, whether it is enabled\n");
         }
 #elif defined(TARGET_PPC)
         if (ret == -EINVAL) {
-            fprintf(stderr,
-                    "PPC KVM module is not loaded. Try modprobe kvm_%s.\n",
-                    (type == 2) ? "pr" : "hv");
+            error_printf("PPC KVM module is not loaded. Try modprobe kvm_%s.\n",
+                         (type == 2) ? "pr" : "hv");
         }
 #endif
         goto err;
@@ -2522,9 +2518,9 @@ static int kvm_init(MachineState *ms)
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
@@ -2538,8 +2534,8 @@ static int kvm_init(MachineState *ms)
     }
     if (missing_cap) {
         ret = -EINVAL;
-        fprintf(stderr, "kvm does not support %s\n%s",
-                missing_cap->name, upgrade_note);
+        error_report("kvm does not support %s", missing_cap->name);
+        error_printf("%s", upgrade_note);
         goto err;
     }
 
-- 
2.46.1


