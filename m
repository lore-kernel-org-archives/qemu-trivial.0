Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cQY-0000Vh-Ox
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:53:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42114)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQU-0000RO-9D
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQT-0006NS-AH
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:53:06 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:33095)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cQQ-0006KI-Qr; Fri, 06 Oct 2017 19:53:02 -0400
Received: by mail-qk0-x241.google.com with SMTP id z12so9700207qkb.0;
	Fri, 06 Oct 2017 16:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=dw5JZ7lP1J1VuPTLyCE48EbyvBxnuDnQ7g/+mqHt1Xk=;
	b=hSaUskY2QvuogyFgFKQjzmoc0+nbN1WuaCy2Q81q3SKvNyv9XoYQrH2EhOelJWVPJY
	A277knl4wSYNTpibD9P+sdoaCDrvGKkeueMiy8DNn+o/FJ4Kp++617P+H9wpu8NNbqDO
	hQStJ1Q6kavHugXOnWmMmjWuS/C2eFDhH9Z4n9YbpUIn8KRfq1QIngj5SlJ1/Jr/qedn
	LRFEt7NxMNXfHetTdBB0KOy3hGWdepZfsC8fCzKtwLu29/DYo9ouLlYzB/ILACb1eFWv
	GU55ZBn3F7vO6Bj5YGQBM0Nj+9UcHi1ukB5Lemfn/OtzM+WRpbwNYa5btT3RekCzdRBy
	l+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=dw5JZ7lP1J1VuPTLyCE48EbyvBxnuDnQ7g/+mqHt1Xk=;
	b=kOxdwrRwhOlwMzYdzlZL2bUNURuayYbBDCr2pkJQmkW7KAt5AX91eZ4uGqIB0gnv4l
	o9qk03NkyBNsTfWK5MP6aP7UFbDUntyfNWCV1t+3Z3otyssJ8XJjAuOSJ4HdUlxxmAWA
	GW6fP8cYKBvuSO5Jxu+QrxlTciDXjhLPSIT0Cc95awOFQFV6qTOxGvUSHo48LM1MvZeH
	evwWb2YqOI9G/osoKxA0mhyfeWwsqIKVCu+wzYa9ejxwyQQNiJrnLiEYYaTiLi0XEskx
	GO66pFaYvL5VzfTeSFABI1Yhop2ixagt5bC5H5f2XvpHxwWfH+Fr7clBJZoSUcUK52pu
	fM/g==
X-Gm-Message-State: AMCzsaVDqYcdtnfaVeQTqLra2kicQA+AXFeEPB8fOoKxuVr1nTT5l9+T
	6aH1Lm0fXuLCswntj5/XSFk=
X-Google-Smtp-Source: AOwi7QBDA1PO8bp4FgVS/EsFOIpiQoLgtSEavcihSY4trPLWM1RKQZbyF+btLN1nhJx5+k6nEMeE5A==
X-Received: by 10.55.125.6 with SMTP id y6mr749339qkc.272.1507333982303;
	Fri, 06 Oct 2017 16:53:02 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.52.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:53:01 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:49:38 -0300
Message-Id: <20171006235023.11952-44-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH 43/88] hw/core: use g_new() family of
 functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:53:09 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: added changes in hw/core/qdev.c]
---
 hw/core/irq.c    | 2 +-
 hw/core/ptimer.c | 2 +-
 hw/core/qdev.c   | 2 +-
 hw/core/reset.c  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/core/irq.c b/hw/core/irq.c
index b98d1d69f5..d9b13b1762 100644
--- a/hw/core/irq.c
+++ b/hw/core/irq.c
@@ -115,7 +115,7 @@ static void qemu_splitirq(void *opaque, int line, int level)
 
 qemu_irq qemu_irq_split(qemu_irq irq1, qemu_irq irq2)
 {
-    qemu_irq *s = g_malloc0(2 * sizeof(qemu_irq));
+    qemu_irq *s = g_new0(qemu_irq, 2);
     s[0] = irq1;
     s[1] = irq2;
     return qemu_allocate_irq(qemu_splitirq, s, 0);
diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
index 7221c68a98..ef4a6646ed 100644
--- a/hw/core/ptimer.c
+++ b/hw/core/ptimer.c
@@ -349,7 +349,7 @@ ptimer_state *ptimer_init(QEMUBH *bh, uint8_t policy_mask)
 {
     ptimer_state *s;
 
-    s = (ptimer_state *)g_malloc0(sizeof(ptimer_state));
+    s = g_new0(ptimer_state, 1);
     s->bh = bh;
     s->timer = timer_new_ns(QEMU_CLOCK_VIRTUAL, ptimer_tick, s);
     s->policy_mask = policy_mask;
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 606ab53c42..7b92af1013 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -378,7 +378,7 @@ static NamedGPIOList *qdev_get_named_gpio_list(DeviceState *dev,
         }
     }
 
-    ngl = g_malloc0(sizeof(*ngl));
+    ngl = g_new0(NamedGPIOList, 1);
     ngl->name = g_strdup(name);
     QLIST_INSERT_HEAD(&dev->gpios, ngl, node);
     return ngl;
diff --git a/hw/core/reset.c b/hw/core/reset.c
index 84c8869371..01d86c3a95 100644
--- a/hw/core/reset.c
+++ b/hw/core/reset.c
@@ -40,7 +40,7 @@ static QTAILQ_HEAD(reset_handlers, QEMUResetEntry) reset_handlers =
 
 void qemu_register_reset(QEMUResetHandler *func, void *opaque)
 {
-    QEMUResetEntry *re = g_malloc0(sizeof(QEMUResetEntry));
+    QEMUResetEntry *re = g_new0(QEMUResetEntry, 1);
 
     re->func = func;
     re->opaque = opaque;
-- 
2.14.2


