Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ioblm-0000P7-6e
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jan 2020 18:26:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45070)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <danielhb413@gmail.com>) id 1ioX3m-0001Wk-QF
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 13:25:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <danielhb413@gmail.com>) id 1ioX3l-0003kH-MB
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 13:25:02 -0500
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:43832)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <danielhb413@gmail.com>)
 id 1ioX3j-0003ho-Hv; Mon, 06 Jan 2020 13:24:59 -0500
Received: by mail-qv1-xf34.google.com with SMTP id p2so19406856qvo.10;
 Mon, 06 Jan 2020 10:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b3ezhmI6tKSWqDJ/WfwsteLWfxOpOCrsFHh/gbYbAF0=;
 b=tzBvyGj+wo2T2PolIlgntJfnn2j0wmFIzjfVA/xfbb6SHdEOj3ECGjiDut4B2xfRUx
 HvfWVudIb33UJYVpg64NVRCAF90YRNV59v/jWQ1BvCig2z2ObX0JQzfK/zpBhdjzU+E3
 IvbB5oOLuvl9rUo+OHQTWip3yVc44k7Hs5AKXtOIQkNBzFPKD4Xt/PEYT0iBGPJxPpVF
 6x8lz/kRro2g5UIqTVg87FoAJ+EGGk301p/uPY6NV9w31M3hBgbcutVG2/fUra3E+23Z
 BuFkuj/XsU4YjvjNKGl4RDTX49CxhILyGAp+KyveD+J+XAburCq05wAMAtMBlGzVI8Qg
 u2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b3ezhmI6tKSWqDJ/WfwsteLWfxOpOCrsFHh/gbYbAF0=;
 b=t10rjgl4vNYfAbqRkzoSThgUeWQcmYPBK7ZhYzb+qjdU5BUVOwX8plv25XxwomPpos
 zoKUt/MEAqfFNTYuyoKdeNWGtMCy4DOocPuNlQCpdjzGL1SF/Q9vhMMA7Jt5L2Qv8pm8
 /3fe3EE0Me3NFpHuaF7YZ2Tb6KWYyA7GqG7fIOCPYyneJVqs/Hi58uQ36uwtAGLk9EAT
 wnbSzXTI+kHgAE1Wz3hqQak1m+Jeoa5DpZpDBEluB9O3EdAilNPrTy5cuhuP16qpC02C
 my30IKNw/6KNtrozVTnDApayQBQTTRmGjAqUSeEaSYntml9+FA++QAFyN+6ka6Yg8g/Z
 z0rg==
X-Gm-Message-State: APjAAAU7lG0pGGMeSSopkQ3HYceD6UngohKWTnC9TUQ9aForHyfM0lz8
 ycJZ248i3uJN52Hv2uDzPgB8eroU
X-Google-Smtp-Source: APXvYqxa8alPkC2npZOI2FQeAkrumgVeX/miC9HIetSqUniM1Jt1AOLEdKApQV2OAJgr2qzoUR3JLA==
X-Received: by 2002:ad4:58e1:: with SMTP id di1mr65547720qvb.201.1578335098883; 
 Mon, 06 Jan 2020 10:24:58 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:655b:9e1c:e865:3705:e1df])
 by smtp.gmail.com with ESMTPSA id b81sm21026522qkc.135.2020.01.06.10.24.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 10:24:58 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v1 04/59] paaudio.c: remove unneeded labels
Date: Mon,  6 Jan 2020 15:23:30 -0300
Message-Id: <20200106182425.20312-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200106182425.20312-1-danielhb413@gmail.com>
References: <20200106182425.20312-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::f34
X-Mailman-Approved-At: Mon, 06 Jan 2020 18:26:41 -0500
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
X-List-Received-Date: Mon, 06 Jan 2020 18:25:04 -0000

Label 'fail1' in qpa_init_out() and qpa_init_in() can be replaced
by 'return -1'.

CC: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 audio/paaudio.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/audio/paaudio.c b/audio/paaudio.c
index 55a91f8980..8f42b2079c 100644
--- a/audio/paaudio.c
+++ b/audio/paaudio.c
@@ -470,7 +470,7 @@ static int qpa_init_out(HWVoiceOut *hw, struct audsettings *as,
         );
     if (!pa->stream) {
         qpa_logerr (error, "pa_simple_new for playback failed\n");
-        goto fail1;
+        return -1;
     }
 
     audio_pcm_init_info (&hw->info, &obt_as);
@@ -479,9 +479,6 @@ static int qpa_init_out(HWVoiceOut *hw, struct audsettings *as,
         &obt_as, ppdo->buffer_length);
 
     return 0;
-
- fail1:
-    return -1;
 }
 
 static int qpa_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
@@ -518,7 +515,7 @@ static int qpa_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
         );
     if (!pa->stream) {
         qpa_logerr (error, "pa_simple_new for capture failed\n");
-        goto fail1;
+        return -1;
     }
 
     audio_pcm_init_info (&hw->info, &obt_as);
@@ -527,9 +524,6 @@ static int qpa_init_in(HWVoiceIn *hw, struct audsettings *as, void *drv_opaque)
         &obt_as, ppdo->buffer_length);
 
     return 0;
-
- fail1:
-    return -1;
 }
 
 static void qpa_simple_disconnect(PAConnection *c, pa_stream *stream)
-- 
2.24.1


