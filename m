Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4Uzs-0001RG-Ni
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:45:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46387)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Uzq-0001Oh-4V
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:45:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Uzp-00037e-8y
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:45:38 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:50265)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Uzn-00036c-7O; Tue, 17 Oct 2017 12:45:35 -0400
Received: by mail-qt0-x241.google.com with SMTP id f15so4897921qtf.7;
	Tue, 17 Oct 2017 09:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=pbkygjYMrABPvChCt0B6mGgs+WT5bdYIWlm0PjMA3Iw=;
	b=Frk1KDh5JfTCvjrtLKMhkGOWxy53MMp8pwCHYT0htFl9GR9JH5xl6lNKKVTR0kInbd
	1Xo23AZ5wrbLAGErntuPclJeBNLWUcDE8aSjWgti+ODcCQ0cAh8dNvA7qBwdG0OTIA7T
	9ZlZWQeXXBuDU3R8DkPYM4JnaJpBInEORI9f7D/BXcsuDqyaZGJRp0ER4Yk0Om2biLRF
	jhvFzeIANgh6DN58KfKYfs2WJN89YwG3Eqa2rNbRvIBF9bzqHTqhlqiNmiuRSfOQU/et
	mDnth9MpP5CKwCf0sC49UyPxn5u/0dOs8tyTVE/SxFlvZjzZOyhJ44bfT7kdmCN/4Y9y
	xTkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=pbkygjYMrABPvChCt0B6mGgs+WT5bdYIWlm0PjMA3Iw=;
	b=KfKEYcoycaJ0yvMZFRRWUGR/FxwonU6uFcEpPd6ktBIB0IX+9Jcs0UFsDF8y3wqNmR
	t+jtD7h0+FdVG9C4Vmheylqg8BHV6FfAucThdr3ecR2Eyo7szCm7MBALjP79itV/63GN
	PWJA7nsk03MWZyiScEpPXkeFxPpvMkPHyzXnPghnEPkMZxJTc71B6uQYynOe9D6I7ZOb
	6oqC2I/JL8cHrBBnSc+AmgwhRZHsscFi0smvGItz8ZxY6VDqn47OxQAeBMhXgvFD+yNM
	JWLIrNHtT1TepmYMLyO2gkH5yo9FaVB4n1aRf6v8nnt1JlnG/nZscJsQh1814ziMExBz
	AzRg==
X-Gm-Message-State: AMCzsaWzG2Wum8gYmpRsscRCXN3i1As4/wq8pOjHX0GImBte0TQope2F
	vpXJqwLfrE5Um/Z5AXcnfwcxIXID
X-Google-Smtp-Source: ABhQp+TkQL54RfpzxEjzHppcaoJIS6LGQs9bGfdW+MS+Cww9TYXuUcS0aloo/sHoS8nNqIhVCfG+Mw==
X-Received: by 10.200.24.185 with SMTP id s54mr4525710qtj.328.1508258734639;
	Tue, 17 Oct 2017 09:45:34 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.45.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:45:33 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>, Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:43:50 -0300
Message-Id: <20171017164426.25277-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH v3 06/42] MAINTAINERS: add an entry for
 input/pckbd.c
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
X-List-Received-Date: Tue, 17 Oct 2017 16:45:39 -0000

and fix a typo in the "PC Chipset" section

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 907e067903..1700f3a541 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -842,12 +842,13 @@ F: hw/misc/sga.c
 PC Chipset
 M: Michael S. Tsirkin <mst@redhat.com>
 M: Paolo Bonzini <pbonzini@redhat.com>
-S: Support
+S: Supported
 F: hw/char/debugcon.c
 F: hw/char/parallel.c
 F: hw/char/serial*
 F: hw/dma/i8257*
 F: hw/i2c/pm_smbus.c
+F: hw/input/pckbd.c
 F: hw/intc/apic*
 F: hw/intc/ioapic*
 F: hw/intc/i8259*
-- 
2.15.0.rc0


