Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lgixo-0000q9-9k
	for mharc-qemu-trivial@gnu.org; Wed, 12 May 2021 03:07:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgixm-0000ji-8t
 for qemu-trivial@nongnu.org; Wed, 12 May 2021 03:07:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgixi-0003Cu-OF
 for qemu-trivial@nongnu.org; Wed, 12 May 2021 03:07:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620803238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+WOfYdVRGGFXTGfPsi4NkvxnlL28c3Y4OEsAOzytlxo=;
 b=SOQuunLUkJsSkGsC2fN8K+QRmmH3SxwQ1Fb3k2bzZYaXhQor+aZgnu7wngica+gYUDMU/9
 aRFHpDvCAa6JGSAX4jawUAjEf04GOXWHGTOC79bBGJ9+SnceKAVsu0jrEWecj9sIfVobyo
 j4P2EmHy4AMj58VoBXDvIbtf/eX6K8o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-EccFw20_Pe2lgAu-lgSyfg-1; Wed, 12 May 2021 03:07:16 -0400
X-MC-Unique: EccFw20_Pe2lgAu-lgSyfg-1
Received: by mail-wr1-f69.google.com with SMTP id
 r12-20020adfc10c0000b029010d83323601so9712700wre.22
 for <qemu-trivial@nongnu.org>; Wed, 12 May 2021 00:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+WOfYdVRGGFXTGfPsi4NkvxnlL28c3Y4OEsAOzytlxo=;
 b=kGV3CtMnFuUk3grDFuUPHEgLFj5Fqz5hryeovH23ke/ogy0HGQP3Vx+OQItg4zmyhG
 aluQeKTUVHJxjtGauTPxQ27V9JcrID6ViDy/Jk2O9F/0CI3nwtCJd1JAMQ1XqQJ6j9JU
 FDlWdcmjq5Xh/QfpF3/Z6A4wE39C+ba6YqqIvqXjM4FKDwBW5mVUNEL4mDW7LoI9TnAD
 JvYqLovY4qI8oNWAC1wOt8BJImFVgV1epfazWVGdJjXPZxiIOduOl06moSANuJ4XesD9
 Q1zSbzRNB1dsWfjdmPYtdXB0VXOTTQVkWDa7XhLo8HVflyLCT3+FZAVeYKB/2DBVMPZG
 9+pg==
X-Gm-Message-State: AOAM530twwNRGqwDgAqDTJLlYxpqDv4yXrpaG6rChdPAADo5pP1Mmivv
 YbIbFC26ruwi6QVqHGxmGEVpBN7hLBBybYIG6jDY3+w7qPSVousEvbivBEFO7PWCBQg943uwdqW
 7p3g4aEaw4edkhEoUMA==
X-Received: by 2002:a05:600c:2cd2:: with SMTP id
 l18mr13844005wmc.142.1620803235519; 
 Wed, 12 May 2021 00:07:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKNw9EQ5nYfUPZ/q9G6qxX/cj+mGCOKf+69GWkQwHQP/PgD2zbT0QXiOvyP2tXiaUzuVB4vA==
X-Received: by 2002:a05:600c:2cd2:: with SMTP id
 l18mr13843990wmc.142.1620803235335; 
 Wed, 12 May 2021 00:07:15 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id i2sm35171165wro.0.2021.05.12.00.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 00:07:14 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>,
 Christophe de Dinechin <dinechin@redhat.com>
Subject: [PATCH] backends/tpm: Replace qemu_mutex_lock calls with
 QEMU_LOCK_GUARD
Date: Wed, 12 May 2021 09:07:13 +0200
Message-Id: <20210512070713.3286188-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Wed, 12 May 2021 07:07:22 -0000

Simplify the tpm_emulator_ctrlcmd() handler by replacing a pair of
qemu_mutex_lock/qemu_mutex_unlock calls by the WITH_QEMU_LOCK_GUARD
macro.

Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Reviewed-by: Christophe de Dinechin <dinechin@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 backends/tpm/tpm_emulator.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/backends/tpm/tpm_emulator.c b/backends/tpm/tpm_emulator.c
index a012adc1934..e5f1063ab6c 100644
--- a/backends/tpm/tpm_emulator.c
+++ b/backends/tpm/tpm_emulator.c
@@ -30,6 +30,7 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qemu/sockets.h"
+#include "qemu/lockable.h"
 #include "io/channel-socket.h"
 #include "sysemu/tpm_backend.h"
 #include "sysemu/tpm_util.h"
@@ -124,31 +125,26 @@ static int tpm_emulator_ctrlcmd(TPMEmulator *tpm, unsigned long cmd, void *msg,
     uint32_t cmd_no = cpu_to_be32(cmd);
     ssize_t n = sizeof(uint32_t) + msg_len_in;
     uint8_t *buf = NULL;
-    int ret = -1;
 
-    qemu_mutex_lock(&tpm->mutex);
+    WITH_QEMU_LOCK_GUARD(&tpm->mutex) {
+        buf = g_alloca(n);
+        memcpy(buf, &cmd_no, sizeof(cmd_no));
+        memcpy(buf + sizeof(cmd_no), msg, msg_len_in);
 
-    buf = g_alloca(n);
-    memcpy(buf, &cmd_no, sizeof(cmd_no));
-    memcpy(buf + sizeof(cmd_no), msg, msg_len_in);
-
-    n = qemu_chr_fe_write_all(dev, buf, n);
-    if (n <= 0) {
-        goto end;
-    }
-
-    if (msg_len_out != 0) {
-        n = qemu_chr_fe_read_all(dev, msg, msg_len_out);
+        n = qemu_chr_fe_write_all(dev, buf, n);
         if (n <= 0) {
-            goto end;
+            return -1;
+        }
+
+        if (msg_len_out != 0) {
+            n = qemu_chr_fe_read_all(dev, msg, msg_len_out);
+            if (n <= 0) {
+                return -1;
+            }
         }
     }
 
-    ret = 0;
-
-end:
-    qemu_mutex_unlock(&tpm->mutex);
-    return ret;
+    return 0;
 }
 
 static int tpm_emulator_unix_tx_bufs(TPMEmulator *tpm_emu,
-- 
2.26.3


