Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k6V56-0003g8-Kw
	for mharc-qemu-trivial@gnu.org; Fri, 14 Aug 2020 04:28:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k6V53-0003Xu-FP; Fri, 14 Aug 2020 04:28:53 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:35665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1k6V51-0004ME-38; Fri, 14 Aug 2020 04:28:53 -0400
Received: by mail-wr1-x433.google.com with SMTP id f1so7614497wro.2;
 Fri, 14 Aug 2020 01:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Iye/cBGgUFdbmxaz6sgS3yQXvh0DJ2OzL+FyZ1uhmuc=;
 b=R/fscXm3OxNrTuTWiZetZYr5co3X/BxtPC8sFoqmIbCRuD02jizE7VrEMS25d0Vev4
 87bnU5FD5SB4usBzumk0gplrdBOrl2t1c6esEPMc9Qm7AbCGrtqcuYkgvOtc72qyjP3k
 ro0zHkARcXOfrnt9bm4lUHG1eFVRQuPe7WYFjFXQYFR+AH/Q+5Z3R1xTeMyizD8NkOW9
 XlITZJrglz9pR9qyxEspMcaD+8gOMRnkxoJRx2au+bradv/r8QZR+aaiJsjxfjFob+sG
 ikU4i7n/saSRRw/76LCH776HFJjvzlMHYmwmhsWAqj7f7BIXg3Qpab2jryGwc0ACyYCS
 gg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Iye/cBGgUFdbmxaz6sgS3yQXvh0DJ2OzL+FyZ1uhmuc=;
 b=FFH3pVcOwdiO3J4Ti6Z0AefyEbe+lLyv5G0YkReOqW8B+bbVOHqFh4rEkUwSM1pxrK
 /RGbCJPjqAqvVzk97NsRLO9L+pT4t5gRzzufCbuN9iBRbb9myTlw2lcuQlNKOcZEy3Db
 9f4K7fMP0bfidbMqh6LDsWykBuOcLpsCMjHj/H+bwZ4HOhGgEOEt/efXOuoigISsRyJu
 EmWyPQ1zJ5a8cyHiFImzVw1glONv70WQ/bIe2q+KIB07rPcTta6EI3+oa8LPO1VaRiAM
 Xweqy51YDFEQUwzZXpT/FCUFPGmNkRVry5hsKJ1s6FzxOOhWLKmhZshHCy1uGml6tU0+
 /ZaQ==
X-Gm-Message-State: AOAM5332zosV99JiBaCCmgOn72xK34AKlke7uTqs59TiuEyD/4/JQ+w4
 /FjlbeSnZFLAkfDQkYxMGxA4H7+BXdU=
X-Google-Smtp-Source: ABdhPJz2krOF4Sk4sBu4hfRcOeuJw1zBMxCFmgWxUoQAYnfZIl1fZYvXyBG56CWSUI9m0hj8f+ar1Q==
X-Received: by 2002:a5d:558a:: with SMTP id i10mr1581637wrv.146.1597393728922; 
 Fri, 14 Aug 2020 01:28:48 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id d14sm14668107wre.44.2020.08.14.01.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2020 01:28:48 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Fam Zheng <fam@euphon.net>,
 Laurent Vivier <laurent@vivier.eu>, qemu-block@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 4/7] hw/ide/ahci: Replace magic '512' value by BDRV_SECTOR_SIZE
Date: Fri, 14 Aug 2020 10:28:38 +0200
Message-Id: <20200814082841.27000-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200814082841.27000-1-f4bug@amsat.org>
References: <20200814082841.27000-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Fri, 14 Aug 2020 08:28:54 -0000

Use self-explicit definitions instead of magic '512' value.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/ide/ahci.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 009120f88b..b696c6291a 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -1151,7 +1151,7 @@ static void process_ncq_command(AHCIState *s, int port, uint8_t *cmd_fis,
     if (!ncq_tfs->sector_count) {
         ncq_tfs->sector_count = 0x10000;
     }
-    size = ncq_tfs->sector_count * 512;
+    size = ncq_tfs->sector_count * BDRV_SECTOR_SIZE;
     ahci_populate_sglist(ad, &ncq_tfs->sglist, ncq_tfs->cmdh, size, 0);
 
     if (ncq_tfs->sglist.size < size) {
@@ -1703,7 +1703,8 @@ static int ahci_state_post_load(void *opaque, int version_id)
                 return -1;
             }
             ahci_populate_sglist(ncq_tfs->drive, &ncq_tfs->sglist,
-                                 ncq_tfs->cmdh, ncq_tfs->sector_count * 512,
+                                 ncq_tfs->cmdh,
+                                 ncq_tfs->sector_count * BDRV_SECTOR_SIZE,
                                  0);
             if (ncq_tfs->sector_count != ncq_tfs->sglist.size >> 9) {
                 return -1;
-- 
2.21.3


