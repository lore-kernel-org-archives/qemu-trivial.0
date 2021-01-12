Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kzHsH-0004mO-Ch
	for mharc-qemu-trivial@gnu.org; Tue, 12 Jan 2021 06:30:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kzHsD-0004ix-E7
 for qemu-trivial@nongnu.org; Tue, 12 Jan 2021 06:30:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kzHsB-0001T0-9n
 for qemu-trivial@nongnu.org; Tue, 12 Jan 2021 06:30:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610451001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=dRiaAu9hETYu/BXG8y6YWk/SYgh2bgnB6lVdCYZbJwU=;
 b=VzsycT9ig00Vh1e+Ax2bZpZAe0PtW2P1RCDsQU6/lbtJPTSFaueKM0vaDRCWRuE5XDRT4X
 hQMgxvDzqei2dD16LbasqmtLVx1m6J3Nwuz+kMqxq3d/jxl8mu9sORFDH8vybtqqBPJcYd
 R2zv+IpQzNSBjfx2ASfmWWwM6MU38ME=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-pITW-c2bMoKBoNoThe6zjQ-1; Tue, 12 Jan 2021 06:29:59 -0500
X-MC-Unique: pITW-c2bMoKBoNoThe6zjQ-1
Received: by mail-wm1-f72.google.com with SMTP id b194so350132wmd.3
 for <qemu-trivial@nongnu.org>; Tue, 12 Jan 2021 03:29:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dRiaAu9hETYu/BXG8y6YWk/SYgh2bgnB6lVdCYZbJwU=;
 b=DZS+9PoCa29ZA45ZN7AvzYv6X/u8/47zwBXJEGQUZxJUVkROyBO+VNyB2jlGhG8XQ3
 P25nhRYQQhzzIP8RUxNn5Adc3KwlqRXqKyy4z6riowmQErb5prorhoV+kgUlJJ9oyO+J
 7+VLJWDRw3Rsw21XexaFwAv0h1cDFm1d2jAdZafZZPTYMSSDkHUJanI2WnbN1haRy0hx
 3cQ0e8C12i4Q2vIjwZiVSJBSqtUDQlMh+ZVB+zm7QC8pbk6SZkGGsbycaYtZ3/N50FXX
 AaeGQoGxvWCgf6Ccut9zR/Axe82YuxeWfEQt5h5+AbqWp2k8Dvxcwbq/bJCIN7XeWSjT
 3EhA==
X-Gm-Message-State: AOAM533tXOJ5ypCkHDlfj9fvt5/bL5i5DmcOdPwN+zKIa4V/KZPPXjsU
 19Ev638ksVOwwAToPETVtJ4fNyoVItP39kgvMWFzcKWeExEcGvCys9fCBQp4GEKfCkDrb4PpJXE
 s+7U/tKLT1ASsE3f2fA==
X-Received: by 2002:adf:dc84:: with SMTP id r4mr3739694wrj.232.1610450998322; 
 Tue, 12 Jan 2021 03:29:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOCkOEWLUrR2VTOfh7upb+ZmDxb4KFoAyvMlLsnIrxZeGnKt4CZvlhL66lzNjHfSzeOppwvQ==
X-Received: by 2002:adf:dc84:: with SMTP id r4mr3739671wrj.232.1610450998092; 
 Tue, 12 Jan 2021 03:29:58 -0800 (PST)
Received: from localhost.localdomain
 (190.red-83-57-173.dynamicip.rima-tde.net. [83.57.173.190])
 by smtp.gmail.com with ESMTPSA id j59sm5067392wrj.13.2021.01.12.03.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 03:29:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, qemu-block@nongnu.org,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] hw/ide/ahci: Replace fprintf() by qemu_log_mask(GUEST_ERROR)
Date: Tue, 12 Jan 2021 12:29:55 +0100
Message-Id: <20210112112955.1849212-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 12 Jan 2021 11:30:06 -0000

Replace fprintf() calls by qemu_log_mask(LOG_GUEST_ERROR).

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/ide/ahci.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 4b675b9cfd8..6d50482b8d1 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -465,8 +465,9 @@ static void ahci_mem_write(void *opaque, hwaddr addr,
 
     /* Only aligned reads are allowed on AHCI */
     if (addr & 3) {
-        fprintf(stderr, "ahci: Mis-aligned write to addr 0x"
-                TARGET_FMT_plx "\n", addr);
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "ahci: Mis-aligned write to addr 0x%03" HWADDR_PRIX "\n",
+                      addr);
         return;
     }
 
@@ -1111,7 +1112,8 @@ static void process_ncq_command(AHCIState *s, int port, uint8_t *cmd_fis,
     g_assert(is_ncq(ncq_fis->command));
     if (ncq_tfs->used) {
         /* error - already in use */
-        fprintf(stderr, "%s: tag %d already used\n", __func__, tag);
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: tag %d already used\n",
+                      __func__, tag);
         return;
     }
 
-- 
2.26.2


