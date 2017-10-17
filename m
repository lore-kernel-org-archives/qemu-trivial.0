Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4Uzz-0001YO-Vf
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:45:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Uzx-0001Vt-U7
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:45:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Uzx-0003Ah-7X
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:45:45 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:51907)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Uzp-00037t-TB; Tue, 17 Oct 2017 12:45:37 -0400
Received: by mail-qt0-x243.google.com with SMTP id h4so4898148qtk.8;
	Tue, 17 Oct 2017 09:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zTsxzug14Vjf5lxep4HOn8dm0buYL77MmEVvSbcp/ws=;
	b=cV9alb3C0+KE85K7F8VRhKOYkHUnE6ZiTSopg9IvMRC5dz1g7sNyK+yjvDviut4z8c
	Bfo7idaTa+xnjP0d/XX2yMNNx/ywb/WlRT6TY4fdgs9zqH0CNXUKxGchVHDuh6N/qEP4
	8goGPY3wyRbFV479Eple1JF51SbvpvxTKSxKzNBK0YrZ5+a7D91bEadjHfn/6YbRshDK
	3kv1DdU7fprm50GVz2uged8G1/qpHMaFYMJ4QvQOpwbVt4uu4UT/ticx8cy0Hn3rOCWc
	smeyGVxW4lrUQ19mnDIxU2DWD1ulLWQYztb06rySqJhatJ7SB9SFTDi/0ts5vOgIzLiw
	YLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=zTsxzug14Vjf5lxep4HOn8dm0buYL77MmEVvSbcp/ws=;
	b=Wbe7j0Nvu/8t48xC1YKCC8sptvyWhfs63K+MNiSN8twjP8QD8k7ScisXsoZ/K19FhV
	urvJiNRLbGJr7V549XZb4HIPVCIkjM0LQOCT48+IZsxVy9raAkjWNyNwMtl9YMY32W5E
	332Pa3KPbwnQ7tifqpSWaZQLlGXoTyUMNzjcHwC/tyKrkjL71avVDkHHuMCXHoQ7SPs+
	qy6jzG3FiFB7vESt/w9DbR7sFkeVxRT7KAt/mPKDXgJHDH8pLSQ6Aqf5t1AWUjvDN++O
	bLfb3MXdRA61pZlU577ekOVZKAtZuoLF84LgZ+xz+9zQ4XSKPjd2g7J7vlKXg2im2qzt
	ZLxA==
X-Gm-Message-State: AMCzsaVV1x2z6ICusP8d43obokqEze/y8pL0F2kD1ZteEP1IEWJCW966
	dkh6xAhhxWAQ8CvVNqUoybtO/s5O
X-Google-Smtp-Source: AOwi7QCWipw/CdqfAGm6TiqSd3vwenDSSVz3MhCmCj/E/QKPHf42iVrgV159Ep4G+28WhK5dKEbJZw==
X-Received: by 10.200.44.46 with SMTP id d43mr21438418qta.283.1508258737280;
	Tue, 17 Oct 2017 09:45:37 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.45.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:45:36 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-trivial@nongnu.org,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Date: Tue, 17 Oct 2017 13:43:51 -0300
Message-Id: <20171017164426.25277-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v3 07/42] MAINTAINERS: add entries for
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
X-List-Received-Date: Tue, 17 Oct 2017 16:45:46 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 1700f3a541..948d99c123 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -715,6 +715,8 @@ F: hw/pci-host/prep.[hc]
 F: hw/isa/i82378.c
 F: hw/isa/pc87312.[hc]
 F: hw/dma/i82374.c
+F: hw/timer/m48t59-isa.c
+F: include/hw/timer/m48t59.h
 F: pc-bios/ppc_rom.bin
 
 sPAPR
-- 
2.15.0.rc0


