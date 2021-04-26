Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lbBUJ-0004F4-7g
	for mharc-qemu-trivial@gnu.org; Mon, 26 Apr 2021 20:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dev.devaqemu@gmail.com>)
 id 1lb7Ui-0007Po-UN; Mon, 26 Apr 2021 16:06:13 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:41786)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dev.devaqemu@gmail.com>)
 id 1lb7Uf-0001Od-N5; Mon, 26 Apr 2021 16:06:12 -0400
Received: by mail-wm1-x343.google.com with SMTP id
 o21-20020a1c4d150000b029012e52898006so5679120wmh.0; 
 Mon, 26 Apr 2021 13:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZYzECBAoWUxLNGhLXO0FzrlEVXSfjJjCzqVH//aq4Dk=;
 b=dEBE0/RPwt92o59W4pknGVpssGzbmvh3k+QsNV2hCsXjyvxkySuKAOProQkbI+wELu
 YsKa/cFFcmHHKIsQqFUrcLj1EWrWMY2hlkngWb203zdOnnUjlUt5hUXgYCSL0C9XlaGV
 gcKNhcGDXbCH7t+lfe0wUNxSyHOQ4RYdgiV8Vb2c0RMrTzb5MCsilG05SZPqoS/pjcMd
 e6UksoTznkIM80S7mfbqObiht1Ihvq8cgdJ8MqCZMkWfXl1BenY8ZorAckoP+toSvdWM
 /IIsHYwLXmPsDS2UG36OjZkdrXNNv4VvHbqtgslmibXpJ8yI/OhM4Vby7tndSzsRY65T
 yZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZYzECBAoWUxLNGhLXO0FzrlEVXSfjJjCzqVH//aq4Dk=;
 b=D8JcnyS53SlTrARy1xWkli0DCU4wQlouL0KjbogjLMOJN/U76BOACIGlXZjE09/ck2
 ENfg30Knfhgfy2LBSgbLGCfz0rFfku0HA29e8+HtkwglB7iWP4w8oC8KNcoAnBIJ3nvm
 zHasaXV6Nw0GUSt/+r8S/5PMY0a17hBplfI9+h+hhaDugRvEVwOnHatN+XzhhcQmm2kW
 U5xf15jFPRreu8IEaLTISdEB2qt4AnlmlkDns8WQHqQIa7Cf6QwA9PephRR4Cl/Xl6Gk
 Nt9dCqtl04oRC9mujte7uJQCHftl9takbI9QwzKJaa2mzIiMLH4QVhnC6uQzreTEUKSX
 hfsQ==
X-Gm-Message-State: AOAM533eL0pvOnQsqlQSYsOCScf7sJgWYMmrjyloAPcItfWGdcWxwe6g
 OM5n9/h39MTm/HbHMq2Bqo1mSDmqPk+wEQ==
X-Google-Smtp-Source: ABdhPJxeyiMtOmcYrPWUpgJOFNPvofodzLujjMwZdnEwLg3XD25psutBByAmSl9NGR+9UJUblW3JAQ==
X-Received: by 2002:a1c:a481:: with SMTP id n123mr666629wme.162.1619467566580; 
 Mon, 26 Apr 2021 13:06:06 -0700 (PDT)
Received: from ubuntu.localdomain (host-92-0-155-74.as13285.net. [92.0.155.74])
 by smtp.gmail.com with ESMTPSA id y11sm1396792wro.37.2021.04.26.13.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 13:06:06 -0700 (PDT)
From: Dev Audsin <dev.devaqemu@gmail.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, qemu-trivial@nongnu.org, dgilber@redhat.com,
 dev.devaqemu@gmail.com
Subject: [PATCH] skip virtio fs cache section to enable NIC passthrough
Date: Mon, 26 Apr 2021 13:05:53 -0700
Message-Id: <20210426200553.145976-2-dev.devaqemu@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210426200553.145976-1-dev.devaqemu@gmail.com>
References: <20210426200553.145976-1-dev.devaqemu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=dev.devaqemu@gmail.com; helo=mail-wm1-x343.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 26 Apr 2021 20:21:57 -0400
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
X-List-Received-Date: Mon, 26 Apr 2021 20:06:13 -0000

Signed-off-by: Dev Audsin <dev.devaqemu@gmail.com>
---
 hw/vfio/common.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 6ff1daa763..3af70238bd 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -541,7 +541,8 @@ static int vfio_host_win_del(VFIOContainer *container, hwaddr min_iova,
 
 static bool vfio_listener_skipped_section(MemoryRegionSection *section)
 {
-    return (!memory_region_is_ram(section->mr) &&
+    return (!strcmp(memory_region_name(section->mr), "virtio-fs-cache")) ||
+    	   (!memory_region_is_ram(section->mr) &&
             !memory_region_is_iommu(section->mr)) ||
            /*
             * Sizing an enabled 64-bit BAR can cause spurious mappings to
-- 
2.25.1


