Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pAW7B-0005Lh-3Y
	for mharc-qemu-trivial@gnu.org; Wed, 28 Dec 2022 08:05:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAW6v-0005K5-PP
 for qemu-trivial@nongnu.org; Wed, 28 Dec 2022 08:04:46 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAW6u-0002I3-6I
 for qemu-trivial@nongnu.org; Wed, 28 Dec 2022 08:04:45 -0500
Received: by mail-wr1-x42d.google.com with SMTP id bk16so1685903wrb.11
 for <qemu-trivial@nongnu.org>; Wed, 28 Dec 2022 05:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J11etKy1I+eD1ZxYBXlK61HtI3MDE9eu0yS0RM5yA44=;
 b=ZCFsDORq/unrNsJDI1vegAbZXKMgvZ1by2Mnh7laqYUXMuiCBXLRPGxZcckDtA2uBW
 Y+mfZvQx3+qOwU1JqNUQVBQa6aPHi590h4wDRKC95vJykYwh24YtfTx3Mv3f8MFE0oOT
 eMt7GSXHOYKAUiLIkS0B9wIT8hm/1t3CL5tCbvkHsj/lHgR8PnUSI7ygz4fCriObjl01
 8hMPMRWzySzo7OYMF6oH7lVmTUif9b8XXP7kMN20Ydj8yDyOGt5i79Q/vRHMdc3MS04F
 V6Ypd6hOY6otIP3vPNMkVGtsbOliSLZcQAoOgCd7dcdysHTGgyCrOTuuPLlWm1uLimFO
 9DuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J11etKy1I+eD1ZxYBXlK61HtI3MDE9eu0yS0RM5yA44=;
 b=n7vHe0pm1L5wVumdl6VUOqETt7qGQ6PyX3fefuSJknRKoslXnPHoW5q6g3Mfi5wgPC
 /AOC7mKGeuNoJI6m38nubr0J502PizzZS4VMPaC8gnGf63NkTGwgs/NZmndTt+ig0/4H
 hKuXsIzuKtTM5P2k9dmyl/TtMxWAlamVM/twdPo3n3coIdIvxsMvTt1jakRVQd28Xtxj
 GSvrfs3oOoVsgaqvXG7/nTYRfnhqgPbxzi3iStLqs6BoPKm4kz7X53qeR0Utu/+SzKYw
 80CmaKtMNpCVMLzejzwUN4Flew5XiGFTxnBCthnFrhJR15YtTNalodpwWsCX8+Q6gKYv
 Wqkg==
X-Gm-Message-State: AFqh2koD62WFyJ1Yg/aONVbGU9aEEviNgUpgujqh/pz6bFf6T7+K+9i0
 fE8jGMC6/5AgdX3FDUIWj4rg3Q==
X-Google-Smtp-Source: AMrXdXsQpv+bhPNA33i/6X+zPcOUNzSi932oBgGtTwxBm0h8b5EQWTfJDZOamk1kGHQSAdnpi/ngGA==
X-Received: by 2002:a5d:43c7:0:b0:26b:c52e:f7c7 with SMTP id
 v7-20020a5d43c7000000b0026bc52ef7c7mr19673387wrr.29.1672232681669; 
 Wed, 28 Dec 2022 05:04:41 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 v7-20020adfe287000000b00241bd177f89sm15323279wri.14.2022.12.28.05.04.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 28 Dec 2022 05:04:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Mark Burton <mburton@qti.qualcomm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] memory: Do not print MR priority in flatview HMP output
Date: Wed, 28 Dec 2022 14:04:39 +0100
Message-Id: <20221228130439.80341-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 28 Dec 2022 13:04:57 -0000

When requesting the flatview output with 'info mtree -f',
the MemoryRegion priority is irrelevant and noise. Remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 softmmu/memory.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/softmmu/memory.c b/softmmu/memory.c
index e05332d07f..89713dd5ce 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -3330,22 +3330,20 @@ static void mtree_print_flatview(gpointer key, gpointer value,
         mr = range->mr;
         if (range->offset_in_region) {
             qemu_printf(MTREE_INDENT TARGET_FMT_plx "-" TARGET_FMT_plx
-                        " (prio %d, %s%s): %s @" TARGET_FMT_plx,
+                        " (%s%s): %s @" TARGET_FMT_plx,
                         int128_get64(range->addr.start),
                         int128_get64(range->addr.start)
                         + MR_SIZE(range->addr.size),
-                        mr->priority,
                         range->nonvolatile ? "nv-" : "",
                         range->readonly ? "rom" : memory_region_type(mr),
                         memory_region_name(mr),
                         range->offset_in_region);
         } else {
             qemu_printf(MTREE_INDENT TARGET_FMT_plx "-" TARGET_FMT_plx
-                        " (prio %d, %s%s): %s",
+                        " (%s%s): %s",
                         int128_get64(range->addr.start),
                         int128_get64(range->addr.start)
                         + MR_SIZE(range->addr.size),
-                        mr->priority,
                         range->nonvolatile ? "nv-" : "",
                         range->readonly ? "rom" : memory_region_type(mr),
                         memory_region_name(mr));
-- 
2.38.1


