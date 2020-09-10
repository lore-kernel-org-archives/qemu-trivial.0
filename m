Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGN6S-0001XC-8h
	for mharc-qemu-trivial@gnu.org; Thu, 10 Sep 2020 09:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kGN6Q-0001RL-AT
 for qemu-trivial@nongnu.org; Thu, 10 Sep 2020 09:59:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30352)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kGN6O-0003rm-PB
 for qemu-trivial@nongnu.org; Thu, 10 Sep 2020 09:59:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599746343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I2nL5nubYV63BIiDSxuLpmGc2Alel66jSGDQ6bJQNtI=;
 b=ELNrUeINlv70F2gy1xqsK5qv+LO8zPM62LJC4dyStdaYSP+mUzd5rXlAcOmauFUWK68159
 qkOV5xlyxajGnZw4rlBe3TpNWUZ80376QDdPgMnMwzWHSw+mgozYE3rmyd45lm8eYhN57K
 lStqEhyHJeEi3lx5MFOzJmCnAgL+RUk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-ii_tqPX0OWSNcdRx5L1BxA-1; Thu, 10 Sep 2020 09:59:01 -0400
X-MC-Unique: ii_tqPX0OWSNcdRx5L1BxA-1
Received: by mail-wm1-f70.google.com with SMTP id d22so35023wmd.6
 for <qemu-trivial@nongnu.org>; Thu, 10 Sep 2020 06:59:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I2nL5nubYV63BIiDSxuLpmGc2Alel66jSGDQ6bJQNtI=;
 b=I498w02itVnwrklWy8bXdAsfS3D+KR6jkshmiYOMNoHV6IpxD61pJ2WsrESAjYQLB5
 w42F1ZMbGluYuIQcr4pghq/sHzfsQoqcqLcK7NoDyJmvVuZgUP3nLhat/3mQA+G6n6oo
 I6y+WGruYcoqu6qRFDrUeGqZQ9U8DbBE/L/go3lutNnnrXYf2dRf/IE9NXa0/AkCi9pw
 gCoiXvr8ChloRIuJZvAKAbG7TtGkzgGzNxLRmxI4d6lZ1oGSlk+pPyTLqxv4iJPr41eF
 GsI21R8dSfN2bHvCr8IIF1CZzqjSLu8yaIDWvcWpohJfL7egkYG2DnUnvobR+FiJ63d4
 0Gkw==
X-Gm-Message-State: AOAM531nKyoulCjbZfvT4LYBEEUXiX/fV7XmDSkENZhb3/u+O1GrtBlS
 LZSVLpxyudJHkKRhBnREB1gH2le93eIaMg2c2RHSmzUhbqw9UxdCKh5jaoKNqAndF57JDvikyMk
 wzHlvbyMlOhE1DTfzOw==
X-Received: by 2002:a1c:59c2:: with SMTP id n185mr106424wmb.43.1599746339534; 
 Thu, 10 Sep 2020 06:58:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwdU15i9on/xEzpzTFJeNDrKwhj18/wXMi72xocKjHs0sI3MuTd2RxP84+HjI55tvZNWr9DSQ==
X-Received: by 2002:a1c:59c2:: with SMTP id n185mr106406wmb.43.1599746339336; 
 Thu, 10 Sep 2020 06:58:59 -0700 (PDT)
Received: from x1w.redhat.com (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id p16sm9522186wro.71.2020.09.10.06.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 06:58:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Dov Murik <dovmurik@linux.vnet.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 1/2] hw/timer/hpet: Remove dead code
Date: Thu, 10 Sep 2020 15:58:51 +0200
Message-Id: <20200910135852.516809-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200910135852.516809-1-philmd@redhat.com>
References: <20200910135852.516809-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 08:38:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Thu, 10 Sep 2020 13:59:06 -0000

This code was never compiled/used, remove it.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
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


