Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kRh63-0003Wb-Qt
	for mharc-qemu-trivial@gnu.org; Sun, 11 Oct 2020 15:33:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRh61-0003Pj-B4; Sun, 11 Oct 2020 15:33:29 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:36705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRh5z-0006wf-PH; Sun, 11 Oct 2020 15:33:29 -0400
Received: by mail-wm1-x344.google.com with SMTP id e2so15335472wme.1;
 Sun, 11 Oct 2020 12:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gejAdYQY/teMYz2RHH6Mc87RW7QIZIz1gQu9dTLuxMg=;
 b=hmnrpmtDQ1h8IpxAsATjEWAyJt6HnVV89VQFF+cY0RjjXVPeqTXZY5Dcl5X0//qDDW
 LzpQBwowdPn6+AWsK3f1NGZk2BSFOXibGnIfFb7HBKfjcjOkGq6g/0s8RLM0asrI0Oc8
 eYO8mD+QSdXE2ODsKW7bviGCec1fBcNf2vr4SWN62Hzoc5/3fT/UprYLBV9odC74hGeV
 7r9ZsIJMdl7y0+fgVTyfCrdAE6qLA9VGXOurdDeSxKj1zbQhEVd6sZuV+Zm3T/nzgp52
 Ik1RYh79Qf69uCIMokB1jqFiPJvkleq3LshytFsuYSBf7tI8vBGOx+C25Lc1Dw35dLHJ
 MysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gejAdYQY/teMYz2RHH6Mc87RW7QIZIz1gQu9dTLuxMg=;
 b=t2tOtZhtt8GpgsyPIHTQscPmL3vLeqotZznakyRLRCYZ5fK3fo7nVfx5FaazDFJkIG
 /SGCnpKC9VKxR4MjczJW41RMyNVB9wrK60OwKH0Bzx4fMFdtH9uiNja1hejmGYLNbqAR
 wFl/NFig/Eaacl4h5pTz8bZB0uMuyuX4iadQzvvWJ785afrSKJ+v87U+BMsFA1D0d8ne
 3lZP/OyTP1QYp/VLX+t1ByTl+G80RPs3tGup8asDHUPYGQEGdqIKjQpT2jv8Ey5tx+gJ
 3Z4oK5GpLImMo7PqfP4Dhs/mx2eU/uP8EIPNNLDHI6XKw+kGGDCdSALjMtvNIJ2C04r2
 pfEw==
X-Gm-Message-State: AOAM531LLcgpRdwcROvEtab8My5PtjL/x4Ha7TBOsZ6zIUkHg3dzBJNZ
 hXFPwebWA4L78CJnQ2XPQxpkwF8k2SA=
X-Google-Smtp-Source: ABdhPJxBLeYlan/olq39IXZxlC37Oueo1eu0SAO7/jy1Ukn3zHUcPt1OS23XOGWG1GLsYM74q0ne2g==
X-Received: by 2002:a7b:ce11:: with SMTP id m17mr7686924wmc.8.1602444805250;
 Sun, 11 Oct 2020 12:33:25 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id i14sm20536215wml.24.2020.10.11.12.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 12:33:24 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Kevin Wolf <kwolf@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Max Reitz <mreitz@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 John Snow <jsnow@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>, qemu-trivial@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH 10/10] hw/isa: Add the ISA_IRQ_IDE_DEFAULT definition
Date: Sun, 11 Oct 2020 21:32:29 +0200
Message-Id: <20201011193229.3210774-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201011193229.3210774-1-f4bug@amsat.org>
References: <20201011193229.3210774-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sun, 11 Oct 2020 19:33:30 -0000

The IDE controller uses IRQ #14 by default. Add this
default definition to the IsaIrqNumber enum.

Avoid magic values in the code, replace them by the
newly introduced definition.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/isa/isa.h | 1 +
 hw/ide/isa.c         | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 43cdc3c47b6..05622ee11e2 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -17,6 +17,7 @@ enum IsaIrqNumber {
     ISA_IRQ_RTC_DEFAULT =  8,
     ISA_IRQ_NET_DEFAULT =  9,
     ISA_IRQ_MOU_DEFAULT = 12,
+    ISA_IRQ_IDE_DEFAULT = 14,
     ISA_NUM_IRQS        = 16
 };
 
diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index 6bc19de2265..2412d568937 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -108,7 +108,7 @@ ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int isairq,
 static Property isa_ide_properties[] = {
     DEFINE_PROP_UINT32("iobase",  ISAIDEState, iobase,  0x1f0),
     DEFINE_PROP_UINT32("iobase2", ISAIDEState, iobase2, 0x3f6),
-    DEFINE_PROP_UINT32("irq",    ISAIDEState, isairq,  14),
+    DEFINE_PROP_UINT32("irq", ISAIDEState, isairq, ISA_IRQ_IDE_DEFAULT),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.26.2


