Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58103CCD199
	for <qemu-trivial@archiver.kernel.org>; Fri, 17 Oct 2025 14:14:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v9lCk-0004ks-BY; Fri, 17 Oct 2025 10:13:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9lCf-0004jD-JB
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 10:13:09 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9lCP-0005ho-Pe
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 10:13:08 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-46e6ba26c50so14748355e9.2
 for <qemu-trivial@nongnu.org>; Fri, 17 Oct 2025 07:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760710372; x=1761315172; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BM6QgAOG34zDGb9jZI8DkkbGa1KuVCoA2kRHxsUOX8Q=;
 b=R8xaQlwxjPSDpG+QCgRTnsSTb6EPzF5/uzVgemcl2m8GOWrzJO0HDemtBfj/CGHzjE
 Fe0YdqmevhyXOZdGTxx2yFkgZI5ACj0XCuZnM8dLxJkU4dYZ1YG52AKn88lnZNpqjIDV
 yN0LUJKQQfH4RnNbMWVrxOtdvMMy+EyhjNXKogz45NiuUXZuMRW1LEHarrXdpmxr/4cq
 81LqkIKW4rlqcqvrBXQGoFWLMf6E1RwBKSOTmZE23A2xezPE77TSXdmWLf03WoNcH547
 XdUCmkZOEO7uTQS1K+cL32VZVhjFT1EawBqowrdZcShjGGhGpGRvsufM91KpcKqBVkZg
 BwEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760710372; x=1761315172;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BM6QgAOG34zDGb9jZI8DkkbGa1KuVCoA2kRHxsUOX8Q=;
 b=mSopl0+JS3S2U/P1hf1WaAwbXsK8Kd1lBeZBVSQFtA07mrqOBOce4Mq9K3i/NJi/o1
 hv/Y6w2jglS1XduCwo610CG01yBZarvBgc0UsN0hjRpCK/60kUZsKVvbH0mglDM2fdBF
 wn8A+dD+mH0uTXc6ALIF/Z9c+4VDIIzF4ckj0Hh0quJsW6naoAadCSpEOk1juOyet68P
 4/XGOHFUwqFky2mtqwENdr67txdKhB1Ck9VqxtajEAuwjwGAqEjaECvFUiYT+kJMUDki
 eCtXNDGChHBxMlSh4G5tnfzTwPU48MsEU3jM62dQELBD3KB80tmXSDtNGOoJVw2pJaQF
 1bAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWK/T1G8jXT9LhxaHOlrqMUaMHf0PV04Qc9cNzDD9dkKn5dAMgIS7n14CTJEWb43vt0OwGb5SOfZsqtBmE=@nongnu.org
X-Gm-Message-State: AOJu0YyWFMDrf+/LMce/zA3ADYs5kptzM8PUtXQj9xMOqDZ5xs5q5MML
 Sx9vekM4zkryLjVrMCpWRsp9ae5KBLpD44VX/uSMk1jwVOaO0R1dwY/F
X-Gm-Gg: ASbGncv5bV83rIDXIyrjLkNf/hMnJulx2m3fZExXWtfhmJN7GbMNwCkTXXRyGrvbl6d
 3U8FRUBSR8e35pu+QdOFoQWxU90sWQbJF8v9cW28iE5LWtrpYVnos88VaiExreuyfD2YpCcCCZo
 FDCLLR7LlyVKb7F/NVIDgnKAh27XhC5jtrgGXT7E+iVsytagvu4FG5exwU4FU6UwkSic3ZEJIF+
 6xi49HSJZBL98nFZQZUQpT9tC/RYIhoWyLShlqqKB+VcF98nyD7T9kTkfClzashiseCozomlaOz
 Rr4PZMt+7CITg3UmAQsMEci7Jf2BJz0gExFjzcmpw998HccS5msMS35Wg6NDaFKdGn/kqybP5mj
 QbcMzx/CygMfKB84GnifSVl+jVPOvRADaNg7DLy6V2F6R2iogMdbo/5kFjyEjrqbZT5SBlJDoz0
 ix1CquDaamDkJlBh9KDfcfG9+fzQ5OTiVvO7jzyAG0LXc=
X-Google-Smtp-Source: AGHT+IG5nxpyCZb86JulC3CK6XBAxAajZvuOX8OdfguJ75zkQr/jxOZUNh4OU/knYFxHTDCsaxeKIg==
X-Received: by 2002:a05:600c:34c7:b0:46f:b42e:e360 with SMTP id
 5b1f17b1804b1-47117931edcmr33177805e9.40.1760710371445; 
 Fri, 17 Oct 2025 07:12:51 -0700 (PDT)
Received: from archlinux (pd95edc07.dip0.t-ipconnect.de. [217.94.220.7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4710cb36e7csm51359675e9.2.2025.10.17.07.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 07:12:51 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>, Laurent Vivier <laurent@vivier.eu>,
 Eduardo Habkost <eduardo@habkost.net>, Cameron Esfahani <dirty@apple.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Zhao Liu <zhao1.liu@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, qemu-trivial@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Phil Dennis-Jordan <phil@philjordan.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 John Snow <jsnow@redhat.com>, kvm@vger.kernel.org,
 Laurent Vivier <lvivier@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 06/11] hw/ide/ide-internal: Move dma_buf_commit() into ide
 "namespace"
Date: Fri, 17 Oct 2025 16:11:12 +0200
Message-ID: <20251017141117.105944-7-shentey@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251017141117.105944-1-shentey@gmail.com>
References: <20251017141117.105944-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

The identifier suggests that it is a generic DMA function while it is tied
to IDE. Fix this by adding an "ide_" prefix.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ide/ide-internal.h |  2 +-
 hw/ide/ahci.c         |  8 ++++----
 hw/ide/core.c         | 10 +++++-----
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/hw/ide/ide-internal.h b/hw/ide/ide-internal.h
index 0d64805da2..281d07c9d5 100644
--- a/hw/ide/ide-internal.h
+++ b/hw/ide/ide-internal.h
@@ -398,7 +398,7 @@ int64_t ide_get_sector(IDEState *s);
 void ide_set_sector(IDEState *s, int64_t sector_num);
 
 void ide_start_dma(IDEState *s, BlockCompletionFunc *cb);
-void dma_buf_commit(IDEState *s, uint32_t tx_bytes);
+void ide_dma_buf_commit(IDEState *s, uint32_t tx_bytes);
 void ide_dma_error(IDEState *s);
 void ide_abort_command(IDEState *s);
 
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 1303c21cb7..14bc66fb7f 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1417,7 +1417,7 @@ static void ahci_pio_transfer(const IDEDMA *dma)
     }
 
     /* Update number of transferred bytes, destroy sglist */
-    dma_buf_commit(s, size);
+    ide_dma_buf_commit(s, size);
 
 out:
     /* declare that we processed everything */
@@ -1482,8 +1482,8 @@ static int32_t ahci_dma_prepare_buf(const IDEDMA *dma, int32_t limit)
 
 /**
  * Updates the command header with a bytes-read value.
- * Called via dma_buf_commit, for both DMA and PIO paths.
- * sglist destruction is handled within dma_buf_commit.
+ * Called via ide_dma_buf_commit, for both DMA and PIO paths.
+ * sglist destruction is handled within ide_dma_buf_commit.
  */
 static void ahci_commit_buf(const IDEDMA *dma, uint32_t tx_bytes)
 {
@@ -1511,7 +1511,7 @@ static int ahci_dma_rw_buf(const IDEDMA *dma, bool is_write)
     }
 
     /* free sglist, update byte count */
-    dma_buf_commit(s, l);
+    ide_dma_buf_commit(s, l);
     s->io_buffer_index += l;
 
     trace_ahci_dma_rw_buf(ad->hba, ad->port_no, l);
diff --git a/hw/ide/core.c b/hw/ide/core.c
index b14983ec54..8c380abf7c 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -827,7 +827,7 @@ static void ide_sector_read(IDEState *s)
                                       ide_sector_read_cb, s);
 }
 
-void dma_buf_commit(IDEState *s, uint32_t tx_bytes)
+void ide_dma_buf_commit(IDEState *s, uint32_t tx_bytes)
 {
     if (s->bus->dma->ops->commit_buf) {
         s->bus->dma->ops->commit_buf(s->bus->dma, tx_bytes);
@@ -848,7 +848,7 @@ void ide_set_inactive(IDEState *s, bool more)
 
 void ide_dma_error(IDEState *s)
 {
-    dma_buf_commit(s, 0);
+    ide_dma_buf_commit(s, 0);
     ide_abort_command(s);
     ide_set_inactive(s, false);
     ide_bus_set_irq(s->bus);
@@ -893,7 +893,7 @@ static void ide_dma_cb(void *opaque, int ret)
     if (ret < 0) {
         if (ide_handle_rw_error(s, -ret, ide_dma_cmd_to_retry(s->dma_cmd))) {
             s->bus->dma->aiocb = NULL;
-            dma_buf_commit(s, 0);
+            ide_dma_buf_commit(s, 0);
             return;
         }
     }
@@ -912,7 +912,7 @@ static void ide_dma_cb(void *opaque, int ret)
     sector_num = ide_get_sector(s);
     if (n > 0) {
         assert(n * 512 == s->sg.size);
-        dma_buf_commit(s, s->sg.size);
+        ide_dma_buf_commit(s, s->sg.size);
         sector_num += n;
         ide_set_sector(s, sector_num);
         s->nsector -= n;
@@ -944,7 +944,7 @@ static void ide_dma_cb(void *opaque, int ret)
          * Reset the Active bit and don't raise the interrupt.
          */
         s->status = READY_STAT | SEEK_STAT;
-        dma_buf_commit(s, 0);
+        ide_dma_buf_commit(s, 0);
         goto eot;
     }
 
-- 
2.51.1.dirty


