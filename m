Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1myMSC-0003NY-Q7
	for mharc-qemu-trivial@gnu.org; Fri, 17 Dec 2021 18:15:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myMS9-0003Mv-6F
 for qemu-trivial@nongnu.org; Fri, 17 Dec 2021 18:15:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1myMS5-0003P0-FM
 for qemu-trivial@nongnu.org; Fri, 17 Dec 2021 18:15:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639782948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iL0P2081J8WaLpt+YEfTZdilM3EPvBPtqroDSbrUA0k=;
 b=gmpEhIRin7g2EkSm/INAsksoA2R7rEyUREKAldXsIkwIEHvxsxzUhuuA8tzqfM1LQ5KlKr
 PooH/PdUVqL1PwUEKnnhB5alnMC5oeK8cpknvWTpePE4YJ0arE4dc5chsRGVQ+rjiSmN7p
 73AUpgwCMoNIbJTg06nFkGqyn0kdH+c=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-qCJrnVFZMM2BYD4-i8ObhQ-1; Fri, 17 Dec 2021 18:15:46 -0500
X-MC-Unique: qCJrnVFZMM2BYD4-i8ObhQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 bi14-20020a05600c3d8e00b00345787d3177so1673027wmb.0
 for <qemu-trivial@nongnu.org>; Fri, 17 Dec 2021 15:15:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iL0P2081J8WaLpt+YEfTZdilM3EPvBPtqroDSbrUA0k=;
 b=kWEoJWgDyTh8D7jyFlAZaws6Bk7RKNbmfZN5BP9wfTmTs/DrkUk8nlCJBHfVcWOdpO
 LSWItpiG59pz5wRG8JIs9OjZtBmXdjtCjOFx1XDGgF8jwBEWkDCqmdJBsTWvbYQ+UIIC
 QkcKJXKUwigyaIp/RyRJJmHacVnkpmgYpxn3WUfdUyihPXQArbsENiPjkwmjHNaFsFT7
 +6MX+J51VG1Wsw2Kj6rwtPyZ1dW18jWY+3ldrCtfsqS3sz5lymGB7VIhDfZpC75+1eBN
 D9R7oer+9ZAZ+RhShDMKyHwj74g2wdXwVRK7xK+PfwBAIOqPE6tsFAlAOkf5bcuf5pKx
 iPOA==
X-Gm-Message-State: AOAM533a0B4hzHB773QE9k/N296drLZ1+6d1KzNZEtx09zeIqKMqDG/i
 XGAXDNoMCadznezIRNFOKayOMg5fhvzzOnbZqSpyTg0yt2dutKvWvh9IbY9UVpxQCJhT/9YiTHJ
 qRlRfNoz+HZsV9qo6ug==
X-Received: by 2002:a05:6000:10c9:: with SMTP id
 b9mr4161790wrx.539.1639782945547; 
 Fri, 17 Dec 2021 15:15:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJRKKfZelw0LUZNvAEFDEUGVRRT7d2bubtdR+rYrYcEyCjvJwtXRSPY7XwhnGJ9tk38X71JQ==
X-Received: by 2002:a05:6000:10c9:: with SMTP id
 b9mr4161775wrx.539.1639782945290; 
 Fri, 17 Dec 2021 15:15:45 -0800 (PST)
Received: from x1w.redhat.com (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id a5sm1607248wrt.94.2021.12.17.15.15.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 15:15:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, Fam Zheng <fam@euphon.net>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] hw/scsi/megasas: Simplify using the ldst API
Date: Sat, 18 Dec 2021 00:15:42 +0100
Message-Id: <20211217231542.1461286-1-philmd@redhat.com>
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
X-List-Received-Date: Fri, 17 Dec 2021 23:15:54 -0000

This code is easier to review using the load/store API.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/scsi/megasas.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 619b66ef0f3..066f30e3f22 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -375,8 +375,7 @@ static int megasas_setup_inquiry(uint8_t *cdb, int pg, int len)
         cdb[1] = 0x1;
         cdb[2] = pg;
     }
-    cdb[3] = (len >> 8) & 0xff;
-    cdb[4] = (len & 0xff);
+    stw_be_p(&cdb[2], len);
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


