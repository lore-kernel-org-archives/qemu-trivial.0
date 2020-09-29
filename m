Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNRbc-0001UD-Ou
	for mharc-qemu-trivial@gnu.org; Tue, 29 Sep 2020 22:12:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <snizovtsev@gmail.com>)
 id 1kNP4N-0007zo-06; Tue, 29 Sep 2020 19:30:03 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:41506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <snizovtsev@gmail.com>)
 id 1kNP4K-0001Gf-74; Tue, 29 Sep 2020 19:30:02 -0400
Received: by mail-ed1-x542.google.com with SMTP id l24so3543999edj.8;
 Tue, 29 Sep 2020 16:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:mime-version:date:message-id:subject:to:cc;
 bh=KhSGaXrogwd/Fi04sIgiySppfiPQ9ooG3Z4HZ+ITPnI=;
 b=UjQrQxfUBiRcU99Fg63dZOJ1z779cgXwXivVVDdyn9y0dXNdHX1jILgA54bVfqJWJ8
 mmW9nSRTP7YoFCOY5qvQ+e1853pfgTY3kWQV9vbORrUoMFFgwiGV/r88ggZKJdZ4kDpY
 2S4pvIEJaZyLkUwZBudQ3INUSmurGShLGJhztcevbOAOBg4Wd8xVKzBVYTkMg5cMxoRq
 xm/ruIabkA+Ze5nx0kowEgV2Hpm8zQrDjNeIDDjwpSZkqmxmCKYp6AEIj4rax/SUizKL
 MbNn6zu2d6J6wlEQH2k9p5k1uthfjHzvYPg9WV/LdfIvqb8vw3c5ZTwA7KtyqPpXHntA
 HlAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:mime-version:date:message-id:subject:to:cc;
 bh=KhSGaXrogwd/Fi04sIgiySppfiPQ9ooG3Z4HZ+ITPnI=;
 b=uOqPz57BVrWH++VKUuzvg0dgzB7yVCaOqEMrCf/fvH5Nnuk2SgGWW9mcMGDzIM1gmo
 NST26CXBWPm1O0itsKDEFaFajAhehwqjL/RtqN0JBWYF3CXKTGX2ZvfVkC2azJIqC/Y+
 syTlyAA6C1l8htRNvE3bjwM3gb/T1dxKpr1knTEz9+IG6V7+tTAhJeAnqp98tHT8yisp
 YfzyU0FJVKHK30m2fA8V7m49Sj4a2kpjysh2bfkZh5Ze75IQmZrFDkj6C+/XXZ5ai2Aq
 bnJMkZ7ZF4XgFdfh7Ttk4XJsV+tOkFiczOxxcd7cQ4LckS4+HZD0ccJPJvoFokSm+tkn
 HJRg==
X-Gm-Message-State: AOAM5319CovXs2mxCe+NYkr90ZB99zvnBEykRpjUp+MQHQQ47dJJ/MDM
 06wbv622k/kBva9aIQ33vnxKDjrWf3FO6hJ9IbE0T42R0g+gzg==
X-Google-Smtp-Source: ABdhPJxO2U15arn8GlgktMdGncuCePagDALHi+zkk0JOJe1EGXPtSMJv5EPgHC+dRJZlH0WRkwhOEw4Gu+EcPO8OUbY=
X-Received: by 2002:aa7:d606:: with SMTP id c6mr5990371edr.370.1601422197377; 
 Tue, 29 Sep 2020 16:29:57 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 29 Sep 2020 16:29:56 -0700
From: Sergey Nizovtsev <snizovtsev@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Date: Tue, 29 Sep 2020 16:29:56 -0700
Message-ID: <CAHOaf94Mq-YNY12NaANg=3Tqxd1UFFhVgxuSD7PRHgN0MyUpMg@mail.gmail.com>
Subject: [PATCH] qom: fix objects with improper parent type
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Sergey Nizovtsev <snizovtsev@gmail.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Ben Warren <ben@skyportsystems.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=snizovtsev@gmail.com; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 29 Sep 2020 22:12:31 -0400
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
X-List-Received-Date: Tue, 29 Sep 2020 23:30:06 -0000

Some objects accidentally inherit ObjectClass instead of Object.
They compile silently but may crash after downcasting.

In this patch, we introduce a coccinelle script to find broken
declarations and fix them manually with proper base type.

Signed-off-by: Sergey Nizovtsev <snizovtsev@gmail.com>
---
 scripts/coccinelle/qobject-parent-type.cocci | 26 ++++++++++++++++++++
 include/hw/acpi/vmgenid.h                    |  2 +-
 include/hw/misc/vmcoreinfo.h                 |  2 +-
 include/net/can_host.h                       |  2 +-
 MAINTAINERS                                  |  1 +
 5 files changed, 30 insertions(+), 3 deletions(-)
 create mode 100644 scripts/coccinelle/qobject-parent-type.cocci

diff --git a/scripts/coccinelle/qobject-parent-type.cocci
b/scripts/coccinelle/qobject-parent-type.cocci
new file mode 100644
index 0000000000..9afb3edd97
--- /dev/null
+++ b/scripts/coccinelle/qobject-parent-type.cocci
@@ -0,0 +1,26 @@
+// Highlight object declarations that don't look like object class but
+// accidentally inherit from it.
+
+@match@
+identifier obj_t, fld;
+type parent_t =~ ".*Class$";
+@@
+struct obj_t {
+    parent_t fld;
+    ...
+};
+
+@script:python filter depends on match@
+obj_t << match.obj_t;
+@@
+is_class_obj = obj_t.endswith('Class')
+cocci.include_match(not is_class_obj)
+
+@replacement depends on filter@
+identifier match.obj_t, match.fld;
+type match.parent_t;
+@@
+struct obj_t {
+*   parent_t fld;
+    ...
+};
diff --git a/include/hw/acpi/vmgenid.h b/include/hw/acpi/vmgenid.h
index d50fbacb8e..cb4ad37fc5 100644
--- a/include/hw/acpi/vmgenid.h
+++ b/include/hw/acpi/vmgenid.h
@@ -19,7 +19,7 @@
 OBJECT_DECLARE_SIMPLE_TYPE(VmGenIdState, VMGENID)

 struct VmGenIdState {
-    DeviceClass parent_obj;
+    DeviceState parent_obj;
     QemuUUID guid;                /* The 128-bit GUID seen by the guest */
     uint8_t vmgenid_addr_le[8];   /* Address of the GUID (little-endian) */
 };
diff --git a/include/hw/misc/vmcoreinfo.h b/include/hw/misc/vmcoreinfo.h
index ebada6617a..0b7b55d400 100644
--- a/include/hw/misc/vmcoreinfo.h
+++ b/include/hw/misc/vmcoreinfo.h
@@ -24,7 +24,7 @@ DECLARE_INSTANCE_CHECKER(VMCoreInfoState, VMCOREINFO,
 typedef struct fw_cfg_vmcoreinfo FWCfgVMCoreInfo;

 struct VMCoreInfoState {
-    DeviceClass parent_obj;
+    DeviceState parent_obj;

     bool has_vmcoreinfo;
     FWCfgVMCoreInfo vmcoreinfo;
diff --git a/include/net/can_host.h b/include/net/can_host.h
index 4e3ce3f954..caab71bdda 100644
--- a/include/net/can_host.h
+++ b/include/net/can_host.h
@@ -35,7 +35,7 @@
 OBJECT_DECLARE_TYPE(CanHostState, CanHostClass, CAN_HOST)

 struct CanHostState {
-    ObjectClass oc;
+    Object oc;

     CanBusState *bus;
     CanBusClientState bus_client;
diff --git a/MAINTAINERS b/MAINTAINERS
index 5eed1e692b..2160b8196a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2402,6 +2402,7 @@ F: qobject/
 F: include/qapi/qmp/
 X: include/qapi/qmp/dispatch.h
 F: scripts/coccinelle/qobject.cocci
+F: scripts/coccinelle/qobject-parent-type.cocci
 F: tests/check-qdict.c
 F: tests/check-qjson.c
 F: tests/check-qlist.c
-- 
2.28.0

