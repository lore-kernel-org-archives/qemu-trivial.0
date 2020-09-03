Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kDpYG-0008MK-FW
	for mharc-qemu-trivial@gnu.org; Thu, 03 Sep 2020 09:45:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDpYE-0008K4-Ou
 for qemu-trivial@nongnu.org; Thu, 03 Sep 2020 09:45:18 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:46430
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDpYD-0001B6-6u
 for qemu-trivial@nongnu.org; Thu, 03 Sep 2020 09:45:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599140716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xnJGsFmE0lHc/vacaNXhWmico4HRbt/COcagt38PJC8=;
 b=ZvjaqcJbQ90ZEHy82JiSez2r3a83b1/ay+oq0QvlgYK/FbTbrHg0A3/jTWa2gPNdVT7w/v
 wkcfZsNufPrQxr+e9+cfymxWSQwcAMur1i7n4wPEJu7JjxbxbTopsxMJ7xxuPnquJGDOVA
 3lFy9p7uCuUDc5j0NvR1e0LiCtohQcw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-5JlZ9yJwNJ-1q8ftWxBtGg-1; Thu, 03 Sep 2020 09:45:14 -0400
X-MC-Unique: 5JlZ9yJwNJ-1q8ftWxBtGg-1
Received: by mail-wm1-f69.google.com with SMTP id z1so1008647wmk.1
 for <qemu-trivial@nongnu.org>; Thu, 03 Sep 2020 06:45:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xnJGsFmE0lHc/vacaNXhWmico4HRbt/COcagt38PJC8=;
 b=OreKa+nopU1AogupNPBuSz922qn4OKeNp0cFRs79730+6yhIzFrsVvsMiuDwesNL0g
 dGFI3PAkeQNLSttWlP1C/HVPHURgi9bcJVaJg/cvRO+wF4M6Vd684vwopUxOoC+cfQVd
 +61eopJyPvq1knKVv6WyyS0D1L8KzPooW7yk7hUcZ5Fbf2P15/7hHyGUOSSvX3Cuh/aF
 m9CkiCiRnYtJidCkDTjK1sIKCM3K2K0+B+JlEP7taFho9Eknp/lfpKB9M3LdjaNVRU6P
 hVIUlve3eSaeand5AQQnpVDJCoKmmjuASqNXjwfBi/KIvEgY40CcjvMeVoBqeszkmaMt
 IzEQ==
X-Gm-Message-State: AOAM5332tViy+6L/cR/Y+TU8yQvpP/O3SsPkQndDACspugBLQ3PmsyMs
 K+K9v/FQe3ySmojkxpQ37JTk331EYq6N7Mh+lQeZvzqtlKxdyHk3UI4D2hHwCCHeqqM+h8u5s3S
 uzBSlUCQgnuyW5Jg1Fw==
X-Received: by 2002:a5d:68d1:: with SMTP id p17mr2498269wrw.378.1599140713414; 
 Thu, 03 Sep 2020 06:45:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkd59juEn6Zi7SDnJ4jjLVol29LXybzqo3sRN18mbzyAzNizyapEc+rY3LZwa19TcFn2OUmA==
X-Received: by 2002:a5d:68d1:: with SMTP id p17mr2498250wrw.378.1599140713266; 
 Thu, 03 Sep 2020 06:45:13 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id l10sm4408149wru.59.2020.09.03.06.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 06:45:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 1/2] hw/timer/hpet: Remove dead code
Date: Thu,  3 Sep 2020 15:45:05 +0200
Message-Id: <20200903134506.440082-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200903134506.440082-1-philmd@redhat.com>
References: <20200903134506.440082-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 01:28:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Thu, 03 Sep 2020 13:45:19 -0000

This code was never compiled/used, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/timer/hpet.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index 380acfa7c8a..b683f64f1d3 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -416,20 +416,6 @@ static void hpet_del_timer(HPETTimer *t)
     update_irq(t, 0);
 }
 
-#ifdef HPET_DEBUG
-static uint32_t hpet_ram_readb(void *opaque, hwaddr addr)
-{
-    printf("qemu: hpet_read b at %" PRIx64 "\n", addr);
-    return 0;
-}
-
-static uint32_t hpet_ram_readw(void *opaque, hwaddr addr)
-{
-    printf("qemu: hpet_read w at %" PRIx64 "\n", addr);
-    return 0;
-}
-#endif
-
 static uint64_t hpet_ram_read(void *opaque, hwaddr addr,
                               unsigned size)
 {
-- 
2.26.2


