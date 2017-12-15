Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePghk-0001TT-BP
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:30:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33175)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePghi-0001P9-1o
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:30:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePghh-0002mu-7b
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:30:30 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:36009)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePghe-0002fL-Kk; Thu, 14 Dec 2017 22:30:26 -0500
Received: by mail-qt0-x241.google.com with SMTP id a16so10616878qtj.3;
	Thu, 14 Dec 2017 19:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=gaEL4yVs8X18wOqjRMaIsry0SAQ21QCV4RouqStulfA=;
	b=Opthbe1w4gxS9+/8/yQdBBzqCp9tHp7ya3UM7tIOefkRr3JevqvjL0H1SvK8/Y2ORR
	JYIwZbQDPfR5e6cFXgb/qg0hDunIK1NsKJLNRbSJ/0TuimblIEudGOdwz9ylgE1M25lC
	WVwVumCF6SXCHCutLGoXs7xwSQHQJ4aqrOyTLRzQgaU6etQdStc2eMwA4YQrIncBbu9I
	2S+j5SD27xogkhyMYNesv5Zrj9S0CbR/bAU3pUtQKdLIcPE5B35++pgXv0FzFoFVA16s
	vwn6dw4r8WmSJ6BGW9WbOdZ4IhdP1TRces95MxfzQ51eBgQw8bd0uX/sBgt8YDVu+5md
	W5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=gaEL4yVs8X18wOqjRMaIsry0SAQ21QCV4RouqStulfA=;
	b=TztNinWY3N8M8UHJVHpvV++EBarIiFirXnx+zfFMcIYgJJiASCjHrVSW75PX3SAtFS
	FtOPNw8njjvewxE8tPOP+b3tAIKO1L/MY9Y/9MxpdvzeH1Lo2ysnwuBsYFNfatmf6hYW
	yf/4QjOMvOZAKtYoqEqv8h9c3fChK36U1Ni8VNzm2Pq7Z8UnEfyzXCMLZ/Eu2/Ttf2ay
	3UMjCaY4V+3XBDXl/EQHa1nhzapBDoFgHeUl07njn/qfTkUqL6yVnPGFvkT8QGoZhbtL
	Igs7PLBpQLa0yNKVfvRI1TRcUxpOxHVrAYdBs6Z2cB0MscCHstiomMFs1OdVNzpMRtqN
	Gg3Q==
X-Gm-Message-State: AKGB3mKJDXGPkTDRFSpz5iMfJJO0D7Hmc0iN/vsbN+aT3HJqE3apG4DX
	EYf+XkMdYdb8aPIUOXRnTYPNL+s9wxU=
X-Google-Smtp-Source: ACJfBovLQ2AhSe4I6wzotbWff7PwWsJNxM+UfKNGwg2tK9MFIC1LZuvxfO1sRCPCMKDO4RYRLjSsEg==
X-Received: by 10.200.33.143 with SMTP id 15mr19652406qty.165.1513308626147;
	Thu, 14 Dec 2017 19:30:26 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.30.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:30:25 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org
Date: Fri, 15 Dec 2017 00:29:33 -0300
Message-Id: <20171215033015.738-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v4 01/43] MAINTAINERS: add entries for
 i2c/ppc4xx
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
X-List-Received-Date: Fri, 15 Dec 2017 03:30:31 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Corey Minyard <cminyard@mvista.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 45e2e2009b..8582c7d6b5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -976,7 +976,9 @@ M: Alexander Graf <agraf@suse.de>
 L: qemu-ppc@nongnu.org
 S: Odd Fixes
 F: hw/ppc/ppc4*.c
+F: hw/i2c/ppc4xx_i2c.c
 F: include/hw/ppc/ppc4xx.h
+F: include/hw/i2c/ppc4xx_i2c.h
 
 ppce500
 M: Alexander Graf <agraf@suse.de>
-- 
2.15.1


