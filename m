Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePgi4-0001lv-MF
	for mharc-qemu-trivial@gnu.org; Thu, 14 Dec 2017 22:30:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgi2-0001ir-28
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:30:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePgi1-0003c6-BE
	for qemu-trivial@nongnu.org; Thu, 14 Dec 2017 22:30:50 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:38787)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ePghz-0003XW-33; Thu, 14 Dec 2017 22:30:47 -0500
Received: by mail-qt0-x242.google.com with SMTP id d4so10607353qtj.5;
	Thu, 14 Dec 2017 19:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=CHREzwpAzRpIN9qqg11ORSJrjmQ8yIxlhQlxNNpEmbI=;
	b=Sgu1pDEonuQ/LpM6b/HYMBAwS14WGNg0Spfbc5Lv78S2sBWvc90L5/dm3Ceasd8ueS
	vy9flKiSFVE33qNk3EiBE+DxusI9XTrgzKOdcXc4rLjcnzyyEhtkFO5c19TxWpxD3XuN
	/uzQkhPc5/Xm2n1Imm3qGFPVhi9zMZQFtJKZCG8vg49IuEpSVwWXj6QjI+BirTJicSEj
	tCgAW959/TO/jwrw1GA/UsHKFT+cnSAvfvp3KIA2t5ObI1s67BwwtPpvHe2AjzuH6qFP
	CTXjhJ3bnRxSJ5wXj2jMR9Zvvc6JzwEF7lXiXL3fzQ9uq2Z8/mwZgu8TGL1pp19Fxv86
	mmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=CHREzwpAzRpIN9qqg11ORSJrjmQ8yIxlhQlxNNpEmbI=;
	b=Z9YwAGB2mQ4gsUG+ym7je0ISPUjsYQXnI5c++JQeHuFOuychJmuZzYV7BVNgdNvDF4
	gceP/qxCiQdqyQvYrZ0eGoGP5Yfu+e1WS20CXvlbU1p8dhvdlcM/j9PPB7HJJWt4k53S
	jyoIHUcKKkxD0hS9XZW0xlx+A7zc9SbeI4HcF6mkAahjU209op6LgqwPY9WnEWtU19ki
	CH2ja/fNkM+9gcuEQ9WA0YVP4fWfpHFmylHvK4Xy5fe1GixkGnZD8HZVfp+IuveMyIHx
	QgWn7qR8zSn8xckfkdz60KA/W3NIzPPY+sH3gZAvPWbyBnRIklMq5nwW4GYaR26Us5kW
	9BFw==
X-Gm-Message-State: AKGB3mIdYXWRJAowLNE2/077n32R4T9i0cMWbERdyQq/gJIjPNYtYrXk
	hoMhNXjxqp3ZlbwGFFtMakg/30L0tf0=
X-Google-Smtp-Source: ACJfBovnixhywtFw+GGj+SEmabxmOJSHKAgdgMKzCXLzsOwm30VwrTc0AuU4mpyoSdCN+h9cEydlDA==
X-Received: by 10.237.62.67 with SMTP id m3mr20383248qtf.289.1513308646563;
	Thu, 14 Dec 2017 19:30:46 -0800 (PST)
Received: from x1.local ([181.91.222.165]) by smtp.gmail.com with ESMTPSA id
	q24sm3794605qkq.63.2017.12.14.19.30.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 19:30:46 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S. Tsirkin" <mst@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org
Date: Fri, 15 Dec 2017 00:29:39 -0300
Message-Id: <20171215033015.738-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171215033015.738-1-f4bug@amsat.org>
References: <20171215033015.738-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH v4 07/43] MAINTAINERS: add entries for
 timer/m48t59
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
X-List-Received-Date: Fri, 15 Dec 2017 03:30:51 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 27f190a70a..9505c3f90a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -735,6 +735,8 @@ F: hw/pci-host/prep.[hc]
 F: hw/isa/i82378.c
 F: hw/isa/pc87312.[hc]
 F: hw/dma/i82374.c
+F: hw/timer/m48t59-isa.c
+F: include/hw/timer/m48t59.h
 F: pc-bios/ppc_rom.bin
 
 sPAPR
-- 
2.15.1


