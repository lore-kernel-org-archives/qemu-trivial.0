Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lH02F-000778-3R
	for mharc-qemu-trivial@gnu.org; Tue, 02 Mar 2021 03:05:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH02D-00075H-AG; Tue, 02 Mar 2021 03:05:37 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:35601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lH02B-00046T-RG; Tue, 02 Mar 2021 03:05:37 -0500
Received: by mail-ej1-x635.google.com with SMTP id dx17so5901909ejb.2;
 Tue, 02 Mar 2021 00:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nm2moPnpz/dAK8p3yLwcugrMA1iGHP07uLqzqW3wl7g=;
 b=aO8cd+03I/FNSXZlU8+yqZ5IDi5fHTmpwpIcw6eWnoy/z/pA26V1KTrYb87Fg3jLLL
 ARaCAoISXHa3d8wQcwMlzARArlmFycSz04Fb6NDKg566zSi9DyaAlfM65uPkdqfvSfly
 lkjSEMp14tVxWc/ItAlXd30z7KZkRAKN120Zo8w8VEEwG1XWGa/CDSRpLL2PFqGxQ8uU
 yetTicITnMURw0T+8wudvzdnJxWLsRr8Mlrowy4/cPbNMAzBUseilS+Me2oBTqhOZLjV
 WCvlsUslXclgEMzv5OyWUt6mV5o01Qph8EbTwCJdzaiAwvpweM1ew4VzPXx9ZZ17/EDz
 WVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=nm2moPnpz/dAK8p3yLwcugrMA1iGHP07uLqzqW3wl7g=;
 b=C06pC29qL6J/VFEkyI/t6uMqNTD9Byg7XqcCc6c/92caNOWsRL48EPd9eVNCIGW2lv
 0YTY7ZacZfNNaxwxTa4vzVryg9+Dpl0gIQxyhQnwJANRRVYC29l9BON+y4TEYksA2xvw
 OxSLKpJtXT6oh+FUQpNlS/EKvcJqkI+vdq1y7nDguel6eRo2ABlfY9mzYafn3f5hEA5x
 eyi85HySLQuoXeCsYyEep/mHKA6bj6ASDBVcArUVxLTAkZhfdKNVjO8GRzoeIZX5KJX8
 EexkiGdEx1yRTof2R+MnsWBPogykYYhnQFRedq/1YgUY/tfnr7PFN5/SvSts+3WrW20w
 0ddw==
X-Gm-Message-State: AOAM532113OT611laiC5Ls/oYvmHW1Aq0fb3vjWCDxkRMOcLqeDq46oc
 o3JYEFh6aeJG5ZODbRvKsZm2WAwynHA=
X-Google-Smtp-Source: ABdhPJxsn7jvh9bvbXsJ75dnGnTeNxE2w2wXwbMEwm3U+wFfuqTqM6YJTLjze8paLslQNP2wqhnJbg==
X-Received: by 2002:a17:906:d8c6:: with SMTP id
 re6mr8317413ejb.311.1614672333371; 
 Tue, 02 Mar 2021 00:05:33 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id q1sm16642158ejt.65.2021.03.02.00.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 00:05:32 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-trivial@nongnu.org,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH] hw/isa/Kconfig: Add missing dependency VIA VT82C686 -> APM
Date: Tue,  2 Mar 2021 09:05:31 +0100
Message-Id: <20210302080531.913802-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x635.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Tue, 02 Mar 2021 08:05:37 -0000

TYPE_VIA_PM calls apm_init() in via_pm_realize(), so
requires APM to be selected.

Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index c7f07854f7e..9c026d0c510 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -47,6 +47,7 @@ config VT82C686
     select ACPI_SMBUS
     select SERIAL_ISA
     select FDC
+    select APM
 
 config SMC37C669
     bool
-- 
2.26.2


