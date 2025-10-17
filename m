Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F125CCD195
	for <qemu-trivial@archiver.kernel.org>; Fri, 17 Oct 2025 11:35:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v9ijC-0000sU-6J; Fri, 17 Oct 2025 07:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9ij4-0000mo-BS
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 07:34:26 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9iil-00060v-UK
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 07:34:26 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-46fc5e54cceso13674135e9.0
 for <qemu-trivial@nongnu.org>; Fri, 17 Oct 2025 04:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760700842; x=1761305642; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WqDslS9NKjHnUWYR3Oq3CSi9/FfiBOz9NHEnZxcZS80=;
 b=VQjIvxksVCWyo9LY+yz9ntgiSFcEST6QShBcpc62Bs844BaxkagGc3tn+6uhDKMyq8
 2/j6GXaBNAK7aZGqHK9Ufro++q4fDv7c8SV8tODKOLC/3AwS7IWq3QO3d0ijCUP+AZ2/
 JgUCChxN7GHaQQcUgn0JR8J69ddGLcWv8QtgWrQ4e+gH/p0A6A453MnhSnzFAnZ/OxbE
 fxgZYkfNzHZpWBd/z4N/BMtHE3Ur5+6juSSGP3WQeP3Mh/Pf4rEC9Vr/74+gXSJDKla9
 QQEGt63QJmYT71+jvSAuHGsWNl4EIf3KA1/mC+R58l9EY0fiziKv7CLWolFpMtYdzhE1
 uFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760700842; x=1761305642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WqDslS9NKjHnUWYR3Oq3CSi9/FfiBOz9NHEnZxcZS80=;
 b=uJ5pGu4tlI0p9zui905oXokIjVjNO4tSHPp2Sj+2h8JRJfSzEm9Za7uDXD9hxn+sYz
 cLVwdGodA5zo9JdkF6qKuEq79fCcvnvtHknv79MJBxSATexwo0HK7nd3bXbeed+pgyWB
 rmeTSyOXE18lwcflvADkQoz6J/N4sqYGqzNqb9Ezn5zeUQYDffkuiujcrs6tOEGQ1+cp
 lR2AMeB1yINZ6pjci6zTwBWTGn4sOb1gfqgAlHOeuIiqBG5JE5m/qVEpwLxp6ktzTjcF
 Fdq9mYqOwTuL8ZUl2gMRAgshvPF2ijg6a2+opyqBj6c3tc1+V+3fsuz7/2XlqFs6YMSQ
 6/2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4xaG2hEivzBRD3v4xi4a9En8z3gvk6J/IypcZkQBeiErM64sRtKs4+x4IIdTaEmKNpwBXH+Wzjx7UioA=@nongnu.org
X-Gm-Message-State: AOJu0YxvapBr6nNHaDRONb/z9fQetZgdF1ABsQpTr1lCWW1XsGWgS4W6
 Tfxpv5/XkhkAbqK83J0Wvxtk0c2XPiBAPLfxox6857ngITFaV5HBiz0t
X-Gm-Gg: ASbGncsPQV8kTCpIhc9mIgtTZVrazu8/02XV7lRDImPv5rcWEYu9YldYU+We2rTp7aX
 5TywfLOaWKkIia14vpl/BZ068D7dvJ8N2ZYFYTVreqkRgPALMr1nyk4cFgc0W+7b5FFAd2AbzJ3
 vlfrFsSqMCBvIqh/sMfB53oasZi88LpEG95SKBsdOTUhVEksTqDKwlp0ZLWAg6+BM3n1v7gIHTn
 Q4PA+zg4j7NWVgMxY3u2zQUakTftwwBOjdQKqvtw63wtptcuKJpSPyCPYxBNUOjFdUtikj/tuhT
 2b6qLOSwte55mocp0l9SaBcBeNH1qmQO3XtJYKHlAqfCX+RhL+pdebkpvIkaM4kdi7l7TPOGS9X
 8cWAbd4t0w7InEGZ06Xe+qs0babr87yP5Yhl/YMABa1efh8W4UnMnLLtGfJ9gyfFdN1Wkhfsz+V
 BK1mIeOBX8fav3eM0Stym9v6M5CtzKbt42F1gtguUKm+8=
X-Google-Smtp-Source: AGHT+IGrPw3UQyxZPdqjtHKNkflxp1U5RB7MM83GtBJGNyQZGFtG1sySZZLtOmG38BC7IEhw+bsWbg==
X-Received: by 2002:a05:600c:820b:b0:46e:27fb:17f0 with SMTP id
 5b1f17b1804b1-47117877244mr24190025e9.9.1760700842351; 
 Fri, 17 Oct 2025 04:34:02 -0700 (PDT)
Received: from archlinux (pd95edc07.dip0.t-ipconnect.de. [217.94.220.7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4711444c8adsm80395435e9.13.2025.10.17.04.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 04:34:01 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <laurent@vivier.eu>, kvm@vger.kernel.org,
 Zhao Liu <zhao1.liu@intel.com>, qemu-trivial@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 5/8] hw/rtc/mc146818rtc: Assert correct usage of
 mc146818rtc_set_cmos_data()
Date: Fri, 17 Oct 2025 13:33:35 +0200
Message-ID: <20251017113338.7953-6-shentey@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251017113338.7953-1-shentey@gmail.com>
References: <20251017113338.7953-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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


