Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4FV5-0005on-Ae
	for mharc-qemu-trivial@gnu.org; Mon, 16 Oct 2017 20:12:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32995)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FV1-0005mJ-9G
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:12:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FV0-0003mC-EI
	for qemu-trivial@nongnu.org; Mon, 16 Oct 2017 20:12:47 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:54395)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4FUy-0003hw-8l; Mon, 16 Oct 2017 20:12:44 -0400
Received: by mail-qt0-x241.google.com with SMTP id z19so36980qtg.11;
	Mon, 16 Oct 2017 17:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xQkSE1PIDblDDKpQn5T7Nlezcb2Hp4eFI3babWLWLtI=;
	b=LMb/OQTiflOFeOrVjtjamTxfsqG5teshTyXCAxTXGCC2a0lduDEO0J42lrvp5FH2sf
	9GgeRWTD3dis6c8gZb/3In/xDbTKff77YU5r4PccskQOv7ReVDeVnxM/L9agXd1NQ/TG
	OH39yj2WxLH77D7HAEuwLJqDakEQq27/LJZqh4Vqrsy8x3iWaJkDH4kuwN7wWTwIZCLv
	vyDY8OwcEn0E7j/h1Tt+n7oz1I5yl32Fu0cIxqkbu9XaUbw5HGUO3YjtlD9I60wBF7Xw
	Po/sfFkiRVwVzRM6qDzZe9xGaVW7V36YB/qK0ChmFrE1hIrFyWKq+gcA/qNKKh+RRVoS
	BcRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=xQkSE1PIDblDDKpQn5T7Nlezcb2Hp4eFI3babWLWLtI=;
	b=iOnScpyep5sdyt9Z0rqdqb7Q3rykLPChaT49X9hdbvf2pZPUxdb2sU64tmn4hYoYa3
	TFJyueRi/NuzsLWcLc2iSo/hSM5vW0Es5VfUk4tj31SjkqFSQV/mcn1PCcD8PlJsKEaB
	ZZaw20zlkCvtp3t7c23RIktdO5yAjFn99uuvCK+FHs4HxTyYoIev2g+93Ra2E3K8JLpW
	uIsxw5iuenZdS/jLMoZvlRJ9sYRUAagaeF3PLC8hh3tB+znjdo8Kb1rYbAYiTM1SzAth
	Zd2lTXRCDFkf2IKPNNjw5D/7SoytAOFU7emCdqXZRAdnW/ZLky96Oe70Gt8j0fI/4Ff2
	w32A==
X-Gm-Message-State: AMCzsaUbg+rPPO+YQi994WvXY2VFrRX67R7iPwJev/Gpskcsjd4g0l4Z
	iGgjDoVmV2kEHhFlLewclo8=
X-Google-Smtp-Source: AOwi7QAg9NqDg7NQnFJZIX3f9o2EGECtQH0PR4BDeZLjA7fP1wdJpvvK1tXX3yGy7S/FFQm7R1nXnA==
X-Received: by 10.200.46.132 with SMTP id h4mr17366040qta.88.1508199163893;
	Mon, 16 Oct 2017 17:12:43 -0700 (PDT)
Received: from x1.local ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id r6sm5409043qkh.22.2017.10.16.17.12.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Oct 2017 17:12:43 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 16 Oct 2017 21:11:33 -0300
Message-Id: <20171017001209.32276-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017001209.32276-1-f4bug@amsat.org>
References: <20171017001209.32276-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v2 03/39] MAINTAINERS: add an entry for the
 i82378 (superio)
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
X-List-Received-Date: Tue, 17 Oct 2017 00:12:50 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cfd9010e27..0ce3c353e0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -712,6 +712,7 @@ F: hw/ppc/prep.c
 F: hw/ppc/prep_systemio.c
 F: hw/ppc/rs6000_mc.c
 F: hw/pci-host/prep.[hc]
+F: hw/isa/i82378.c
 F: hw/isa/pc87312.[hc]
 F: hw/dma/i82374.c
 F: pc-bios/ppc_rom.bin
-- 
2.15.0.rc0


