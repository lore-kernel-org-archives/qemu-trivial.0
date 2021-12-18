Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1myXkK-00052d-5K
	for mharc-qemu-trivial@gnu.org; Sat, 18 Dec 2021 06:19:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myXkH-000503-Jj
 for qemu-trivial@nongnu.org; Sat, 18 Dec 2021 06:19:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myXkG-0000xx-9M
 for qemu-trivial@nongnu.org; Sat, 18 Dec 2021 06:19:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639826359;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xlpdcFiKk+QT53vi6eV0nYkKCyVWkrxaOucCuxeBwmg=;
 b=BuN5GK4I9pTNyQtUbxiDQYMTdyk3zxGqPGVScwUyKUP9810CmwWJt+sWVfK6UaV/BpeenX
 RWb9nhx5DSCoeLb2deu2FK6Muw3gNaDmKRaitEwwYyQcLr7FGHl1lDMcHKzDpoRDm4PlBQ
 Z1qurtYxYD9Rn0z9bj/NMnOR7UcncHA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-YOMwuJXRMZafAtmHpuyJJg-1; Sat, 18 Dec 2021 06:19:16 -0500
X-MC-Unique: YOMwuJXRMZafAtmHpuyJJg-1
Received: by mail-wm1-f71.google.com with SMTP id
 az35-20020a05600c602300b00345812649ddso713066wmb.8
 for <qemu-trivial@nongnu.org>; Sat, 18 Dec 2021 03:19:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xlpdcFiKk+QT53vi6eV0nYkKCyVWkrxaOucCuxeBwmg=;
 b=MYUDD0QZtOLxIpv5SGMcIEaNJ/c++JuYTODiXIxY0pHbKOlrG+uHaJe0zxnVNEaVZI
 ccMwMmJj4GX09lH7nrpzX5tQCKd21C9wfxp6jMrxvW5JIO9VmA6RMZf+SWprY24uLp15
 /xTxwDmb1hWTNGKOxwHSCqiFxcQ5EjzmQq7z7y01sB/18Zy/5QTSNAp/CNrrbjECZiRC
 10h+KjsYLqdq9keh96t3oPNStQqWXIB1iOuQsax+li7EJlnD04vepG6EdHeHZiynfjoD
 mK81TvQdpgitQW9PvOb/RfF+/EkOAGwcRjQpxng9/iY1zMmBjZa+jT73vKv7+lWdwCQb
 SanA==
X-Gm-Message-State: AOAM530KaMPJ9B6tU2YyBrzn7HOzI/9cnv1JnbvRtZI9JnPdL+tR/ihz
 jq/Y45kHzH2EYuBgJaFMw/oJAFPVvH1qjC/mLZoo5fBEBdgHWFhd3xZjMKVzPBdLaJ2zQmGuhIX
 ZV9FPKJNv4LO/BvYCpA==
X-Received: by 2002:a05:600c:3d90:: with SMTP id
 bi16mr4670625wmb.42.1639826355008; 
 Sat, 18 Dec 2021 03:19:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywNiLYL4XiRs6jKG961HFnh3L4l5Y+ZVNwOXIRqTU1obt1gblcMdPWQrWhrwLGY+H7ercVLw==
X-Received: by 2002:a05:600c:3d90:: with SMTP id
 bi16mr4670607wmb.42.1639826354829; 
 Sat, 18 Dec 2021 03:19:14 -0800 (PST)
Received: from x1w.. (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id u14sm10434757wrf.39.2021.12.18.03.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 03:19:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Hannes Reinecke <hare@suse.com>, qemu-trivial@nongnu.org,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2] hw/scsi/megasas: Simplify using the ldst API
Date: Sat, 18 Dec 2021 12:19:12 +0100
Message-Id: <20211218111912.1499377-1-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sat, 18 Dec 2021 11:19:21 -0000

This code is easier to review using the load/store API.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
v2: Fixed offset in megasas_setup_inquiry (rth)
---
 hw/scsi/megasas.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 619b66ef0f3..9a4e9ba87e6 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -375,8 +375,7 @@ static int megasas_setup_inquiry(uint8_t *cdb, int pg, int len)
         cdb[1] = 0x1;
         cdb[2] = pg;
     }
-    cdb[3] = (len >> 8) & 0xff;
-    cdb[4] = (len & 0xff);
+    stw_be_p(&cdb[3], len);
     return len;
 }
 
@@ -392,18 +391,8 @@ static void megasas_encode_lba(uint8_t *cdb, uint64_t lba,
     } else {
         cdb[0] = READ_16;
     }
-    cdb[2] = (lba >> 56) & 0xff;
-    cdb[3] = (lba >> 48) & 0xff;
-    cdb[4] = (lba >> 40) & 0xff;
-    cdb[5] = (lba >> 32) & 0xff;
-    cdb[6] = (lba >> 24) & 0xff;
-    cdb[7] = (lba >> 16) & 0xff;
-    cdb[8] = (lba >> 8) & 0xff;
-    cdb[9] = (lba) & 0xff;
-    cdb[10] = (len >> 24) & 0xff;
-    cdb[11] = (len >> 16) & 0xff;
-    cdb[12] = (len >> 8) & 0xff;
-    cdb[13] = (len) & 0xff;
+    stq_be_p(&cdb[2], lba);
+    stl_be_p(&cdb[2 + 8], len);
 }
 
 /*
-- 
2.33.1


