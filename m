Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kGN6V-0001eu-Er
	for mharc-qemu-trivial@gnu.org; Thu, 10 Sep 2020 09:59:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kGN6U-0001cK-AT
 for qemu-trivial@nongnu.org; Thu, 10 Sep 2020 09:59:10 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:24796
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kGN6S-0003sF-Kg
 for qemu-trivial@nongnu.org; Thu, 10 Sep 2020 09:59:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599746347;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZoFYGRmakF5g5oQA1REcNZ0QsgbkYiu/M6HpT8wcTwo=;
 b=QgZOGZh+necEm2rvQ2yrX6TbR51UkqSFsDAp4mk4fkNZAKbBKyxNGpfClT7UfShk3+phqc
 yiRpEKCp0gjbOFfXVSgwgtXUV9jcJ/ygqAc7h2arbSLuh+XUQkP70uF9wEm/IxtVMOusHg
 cC3Z7okduE1w0+UuhH1Xu4+Oi2A312U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-9cQ8sfvlMuKKaApSa3ZxGA-1; Thu, 10 Sep 2020 09:59:05 -0400
X-MC-Unique: 9cQ8sfvlMuKKaApSa3ZxGA-1
Received: by mail-wm1-f70.google.com with SMTP id 23so31296wmk.8
 for <qemu-trivial@nongnu.org>; Thu, 10 Sep 2020 06:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZoFYGRmakF5g5oQA1REcNZ0QsgbkYiu/M6HpT8wcTwo=;
 b=ZxA6r/ZIaI//0JC9mqsqdq1F9r1vvYKPPEkcaOwXbS3C8hnK/se15N9MIc1gUzk7iW
 Qk3sVz7EmrZ4bea3yuWtTOZsMip5ffNarAkRajmEMOxg36AeDkvAPxY2tRcz+S0+h9vo
 ZiKFCifKMbSpeGb/pilfpVr748Y2J0EmWkv3FwdSl2jMrKJWdKjjxLSYT8YJJIDZAfcE
 9mkcumzrixz+pwamn6mTouE6ZWVSYJIF8k6rvfG4GOslv9u+uCvhEuVk3v4+9zfwJgXx
 2c1ewoi6vlLtUCWBJ4hneVlEj7YzTscGaMG7X5FblxrSrrEctDLG/U4TM9TACofmg+uZ
 NrRw==
X-Gm-Message-State: AOAM530L7mzPjRkAmR5rqedwmQ5NrxJFWvm3BQtC9v6c97kYvJXXbsj/
 NLrKFFRMQqoeq8V/nwuPPwGCbFkIwPpMPVYB0pfbZe+PZ6ono7TqMBWfHXtHcsm+A/N9ZZzOk2g
 JCsX+EtemaAgQ73HuLw==
X-Received: by 2002:a5d:634d:: with SMTP id b13mr9430868wrw.324.1599746344464; 
 Thu, 10 Sep 2020 06:59:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwy6RIhL+x/0FP0Y9VjyGYMw3xGiuSxmmhaKbxe8cBobjfShD25xqqCwP6BM5Yq37IhOZALSQ==
X-Received: by 2002:a5d:634d:: with SMTP id b13mr9430848wrw.324.1599746344288; 
 Thu, 10 Sep 2020 06:59:04 -0700 (PDT)
Received: from x1w.redhat.com (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id q20sm3640924wmj.5.2020.09.10.06.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 06:59:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Dov Murik <dovmurik@linux.vnet.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 2/2] hw/timer/hpet: Fix DPRINTF format string
Date: Thu, 10 Sep 2020 15:58:52 +0200
Message-Id: <20200910135852.516809-3-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200910135852.516809-1-philmd@redhat.com>
References: <20200910135852.516809-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/10 09:07:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 10 Sep 2020 13:59:10 -0000

Fix building with HPET_DEBUG enabled:

  hw/timer/hpet.c:512:73: error: format specifies type 'unsigned int' but the argument has type 'uint64_t' (aka 'unsigned long') [-Werror,-Wformat]
      DPRINTF("qemu: Enter hpet_ram_writel at %" PRIx64 " = %#x\n", addr, value);
                                                            ~~~           ^~~~~
                                                            %#lx
  hw/timer/hpet.c:655:21: error: format specifies type 'unsigned int' but the argument has type 'uint64_t' (aka 'unsigned long') [-Werror,-Wformat]
                      value, s->hpet_counter);
                      ^~~~~

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/timer/hpet.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/timer/hpet.c b/hw/timer/hpet.c
index b683f64f1d3..20bd0388740 100644
--- a/hw/timer/hpet.c
+++ b/hw/timer/hpet.c
@@ -495,7 +495,8 @@ static void hpet_ram_write(void *opaque, hwaddr addr,
     HPETState *s = opaque;
     uint64_t old_val, new_val, val, index;
 
-    DPRINTF("qemu: Enter hpet_ram_writel at %" PRIx64 " = %#x\n", addr, value);
+    DPRINTF("qemu: Enter hpet_ram_writel at %#" HWADDR_PRIx " = %#"PRIx64"\n",
+            addr, value);
     index = addr;
     old_val = hpet_ram_read(opaque, addr, 4);
     new_val = value;
@@ -637,7 +638,8 @@ static void hpet_ram_write(void *opaque, hwaddr addr,
             }
             s->hpet_counter =
                 (s->hpet_counter & 0xffffffff00000000ULL) | value;
-            DPRINTF("qemu: HPET counter written. ctr = %#x -> %" PRIx64 "\n",
+            DPRINTF("qemu: HPET counter written. ctr = %#"
+                    PRIx64 " -> %#" PRIx64 "\n",
                     value, s->hpet_counter);
             break;
         case HPET_COUNTER + 4:
@@ -646,7 +648,8 @@ static void hpet_ram_write(void *opaque, hwaddr addr,
             }
             s->hpet_counter =
                 (s->hpet_counter & 0xffffffffULL) | (((uint64_t)value) << 32);
-            DPRINTF("qemu: HPET counter + 4 written. ctr = %#x -> %" PRIx64 "\n",
+            DPRINTF("qemu: HPET counter + 4 written. ctr = %#"
+                    PRIx64 " -> %#" PRIx64 "\n",
                     value, s->hpet_counter);
             break;
         default:
-- 
2.26.2


