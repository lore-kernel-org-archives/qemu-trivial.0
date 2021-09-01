Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mLPAT-0006D8-G7
	for mharc-qemu-trivial@gnu.org; Wed, 01 Sep 2021 08:16:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mLPAQ-0006AY-P2
 for qemu-trivial@nongnu.org; Wed, 01 Sep 2021 08:16:35 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:36436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mLPAP-00083i-5z
 for qemu-trivial@nongnu.org; Wed, 01 Sep 2021 08:16:34 -0400
Received: by mail-qt1-x82c.google.com with SMTP id d11so2336738qtw.3
 for <qemu-trivial@nongnu.org>; Wed, 01 Sep 2021 05:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9d7gWlG2jrqTaKfKtQ7cgmiLBbVCcFP+SmyvRo7UtMs=;
 b=B8LG6r30O6vsnu6JNvFKVeVlc613ckBJ5w015H0Z++K1S39hgZXWXa5wHHZ9mlgZog
 TQuOPHr518BBpodbzgPxaSbOSEcZCBxKyYbKpl4k1UncZiRM6mUN3iWNSnr7c+ns5h+G
 k2zf1d78ZMCYPraOt9Welk0VOWrCwOqX6FkOFsDMRmGmWq7HSagDrebfucgq3x+C12e+
 W4AdI2DitElaTZT7sAyQLQUZPVG5ztUgEN4zjNBf4hTL6h4wXUof+U7TIbf9aIQIAp/k
 57NFums5lXNWxrf5AxKf1sW0mUy2PEuScPCI96LQL5WAbUIYfNE4ZJnrwk9MMd95Ge3a
 l2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9d7gWlG2jrqTaKfKtQ7cgmiLBbVCcFP+SmyvRo7UtMs=;
 b=qjH9LMGpwNax+Q4MzFh/uUhSxKnnEY5WlVQZK4doM6Sq9FQ+tgjZjI5Y9wOj9Ft0LY
 BEUW/VLJYBJpKwLD+BEOJmvlAN2KEQXgMCMeyK+15KoVnqDHTiCY5KlcNhW0mX5Z6C2j
 Kssrl1BTrCXm2mPN5uU8lb3jsvpRsnVzMW9TLUXXzfC1GfTO57R+e7T/I0CmjfXkmE9/
 pDDxuZxvUfHKUHHMVWAx2WGRmY/b5kkiAyp86AS5sOWR3Q24LucYsL7m3KdXsMKqeus8
 /dmb8eZJy5Lzt8cma9XVbGLOyu+DR4HUHxtyg3OQiqQ65dTVoAW9Z2FpFv66g2lzVpmX
 15Sg==
X-Gm-Message-State: AOAM532nSHB+3Mh8JHJTVyVS29pPC9oNnaorU9WLrmyMbGA4Swy3xbTY
 sYBPUnHV54V5k68v1mXu7TUuJiWPvS0=
X-Google-Smtp-Source: ABdhPJwLFPHQIeOZYkaab7aqPgWRnfDKg9PPf2L0x5F3724LPJnM8GmbpH8pCbumS6iK2t+cJECzaw==
X-Received: by 2002:a05:622a:58f:: with SMTP id
 c15mr7995796qtb.21.1630498591731; 
 Wed, 01 Sep 2021 05:16:31 -0700 (PDT)
Received: from localhost.localdomain (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id o23sm15859931qkk.40.2021.09.01.05.16.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 Sep 2021 05:16:31 -0700 (PDT)
From: John Arbuckle <programmingkidx@gmail.com>
To: qemu-trivial@nongnu.org,
	mjt@tls.msk.ru,
	laurent@vivier.eu
Cc: John Arbuckle <programmingkidx@gmail.com>
Subject: [PATCH] Add qemu_vga.ndrv to build/pc-bios folder
Date: Wed,  1 Sep 2021 08:16:20 -0400
Message-Id: <20210901121620.1320-1-programmingkidx@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=programmingkidx@gmail.com; helo=mail-qt1-x82c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Wed, 01 Sep 2021 12:16:35 -0000

Currently the file qemu_vga.ndrv is not copied into the /build/pc-bios folder. This makes all video resolution choices disappear from a PowerPC Mac OS guest. This patch has the qemu_vga.ndrv file copied into the build/pc-bios folder giving users back their video resolution choices.

Signed-off-by: John Arbuckle <programmingkidx@gmail.com>
---
 configure | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 9a79a004d7..281577e46f 100755
--- a/configure
+++ b/configure
@@ -5056,7 +5056,9 @@ for bios_file in \
     $source_path/pc-bios/openbios-* \
     $source_path/pc-bios/u-boot.* \
     $source_path/pc-bios/edk2-*.fd.bz2 \
-    $source_path/pc-bios/palcode-*
+    $source_path/pc-bios/palcode-* \
+    $source_path/pc-bios/qemu_vga.ndrv
+
 do
     LINKS="$LINKS pc-bios/$(basename $bios_file)"
 done
-- 
2.24.3 (Apple Git-128)


