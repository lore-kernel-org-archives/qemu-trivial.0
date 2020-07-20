Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jxV12-0004YH-7V
	for mharc-qemu-trivial@gnu.org; Mon, 20 Jul 2020 08:35:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jxV11-0004YA-GO
 for qemu-trivial@nongnu.org; Mon, 20 Jul 2020 08:35:31 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:39726
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jxV0y-0004L3-W2
 for qemu-trivial@nongnu.org; Mon, 20 Jul 2020 08:35:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595248527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=q/uhV1U5q10/8WUWYa5p5ciKHqrkEZEYzCIG0nzeD5A=;
 b=cMc7dzMDrD8Uamz2viARky2lTAl3VunVMRnr76iy0fYwjcfsZoMdBoOKTNn6MFbP6zEjuj
 3JRlA+3IQ7g5og3+PYvAbOu6mdALEnCgLNjMPc7iQjfAwSWVPy+HYn83OWKt8PF/5WWGHb
 a17IiE0kBWXdzeG+LYQ7IWQV8LVljOI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-KlYA03pGMj2bNgkTZaaSwQ-1; Mon, 20 Jul 2020 08:35:26 -0400
X-MC-Unique: KlYA03pGMj2bNgkTZaaSwQ-1
Received: by mail-wr1-f70.google.com with SMTP id v4so4935874wrb.2
 for <qemu-trivial@nongnu.org>; Mon, 20 Jul 2020 05:35:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q/uhV1U5q10/8WUWYa5p5ciKHqrkEZEYzCIG0nzeD5A=;
 b=baVy1b6xWS/cYLAqQ9Kd9z3dxqAZW4jLr6yCVxlGE2LHaR//O2h6vXUGheJwRNoIZ3
 l1YQz5wwDu66gj/zMXOcTIViLVejh916eS/gxDR5190oERZz5iCC5sXN69e8E1Qm/lv+
 mYuDvRkJ3XGV2Znv7yJFYeOzb5Hsp7/Dwzpb9vI6/aTpm6aQDEQGR/zIBvNmqtWi/QxX
 cP7s7yFn7VzNgD2l+X/1pVLSxTfdoRB6fzWr25Mu90tKkSbjmQ2Ju4pSzxMHH0FVkQpm
 TLsizbMCqiiUox6NiIwsDvtEO6EFx/fa5X06+PorBBPTDpBG2NjZDLSC8KEIyUf2Znzk
 /YTA==
X-Gm-Message-State: AOAM532Oeq5w7VwNsTG9COFVSULulDeGio4nMP/xPaAPXY7sSqLhpPhj
 HDLSAyBxBgVl7wXH2B8sol3ChiyACr9hNTGKixkzxFb+Xg6HanWOG2Eg+cITTJUg9DJKSjDL2z7
 HtACEIE/Q3E0EcMc7/Q==
X-Received: by 2002:a5d:420b:: with SMTP id n11mr21866546wrq.91.1595248524336; 
 Mon, 20 Jul 2020 05:35:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzcCuRbtZGREE6l53fO4mel3G4he9151rB2DO02N0MpoX2lWgCw/3PDWvnLVmflJUgwUuVLQA==
X-Received: by 2002:a5d:420b:: with SMTP id n11mr21866526wrq.91.1595248524112; 
 Mon, 20 Jul 2020 05:35:24 -0700 (PDT)
Received: from localhost.localdomain
 (138.red-83-57-170.dynamicip.rima-tde.net. [83.57.170.138])
 by smtp.gmail.com with ESMTPSA id m4sm31503282wmi.48.2020.07.20.05.35.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 05:35:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, qemu-trivial@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH-for-5.1] hw/nvram/fw_cfg: Let fw_cfg_add_from_generator()
 return boolean value
Date: Mon, 20 Jul 2020 14:35:21 +0200
Message-Id: <20200720123521.8135-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/20 02:16:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 20 Jul 2020 12:35:31 -0000

Commits b6d7e9b66f..a43770df5d simplified the error propagation.
Similarly to commit 6fd5bef10b "qom: Make functions taking Error**
return bool, not void", let fw_cfg_add_from_generator() return a
boolean value, not void.
This allow to simplify parse_fw_cfg() and fixes the error handling
issue reported by Coverity (CID 1430396):

  In parse_fw_cfg():

    Variable assigned once to a constant guards dead code.

    Local variable local_err is assigned only once, to a constant
    value, making it effectively constant throughout its scope.
    If this is not the intent, examine the logic to see if there
    is a missing assignment that would make local_err not remain
    constant.

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Fixes: Coverity CID 1430396: 'Constant' variable guards dead code (DEADCODE)
Fixes: 6552d87c48 ("softmmu/vl: Let -fw_cfg option take a 'gen_id' argument")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/nvram/fw_cfg.h |  4 +++-
 hw/nvram/fw_cfg.c         | 10 ++++++----
 softmmu/vl.c              |  6 +-----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
index 11feae3177..d90857f092 100644
--- a/include/hw/nvram/fw_cfg.h
+++ b/include/hw/nvram/fw_cfg.h
@@ -302,8 +302,10 @@ void *fw_cfg_modify_file(FWCfgState *s, const char *filename, void *data,
  * will be used; also, a new entry will be added to the file directory
  * structure residing at key value FW_CFG_FILE_DIR, containing the item name,
  * data size, and assigned selector key value.
+ *
+ * Returns: %true on success, %false on error.
  */
-void fw_cfg_add_from_generator(FWCfgState *s, const char *filename,
+bool fw_cfg_add_from_generator(FWCfgState *s, const char *filename,
                                const char *gen_id, Error **errp);
 
 FWCfgState *fw_cfg_init_io_dma(uint32_t iobase, uint32_t dma_iobase,
diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
index 3b1811d3bf..c88aec4341 100644
--- a/hw/nvram/fw_cfg.c
+++ b/hw/nvram/fw_cfg.c
@@ -1032,7 +1032,7 @@ void *fw_cfg_modify_file(FWCfgState *s, const char *filename,
     return NULL;
 }
 
-void fw_cfg_add_from_generator(FWCfgState *s, const char *filename,
+bool fw_cfg_add_from_generator(FWCfgState *s, const char *filename,
                                const char *gen_id, Error **errp)
 {
     ERRP_GUARD();
@@ -1044,20 +1044,22 @@ void fw_cfg_add_from_generator(FWCfgState *s, const char *filename,
     obj = object_resolve_path_component(object_get_objects_root(), gen_id);
     if (!obj) {
         error_setg(errp, "Cannot find object ID '%s'", gen_id);
-        return;
+        return false;
     }
     if (!object_dynamic_cast(obj, TYPE_FW_CFG_DATA_GENERATOR_INTERFACE)) {
         error_setg(errp, "Object ID '%s' is not a '%s' subclass",
                    gen_id, TYPE_FW_CFG_DATA_GENERATOR_INTERFACE);
-        return;
+        return false;
     }
     klass = FW_CFG_DATA_GENERATOR_GET_CLASS(obj);
     array = klass->get_data(obj, errp);
     if (*errp) {
-        return;
+        return false;
     }
     size = array->len;
     fw_cfg_add_file(s, filename, g_byte_array_free(array, TRUE), size);
+
+    return true;
 }
 
 static void fw_cfg_machine_reset(void *opaque)
diff --git a/softmmu/vl.c b/softmmu/vl.c
index f476ef89ed..3416241557 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -2070,11 +2070,7 @@ static int parse_fw_cfg(void *opaque, QemuOpts *opts, Error **errp)
         size = strlen(str); /* NUL terminator NOT included in fw_cfg blob */
         buf = g_memdup(str, size);
     } else if (nonempty_str(gen_id)) {
-        Error *local_err = NULL;
-
-        fw_cfg_add_from_generator(fw_cfg, name, gen_id, errp);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        if (!fw_cfg_add_from_generator(fw_cfg, name, gen_id, errp)) {
             return -1;
         }
         return 0;
-- 
2.21.3


