Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50576CCD184
	for <qemu-trivial@archiver.kernel.org>; Sun, 19 Oct 2025 21:04:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vAaZF-0007Vg-VD; Sun, 19 Oct 2025 17:03:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vAaZD-0007US-F8
 for qemu-trivial@nongnu.org; Sun, 19 Oct 2025 17:03:51 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vAaZ8-000238-Pn
 for qemu-trivial@nongnu.org; Sun, 19 Oct 2025 17:03:49 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-63c523864caso3049593a12.1
 for <qemu-trivial@nongnu.org>; Sun, 19 Oct 2025 14:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760907824; x=1761512624; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ROqS5b9mjR1Hcdo/MNxQW9zo/TvwGOsH5rFLzCQXjhw=;
 b=Xi6wop5ZBLtEvQ7okDhUca5A8UKK2iFeejWZmbfNmgtgPG3GJpGEh/asEIiLsJpojg
 YDPosdY1jqq9P0XEiRjoY//JHWSUIynF9v2jJt9oIU/aGwf2w8IlWSyCge5Z1dfP0OXX
 ypcdtexxV3TZ7BOQ9BFUjyDH0XEtVgGjCJFixe1jFwckSxd+nO6Mowc9gRLTvwdPKtFO
 HUxoj0CjyPJK8ResVw7gHTUP11DY2tLOtvb/xenrQ+poOiYt4qKQPWqGbm3FQtUipcFC
 yz0/DghId5boNP8t7Jiwu8CcFGPYt+w6iUe8TTZMMPkQ8CWx8RJgkL0mxDwrw6j10lIF
 Tt/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760907824; x=1761512624;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ROqS5b9mjR1Hcdo/MNxQW9zo/TvwGOsH5rFLzCQXjhw=;
 b=vK45+tSnizCpy85kU776WDGf/2lbJjoWKvX/RXHbOeGUPu6+ls1ULyRp6GchRYV4rb
 CHga5kckHe5R874az4R9VlBFK21YEeHYFd12mo0j8JVbvalRmMvPifEm1hv8y6QX/sAN
 0oN2fMk9PIjLQIHIW4IhKnYMbuzgmWCYMm/nR4XQocZUlan4I1o9VpFLR67UzJPD3SDd
 moxucNI4Ix2oZyk5JhneSVmpdRWwRdG58TXeEaY7hFKB68ObiplYewXH0LIbRfUVzeFI
 xRfB0GGyGNsmHBLmW1M+InPnWhHURzEd2yB20QeGO/bnZVA4HkJPRdnzFiPD8XnlXUmI
 +7qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyhYbAqQbZXPSDF7HOAs1J6ZzFF4lZul3ztRC+qdfjqURysiEFwoOISOwkmx7bNC+MRqsF+j0K1Ck29/Q=@nongnu.org
X-Gm-Message-State: AOJu0YwperMe7A+jTphDuHMIVgby3nW668RXBcGTlsnQjKu/UlN4XqPE
 qLCVwTADyCBMz0c2tg7lGVcv+YCJqBg102YmC+ro48mv2pIr2SP8Us/h
X-Gm-Gg: ASbGnctbXUwmunwQ/YTuBTN6Irm+VobrLA58dmsK0LTwGBwth+UmlVrTLwLzKFfnwKW
 yGi4k7IX0SnD2gqB7BjME80MvIMCO8mfKccaD61a0XNhZsAfh3VN7mLZT+bFbWSI594vvUwW6sB
 b7z2GFLypGoNWK+41pG3Lblrjqn6/SlKMIb5EuLAgV5To3m0qFyPbRDcT3GkzBgmDN/2CnsaNRQ
 PGTbCPdwDDsynp7woy8k9ZwzaZyfyxf/ipe+LUF9n/pT6xSfBGJfHZIEqXTzhKuhrgUSVHYkuPP
 dRGzOA7hO3ZG+iHPp8wINj/TR2GmOwBYCXiZY2vq4t3wuhezLD+Y7UYD2+/7A53W3tgvw9fzTaN
 osjp9BQ/sVqzNfYuib2OHTBIzqS6WdAlKI96hHzJGM3F8StmrqfL87w59olKAOdpO7c5jzrwRET
 XgDBv1Aej4tg+HRLnsMIlGEbhb/gT31Wehn2hf58vAWPX7EKaYHTLqvR0TM5KzvO2n4Ekq
X-Google-Smtp-Source: AGHT+IHqxQHSLWGjl/1o+caM7v59/pl99Hw05CaKkU9VxpB1BkUo2CSz0N/TNd5uoNKIH8Cs1RcreQ==
X-Received: by 2002:a05:6402:461a:b0:634:ab80:d84b with SMTP id
 4fb4d7f45d1cf-63c1f6c42c3mr10193464a12.32.1760907824053; 
 Sun, 19 Oct 2025 14:03:44 -0700 (PDT)
Received: from archlinux (dynamic-002-245-026-170.2.245.pool.telefonica.de.
 [2.245.26.170]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c4945f003sm5107655a12.27.2025.10.19.14.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Oct 2025 14:03:43 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Zhao Liu <zhao1.liu@intel.com>,
 kvm@vger.kernel.org, Michael Tokarev <mjt@tls.msk.ru>,
 Cameron Esfahani <dirty@apple.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, John Snow <jsnow@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 09/10] hw/intc/apic: Pass APICCommonState to
 apic_register_{read, write}
Date: Sun, 19 Oct 2025 23:03:02 +0200
Message-ID: <20251019210303.104718-10-shentey@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251019210303.104718-1-shentey@gmail.com>
References: <20251019210303.104718-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x530.google.com
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

As per the previous patch, the APIC instance is already available in
apic_msr_{read,write}, so it can be passed along. It turns out that
the call to cpu_get_current_apic() is only required in
apic_mem_{read,write}, so it has been moved there. Longer term,
cpu_get_current_apic() could be removed entirely if
apic_mem_{read,write} is tied to a CPU's local address space.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/intc/apic.c | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index ba0eda3921..077ef18686 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -769,17 +769,11 @@ static void apic_timer(void *opaque)
     apic_timer_update(s, s->next_time);
 }
 
-static int apic_register_read(int index, uint64_t *value)
+static int apic_register_read(APICCommonState *s, int index, uint64_t *value)
 {
-    APICCommonState *s;
     uint32_t val;
     int ret = 0;
 
-    s = cpu_get_current_apic();
-    if (!s) {
-        return -1;
-    }
-
     switch(index) {
     case 0x02: /* id */
         if (is_x2apic_mode(s)) {
@@ -868,6 +862,7 @@ static int apic_register_read(int index, uint64_t *value)
 
 static uint64_t apic_mem_read(void *opaque, hwaddr addr, unsigned size)
 {
+    APICCommonState *s = cpu_get_current_apic();
     uint64_t val;
     int index;
 
@@ -875,8 +870,12 @@ static uint64_t apic_mem_read(void *opaque, hwaddr addr, unsigned size)
         return 0;
     }
 
+    if (!s) {
+        return -1;
+    }
+
     index = (addr >> 4) & 0xff;
-    apic_register_read(index, &val);
+    apic_register_read(s, index, &val);
 
     return val;
 }
@@ -891,7 +890,7 @@ int apic_msr_read(APICCommonState *s, int index, uint64_t *val)
         return -1;
     }
 
-    return apic_register_read(index, val);
+    return apic_register_read(s, index, val);
 }
 
 static void apic_send_msi(MSIMessage *msi)
@@ -919,15 +918,8 @@ static void apic_send_msi(MSIMessage *msi)
     apic_deliver_irq(dest, dest_mode, delivery, vector, trigger_mode);
 }
 
-static int apic_register_write(int index, uint64_t val)
+static int apic_register_write(APICCommonState *s, int index, uint64_t val)
 {
-    APICCommonState *s;
-
-    s = cpu_get_current_apic();
-    if (!s) {
-        return -1;
-    }
-
     trace_apic_register_write(index, val);
 
     switch(index) {
@@ -1054,12 +1046,17 @@ static int apic_register_write(int index, uint64_t val)
 static void apic_mem_write(void *opaque, hwaddr addr, uint64_t val,
                            unsigned size)
 {
+    APICCommonState *s = cpu_get_current_apic();
     int index = (addr >> 4) & 0xff;
 
     if (size < 4) {
         return;
     }
 
+    if (!s) {
+        return;
+    }
+
     if (addr > 0xfff || !index) {
         /*
          * MSI and MMIO APIC are at the same memory location,
@@ -1073,7 +1070,7 @@ static void apic_mem_write(void *opaque, hwaddr addr, uint64_t val,
         return;
     }
 
-    apic_register_write(index, val);
+    apic_register_write(s, index, val);
 }
 
 int apic_msr_write(APICCommonState *s, int index, uint64_t val)
@@ -1086,7 +1083,7 @@ int apic_msr_write(APICCommonState *s, int index, uint64_t val)
         return -1;
     }
 
-    return apic_register_write(index, val);
+    return apic_register_write(s, index, val);
 }
 
 static void apic_pre_save(APICCommonState *s)
-- 
2.51.1.dirty


