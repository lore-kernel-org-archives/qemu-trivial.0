Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1izVoF-0000WA-FB
	for mharc-qemu-trivial@gnu.org; Wed, 05 Feb 2020 20:18:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53751)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVoC-0000S4-UO
 for qemu-trivial@nongnu.org; Wed, 05 Feb 2020 20:18:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVoC-0002bo-1w
 for qemu-trivial@nongnu.org; Wed, 05 Feb 2020 20:18:20 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:55406)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1izVo6-00024a-Na; Wed, 05 Feb 2020 20:18:14 -0500
Received: by mail-wm1-x343.google.com with SMTP id q9so4473833wmj.5;
 Wed, 05 Feb 2020 17:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W2XB7avCzY/On5eAKW5ymwIRtI2E5aDh8P+f+vF2jdQ=;
 b=Jyc0WFcrxYoKMiOxbcPKERxqQug5mK3/ZyHPNMIW3WFOT8LxPxDcBO17kVpLJlFFIE
 4hy98q/k4tobPbyxRmDYCWqVd3AxL+HNRy2kLrN4aGUITPthE4J2AZtFqdOFaZaJsqMp
 YY48MZOeKrlqYc1NXqgfM2OvT1RfwQGbdeMfyJk75HBvYkmvvHwXhpBfmuEBSfS2FOdt
 dldFCXO47BnmcK/55UWFP/oo1i7W8qY2cWV73FrXLRzqmmXdG2k9w6otEy7jIN6wSWPA
 o5KpxF355R0rFOmcgP0u6dphHQ2iPGPfg4T7UfCrGZnFkHoGUvaCk65gzNTg9APHTDqW
 fGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=W2XB7avCzY/On5eAKW5ymwIRtI2E5aDh8P+f+vF2jdQ=;
 b=Res+HPN/vS/iPwE9GvYW1SX5NhA7o4lYVKNHHxmWBQHiQuRtXR0W4bQ0UPGaENIFFF
 r+bF7BQJRg7bfPrjMXqNjgCtrAY8PR0s3N62Mi2HMksA0syHG4rlv0Lo90ft1eGR6y9d
 IWYIs48t++rVTm7AknrvpwpEns6fdcmjDoGmykKjIAkxXuFqFzSa/rIKAjQON0WlUmqT
 fHY7JFW3/qXqmlmzmmd4AMO1Lz1hfxErbjDKPIkpo3lYYz76fnmYiI136ES3+NqgiVdK
 T76jzl8VQXytdxXCd5mg5zPxInrrcdaKWrnF51+kBbpE0XFxe7+pi2dfXv5rkSX9uB6o
 p6Ug==
X-Gm-Message-State: APjAAAXCu5JIvlvKgezNJGNAroQURNQlad355xSPb37ZM2PYNvEVWq0o
 aFKW+dcaWrbu2Ydw+cYMrz1HmLdj
X-Google-Smtp-Source: APXvYqz85deY74w3KyntT+LwF1bq55/fJ8GhkiGkDO9Ok1137DIGA+7gf9B7K+pnFVBNgYF1E/w7lQ==
X-Received: by 2002:a1c:e488:: with SMTP id b130mr606177wmh.108.1580951893551; 
 Wed, 05 Feb 2020 17:18:13 -0800 (PST)
Received: from localhost.localdomain (2.red-95-127-156.staticip.rima-tde.net.
 [95.127.156.2])
 by smtp.gmail.com with ESMTPSA id w13sm2053526wru.38.2020.02.05.17.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Feb 2020 17:18:12 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Joaquin de Andres <me@xcancerberox.com.ar>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Esteban Bosse <estebanbosse@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org (open list:Trivial patches)
Subject: [PATCH v2 06/30] hw/arm/raspi: Trivial code movement
Date: Thu,  6 Feb 2020 02:17:32 +0100
Message-Id: <20200206011756.2413-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200206011756.2413-1-f4bug@amsat.org>
References: <20200206011756.2413-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::343
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
X-List-Received-Date: Thu, 06 Feb 2020 01:18:22 -0000

There is no point in creating the SoC object before allocating the RAM.
Move the call to keep all the SoC-related calls together.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/raspi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 20195227eb..fab361939c 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -226,9 +226,6 @@ static void raspi_init(MachineState *machine, uint32_t board_rev)
         exit(1);
     }
 
-    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
-                            board_soc_type(board_rev), &error_abort, NULL);
-
     /* Allocate and map RAM */
     memory_region_allocate_system_memory(&s->ram, OBJECT(machine), "ram",
                                          machine->ram_size);
@@ -236,6 +233,8 @@ static void raspi_init(MachineState *machine, uint32_t board_rev)
     memory_region_add_subregion_overlap(get_system_memory(), 0, &s->ram, 0);
 
     /* Setup the SOC */
+    object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
+                            board_soc_type(board_rev), &error_abort, NULL);
     object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(&s->ram),
                                    &error_abort);
     object_property_set_int(OBJECT(&s->soc), board_rev, "board-rev",
-- 
2.21.1


