Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34ABCCD195
	for <qemu-trivial@archiver.kernel.org>; Sun, 19 Oct 2025 21:05:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vAaZ3-0007RL-GF; Sun, 19 Oct 2025 17:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vAaZ0-0007P1-NH
 for qemu-trivial@nongnu.org; Sun, 19 Oct 2025 17:03:39 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vAaYy-00021I-9m
 for qemu-trivial@nongnu.org; Sun, 19 Oct 2025 17:03:37 -0400
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-b3f5e0e2bf7so737377066b.3
 for <qemu-trivial@nongnu.org>; Sun, 19 Oct 2025 14:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760907815; x=1761512615; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WqDslS9NKjHnUWYR3Oq3CSi9/FfiBOz9NHEnZxcZS80=;
 b=JdT50y4pTYhg+g9mxUO+Gozw1kBVM91ffYWoztdmf3OF5EOOVIwAAhdVGw7nXq3VRq
 +ved9IA+EX39WIZBOITN9Rz52QSPsdFe7EKvtZH591CYtPNskX3Z+ojApxLVdvsPXXb/
 I3pCTNWnMlLwpHBZLOItgmWoMn1xQDMh0EliU2m2oAY2OVlXgRk1NBbrYsZKFnzlKnk2
 /F+08VhMwVSB0Um9GJ95pcVj70eqsDTrxA/E84Cwp7Bjnal/SWeFoAhT4GafuvszG2LE
 RLIOcl92c67pxcj1AT4wI7Fmb82M4quQRtrE6KRaXRuxj984G2edFLxkEQvLRJrTcyYT
 edPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760907815; x=1761512615;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WqDslS9NKjHnUWYR3Oq3CSi9/FfiBOz9NHEnZxcZS80=;
 b=jaPDAmQ4VzVWa8zW/oJhlRN+DvDfWVO7tVbNzLJTU0yS8VUVr3W1C0GKpD14n6NFrR
 MeeBTImdSIw0Qf6njyezq+3yrd0bRu2wyalBRMl3Zw/kUyK7NQa0awlnI/yWrvQHvxUN
 nJBu1/rPGQuxmEyyT8+aJND60GWIApIng5PpH0+UufIgL/fMx1BwcxWYTVEW8hWygduT
 orVkIK+C8RgkJdswQzVDqRlHS6gL1P86/mwFeg5EHmlO8DGCCfJJfWSfb3NwPsLTlsUu
 cDugA4snP1CzEwxpT/Wh14qL7cH05icfptM5kXLAUtdDNnKSTqZN49aK4V+OT9vQyZSy
 xCEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMqoy100NMWTKDAEAXUwd0mPgCxdvDXVRxlVbrxDEjwOObXcdRMZ/6Vc7kJhcmHIOIQJvdeHcV3845uN8=@nongnu.org
X-Gm-Message-State: AOJu0Yx/Ejq56YX5GnTnC3UhvPEole7c7/LUabOihgdHDerGKj2bnh+R
 YqbwjoO58UtenncVPPMCtm3DNpoOgkwQ5bAKcWYrdaGKOzRKbWTJDzEm
X-Gm-Gg: ASbGncvwfV3beLddi6q/P3GvRjaZsmTkV0pljdrMt/jpThRQ1POekDZJmpChxUYS7ex
 8lvcgOXBSVkkuTodcN/Qb7u2AfYmOfKFsF3QqcxHEdff9LbsKnRzhxEWyIRmLWqRW16gphsuAwD
 vaC6AFpvu2elwu//Z70UO6/QywpWHQIZS5gQka+hq7TKupdXv82WJDoqdpywOa6ZutsGX2QINOq
 UUJCZRXKtaMOtc93Sx9llOdy2zhrv8xa1u31ELgcIl41PsAl3ARQBWzJtn5kSkJH8Lpx7QaACbh
 knPvqDDHNyYug1jU8YjYTffFob2YWTMw+xvj0+B/K/a5FJGpd4aoPXC6wMaZNQtTbiR2e7UhwJg
 h735qWm6mijirW73XRqNKuOuqc2Ak9guTJXlL9KgmTNRgjQvsSj1gimV2/GmSIEQGzcUyjWo2F/
 a/hCkUDnrgpL4lRx0zLSm2jsScg5kO8Ort4Z6SMyel+t67J5tMidquG2FF4v9UXj7w5z/q
X-Google-Smtp-Source: AGHT+IGPfPy34v/udZLQXvm5jDIXrAZ61l/oD9nGQpnV8TbdI46dqjRmVUAcVk/yLDzjHgyLvbFqIQ==
X-Received: by 2002:a17:907:728c:b0:b57:5353:1032 with SMTP id
 a640c23a62f3a-b6472b5fab6mr1140469866b.5.1760907814623; 
 Sun, 19 Oct 2025 14:03:34 -0700 (PDT)
Received: from archlinux (dynamic-002-245-026-170.2.245.pool.telefonica.de.
 [2.245.26.170]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63c4945f003sm5107655a12.27.2025.10.19.14.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Oct 2025 14:03:34 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Zhao Liu <zhao1.liu@intel.com>,
 kvm@vger.kernel.org, Michael Tokarev <mjt@tls.msk.ru>,
 Cameron Esfahani <dirty@apple.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, John Snow <jsnow@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 05/10] hw/rtc/mc146818rtc: Assert correct usage of
 mc146818rtc_set_cmos_data()
Date: Sun, 19 Oct 2025 23:02:58 +0200
Message-ID: <20251019210303.104718-6-shentey@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251019210303.104718-1-shentey@gmail.com>
References: <20251019210303.104718-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

The offset is never controlled by the guest, so any misuse constitutes a
programming error and shouldn't be silently ignored. Fix this by using assert().

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/rtc/mc146818rtc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index 5a89062b4c..8631386b9f 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -726,9 +726,8 @@ static uint64_t cmos_ioport_read(void *opaque, hwaddr addr,
 
 void mc146818rtc_set_cmos_data(MC146818RtcState *s, int addr, int val)
 {
-    if (addr >= 0 && addr < ARRAY_SIZE(s->cmos_data)) {
-        s->cmos_data[addr] = val;
-    }
+    assert(addr >= 0 && addr < ARRAY_SIZE(s->cmos_data));
+    s->cmos_data[addr] = val;
 }
 
 int mc146818rtc_get_cmos_data(MC146818RtcState *s, int addr)
-- 
2.51.1.dirty


