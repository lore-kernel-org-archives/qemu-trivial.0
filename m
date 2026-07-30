Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 437FDC55165
	for <qemu-trivial@archiver.kernel.org>; Fri, 31 Jul 2026 00:30:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wpb8K-0002fl-Df; Thu, 30 Jul 2026 20:29:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oliverhenryc@gmail.com>)
 id 1wpZp2-0008F6-Hl
 for qemu-trivial@nongnu.org; Thu, 30 Jul 2026 19:05:52 -0400
Received: from mail-qv1-xf31.google.com ([2607:f8b0:4864:20::f31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <oliverhenryc@gmail.com>)
 id 1wpZp1-0000hb-4l
 for qemu-trivial@nongnu.org; Thu, 30 Jul 2026 19:05:52 -0400
Received: by mail-qv1-xf31.google.com with SMTP id
 6a1803df08f44-907abe5462bso602716d6.1
 for <qemu-trivial@nongnu.org>; Thu, 30 Jul 2026 16:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785452750; x=1786057550; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=WeoZMFRUcScYUud2h5F047Ygt+CNqlQ41cRVby3nNZ4=;
 b=O+7x55poI3NUpZGUXU/XT70rYwH0C+uCQFCAybrhYKczVGbl8m/xHauj2moH5GRY/N
 nmpK3IjUTCGorc7OzZQs41/mHvqCrYWvFPHSa2/xvXTRo78XXpEIWNxpGrzMIh4QXoTe
 2ZcXIjY0EE2eTQSIS/YBi1XR/u0938XRzvhAw/fjFvCboBnsIpQ/GOLGzsnmiszobPrP
 vhajgKMNxqKNsCjz+oisHdD3doaeF5ozB2JibjaDGtyN8wfPvJHc0Y7GKh4Tu+ypQto4
 NcCZTK0T7B+QlXOLyT2znqUxk1XZJqE0q5k8XMeKwO8UKYnkW+UYtvRJv9BpQY4kmBGg
 co6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785452750; x=1786057550;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WeoZMFRUcScYUud2h5F047Ygt+CNqlQ41cRVby3nNZ4=;
 b=sI4rlL6pDxBssgaRDJ5lqcFkKo3lvDBwzsMaCfSLswBGz2qVssgR3e92HNSpfgC4Wz
 tOWDCE7y8QReiau5bEK+pLjKI8G/Np+gRPfQyuFWdGggMR+qNF8kAH6NUmwuJm9S2v04
 tWlhefirRVG36XckMFHHePFd/7fvXZduLISZX5sGIWFHpc0m9V1Me6jxvvuZzssqGhrJ
 g5NJS4pC2szSjdJ+7D/abDnHoCEBbnSg6/Qd1Fu6fPc/YohAiZaJxvofyFzg/H0JH3ft
 3KPUTkGUyAtFKMhqRC4WPnUnDiZ8VDuAMdfrfmLjqNDb49vOfR6YT3CKViVXJ++EbcOn
 F60g==
X-Gm-Message-State: AOJu0YzIKsXkIsGncOFVA1HSd8H0IuY4z64Pydi1vE0d+Uf03uwonUVU
 dak+pIotnziZadJQItyAKKnRW65u8m1tMM7NbwtaPME7kRuvLb7wbRP8
X-Gm-Gg: AR+sD10rDHJphTG2HIK+6Hjfbg7ZhCP2WnKCHpJJAsu4OMaxaeeu4JxHblzqSlrO2qp
 PnXTM5eILdV1lqcRfIzt+nt7KQR194IUSQRInVcC84R5JU4q9WHZIdGsL9x/dqXt30MNgIx9RKJ
 JEueeha1nMjACSd3vxN8RwB8SGSStcRhOt+DxYk317B10a7LC666awbqpxd1eZymmnmbStKTaNY
 mRX0+8elW2/UOxwDm1da+3wi4dpgEIS8/FE8MUxcH5hwVLT/bpHsaUZrANGzVW10RNKSYuTtJ6F
 7b3IGf4wOhU/7m3gAVQyJFjZJTg5uIZKSRmlgTvoCTm3Ej1iC2zVThNzU6o8bFR//HzA9bGve0Z
 issbD9S+PGYBCpdtquVXWm5YUEYIs9RH8gten5ls4reE2yF9pX6KScZaC08p1PMMhCfcwxE0JYW
 R+zydkrmxUdkf2yH0Ue1P5c/Nz/9jEPc7V7D5XQcl5tDeTTUEJRapmYmG4fQ5aMyN6MaVINNEJF
 /scgFxMK7YJKYN8bMI0rCRflPy0mfdOoxsblw==
X-Received: by 2002:a05:6214:e84:b0:8e9:ee1f:6631 with SMTP id
 6a1803df08f44-9083be78c93mr33422606d6.3.1785452749712; 
 Thu, 30 Jul 2026 16:05:49 -0700 (PDT)
Received: from DESKTOP-MVROD8J ([147.124.77.95])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-908324f8805sm28111446d6.35.2026.07.30.16.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2026 16:05:49 -0700 (PDT)
From: Oliver Clarke <oliverhenryc@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, marcandre.lureau@redhat.com,
 Oliver Clarke <oliverhenryc@gmail.com>
Subject: [PATCH] sdl2: fix HighDPI display scaling
Date: Thu, 30 Jul 2026 19:04:48 -0400
Message-ID: <20260730230449.963-1-oliverhenryc@gmail.com>
X-Mailer: git-send-email 2.51.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f31;
 envelope-from=oliverhenryc@gmail.com; helo=mail-qv1-xf31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 30 Jul 2026 20:29:50 -0400
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

This makes sdl2 windows work well with dpi scaling. It fixes the issue of the display surface being stretched to fit the dpi corrected window (which created a blurry result).

Note, this does not do any scaling, it just tells the os to not scale the window. Before, when the console requested size 640x480, the logical size of the window was 640x480, and the physical size was scaled by the dpi scaling. Now, both the logical and physical size will be 640x480. This is unlike most dpi aware programs which usually do have the scaled physical size, then also make the render target that scaled size as well. This doesn't make as much sense for QEMU, since the guest is responsible for modesetting, and they should get the exact physical pixels they request (if i modeset to 3840x2160, I wouldn't want this to be scaled in any way).

Signed-off-by: Oliver Clarke <oliverhenryc@gmail.com>
---
 ui/sdl2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/ui/sdl2.c b/ui/sdl2.c
index 1c97d23a47..1910477db4 100644
--- a/ui/sdl2.c
+++ b/ui/sdl2.c
@@ -102,7 +102,7 @@ void sdl2_window_create(struct sdl2_console *scon)
         flags |= SDL_WINDOW_OPENGL;
     }
 #endif
-
+    flags |= SDL_WINDOW_ALLOW_HIGHDPI;
     scon->real_window = SDL_CreateWindow("", SDL_WINDOWPOS_UNDEFINED,
                                          SDL_WINDOWPOS_UNDEFINED,
                                          surface_width(scon->surface),
@@ -907,6 +907,7 @@ static void sdl2_display_init(DisplayState *ds, DisplayOptions *o)
     char *dir;
 
     assert(o->type == DISPLAY_TYPE_SDL);
+    SDL_SetHint(SDL_HINT_WINDOWS_DPI_AWARENESS, "permonitorv2");
 
     if (SDL_GetHintBoolean("QEMU_ENABLE_SDL_LOGGING", SDL_FALSE)) {
         SDL_LogSetAllPriority(SDL_LOG_PRIORITY_VERBOSE);
-- 
2.51.0.windows.1


