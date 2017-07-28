Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxxj-0004fs-0q
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:37:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48339)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxg-0004dK-Pk
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxd-0003ta-Ud
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:37:20 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:37978)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxa-0003ob-HP; Fri, 28 Jul 2017 01:37:14 -0400
Received: by mail-qk0-x243.google.com with SMTP id v76so8644252qka.5;
	Thu, 27 Jul 2017 22:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0AWk+F7JFoWqHj6qOzlHORdS5hbyPcN3WaXF1fwoOn4=;
	b=AG138CHNxqfPEyeZi0N8m8CCSLo/GgaRfvk7h+bWo5p/MYXgmDYWSq0afakVv3gZni
	Dl1VDhYNlBeFHOyDHrP9V1QbavrZ87xLVw4Plc4FB74SzqnH9dPc8b6lK4ECuZVdnxFQ
	KJNCFdxBKDfVDcC+GTI/X+W93aU4m+9QTjE8fHe6kXIgSue9u6flOdyc6UtP5M/qbpF7
	xGpSnkFuBfTbF+4A9to42+OKg6onRbhfsptARMCD6CGoyQvp9vU5BHX8wFT5xGKMf9C0
	ts0PlcdT0frp3Qqc2Czf0jYnioAQe3qgGEPFcMrzT+JZ9VV9QT9suERuhD59pZZrSNKS
	QcTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=0AWk+F7JFoWqHj6qOzlHORdS5hbyPcN3WaXF1fwoOn4=;
	b=X+qpEiHBgKn9N8e2GmiBR2+TlL/TwaLjKQzId4N4gQyd4HVe5DGMvj7g0iAy9A9O9G
	Qo/khoUo9xu9re+HozzDg8hSOyyZOAxC47Ze9FTMRYxRSK+Du46VxYkHrZ8oK5hdjPMZ
	1QZDc8tQXEje8q5X2vDndB5LsyDaX0PrB3/c7bNJ7uXdioZyAye019GFf40FXNXzHXi6
	yHlYMLdXV4xwNFsE9GEoxYkVckC0EuiUm38QppE6d02OztcKpMSLx4hKI+FOnF3NJckT
	HSoEJlPgOWVvLJ0vntXJS3yR1uWMipKs5d0Ny76lkPnbqFUaDp1+FvMTfExtT6DKX7xZ
	jdJw==
X-Gm-Message-State: AIVw111q8NMW6/Apes5pxp/aQnsqEIwcmSA58vfvrkGp4/1zmmQ+YXQp
	UfHo81v+cuTxQQ==
X-Received: by 10.55.137.132 with SMTP id l126mr4402471qkd.322.1501220234125; 
	Thu, 27 Jul 2017 22:37:14 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.37.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:37:13 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:45 -0300
Message-Id: <20170728053610.15770-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH 22/47] MAINTAINERS: add missing M68k entry
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Jul 2017 05:37:21 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 14109f4513..06b092bf85 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -156,6 +156,7 @@ M: Laurent Vivier <laurent@vivier.eu>
 S: Maintained
 F: target/m68k/
 F: disas/m68k.c
+F: default-configs/m68k-softmmu.mak
 
 MicroBlaze
 M: Edgar E. Iglesias <edgar.iglesias@gmail.com>
-- 
2.13.3


