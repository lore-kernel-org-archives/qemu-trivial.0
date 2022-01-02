Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n44ry-0006PD-Sr
	for mharc-qemu-trivial@gnu.org; Sun, 02 Jan 2022 12:42:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n44rs-0006Kg-Sf; Sun, 02 Jan 2022 12:42:04 -0500
Received: from [2a00:1450:4864:20::42e] (port=33642
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n44rr-0003lj-3M; Sun, 02 Jan 2022 12:42:04 -0500
Received: by mail-wr1-x42e.google.com with SMTP id d9so65918405wrb.0;
 Sun, 02 Jan 2022 09:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:signed-off-by:content-transfer-encoding;
 bh=pHCAwqns1twtPFixgldOfBOPXptGKHgFxpFDmDRmBVg=;
 b=lAl50+GPB3pIhLuudiXTIDrYGSifmxGpOpu6yCoZWHPpLeV4u44stFn5/PMNlAhwwM
 B/KcIO7zAuBIQaC1M5POM3DCI8zrOBQ9HVWBVfzvCkB74BVg576cgrCtidDhmxD4S57e
 zzuX65SjAHLEzwqEfrvOqbtf296e4wm8KnMm941gQU+e+AhKNWUH+4SuhUepI7v/9EV0
 RNpd//gxFUk5oA1iVI74yzAvRblMfW1FdU8x6yrSRqFUOBSa+zeDryMk77b3EKaQmLi2
 iKDXM0A8HmAG/+QFi/xPDWx7O+zjCsYYlOr686s6oY8kn0BGauAkzhI5f7NIjKSPBpaA
 oFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:signed-off-by:content-transfer-encoding;
 bh=pHCAwqns1twtPFixgldOfBOPXptGKHgFxpFDmDRmBVg=;
 b=AYocj8MFIFlyqg/pgWL6DJfVsG3b2qBqyg+glAL5mHmGJYj+TryZFZ48F3GEs/7BKU
 bX1NglzX6uAESRmcYfCaIq10og45P3Csp71eQCZkQP/wDvgpjN2puTimmMiRqQipylFt
 b/GVaycYkeXh1g5OHlTYlcZIzPiXyyDISTRByxo6dxQcGXwOD9D+4I1OdeWcIp8e4L21
 cD+aGSqJK9A9Lc4rCs5j5e1+LtYcZ2SIIFAcv3g6WZpuFziNsLZaITVsddWsa+Fw5bNS
 qZY4hqMBZqaQmyNPm2K+PlnN3w7WGv89X5g4qhXk9BkGC96gwBd/zoT9heu0ZakepIMZ
 p/DQ==
X-Gm-Message-State: AOAM533yx70dJ9ynW2BikUFBRtIYsdEf5xlARBGodx1xSLSTonCoWoaE
 8Xafs1N+zUNV9p7WgJRPZnjVQp8BmVI=
X-Google-Smtp-Source: ABdhPJzhNs0LfxYOMI0U/boWBDL1Yro+z7I4B7hOrlH9zDgtM+5enU/KSl9UmwZeZuYArWTpXNonSw==
X-Received: by 2002:a5d:6049:: with SMTP id j9mr34787212wrt.332.1641145321566; 
 Sun, 02 Jan 2022 09:42:01 -0800 (PST)
Received: from localhost.localdomain (201.11.75.194.dyn.plus.net.
 [194.75.11.201])
 by smtp.googlemail.com with ESMTPSA id w9sm1626565wrq.70.2022.01.02.09.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jan 2022 09:42:01 -0800 (PST)
From: Carwyn Ellis <carwynellis@gmail.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-trivial@nongnu.org,
 Carwyn Ellis <carwynellis@gmail.com>
Subject: [PATCH 2/2] ui/cocoa: release mouse when user switches away from QEMU
 window
Date: Sun,  2 Jan 2022 17:41:53 +0000
Message-Id: <20220102174153.70043-3-carwynellis@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220102174153.70043-1-carwynellis@gmail.com>
References: <20220102174153.70043-1-carwynellis@gmail.com>
MIME-Version: 1.0
Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=carwynellis@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 02 Jan 2022 17:42:05 -0000

This resolves an issue where using command-tab to switch between QEMU
and other windows on the host can leave the mouse pointer visible.

By releasing the mouse when the user switches away, the user must left
click on the QEMU window when switching back in order to hide the
pointer and return control to the guest.

This appraoch ensures that the calls to NSCursor hide and unhide are
always balanced and thus work correctly when invoked.

Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
---
 ui/cocoa.m | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/ui/cocoa.m b/ui/cocoa.m
index 01045d6698..3f7af4a8fa 100644
--- a/ui/cocoa.m
+++ b/ui/cocoa.m
@@ -1243,6 +1243,7 @@ QemuCocoaView *cocoaView;
 - (void) applicationWillResignActive: (NSNotification *)aNotification
 {
     COCOA_DEBUG("QemuCocoaAppController: applicationWillResignActive\n");
+    [cocoaView ungrabMouse];
     [cocoaView raiseAllKeys];
 }
 
@@ -2052,6 +2053,7 @@ static void cocoa_display_init(DisplayState *ds, DisplayOptions *opts)
             [(QemuCocoaAppController *)[[NSApplication sharedApplication] delegate] toggleFullScreen: nil];
         });
     }
+
     if (opts->has_show_cursor && opts->show_cursor) {
         cursor_hide = 0;
     }
-- 
2.34.1


