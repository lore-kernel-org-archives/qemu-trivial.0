Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kb5A0-0003BJ-Uh
	for mharc-qemu-trivial@gnu.org; Fri, 06 Nov 2020 12:04:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kb59y-00037g-PS
 for qemu-trivial@nongnu.org; Fri, 06 Nov 2020 12:04:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:29558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kb59x-0001zm-1d
 for qemu-trivial@nongnu.org; Fri, 06 Nov 2020 12:04:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604682260;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K3wfZcCwMKslEFjXlVJ3jqNVIPb5NGo7EYNvTAtaW0Y=;
 b=CkJmqr5rq/S0c5B8iLC+5esbs1LfG2GpD7iT6y0xtPh0Hu6TvGs7r7W2cUYgh8P+SwWo9B
 SvN2CjXcw/nYSBjoNRmB/w3hDg5bqGgR2QXwxFGu7R9oPUSkk4KKwpXav1aexq3wYr2XAB
 w0DLEXsk8ehFsfFC9m27JVw64nirNFY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-5LzCHNByOQ-Cj8_VNUoeKQ-1; Fri, 06 Nov 2020 12:04:18 -0500
X-MC-Unique: 5LzCHNByOQ-Cj8_VNUoeKQ-1
Received: by mail-wm1-f72.google.com with SMTP id s85so660395wme.3
 for <qemu-trivial@nongnu.org>; Fri, 06 Nov 2020 09:04:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K3wfZcCwMKslEFjXlVJ3jqNVIPb5NGo7EYNvTAtaW0Y=;
 b=sJXtrzG0m48d/5WqnFzu9iawG3nZvtYjlVwWYGYdf7osRiHhE4/JYXuKY5UuotBVcF
 KRqhBz4XP6PCasa5rUOJMdYs0NReJgivjH5/Y0WIjgxjrL6OXT5uCxeNNHdOsTT5omfa
 fKG21ajJtY5uxyrMkH5MFfcLIPnTO1XrvWjGjZIB6e42eG9Tm0uLV4d7TT3mDcHoJS5D
 JCfLnX1qtQitc1TxEL1eOHFEIFnTd/oWQSzG1T44muKkTmlcmSnYykxDMQjaARY0EHhK
 LGhg/OXwMEl8c4vYsWOCXBneITjIVzg6MKleufDEqRgyBtBaVJzAIR7Joch3D4NfzclJ
 njMw==
X-Gm-Message-State: AOAM5330fBHpmBdOur6AMBDKaeaa3aRaGuE30L0/XO7G7wXKLtP2bElD
 jlSQwGY7p8YjnzD8m7c5zda+6GSqarFn9Ji9x5ViROO2XU8xL6w0/EO8HdAPToWmf26hZ7A8KDE
 wp2QX7M0IempAH8YHyA==
X-Received: by 2002:adf:f104:: with SMTP id r4mr3786245wro.202.1604682257496; 
 Fri, 06 Nov 2020 09:04:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwrk2TqWGpdD7Y2fa525+AMJB0ebORXfqExvGopeDXyoNqS1xNofDTgfu3VzWwoXdNxVQ3rfA==
X-Received: by 2002:adf:f104:: with SMTP id r4mr3786210wro.202.1604682257274; 
 Fri, 06 Nov 2020 09:04:17 -0800 (PST)
Received: from localhost.localdomain (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id v123sm3330004wme.7.2020.11.06.09.04.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 09:04:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-trivial@nongnu.org, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH-for-6.0 1/2] hw/scsi/scsi-disk: Rename type as TYPE_SCSI_DISK
Date: Fri,  6 Nov 2020 18:04:03 +0100
Message-Id: <20201106170404.4130486-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201106170404.4130486-1-philmd@redhat.com>
References: <20201106170404.4130486-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/06 06:30:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Fri, 06 Nov 2020 17:04:23 -0000

Rename TYPE_SCSI_DISK without the '_BASE' suffix to match
the other abstract types in the codebase.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/scsi/scsi-disk.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
index e859534eaf3..d2b9cb28da1 100644
--- a/hw/scsi/scsi-disk.c
+++ b/hw/scsi/scsi-disk.c
@@ -53,9 +53,9 @@
 #define DEFAULT_MAX_UNMAP_SIZE      (1 * GiB)
 #define DEFAULT_MAX_IO_SIZE         INT_MAX     /* 2 GB - 1 block */
 
-#define TYPE_SCSI_DISK_BASE         "scsi-disk-base"
+#define TYPE_SCSI_DISK              "scsi-disk-base"
 
-OBJECT_DECLARE_TYPE(SCSIDiskState, SCSIDiskClass, SCSI_DISK_BASE)
+OBJECT_DECLARE_TYPE(SCSIDiskState, SCSIDiskClass, SCSI_DISK)
 
 struct SCSIDiskClass {
     SCSIDeviceClass parent_class;
@@ -2956,7 +2956,7 @@ BlockAIOCB *scsi_dma_writev(int64_t offset, QEMUIOVector *iov,
 static void scsi_disk_base_class_initfn(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
-    SCSIDiskClass *sdc = SCSI_DISK_BASE_CLASS(klass);
+    SCSIDiskClass *sdc = SCSI_DISK_CLASS(klass);
 
     dc->fw_name = "disk";
     dc->reset = scsi_disk_reset;
@@ -2966,7 +2966,7 @@ static void scsi_disk_base_class_initfn(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo scsi_disk_base_info = {
-    .name          = TYPE_SCSI_DISK_BASE,
+    .name          = TYPE_SCSI_DISK,
     .parent        = TYPE_SCSI_DEVICE,
     .class_init    = scsi_disk_base_class_initfn,
     .instance_size = sizeof(SCSIDiskState),
@@ -3036,7 +3036,7 @@ static void scsi_hd_class_initfn(ObjectClass *klass, void *data)
 
 static const TypeInfo scsi_hd_info = {
     .name          = "scsi-hd",
-    .parent        = TYPE_SCSI_DISK_BASE,
+    .parent        = TYPE_SCSI_DISK,
     .class_init    = scsi_hd_class_initfn,
 };
 
@@ -3067,7 +3067,7 @@ static void scsi_cd_class_initfn(ObjectClass *klass, void *data)
 
 static const TypeInfo scsi_cd_info = {
     .name          = "scsi-cd",
-    .parent        = TYPE_SCSI_DISK_BASE,
+    .parent        = TYPE_SCSI_DISK,
     .class_init    = scsi_cd_class_initfn,
 };
 
@@ -3090,7 +3090,7 @@ static void scsi_block_class_initfn(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     SCSIDeviceClass *sc = SCSI_DEVICE_CLASS(klass);
-    SCSIDiskClass *sdc = SCSI_DISK_BASE_CLASS(klass);
+    SCSIDiskClass *sdc = SCSI_DISK_CLASS(klass);
 
     sc->realize      = scsi_block_realize;
     sc->alloc_req    = scsi_block_new_request;
@@ -3106,7 +3106,7 @@ static void scsi_block_class_initfn(ObjectClass *klass, void *data)
 
 static const TypeInfo scsi_block_info = {
     .name          = "scsi-block",
-    .parent        = TYPE_SCSI_DISK_BASE,
+    .parent        = TYPE_SCSI_DISK,
     .class_init    = scsi_block_class_initfn,
 };
 #endif
@@ -3146,7 +3146,7 @@ static void scsi_disk_class_initfn(ObjectClass *klass, void *data)
 
 static const TypeInfo scsi_disk_info = {
     .name          = "scsi-disk",
-    .parent        = TYPE_SCSI_DISK_BASE,
+    .parent        = TYPE_SCSI_DISK,
     .class_init    = scsi_disk_class_initfn,
 };
 
-- 
2.26.2


