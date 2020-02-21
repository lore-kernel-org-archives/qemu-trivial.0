Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j5B5S-0004RK-53
	for mharc-qemu-trivial@gnu.org; Fri, 21 Feb 2020 11:23:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46430)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j5B5P-0004PH-Ss
 for qemu-trivial@nongnu.org; Fri, 21 Feb 2020 11:23:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j5B5O-0003Zd-QD
 for qemu-trivial@nongnu.org; Fri, 21 Feb 2020 11:23:31 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:57632
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j5B5O-0003ZO-LI
 for qemu-trivial@nongnu.org; Fri, 21 Feb 2020 11:23:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582302209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vFiPRvFKVsbNzmJDjMRO2L9Swvm9SGW0hfm4mbSD9HI=;
 b=YW/i+5dfh2Gdx8Z1kdxgkhFgPVxQsWyYl4ZtatLfWLKQrGOOpLZCtCOJ+hqca48n1/KxdS
 sJObzTbuuOPynIn4zvvR8RGupJH6lnS7XsZrUmQdfsZzCKgq0zz86vCAF/oFDeTLFjAEr5
 mAo48T5Bno5fI4C+mafoAPD4+i5PM9s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-98-rQOMd20pMri7-oWfbHaQ-A-1; Fri, 21 Feb 2020 11:23:28 -0500
X-MC-Unique: rQOMd20pMri7-oWfbHaQ-A-1
Received: by mail-wr1-f70.google.com with SMTP id 50so1250160wrc.2
 for <qemu-trivial@nongnu.org>; Fri, 21 Feb 2020 08:23:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NcTfhGykjxqUJHmU3wSmXTaQacdRKcUuYEHPVWON51c=;
 b=teSC3DSd/TStMwl4tgZ62Usdu/6sTFP1MnhSr8Co7FNGg9GMLMrQ1SaJQstWudTOE1
 76oiagtvGCp2FQPBjbPNqdOO9OSU0QqZ3grMEn8ohXP2vZS60+D4RNvcuUoFAsMRKeOp
 qA8C51vV2mLPbSYnb0BFsGIIo3S5kvspcHfzlyoZTpKI/7ombGUCfu4029s8fnJPDtBS
 +jVzRevrltAQXNfw81Ulf3pWLnL5F9OtGoDL22GgXorkQeWd4WzFTVv2Y03coX4I6KY3
 UMPl53KGVpJJfh3fct74qQrWXMjhwdMA9+m9EdAIWWdneN7sAWpLuZUQg86DJr/goN/g
 30vw==
X-Gm-Message-State: APjAAAUD/NdOvJiNfrY3r9fv5We/jBuloGtiioZj7EZ/eoPlU3E583+J
 8Xb7MRSdiK9KCHcRWjEPO7F96A0c+56BR8b3Adv0FfBrHywIBB50Y71Uj+B8J3aFQ5DEsrK/yNs
 IYhtsjUNKzoToTC9C4Q==
X-Received: by 2002:a05:600c:34b:: with SMTP id
 u11mr4630261wmd.69.1582302206929; 
 Fri, 21 Feb 2020 08:23:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqzPW6MlDqjpVahUai1trotfdKv5CNBBce8BJNdWrULkYlCfHaQVRs9HWS27lBbyek3/wKN6Lg==
X-Received: by 2002:a05:600c:34b:: with SMTP id
 u11mr4630240wmd.69.1582302206723; 
 Fri, 21 Feb 2020 08:23:26 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id t81sm4367414wmg.6.2020.02.21.08.23.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 08:23:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-trivial@nongnu.org,
 Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Alistair Francis <alistair.francis@wdc.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] hw/unicore32/puv3: Simplify puv3_soc_init()
Date: Fri, 21 Feb 2020 17:23:25 +0100
Message-Id: <20200221162325.28194-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
X-List-Received-Date: Fri, 21 Feb 2020 16:23:33 -0000

Since commit d8ed887bdc, the puv3_intc_cpu_handler handler takes
a pointer to UniCore32CPU in its opaque argument.  Directly pass
the cpu pointer.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/unicore32/puv3.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hw/unicore32/puv3.c b/hw/unicore32/puv3.c
index 7e933de228..eec7f561eb 100644
--- a/hw/unicore32/puv3.c
+++ b/hw/unicore32/puv3.c
@@ -48,7 +48,7 @@ static void puv3_intc_cpu_handler(void *opaque, int irq, =
int level)
     }
 }
=20
-static void puv3_soc_init(CPUUniCore32State *env)
+static void puv3_soc_init(UniCore32CPU *cpu)
 {
     qemu_irq cpu_intc, irqs[PUV3_IRQS_NR];
     DeviceState *dev;
@@ -56,8 +56,7 @@ static void puv3_soc_init(CPUUniCore32State *env)
     int i;
=20
     /* Initialize interrupt controller */
-    cpu_intc =3D qemu_allocate_irq(puv3_intc_cpu_handler,
-                                 env_archcpu(env), 0);
+    cpu_intc =3D qemu_allocate_irq(puv3_intc_cpu_handler, cpu, 0);
     dev =3D sysbus_create_simple("puv3_intc", PUV3_INTC_BASE, cpu_intc);
     for (i =3D 0; i < PUV3_IRQS_NR; i++) {
         irqs[i] =3D qdev_get_gpio_in(dev, i);
@@ -131,7 +130,7 @@ static void puv3_init(MachineState *machine)
     cpu =3D UNICORE32_CPU(cpu_create(machine->cpu_type));
     env =3D &cpu->env;
=20
-    puv3_soc_init(env);
+    puv3_soc_init(cpu);
     puv3_board_init(env, ram_size);
     puv3_load_kernel(kernel_filename);
 }
--=20
2.21.1


