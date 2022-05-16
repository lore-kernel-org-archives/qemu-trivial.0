Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nqhgf-0005Zc-SC
	for mharc-qemu-trivial@gnu.org; Mon, 16 May 2022 16:51:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhge-0005XQ-Lq
 for qemu-trivial@nongnu.org; Mon, 16 May 2022 16:51:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhgc-0006Po-UG
 for qemu-trivial@nongnu.org; Mon, 16 May 2022 16:51:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7SkfgM5LP5kRZHpaFT+JBmZUEdF/ThWL8FHFjzYg3vs=;
 b=RsyJsVk13hyUPPa2fOXizVypAyTEEK+b/c+fgsAwpZSF3cNgHiP1d/U56Gg45sF6yWpZ2i
 r7QpmtxAg8XvL1OZZYUhxV83Jk9/aSBwV3oZC7QPCpOsYHC0GFziTi+nJc1vQ1cnFuTRjF
 cWBMGrO47SwphehBuwzGSMefifxz5pc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-176-1OZ6wqBdMO6eqRrV6H_V1g-1; Mon, 16 May 2022 16:51:25 -0400
X-MC-Unique: 1OZ6wqBdMO6eqRrV6H_V1g-1
Received: by mail-ed1-f70.google.com with SMTP id
 q12-20020a056402040c00b0042a84f9939dso4546383edv.7
 for <qemu-trivial@nongnu.org>; Mon, 16 May 2022 13:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7SkfgM5LP5kRZHpaFT+JBmZUEdF/ThWL8FHFjzYg3vs=;
 b=Moss3KmiCQcDXMtb4QOfTIgizCs+uJdK4sqYvBNbn97VMIrB+jqboA19XnKxneIIxG
 zQNNgEoJ1xkC1aTxLLgIpayolhkZplW5zw5WC05DCogU8v1DkflTsH1l/b8iMUOHMNlj
 CIERYgEzEEoF0DKnPMGVB8lZEI1Eo9QyyEKeBIc7GENHhdPodaD73GvUMFrxbfxsXZLN
 BOCj6kvDVvHUZikqZO5/3xC+oy7L5SMLWbgt+OCuFVqISDX0kGMQ+wuIfXQRU90c387C
 8QyPgtgoiGE4xWhGrOnzRbzl13SiMWz8UR6z5yokWdZM/7/CZMB0KfzRSZ5+Prxs12qw
 KeQA==
X-Gm-Message-State: AOAM530Q8/saqrGPxQB0dh6wW+e3JvWVSVDGkSaLuZk+KlSa5/FYHi86
 wegP6JLylA17PXR1B88KT2LyrVj2lcFqaYRWFCwyZloXMXZxVkDT5XzNE+LgKMh3F0CcRbz/5CY
 btEQVHx1kBdTCCEOSUQ==
X-Received: by 2002:a17:906:f2c8:b0:6f5:18a1:c410 with SMTP id
 gz8-20020a170906f2c800b006f518a1c410mr16651075ejb.281.1652734283664; 
 Mon, 16 May 2022 13:51:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjrnki4yo/lr+DkL/Z0ghRc0x+D1Pl9UewxGG5nCo0E88FDy3F9dYL61xjp4k5W6a3/p9cyQ==
X-Received: by 2002:a17:906:f2c8:b0:6f5:18a1:c410 with SMTP id
 gz8-20020a170906f2c800b006f518a1c410mr16651055ejb.281.1652734283429; 
 Mon, 16 May 2022 13:51:23 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 ek27-20020a056402371b00b0042617ba63c0sm5496728edb.74.2022.05.16.13.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:51:22 -0700 (PDT)
Date: Mon, 16 May 2022 16:51:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org
Subject: [PULL v2 21/86] hw/cxl/device: Add some trivial commands
Message-ID: <20220516204913.542894-22-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Mon, 16 May 2022 20:51:28 -0000

From: Ben Widawsky <ben.widawsky@intel.com>

GET_FW_INFO and GET_PARTITION_INFO, for this emulation, is equivalent to
info already returned in the IDENTIFY command. To have a more robust
implementation, add those.

Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Message-Id: <20220429144110.25167-20-Jonathan.Cameron@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/cxl/cxl-mailbox-utils.c | 69 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index 4ae0561dfc..c8188d7087 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -10,6 +10,7 @@
 #include "qemu/osdep.h"
 #include "hw/cxl/cxl.h"
 #include "hw/pci/pci.h"
+#include "qemu/cutils.h"
 #include "qemu/log.h"
 #include "qemu/uuid.h"
 
@@ -44,6 +45,8 @@ enum {
         #define CLEAR_RECORDS   0x1
         #define GET_INTERRUPT_POLICY   0x2
         #define SET_INTERRUPT_POLICY   0x3
+    FIRMWARE_UPDATE = 0x02,
+        #define GET_INFO      0x0
     TIMESTAMP   = 0x03,
         #define GET           0x0
         #define SET           0x1
@@ -52,6 +55,8 @@ enum {
         #define GET_LOG       0x1
     IDENTIFY    = 0x40,
         #define MEMORY_DEVICE 0x0
+    CCLS        = 0x41,
+        #define GET_PARTITION_INFO     0x0
 };
 
 /* 8.2.8.4.5.1 Command Return Codes */
@@ -114,6 +119,39 @@ DEFINE_MAILBOX_HANDLER_NOP(events_clear_records);
 DEFINE_MAILBOX_HANDLER_ZEROED(events_get_interrupt_policy, 4);
 DEFINE_MAILBOX_HANDLER_NOP(events_set_interrupt_policy);
 
+/* 8.2.9.2.1 */
+static ret_code cmd_firmware_update_get_info(struct cxl_cmd *cmd,
+                                             CXLDeviceState *cxl_dstate,
+                                             uint16_t *len)
+{
+    struct {
+        uint8_t slots_supported;
+        uint8_t slot_info;
+        uint8_t caps;
+        uint8_t rsvd[0xd];
+        char fw_rev1[0x10];
+        char fw_rev2[0x10];
+        char fw_rev3[0x10];
+        char fw_rev4[0x10];
+    } QEMU_PACKED *fw_info;
+    QEMU_BUILD_BUG_ON(sizeof(*fw_info) != 0x50);
+
+    if (cxl_dstate->pmem_size < (256 << 20)) {
+        return CXL_MBOX_INTERNAL_ERROR;
+    }
+
+    fw_info = (void *)cmd->payload;
+    memset(fw_info, 0, sizeof(*fw_info));
+
+    fw_info->slots_supported = 2;
+    fw_info->slot_info = BIT(0) | BIT(3);
+    fw_info->caps = 0;
+    pstrcpy(fw_info->fw_rev1, sizeof(fw_info->fw_rev1), "BWFW VERSION 0");
+
+    *len = sizeof(*fw_info);
+    return CXL_MBOX_SUCCESS;
+}
+
 /* 8.2.9.3.1 */
 static ret_code cmd_timestamp_get(struct cxl_cmd *cmd,
                                   CXLDeviceState *cxl_dstate,
@@ -258,6 +296,33 @@ static ret_code cmd_identify_memory_device(struct cxl_cmd *cmd,
     return CXL_MBOX_SUCCESS;
 }
 
+static ret_code cmd_ccls_get_partition_info(struct cxl_cmd *cmd,
+                                           CXLDeviceState *cxl_dstate,
+                                           uint16_t *len)
+{
+    struct {
+        uint64_t active_vmem;
+        uint64_t active_pmem;
+        uint64_t next_vmem;
+        uint64_t next_pmem;
+    } QEMU_PACKED *part_info = (void *)cmd->payload;
+    QEMU_BUILD_BUG_ON(sizeof(*part_info) != 0x20);
+    uint64_t size = cxl_dstate->pmem_size;
+
+    if (!QEMU_IS_ALIGNED(size, 256 << 20)) {
+        return CXL_MBOX_INTERNAL_ERROR;
+    }
+
+    /* PMEM only */
+    part_info->active_vmem = 0;
+    part_info->next_vmem = 0;
+    part_info->active_pmem = size / (256 << 20);
+    part_info->next_pmem = 0;
+
+    *len = sizeof(*part_info);
+    return CXL_MBOX_SUCCESS;
+}
+
 #define IMMEDIATE_CONFIG_CHANGE (1 << 1)
 #define IMMEDIATE_POLICY_CHANGE (1 << 3)
 #define IMMEDIATE_LOG_CHANGE (1 << 4)
@@ -271,12 +336,16 @@ static struct cxl_cmd cxl_cmd_set[256][256] = {
         cmd_events_get_interrupt_policy, 0, 0 },
     [EVENTS][SET_INTERRUPT_POLICY] = { "EVENTS_SET_INTERRUPT_POLICY",
         cmd_events_set_interrupt_policy, 4, IMMEDIATE_CONFIG_CHANGE },
+    [FIRMWARE_UPDATE][GET_INFO] = { "FIRMWARE_UPDATE_GET_INFO",
+        cmd_firmware_update_get_info, 0, 0 },
     [TIMESTAMP][GET] = { "TIMESTAMP_GET", cmd_timestamp_get, 0, 0 },
     [TIMESTAMP][SET] = { "TIMESTAMP_SET", cmd_timestamp_set, 8, IMMEDIATE_POLICY_CHANGE },
     [LOGS][GET_SUPPORTED] = { "LOGS_GET_SUPPORTED", cmd_logs_get_supported, 0, 0 },
     [LOGS][GET_LOG] = { "LOGS_GET_LOG", cmd_logs_get_log, 0x18, 0 },
     [IDENTIFY][MEMORY_DEVICE] = { "IDENTIFY_MEMORY_DEVICE",
         cmd_identify_memory_device, 0, 0 },
+    [CCLS][GET_PARTITION_INFO] = { "CCLS_GET_PARTITION_INFO",
+        cmd_ccls_get_partition_info, 0, 0 },
 };
 
 void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
-- 
MST


