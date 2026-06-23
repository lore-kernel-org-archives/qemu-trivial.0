Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E457FCD98F2
	for <qemu-trivial@archiver.kernel.org>; Tue, 23 Jun 2026 17:04:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1wc4Xv-00029W-3N; Tue, 23 Jun 2026 13:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wc4Xu-00029H-7N
 for qemu-trivial@nongnu.org; Tue, 23 Jun 2026 13:04:22 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <163wangjack@gmail.com>)
 id 1wc4Xs-0003J4-Qv
 for qemu-trivial@nongnu.org; Tue, 23 Jun 2026 13:04:21 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-37da8b5540bso151696a91.0
 for <qemu-trivial@nongnu.org>; Tue, 23 Jun 2026 10:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782234259; x=1782839059; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=crr1l7AbqIJpnCIIQgwjrCEC22VVL/5ejVJkhEPJPD0=;
 b=gu8oxTgxY+2y75MEWpyJegROCScNTPkF1xOgs/zE5J0N1F0CmobX5N8RIbsI9e8ZJx
 ieXwNKGBIFjMVg9C4gUrj98/hyCeQYKYNZwgj9fVovjoFnERRY9LnAAkMj0vZWilgyVe
 /Z0S0bUI/7OwZn8pQNaKHsqe5gPzyRXm5LRkxDZQPd7lPNeo3J96xg8YWRWHtpBDjoNp
 uBFNPSpC+jckW0TZjhf8yQJmkfG+YlK2UjPiLczn7ByTsaTkkH2IbygRDEXZXf5dtq9C
 fctKKdQkaX8PAezPTcJmRhSC9y5RiWavXr9IG6ymgQUzkT4Ca9dFw1jQZBa4aOsOwrnJ
 geBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782234259; x=1782839059;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=crr1l7AbqIJpnCIIQgwjrCEC22VVL/5ejVJkhEPJPD0=;
 b=dK9lcfztfWFqC97HUwEhdHjaadzU6lIhQHR8vC1T5s7xJnC25QZ+Jaoq/+1gsK8GeP
 hyAFptCyAv+omPKP0uS8TwEz5KD/eqmJZAJIDfTc4vsl/uKICEKg9CGYCBJwoNv6dKfH
 1XgZBriLSn4HecTKN7nwqSeSCb0nPjc9CcRncG6XjGP/3L8Q8jnRjszMHePnx4tE/PoU
 h5PeeLrEfZbfhMBtbdDsDW5qnvaB03uDQwwIsb6q9bjJXNuSoNJZ9M4Bx5zS1ouNUWVJ
 efMK0k3S1xSkqtD9idvk249jPeEvIEj5rrIEhpKpnCoYQqKDHoLcQzB/QOqubdDR5+Dk
 4UDQ==
X-Gm-Message-State: AOJu0YwDT4oJtNETtmYSYNSQ2vueGv0MRCpxlfEfJVVPkglY3m94qW+C
 bKXiQ2tSy0yfn44Y2JP76jenRCjF9WhnDclawDRummXJjxPRYQXSsnwy
X-Gm-Gg: AfdE7cnRjCmW9kg+bsLAv9/X/Lb9NGTXFtSFYlp49JUvkifwChuVl3b1YKMNiZRbBaE
 VNnSSvfHclmQOm0YHjD13MAIS/PwIWi5rgyT6gyXyDNp3um+7909bUyg27VUNDi44UE9EcQbAY6
 SgMuhLBefI/fgvHApw/BxWjv2QMmbFy+SXkX3ZmQwugvlEBsdEO+vbv2E27W0o0zCTVobVe7/6k
 JBesgk2AcBwY8dyWY1DbSXw2Nz3vHY4bRVcbdWwFGDV+mV8GtLYKzqdN/2/KfwMaa0QIQ+VCKJ+
 +D+VUK6jnpf8FtZ4MZGvx2duRttrKzjJF69dy7f0oAuzPzr6qi11I9y7fUOSSaPoV0PhDqkjxP6
 jbNKsEtYD6Aslt73LbfBKuX6eH/GKtsdz2BwiCpFNo9TJsBOkjSkK3dwkfvcOfv7/nLqWjHB23f
 0z/SMFfYZ3U9W4MAE+S3ALXK/gsA+ncb0mqlzg1Q==
X-Received: by 2002:a17:90b:48:b0:36d:5d1c:c4ad with SMTP id
 98e67ed59e1d1-37d160e49f9mr18017279a91.9.1782234258592; 
 Tue, 23 Jun 2026 10:04:18 -0700 (PDT)
Received: from localhost.localdomain ([212.135.211.99])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-37d4f225870sm10242924a91.8.2026.06.23.10.04.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 23 Jun 2026 10:04:17 -0700 (PDT)
From: jack wang <163wangjack@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	jack wang <163wangjack@gmail.com>
Subject: [PATCH 0/3] hw/misc: Replace DPRINTF with trace events in i.MX CCM
 family
Date: Wed, 24 Jun 2026 01:03:51 +0800
Message-ID: <20260623170354.43981-1-163wangjack@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=163wangjack@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FROM_STARTS_WITH_NUMS=0.738, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

This series modernizes the three i.MX CCM device models by removing
the old DEBUG_IMX*_CCM / DPRINTF macros and emitting QEMU trace
events instead, following the same pattern already merged for
hw/timer/imx_epit (commit 5005b00d41).

Patches are split per file so each commit changes one device, keeps
git bisect clean, and stays in scope for the trivial-patches team.

No behavior change is intended: the previous DEBUG_IMX_CCM switches defaulted to 0, 
so DPRINTF output was off by default. After this series the same information is 
available via -trace 'imx*ccm'.

jack wang (3):
  hw/misc/imx_ccm: Replace DPRINTF with trace events
  hw/misc/imx25_ccm: Replace DPRINTF with trace events
  hw/misc/imx31_ccm: Replace DPRINTF with trace events

 hw/misc/imx25_ccm.c  | 34 ++++++++++------------------------
 hw/misc/imx31_ccm.c  | 33 ++++++++++-----------------------
 hw/misc/imx_ccm.c    | 18 +++---------------
 hw/misc/trace-events | 23 +++++++++++++++++++++++
 4 files changed, 46 insertions(+), 62 deletions(-)

-- 
2.53.0


