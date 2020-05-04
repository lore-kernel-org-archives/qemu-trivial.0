Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jVWNA-0005BK-Ke
	for mharc-qemu-trivial@gnu.org; Mon, 04 May 2020 04:22:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jVWN9-000599-8d; Mon, 04 May 2020 04:22:43 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:42350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jVWN8-0006wX-IL; Mon, 04 May 2020 04:22:42 -0400
Received: by mail-wr1-x443.google.com with SMTP id s8so9502020wrt.9;
 Mon, 04 May 2020 01:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gVwDMqU7IDBJFvdNOuVVuB4LeRx8gjOeYN0o0mGV2Qw=;
 b=Bo1dZolLpAJb7IszJBw0u2h4zHCqI7s79sB6g6e+8ImLO7sS5vQ1M1SeFuj/raxw48
 nq83UtV3qqFMkvBbP8sezzfxuvNGWvzqGN4UsY3jpfkooNON4q2n2FfIV7f+gBn/A/Q0
 OPaiewQM8UC/kCpH6fCMWQafSzhgW5T/4Z6NOb/gMuQ/xJj5jkDGYk1R8uBC6qT1EE/6
 VckYA0ZLtPrxdaoq/DOO+UFvv0RTcbxAHd/clTSw+hOkpX3kDRGCun52vRfJxZ/LGMh2
 HvyBFRp0hYhswBMbUBP0IJEUXbbBHJzb25NxzHpwVi8ah0fblnpIxkV7RcYjzt1UaRTQ
 LXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=gVwDMqU7IDBJFvdNOuVVuB4LeRx8gjOeYN0o0mGV2Qw=;
 b=mweS/D82ZS2m7C61gzdiFevld6HPdiKxwDjzjTzBQKpwbit+wPJqlMg/zHQBBFBmz8
 KwE+VBwfQ/tSJc0mcTpjMt61NipEDvlPTSagH3mfWVWQlCyUA1H1XmRcaIrOqa9g9G34
 YQyFyeslK9ZEKk7rKpSnp7lcw+Fh0G6J7/+6X32uDABB7usfeF4EJv2q7NhKbKy7lVL3
 Hq4Wcyy3OX1C0yMBIP9vwg0oAOt1wK47cWEHvndwYs6NJkXxL5a/6q/FtB7Lf1YNxrqd
 k5lLgVu3lr5c98eXPRqmiE+iZIuyRUo+gj8Cex38OEBhfa9+Ih7H21L+T33d0ZCiB1ob
 HTXA==
X-Gm-Message-State: AGi0Pua7eMtvskBIxyH7o25UDx9WTRQqC82T1nh1ri3FE+VF2pJCN7pJ
 8AmggE4uI9o0ZewIOkJsNS9+SGrg
X-Google-Smtp-Source: APiQypJy3OfBaZK5dQxpWyDdbvySBklTV0VqAzt8csYksJOa0eN+2/+gA6WA+ZEV+cz0Mzk1t77lqQ==
X-Received: by 2002:adf:d841:: with SMTP id k1mr10114465wrl.129.1588580560042; 
 Mon, 04 May 2020 01:22:40 -0700 (PDT)
Received: from x1w.redhat.com (26.red-88-21-207.staticip.rima-tde.net.
 [88.21.207.26])
 by smtp.gmail.com with ESMTPSA id b66sm13045738wmh.12.2020.05.04.01.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 01:22:39 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH] hw/usb: Make "hcd-ehci.h" header public
Date: Mon,  4 May 2020 10:22:37 +0200
Message-Id: <20200504082238.16655-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 04 May 2020 08:22:43 -0000

As target-specific code use this header, move it to the publicly
accessible include/ folder.

  $ git grep hw/usb/hcd-ehci.h
  hw/arm/allwinner-h3.c:31:#include "hw/usb/hcd-ehci.h"
  hw/arm/exynos4210.c:38:#include "hw/usb/hcd-ehci.h"
  hw/ppc/sam460ex.c:38:#include "hw/usb/hcd-ehci.h"
  include/hw/arm/allwinner-a10.h:13:#include "hw/usb/hcd-ehci.h"
  include/hw/arm/aspeed_soc.h:29:#include "hw/usb/hcd-ehci.h"

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 {hw => include/hw}/usb/hcd-ehci.h | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {hw => include/hw}/usb/hcd-ehci.h (100%)

diff --git a/hw/usb/hcd-ehci.h b/include/hw/usb/hcd-ehci.h
similarity index 100%
rename from hw/usb/hcd-ehci.h
rename to include/hw/usb/hcd-ehci.h
-- 
2.21.3


