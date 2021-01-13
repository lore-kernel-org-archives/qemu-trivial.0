Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kznXc-00052u-LF
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jan 2021 16:18:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.dentinger@spacecodesign.com>)
 id 1kznNs-000828-C9
 for qemu-trivial@nongnu.org; Wed, 13 Jan 2021 16:08:52 -0500
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:36626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anthony.dentinger@spacecodesign.com>)
 id 1kznNp-0005bg-BD
 for qemu-trivial@nongnu.org; Wed, 13 Jan 2021 16:08:51 -0500
Received: by mail-qv1-xf2a.google.com with SMTP id j18so1467858qvu.3
 for <qemu-trivial@nongnu.org>; Wed, 13 Jan 2021 13:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=spacecodesign.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=/+0KbUs6wv+H6He8aUZqbucCfLiVDvi1h7YFTS+o9Lc=;
 b=Pthwd01bpXr73WlyGOY5CVMUDBXqH8loYeQZtYSSy8B2LUvvAFVbtt4UuzBvbLMpOq
 tEV4Nlj/vRxuSslc3vi9/fM7yNHcQrqC+pO1WKdLL790Bz1Tfp6rQiTwStFsogBIP9je
 hwWq5X62mWsE1yKkxaSe44cSoofHm7yhFnx54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=/+0KbUs6wv+H6He8aUZqbucCfLiVDvi1h7YFTS+o9Lc=;
 b=CyMq4qFCRreY7UOvSwCtsv7BMFzIsUCDruMIwnNTXrhYaGve97XYwGzxrCieFUOKow
 vVLU7SGbe/ui7P2xSxyexSSNezVgTOGVgfvFaf0//Y1g9CTd+ho+wCzAq8saziDjVUkn
 iVmN0KBxsF9RVWP93oE/VEOo5mgMI8OgOlvqtzrYQ3zG9ka+y/OyA+lDdTDWAy8SyEd8
 TkCzc2QhEOOSW2A/KT2NoAc9BucjG2WA+ce3beC3O9z7QEo14ftc/1BiyPd5/CSqul0O
 Ha3Y6WO/9VEefWHXZuxJ+4wz2K9mjmEWXDu4N+ClriTnHxCOd4r5yNu8wbYBNmN2yYBY
 XJXA==
X-Gm-Message-State: AOAM533Hnjr96Rl00qXatSLscZe74CEFXiVSmeVdxwReF3HCcp3BBQrZ
 CwzpYy2u+0c9zVmyEhnALyY3pMIJdF/GJLut
X-Google-Smtp-Source: ABdhPJxu6SRG1FvjiyEX53Yhyojw23mwvaKnbTYczeKVij6SD01jshlebeVsUAewLOHIigFgagsUZg==
X-Received: by 2002:ad4:4f11:: with SMTP id fb17mr4395938qvb.46.1610572126601; 
 Wed, 13 Jan 2021 13:08:46 -0800 (PST)
Received: from localhost.localdomain (104-37-205-141.resi.cgocable.ca.
 [104.37.205.141])
 by smtp.gmail.com with ESMTPSA id m8sm1818675qkh.21.2021.01.13.13.08.45
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 13 Jan 2021 13:08:46 -0800 (PST)
From: Anthony Dentinger <anthony.dentinger@spacecodesign.com>
To: qemu-trivial@nongnu.org
Cc: Anthony Dentinger <anthony.dentinger@spacecodesign.com>
Subject: [PATCH] hw/char/cadence_uart: Fixed wrong Cadence UART stop bit count
 register value.
Date: Wed, 13 Jan 2021 16:08:34 -0500
Message-Id: <20210113210834.1552-1-anthony.dentinger@spacecodesign.com>
X-Mailer: git-send-email 2.16.2.windows.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=anthony.dentinger@spacecodesign.com;
 helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Jan 2021 16:18:55 -0500
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
X-List-Received-Date: Wed, 13 Jan 2021 21:08:52 -0000

Here is a reference showing that 0x00 is the correct value:
- https://www.xilinx.com/support/documentation/user_guides/ug585-Zynq-7000-TRM.pdf
  (page 1776, Register XUARTPS_MR_OFFSET Details, which is for a platform
  called Zynq that has a UART made by Cadence)
- https://github.com/Xilinx/linux-xlnx/blob/51445f9139af73c616f054a8fcc77ed2568b81b1/drivers/tty/serial/xilinx_uartps.c#L98
  (Linux driver for the Cadence UART on that Zynq platform).

Signed-off-by: Anthony Dentinger <anthony.dentinger@spacecodesign.com>
---
 hw/char/cadence_uart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
index c603e14012..a049ed50c4 100644
--- a/hw/char/cadence_uart.c
+++ b/hw/char/cadence_uart.c
@@ -93,7 +93,7 @@
 #define UART_DATA_BITS_7       (0x2 << UART_MR_CHRL_SH)
 #define UART_PARITY_ODD        (0x1 << UART_MR_PAR_SH)
 #define UART_PARITY_EVEN       (0x0 << UART_MR_PAR_SH)
-#define UART_STOP_BITS_1       (0x3 << UART_MR_NBSTOP_SH)
+#define UART_STOP_BITS_1       (0x0 << UART_MR_NBSTOP_SH)
 #define UART_STOP_BITS_2       (0x2 << UART_MR_NBSTOP_SH)
 #define NORMAL_MODE            (0x0 << UART_MR_CHMODE_SH)
 #define ECHO_MODE              (0x1 << UART_MR_CHMODE_SH)
-- 
2.16.2.windows.1


