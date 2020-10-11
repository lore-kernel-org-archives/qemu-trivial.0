Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kRh5t-000361-Gj
	for mharc-qemu-trivial@gnu.org; Sun, 11 Oct 2020 15:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRh5r-0002zd-1q; Sun, 11 Oct 2020 15:33:19 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:36977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kRh5p-0006vE-Ii; Sun, 11 Oct 2020 15:33:18 -0400
Received: by mail-wm1-x341.google.com with SMTP id j136so15336054wmj.2;
 Sun, 11 Oct 2020 12:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ottyxadkfdG6t1j9EHj71mxgUhLG6Ki7NMaGNynZJD0=;
 b=qEwwLhXfmlgPiK25yyOcjxsJ3q6RS8jvY3+SEaEz2+i7iO1P0LlvcWHDK4l3Ri4LPB
 qGpOdydfbM0UerCDmcJ94eviy2yU5Sb2QSx5PCS3a9QmWlP6G4lmErLaesEeYq33Eqk8
 Oq78gsC/3iuwPT39zyXdDhPj8J+50eBMUnUYHnZxrdpgtDRdcFOqnLT2l88GYI1PwJy+
 SAP4Eqycljc26DjboqgJ+oXEl852pxyECm7Fyg1eLe7CaIhjeqiMnkVMGG1AYRdlgKoF
 F75IVc/9m9kzcxiIa8Ts3FWnLnRpJQXeCvUZQBxZFW7R5dbuW5PBhnAz/sjMa4x7qfmq
 8Ugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ottyxadkfdG6t1j9EHj71mxgUhLG6Ki7NMaGNynZJD0=;
 b=SrYQeNm6OyekXfDBGNV2Pkyv/cwzBj5qBeJuOScA1MH4w8Fj3LQzU6NOTTO9H0/b42
 bV7Z5lxTUg2oBAFATSXqEghdArJkkFFBz5f5VmqUhrsNtTgnid+Y/OzS8N5661CDNZtc
 It/YIzebLpXtto5Fz97RU5e3miGriH6F9UZFDYKl/YuTf6HSt8LmH11GxSTx57tRhj5Y
 rnL+YR/VEpoEov94ZkF7ga+ykZU8C7NUo45rJ0if+84+Ha/4Ft8mBIq6/JIBNO+SKk2A
 bZpzO3L6hgkT1wiANXTtHkjNnTVRQb8N1QnBuUi1ofRdkEHqD7e+p40d2OQSRRQxPpHo
 Kwsg==
X-Gm-Message-State: AOAM532V76eorRPsVoc1VmdUPOJBzZw+eoY9KYZJNy9reUoW5rwrEk04
 T9vZk9XmDvYh1wqwy5HCs8MfTJgXEHM=
X-Google-Smtp-Source: ABdhPJxwCHk9ZmaUKr7CkbYZxWaEQIWMZ6rAQBHwbNpxGejuErNgC8kytvS3q5p8QQv7R4bsOtQhNQ==
X-Received: by 2002:a1c:3b8a:: with SMTP id i132mr7793744wma.178.1602444795066; 
 Sun, 11 Oct 2020 12:33:15 -0700 (PDT)
Received: from localhost.localdomain
 (106.red-83-59-162.dynamicip.rima-tde.net. [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id 88sm22673596wrl.76.2020.10.11.12.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 12:33:14 -0700 (PDT)
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
Subject: [PATCH 08/10] hw/isa: Add the ISA_IRQ_NET_DEFAULT definition
Date: Sun, 11 Oct 2020 21:32:27 +0200
Message-Id: <20201011193229.3210774-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201011193229.3210774-1-f4bug@amsat.org>
References: <20201011193229.3210774-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
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
X-List-Received-Date: Sun, 11 Oct 2020 19:33:20 -0000

The network devices use IRQ #9 by default. Add this
default definition to the IsaIrqNumber enum.

Avoid magic values in the code, replace them by the
newly introduced definition.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/isa/isa.h | 1 +
 hw/net/ne2000-isa.c  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
index 9f78ff11246..11166592246 100644
--- a/include/hw/isa/isa.h
+++ b/include/hw/isa/isa.h
@@ -15,6 +15,7 @@ enum IsaIrqNumber {
     ISA_IRQ_FDC_DEFAULT =  6,
     ISA_IRQ_PAR_DEFAULT =  7,
     ISA_IRQ_RTC_DEFAULT =  8,
+    ISA_IRQ_NET_DEFAULT =  9,
     ISA_NUM_IRQS        = 16
 };
 
diff --git a/hw/net/ne2000-isa.c b/hw/net/ne2000-isa.c
index dd6f6e34d3c..e31e86c14af 100644
--- a/hw/net/ne2000-isa.c
+++ b/hw/net/ne2000-isa.c
@@ -80,7 +80,7 @@ static void isa_ne2000_realizefn(DeviceState *dev, Error **errp)
 
 static Property ne2000_isa_properties[] = {
     DEFINE_PROP_UINT32("iobase", ISANE2000State, iobase, 0x300),
-    DEFINE_PROP_UINT32("irq",   ISANE2000State, isairq, 9),
+    DEFINE_PROP_UINT32("irq", ISANE2000State, isairq, ISA_IRQ_NET_DEFAULT),
     DEFINE_NIC_PROPERTIES(ISANE2000State, ne2000.c),
     DEFINE_PROP_END_OF_LIST(),
 };
-- 
2.26.2


