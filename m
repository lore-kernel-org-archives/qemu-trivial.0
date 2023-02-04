Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pOKC3-0002So-Tk
	for mharc-qemu-trivial@gnu.org; Sat, 04 Feb 2023 10:11:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pOKC1-0002RB-Ns; Sat, 04 Feb 2023 10:11:05 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pOKC0-0006ax-3F; Sat, 04 Feb 2023 10:11:05 -0500
Received: by mail-ej1-x62b.google.com with SMTP id k4so22951445eje.1;
 Sat, 04 Feb 2023 07:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=drXiSmMhmqlJvPhiv+dKQt+fuq5k4HQA4wYOcYoI5f8=;
 b=L6ASOPBAMRP8vARV3n7PTanMy3IXr3+XNeH9ZqaBsIhtkyb88nZ/+IEFZkLERmlNM6
 lX2H8edcR5ogbZILSF+pNA/kBrHqY0i03WmvOeY1IgHX7xxJSw5hOa2WDVxfY6yPNRiu
 awkjWlk6aLEbw6STFkX+H2nyaxFaeTmwin69J2lpsoCed3fUYKauxPmek04vDWl0YO3r
 7YSLl4RRDPqRdbyfI3BZoAlXfgigGurBPdGL44sYoMoi9kHd6uDU3fQxWbaKTv6gFXpB
 9zb3up3dFr3RK70o36uJZoQbfJ2HY+kTwMeCaZo22FCibEjzyCvXq73xfQXZKaFFWaUJ
 xQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=drXiSmMhmqlJvPhiv+dKQt+fuq5k4HQA4wYOcYoI5f8=;
 b=Eh5q88LieEbMtYeCRyesNsNoKktU7+yaqR6DLxN+KNUNZKuHm8fiGwigxrWXBb3cbD
 ofs2CBBZSg/OKIYsVXt16XVVFjWxqeddp8j8ZfurLuiGD8NScTFs+1kwyDFVFrQUnmZy
 UIpaJQFWj6jRgNdv17o8IxE/LHW+gSOSwvokeyvFF5cPsitM74B+9MnveMikPwZPZHck
 Uj0LJc7ULzNaZUjZtVGCus2mgWxmvaBRbKuKzeah+be3sHRCXBXqGlghImt6q5K3wgke
 dbeQmzid7Ln82lmUckuM0ldQ9jJaAvXe8K7z2EOgnOZP9CNAyMVFlGe2zactcWBS6aTE
 5w+A==
X-Gm-Message-State: AO0yUKUvQFRKX8xZfe45GdxmGzL6jgvqFDtH/dFX6aElgjhoTL0+3KG9
 e4D5xQg8RKZqkBoxPj3oW1HwmjuYs+c=
X-Google-Smtp-Source: AK7set9NVeGVkEuhNJvF/Ls3orC8GrzDRzXTd+T9evyD9perDe4BM5fefpR+VHB4V+52vsFExgg2tg==
X-Received: by 2002:a17:906:9c95:b0:87b:bbdc:468 with SMTP id
 fj21-20020a1709069c9500b0087bbbdc0468mr15955281ejc.70.1675523461656; 
 Sat, 04 Feb 2023 07:11:01 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-183-077-083.77.183.pool.telefonica.de. [77.183.77.83])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906211100b0088a2aebb146sm2937922ejt.52.2023.02.04.07.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Feb 2023 07:11:01 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 BALATON Zoltan <balaton@eik.bme.hu>, Laurent Vivier <lvivier@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 5/9] hw/i386/pc_{q35,
 piix}: Minimize usage of get_system_memory()
Date: Sat,  4 Feb 2023 16:10:23 +0100
Message-Id: <20230204151027.39007-6-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204151027.39007-1-shentey@gmail.com>
References: <20230204151027.39007-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 04 Feb 2023 15:11:06 -0000

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 hw/i386/pc_piix.c | 2 +-
 hw/i386/pc_q35.c  | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index ee9d9a4175..5bde4533cc 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -241,7 +241,7 @@ static void pc_init1(MachineState *machine,
         isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
     } else {
         pci_bus = NULL;
-        isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
+        isa_bus = isa_bus_new(NULL, system_memory, system_io,
                               &error_abort);
         i8257_dma_init(isa_bus, 0);
         pcms->hpet_enabled = false;
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 71b7a30bb9..8253b49296 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -125,6 +125,7 @@ static void pc_q35_init(MachineState *machine)
     DeviceState *lpc_dev;
     BusState *idebus[MAX_SATA_PORTS];
     ISADevice *rtc_state;
+    MemoryRegion *system_memory = get_system_memory();
     MemoryRegion *system_io = get_system_io();
     MemoryRegion *pci_memory;
     MemoryRegion *rom_memory;
@@ -192,7 +193,7 @@ static void pc_q35_init(MachineState *machine)
         rom_memory = pci_memory;
     } else {
         pci_memory = NULL;
-        rom_memory = get_system_memory();
+        rom_memory = system_memory;
     }
 
     pc_guest_info_init(pcms);
@@ -215,7 +216,7 @@ static void pc_q35_init(MachineState *machine)
     }
 
     /* allocate ram and load rom/bios */
-    pc_memory_init(pcms, get_system_memory(), rom_memory, &ram_memory,
+    pc_memory_init(pcms, system_memory, rom_memory, &ram_memory,
                    pci_hole64_size);
 
     object_property_add_child(OBJECT(machine), "q35", OBJECT(q35_host));
@@ -224,7 +225,7 @@ static void pc_q35_init(MachineState *machine)
     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_PCI_MEM,
                              OBJECT(pci_memory), NULL);
     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_SYSTEM_MEM,
-                             OBJECT(get_system_memory()), NULL);
+                             OBJECT(system_memory), NULL);
     object_property_set_link(OBJECT(q35_host), MCH_HOST_PROP_IO_MEM,
                              OBJECT(system_io), NULL);
     object_property_set_int(OBJECT(q35_host), PCI_HOST_BELOW_4G_MEM_SIZE,
-- 
2.39.1


