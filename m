Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j0TQ3-0006Aw-Qk
	for mharc-qemu-trivial@gnu.org; Sat, 08 Feb 2020 11:57:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53937)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TQ1-00063i-Cs
 for qemu-trivial@nongnu.org; Sat, 08 Feb 2020 11:57:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TQ0-0001pd-Ai
 for qemu-trivial@nongnu.org; Sat, 08 Feb 2020 11:57:21 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:42575)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1j0TPs-0001jx-NK; Sat, 08 Feb 2020 11:57:12 -0500
Received: by mail-wr1-x443.google.com with SMTP id k11so2466698wrd.9;
 Sat, 08 Feb 2020 08:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p0CIm4ZyNmzBVoqBIDDC/4y2EAVfboHjJlAZjEgSztE=;
 b=pnUYEJaVU8+Xl58FKRdO4JOjksL0si64wFTdea5tr+GkVN7pmE2QIAf+bV+fg+90H5
 9qUKjzAQ0vJg/zb/0xCnlCUP1w3eLIsfs2P1C1EYInLLDyEX7h4Bw/h/DAQV5IFrtF9y
 8Mhklh94hQCB0WljY8+pbZ5KPDDvj+mYfoYBsQoRRohJaevZ28PqerjMSgIOv46alWHQ
 31HPUOz1a0f5ens1Sk4YYSf4xPPsqZekq9frznqhUijoAktGzWUo2ZZlNA3ysjhT6CoT
 nWHQACYQe2U5j9dR+BNqzDGl9htsun1eOr6xygkImZdA1DbCfQayKpIzNLTN92d6m0Fs
 BVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=p0CIm4ZyNmzBVoqBIDDC/4y2EAVfboHjJlAZjEgSztE=;
 b=ZBa2vcueQ5u1xZ+FKk2GkTUSxP0bmwvRGvFiQ+REuk4qP3pIe1Iq7fLiFgiVkIZ7+U
 Isu5DPzHJNuuupm0Fu755ySbCdhnymztdhB9/kTTf5GiN10JF/RV4fu5BNBt/pfmSEzG
 Cf5W5fPwBSRCggXnQDSgXzbzEGbM6pY3FCz6cZldCXrkHlRMa4NXCHB5KN05N79QdNnw
 1D37KFdBuPmPDqMWIBbP918mlvK7T5DoTJ/q+C/LNvzL6fxlz+I971datzuMO3hslK3I
 BWeNobO0NOhXpTNEs1X06lqepPW2YkMmmsA93wJL5XSr3qVbF8gdE8uu0scCFGGoUKBn
 Itcg==
X-Gm-Message-State: APjAAAU7wqzAsE3wKRyD0rpaPP2MuI1HVIE3TYFZvjlIip96EPzzKGZw
 oTAhqxO6KgFGLTL2j5ONUOVrYNV1
X-Google-Smtp-Source: APXvYqzLGb0CHBz/BoAxnqK1EKwMATPdV9oSxFoAOvAy/EA+JA3TYTZWkg8+Ud3g0yUwLClf+nme2g==
X-Received: by 2002:a5d:4d12:: with SMTP id z18mr6158740wrt.139.1581181031477; 
 Sat, 08 Feb 2020 08:57:11 -0800 (PST)
Received: from localhost.localdomain (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id a5sm7872763wmb.37.2020.02.08.08.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2020 08:57:10 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org (open list:Trivial patches)
Subject: [PATCH v3 06/13] hw/arm/raspi: Trivial code movement
Date: Sat,  8 Feb 2020 17:56:38 +0100
Message-Id: <20200208165645.15657-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200208165645.15657-1-f4bug@amsat.org>
References: <20200208165645.15657-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
X-List-Received-Date: Sat, 08 Feb 2020 16:57:22 -0000

There is no point in creating the SoC object before allocating the RAM.
Move the call to keep all the SoC-related calls together.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 7a2ca97347..b3e6f72b55 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -227,9 +227,6 @@ static void raspi_init(MachineState *machine, uint32_t board_rev)
         exit(1);
     }
 
-    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
-                            board_soc_type(board_rev), &error_abort, NULL);
-
     /* Allocate and map RAM */
     memory_region_allocate_system_memory(&s->ram, OBJECT(machine), "ram",
                                          machine->ram_size);
@@ -237,6 +234,8 @@ static void raspi_init(MachineState *machine, uint32_t board_rev)
     memory_region_add_subregion_overlap(get_system_memory(), 0, &s->ram, 0);
 
     /* Setup the SOC */
+    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
+                            board_soc_type(board_rev), &error_abort, NULL);
     object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(&s->ram),
                                    &error_abort);
     object_property_set_int(OBJECT(&s->soc), board_rev, "board-rev",
-- 
2.21.1


