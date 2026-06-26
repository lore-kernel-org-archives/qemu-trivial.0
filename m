Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DF9CDE011
	for <qemu-trivial@archiver.kernel.org>; Fri, 26 Jun 2026 12:04:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wd5Hs-0005oN-2u; Fri, 26 Jun 2026 08:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ziyifu970225@gmail.com>)
 id 1wd1Zt-0000ri-Pb
 for qemu-trivial@nongnu.org; Fri, 26 Jun 2026 04:06:21 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ziyifu970225@gmail.com>)
 id 1wd1Zs-0002Er-6V
 for qemu-trivial@nongnu.org; Fri, 26 Jun 2026 04:06:21 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-4624a44e152so521419f8f.2
 for <qemu-trivial@nongnu.org>; Fri, 26 Jun 2026 01:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782461178; x=1783065978; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KHWAytSHm3rZiuxyO5V2zu9TvkYZv4XaAdR3/Rzb+d0=;
 b=eMDEaPnZUR93cNZ7Qh2A18I6Hm3vBAkgGiLjVvSma0361sxHUB8IcZXIoEzFo8TMY0
 fu40WszlT9sEPNFUDNygoxUSlN3Y6Mw5DccMCEU7gMDbZWeS3Ld/68v7t2OY6ox6Kqe1
 8dVjy1uE6WgZptWxO4fpLZr6yXsDO+TAHqy7/GTVeFC9yWeO7ZzgDEqXq3UPXGl0xWyJ
 sb/702wy95P/fsSO6av6OWMemPTYHNxLkfoYpLKg58V5o6znmiVjNRNdk87aP3G1C3fs
 pawkTzID/mX4j5FtjFb//7qu6UboWq9ycO85D/kdoV4gYzNguOstgQVUdRw4x5V284gO
 vGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782461178; x=1783065978;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KHWAytSHm3rZiuxyO5V2zu9TvkYZv4XaAdR3/Rzb+d0=;
 b=Abt7KOZXfbkc7xf0qKdPNL0mjbZPDD4Y76DE4/dD8RZxjZhhnOnHRV5nV9knNw6VkF
 czYRuxqHPyTdieBZ5lsp00Chz0fzcYkCvKXzTEAbYUGjBewe8WVM1yX4EIo8Ucry8V0M
 oSI1OCH41BjGYcyspp5cmtAFFhtM9qhAoaiXMT4qRwkFnpvj4KTsMZsy4Uk2bqmUZayp
 QBvoIXMjpBNHvldfSw2JaKGBb9yu+OP8PxYbp4Zx9UomzQTmgdUab/e4wPSZ6kSGrdcR
 3FuDldwIMDhMLiyTaKTDx8R7QljtaKgVv0J9ry6Af79wD1waR0vJgkzZI3A/EaeLTurJ
 W64g==
X-Gm-Message-State: AOJu0YxIQtlmZ5v02wjuWdEM94y/F7uRmmNjYfWcAHdi4WqbxAggowWN
 NRkj7JEHpQ8eWnGAQl5scBm/ORzelfKHMdBYha+id1OLcw4OvG9/BOG/
X-Gm-Gg: AfdE7cmQzy8Hl+r0NR9bLrRo+usz5iDTXE/xs9AFrCDU9NwCZZ0qlj+XMIE8K9y7/xp
 wiMS/PPG+7puwbV7ieJoB+ASCQPii5Iy/MotS2+pUrdvdxVD1ulHazWZ3vyQK03GeafMZn/tcZ3
 C6lup8dPgyLrEeEOIxKuGMFOf/xEttURewjZdddys8OXdDKK0eEFC3APAn3E3Y2n8dX990Y95Uc
 QaLV3BBNvy6wMwaFFfzG5WOffyjWn/bnLc6FMDlHe0MjH/5U8SEfFRI4J25t1YQmOdK7hxGOebe
 tfn6G6nu/1sEWevq8HKCohEamI5JSZQm122yF7ajtwonQDWAlynbwsK7Mg37iT8DVbLqIR9hYcr
 mlzNhf2Olol1GSEhzKwiFue029PhuMUyKqCUtUku51ZV8LmWflXyTyPQ4OosR6Cs+WWISR+Hgsm
 /RWlzlkOC/i5o=
X-Received: by 2002:a05:600c:4745:b0:490:b355:9c70 with SMTP id
 5b1f17b1804b1-49266873f5bmr79323925e9.11.1782461177871; 
 Fri, 26 Jun 2026 01:06:17 -0700 (PDT)
Received: from nixos ([2a00:8180:2004:e00:d275:2473:944c:1937])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46d3ba68d8dsm16777514f8f.27.2026.06.26.01.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 01:06:17 -0700 (PDT)
From: Ziyi Fu <ziyifu970225@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 BU Embedded <bu-embedded@cyberus-technology.de>,
 Ziyi Fu <ziyi.fu@cyberus-technology.de>
Subject: [PATCH] hw/usb: record async control completion for parameter
 transfers
Date: Fri, 26 Jun 2026 10:05:53 +0200
Message-ID: <20260626080554.1656771-1-ziyifu970225@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=ziyifu970225@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 26 Jun 2026 08:03:56 -0400
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

From: Ziyi Fu <ziyi.fu@cyberus-technology.de>

Record the completion side of parameter-based control transfers when they
complete asynchronously. This lets pcap captures include descriptor
response data for requests such as GET_DESCRIPTOR from usb-host devices.

The synchronous path already recorded the completion, but the async
SETUP_STATE_PARAM path was missing it.

Signed-off-by: Ziyi Fu <ziyi.fu@cyberus-technology.de>
---
Tested with a usb-host HID keyboard on qemu-xhci. Before this change, the
generated pcap contained GET_DESCRIPTOR submissions but not the corresponding
completion payloads. After this change, the pcap contains the descriptor
payloads and Wireshark can associate endpoint 0x81 with the HID interface.

 hw/usb/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/usb/core.c b/hw/usb/core.c
index 9572a870cc..d71204c5c8 100644
--- a/hw/usb/core.c
+++ b/hw/usb/core.c
@@ -345,6 +345,7 @@ void usb_generic_async_ctrl_complete(USBDevice *s, USBPacket *p)
             p->actual_length = 0;
             usb_packet_copy(p, s->data_buf, s->setup_len);
         }
+        usb_pcap_ctrl(p, false);
         break;
 
     default:
-- 
2.51.2

