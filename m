Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jdBD8-0000og-Us
	for mharc-qemu-trivial@gnu.org; Mon, 25 May 2020 07:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jdBD6-0000k9-3y; Mon, 25 May 2020 07:24:00 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:39345)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jdBD5-0000pF-HB; Mon, 25 May 2020 07:23:59 -0400
Received: by mail-wm1-x32c.google.com with SMTP id y5so2449030wmj.4;
 Mon, 25 May 2020 04:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xi9QqR+83+B5s2IOVxfJBVAFepRnYVrkPVzemn60gzI=;
 b=mV0Ov88tOG4k8pajy0PZCGW/D7neDXPoUh++u8F5BrLIJLal2spLcI03NtxTG5Kmyh
 Uo7QMyI0aqqxn68D7aor7DU66qktLz+EyU8K328eM3r+JVriSuOrzCJnuErNdNrixz1Z
 DF7JE2W6uSSHtxj07V/Fnk3WAtCfLi+k1ifP5tI0wga4obckuZcQ8u4+ShIrWBcB+oVJ
 OygzTUdl4aFW0dm0NEHO3hzM4YRv2o/jGHgRn8IZmzv3XcRiZJXYsWawj1CNiOW9JZav
 uqLvA2Ta99OKEtFqHBHeMcrBB8sUmyUSWTAxHgUUuS2/mhlur3uOw/59vTz33HSK3EuD
 ACZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=xi9QqR+83+B5s2IOVxfJBVAFepRnYVrkPVzemn60gzI=;
 b=mBps7zDMMBvHCPtLDUAFvH0m16FIWubMfsUHKKK+r8tsr/ZFH3jcFB2+ibKBnFrrIO
 Yf2EBAYBggzl93PZMR7wdpxXnKLrTXfDM7NsuvNMlTCRrr4RiTVPAW0j+TOv6tfLZDoS
 APg1TM7zV0d2msUkC4pTLgwxiyMjVCtWuBymlfydBzEJRTMbKHCM8vbea4rSL6ppPgcs
 tURxRJqZDA31Xf7NdNSiQKGo1uGarN4t52E8dhPspyUSvkYCxPWPHS556XKgcA9qWb2t
 TShUMbgj0h6FXs/+TAXsRPti0F4ug3uSzk75BIbiaZIll7/qtHpQagpoLlrSfha3ZW/g
 qgEg==
X-Gm-Message-State: AOAM5302Wiomsys6XAhQG1kbdGy3owIkbyNKYh/ObiHiUZo1dsyOUq7L
 7VSmH6xxGwP/Ukjnn1M0NygQ88TAhyU=
X-Google-Smtp-Source: ABdhPJyT1hGMf1DrqHJx7+AHUt01BTmY6d/eIGRODJW0Cw2/nheva5h3UfKnRLokZpdzeYOCJQ1XLg==
X-Received: by 2002:a7b:c7d4:: with SMTP id z20mr10395324wmk.35.1590405837114; 
 Mon, 25 May 2020 04:23:57 -0700 (PDT)
Received: from localhost.localdomain (71.red-88-21-204.staticip.rima-tde.net.
 [88.21.204.71])
 by smtp.gmail.com with ESMTPSA id h196sm10715635wme.22.2020.05.25.04.23.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 04:23:56 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>, qemu-trivial@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 0/3] hw/display/vmware_vga: Trivial cleanups
Date: Mon, 25 May 2020 13:23:51 +0200
Message-Id: <20200525112354.10445-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 25 May 2020 11:24:00 -0000

Use qemu_log_mask(LOG_GUEST_ERROR),
let the device be parent of a MemoryRegion.

Philippe Mathieu-Daudé (3):
  MAINTAINERS: Cover vmware_vga related files in VMware section
  hw/display/vmware_vga: Replace printf() calls by qemu_log_mask(ERROR)
  hw/display/vmware_vga: Let the PCI device own its I/O MemoryRegion

 hw/display/vmware_vga.c | 18 ++++++++++++------
 MAINTAINERS             |  3 +++
 2 files changed, 15 insertions(+), 6 deletions(-)

-- 
2.21.3


