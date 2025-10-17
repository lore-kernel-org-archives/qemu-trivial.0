Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A7A0CCD195
	for <qemu-trivial@archiver.kernel.org>; Fri, 17 Oct 2025 11:37:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v9ijI-0000tv-Rm; Fri, 17 Oct 2025 07:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9ijB-0000rz-II
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 07:34:33 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9iit-00061V-25
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 07:34:33 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4710683a644so17082195e9.0
 for <qemu-trivial@nongnu.org>; Fri, 17 Oct 2025 04:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760700845; x=1761305645; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BM6QgAOG34zDGb9jZI8DkkbGa1KuVCoA2kRHxsUOX8Q=;
 b=J0/Q8a99uHbddqr8eEuhbYg43kERV6BnoyqXqKY/153/gVWnO9phgn2vNhbypyHYIv
 /w6tNgbDDol8jIq3OGGGZudff1HmpszhTavgO1rhdZh2K8u0JSiqK3I2QbyHd+LweUx9
 UhajrPDExSoBIFnWiyYTVHy3iPQwqbu9aciUdoUoU9CsC7G/Kjmf5OwCHIhWQA1Oeyk1
 nyj0e8qJJQ+58zqVQQZnXmR3w7J6qBxLm87ZP1cS43GmLrJ0UW1WTS3MOtEHfTA+xt/6
 3r5cNCaEgMtgQR5v6xwHRR5EDEBOVX610aWvyzuLqvMEtQKUY5v6PnvHgjovVaZHJnuf
 xGsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760700845; x=1761305645;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BM6QgAOG34zDGb9jZI8DkkbGa1KuVCoA2kRHxsUOX8Q=;
 b=dspC0PqZ/OOWMfqqeyiCSnEweDK4kD6PFx7thOOFjIiOZT1x9w7BgFeUN0quwDiTNq
 W3HVXKLFd3AqFCuoFv9XgkZSVNZjE45NARMDJJ0loZ5Hr8UcSTuG6jw5M6bXpUBFrBng
 i8muR2J8fcnt8mNU29fRovRPokjeTDB7oV85xtxSYO+XogCDYa9Sr0VPCC4YtzW4rOBb
 PckwRRVdJ8LHwUkQjphlJn7HTfDBXJwLjRce6l1msgKiLlpTU0xy+3rXHW2QJaw5LfQa
 cJsV6fz+VnlITfl9bQXog7qnlhoc/VbPdkqoI1RH0B9f5P3+aOze7BgDxLxhhd4XHKZn
 4zGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVqH7GRnJtRqsBVGpnamxbbOxqs+PffRZh+rPHXxTErSoXZK1UCoEyeKkxWqsVFr1EEjfhGMRIefrwz1E=@nongnu.org
X-Gm-Message-State: AOJu0YyFoHRKZMB3Qb4AVreeU1iCCjLDXsH4tQPFD52L+YStNB0kKQw6
 FfuLCYYB09qFHnf+FugZ3/IdbO248LAay8q8gi8BrESvTBKoG5WFR2py
X-Gm-Gg: ASbGncsz9FOHcS/gEkYbWXMfdCzTs9tsqQYwrkeKU1k/8MxFKCPdzUWRX/bQfs/iNmF
 Gv8Hw2BlH3TvUtu26rhmnnk5NleoWSRTAkSxZP8bVx2Hf/aywRmvUmPW2BNCnl8doqaWgOpEwHk
 Xe1mZVgA13EyVA1wLMDOrXqfhWJJA7wQc5Ut/99bJKfppNjh3jG7GivjihI2aVo1wer7tgXBWU2
 +2WFkJjyTxWHnhS2pshzDXdTyjifQDjFTMEmljd7D3haMbwiAXmgHdcuGRDhBqOIrJGAHkjrba8
 4zUFzoSBr86qkoOPzAFfyNbcEI8EZ2FwUhdqqkJzIGJhf69br9PnEUxfI6fC+REFFhQpAILWiXq
 ww5dzecyTK5mAmnzLFC3FZ3SL3F076B5dlpBFtKmjMPsWgxJm/yd0bvoZAKvUiZl6fqB+jWbcPN
 2d831EproIbNerVvuoM7qg0Mv6qEmUrpYq
X-Google-Smtp-Source: AGHT+IGLsMwNa24SVKElCrTuDly2JhrkRR3DVkahMshWsaOruLCSdJ+4rhKxrSHRXVTtx+GQp2kERQ==
X-Received: by 2002:a05:600c:364d:b0:471:6a1:26e7 with SMTP id
 5b1f17b1804b1-47109b4f8bemr37360005e9.12.1760700844745; 
 Fri, 17 Oct 2025 04:34:04 -0700 (PDT)
Received: from archlinux (pd95edc07.dip0.t-ipconnect.de. [217.94.220.7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711444c8adsm80395435e9.13.2025.10.17.04.34.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 04:34:04 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <laurent@vivier.eu>, kvm@vger.kernel.org,
 Zhao Liu <zhao1.liu@intel.com>, qemu-trivial@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 7/8] hw/ide/ide-internal: Move dma_buf_commit() into ide
 "namespace"
Date: Fri, 17 Oct 2025 13:33:37 +0200
Message-ID: <20251017113338.7953-8-shentey@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251017113338.7953-1-shentey@gmail.com>
References: <20251017113338.7953-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


