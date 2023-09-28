Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qlrR6-0004Iy-Oo
	for mharc-qemu-trivial@gnu.org; Thu, 28 Sep 2023 09:52:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3IHgVZQgKDJUEAz0zIJI5DD5A3.1DBF3BJ-IG7K7zACDC5CJ.DG5@flex--plabatut.bounces.google.com>)
 id 1qlqZp-00015F-LB
 for qemu-trivial@nongnu.org; Thu, 28 Sep 2023 08:57:11 -0400
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3IHgVZQgKDJUEAz0zIJI5DD5A3.1DBF3BJ-IG7K7zACDC5CJ.DG5@flex--plabatut.bounces.google.com>)
 id 1qlqZo-00011u-7y
 for qemu-trivial@nongnu.org; Thu, 28 Sep 2023 08:57:09 -0400
Received: by mail-yb1-xb49.google.com with SMTP id
 3f1490d57ef6-d868842eda1so16076610276.0
 for <qemu-trivial@nongnu.org>; Thu, 28 Sep 2023 05:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695905825; x=1696510625; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Puu8I37xVpYahsOAAGkvd/Km2XPYF5T2bftP83WPWhM=;
 b=ezEmi0u+rdxQYvvLxh885ECmaB6bNjW5cdcobvGrcq/LPYg/DjPPUPEsEpxx3s+iMF
 1BHOV1/fFIHePPQQCpqR1MJvXcI/vxCTzeN5PvZTmw5J+xVkYPGCaEkmcmuhf7+TFVMt
 4Rp3VEHRsNJQW0i1j2UeaZvaXQKpElKWfCyBG8GsBzaVPO8LQr+UE/LRbPUx19rWJJwv
 BkcmBKuaGo+yOlOQLGnPIEx4koFNm8Xq5sUke46xbDqpWwR0kRfSzbsz8V8a0DUCVDS3
 P9xObJPsKgiRKdN16OKvr/lh7LXU91Wp4afBMNc5PRv0Tb4g+o8vbl59HevCTj8VE9In
 5kAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695905825; x=1696510625;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Puu8I37xVpYahsOAAGkvd/Km2XPYF5T2bftP83WPWhM=;
 b=TKZllXZm/zLHuNEwk0S8r8VDO6oWLDKs5yNgeXB6z87OFLnPTejGsO+6AvDjRIYl7S
 Efz2D5YTrrM3qOwy3mhIEEIzpm26lGhpNhvBartf28Nd1KKLfFmakXEJu8V4gGYJv95b
 G7E78I12Jx6Ytk5cht3WO7dTjioSdmoutSlqLswmS4x97nrAUooL6QkRrCnGJ/aUVIxM
 swPklT7JI1wOUBxK2Ra6VDiXSg6Z4za9NqMis434MU/7u8cfmCtoDmO1qZlm0XdFQBMa
 6eB9RWaW4GLHd+wu/pMPC6UKQwnYhIl0ZWQTkJ3BGmny1pzFDFPMsf1hN/phIsF4A/B0
 VpXg==
X-Gm-Message-State: AOJu0Yw+PgWzsyxSox9P4h3CIPFurdGkDyNjKv3ybzFhDKSrnxM6HSh8
 rwkFjJVmIk3CX5luRw2gcKGhCBYA9h4qWizh3AOa2IzNfQVhe3zid15SEROHQvMaUORiJvAyj40
 K+Mk5lnfCUJXF/Vi7zLm3ea2UVyA0wveCZWS3KO5v5XyLCG4GjLvLxprOB26s8Mue1BWX
X-Google-Smtp-Source: AGHT+IG3qDWrWedhBeS1RRB0tQuAoGDsRZo1bc61MSsxdTmJsbgcNSxgKIFn6K9+qS2LjNnjopJsRCdTa+bwaw==
X-Received: from plabatut.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:7f2a])
 (user=plabatut job=sendgmr) by 2002:a25:abaf:0:b0:d7b:9830:c172 with SMTP id
 v44-20020a25abaf000000b00d7b9830c172mr18048ybi.0.1695905824694; Thu, 28 Sep
 2023 05:57:04 -0700 (PDT)
Date: Thu, 28 Sep 2023 12:56:59 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
Message-ID: <20230928125700.1504442-1-plabatut@google.com>
Subject: [PATCH] Fix compilation when UFFDIO_REGISTER is not set.
From: Pierre Labatut <plabatut@google.com>
To: qemu-trivial@nongnu.org
Cc: Pierre Labatut <plabatut@google.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=3IHgVZQgKDJUEAz0zIJI5DD5A3.1DBF3BJ-IG7K7zACDC5CJ.DG5@flex--plabatut.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 28 Sep 2023 09:52:10 -0400
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
X-List-Received-Date: Thu, 28 Sep 2023 12:57:12 -0000

Signed-off-by: Pierre Labatut <plabatut@google.com>
---
 subprojects/libvhost-user/libvhost-user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 0469a50101..d4a2eab883 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -629,9 +629,9 @@ static bool
 generate_faults(VuDev *dev) {
     unsigned int i;
     for (i = 0; i < dev->nregions; i++) {
+#ifdef UFFDIO_REGISTER
         VuDevRegion *dev_region = &dev->regions[i];
         int ret;
-#ifdef UFFDIO_REGISTER
         struct uffdio_register reg_struct;
 
         /*
-- 
2.42.0.515.g380fc7ccd1-goog


