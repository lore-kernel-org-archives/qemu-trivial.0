Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FE3CCD199
	for <qemu-trivial@archiver.kernel.org>; Fri, 17 Oct 2025 14:16:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1v9lCl-0004lv-Uz; Fri, 17 Oct 2025 10:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9lCf-0004jE-JD
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 10:13:09 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1v9lCO-0005h3-V3
 for qemu-trivial@nongnu.org; Fri, 17 Oct 2025 10:13:07 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-471131d6121so15681965e9.1
 for <qemu-trivial@nongnu.org>; Fri, 17 Oct 2025 07:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760710369; x=1761315169; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HtQk0GJuCq/JgD3T73Q/ujEtbCnLstw5lfgjKUjPFqo=;
 b=IbUvP/ttLHzkn03Vujr6uXLoSaDKtsfJhgXLxzEB3GdgcY1yQ8m5FFrYi2YuoUK5+C
 GbqFIE0NSqBNomDp5ypzJc0ToGhpumJwPWGu7OTh+ECy6v9Q1CeQUyfkGyJ/j17ZkMLU
 IR1cYEkO0476aMV4a5EwlNLcB2z0xsfU/UCp/2gvcsPA8RqpOnPqNacxkvqQiE1hLZrw
 BM0+kG4nQnPdfLEXlFXgQ22GXzqBahtb9SU5eePp1+AlcJCDGUugiFmSbfvK6N2CFvTy
 rpE5SJy02DaNCMinKgK47VYXnW1/5WrCBBey62shigz9Qh6877U9uIlIiRslb2ctY5pR
 jLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760710369; x=1761315169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HtQk0GJuCq/JgD3T73Q/ujEtbCnLstw5lfgjKUjPFqo=;
 b=e1OiaB8lDL/BuSmourWWFNjpv2jjY0TbGVcU3zrnpunfbjbZymIsPPK/ivGhGrSty8
 g1jFIrrc0BpjaZ5Gn0Y28FSkm7yTkepS8Nia0QPJtwqQGDPt4KP9bd6uZtk7boVoqXn4
 oyGFVr9OxK12n8yr8j0Yd76RqVd7m6ygL5wCd34tsIBzEWEY9FZjvE/MqpDKMPzgtaZ/
 TQUllXCMujqlSzDMhSkXZ3eokX+6WltTVOzIgvsKvH+u0TITcedAz3s6g3PWJ8JmRPzA
 bH5F/nvjzwkHqgyf5SOE6Eh7jPyYwdH/2WkGf3s14LRttrY5MwlJGDitTONoCqoTnk9m
 0cRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXA6jhpGUdfWxkv8yKKVg+mo6kb0uwW1bdBtzHtXi4Yvq/Tn7Uqq/n2ejjhUUI7zsSK9oZYfk9Nv9a88BM=@nongnu.org
X-Gm-Message-State: AOJu0Yy2gx1hzlQLB1+6+yeDSQHkz6awoUah/m2/7fxlvSIDTmMTdWBE
 lMCRgqMQZjs4GndY2lYJcGzkdrM4SYnsLwVZR+Ssf50t9qeAtvElyiuE
X-Gm-Gg: ASbGncueTxIwFiYzDLHL6KGOrtKWPJ970/VUQrK71y5FERjWOSvibrfiDjQm9DF2T/C
 b12IKzATSU2iBEtevRYnCB+1JVxUrtSEh/RBY26L4Z04Eig2UK11H6qcWloBjv+hYdW15TXjBOM
 hoBQejTBaXV1JwOMtR0enDzUmIHBR7WF7MWSOmSroQUH/nCpRWInbYCIp7ByZmU2edNmw3zfV7k
 V1auKBH4UUnnWDhrswZDvZ1zAgtiW6o4JynFgdrb5Ze1oNrAVSIakSDRvU1Vudm40KFusiBny1V
 yucLnKJS36TTOs7j8iWf0XGbdPXtv13qEvsV0Xek9zvveGzMsdnHy5ecfuLt6n2222JeC0lv5ov
 WY0NPTN99IkP9YHJD/d6byjAy2epdhp2UNe8qZzz5puC7610PoqvqQhSW4dmVNXVcub2WJTExsK
 vRDeyZVas+7sGNDZZAsEWaIxMzB2c/HT6ps/io+QLFzWg=
X-Google-Smtp-Source: AGHT+IElsIb/+OVACplDy763YqEHBwFhKZ/w/iY2OrFjr2q46IPQug3eVaWvEqAmJxYiR/ktjpqWEQ==
X-Received: by 2002:a05:600c:3e8f:b0:46f:a95d:e9e7 with SMTP id
 5b1f17b1804b1-471177ab11dmr32479285e9.0.1760710369052; 
 Fri, 17 Oct 2025 07:12:49 -0700 (PDT)
Received: from archlinux (pd95edc07.dip0.t-ipconnect.de. [217.94.220.7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4710cb36e7csm51359675e9.2.2025.10.17.07.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 07:12:48 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Roman Bolshakov <rbolshakov@ddn.com>, Laurent Vivier <laurent@vivier.eu>,
 Eduardo Habkost <eduardo@habkost.net>, Cameron Esfahani <dirty@apple.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Zhao Liu <zhao1.liu@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, qemu-trivial@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Phil Dennis-Jordan <phil@philjordan.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 John Snow <jsnow@redhat.com>, kvm@vger.kernel.org,
 Laurent Vivier <lvivier@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 04/11] hw/rtc/mc146818rtc: Use ARRAY_SIZE macro
Date: Fri, 17 Oct 2025 16:11:10 +0200
Message-ID: <20251017141117.105944-5-shentey@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251017141117.105944-1-shentey@gmail.com>
References: <20251017141117.105944-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Avoids the error-prone repetition of the array size.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/rtc/mc146818rtc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index 61e9c0bf99..5a89062b4c 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -726,13 +726,14 @@ static uint64_t cmos_ioport_read(void *opaque, hwaddr addr,
 
 void mc146818rtc_set_cmos_data(MC146818RtcState *s, int addr, int val)
 {
-    if (addr >= 0 && addr <= 127)
+    if (addr >= 0 && addr < ARRAY_SIZE(s->cmos_data)) {
         s->cmos_data[addr] = val;
+    }
 }
 
 int mc146818rtc_get_cmos_data(MC146818RtcState *s, int addr)
 {
-    assert(addr >= 0 && addr <= 127);
+    assert(addr >= 0 && addr < ARRAY_SIZE(s->cmos_data));
     return s->cmos_data[addr];
 }
 
-- 
2.51.1.dirty


