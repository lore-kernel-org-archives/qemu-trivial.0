Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rZrW7-0007e8-Mf
	for mharc-qemu-trivial@gnu.org; Tue, 13 Feb 2024 07:04:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZrUW-0005Ri-7Z
 for qemu-trivial@nongnu.org; Tue, 13 Feb 2024 07:02:37 -0500
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZrUN-00017p-RR
 for qemu-trivial@nongnu.org; Tue, 13 Feb 2024 07:02:22 -0500
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2d0d7985dfdso58569391fa.2
 for <qemu-trivial@nongnu.org>; Tue, 13 Feb 2024 04:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707825734; x=1708430534; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NDuO1yoG1D7/XJGzTiSB0HfRJ9/QIMB6S76Ai8lLnLY=;
 b=Xwd7CsZ2LXPgiUYLjX4Gu9GzmkYhbQmmiqmpYpul+aF2aINR5J1o+nVrypTe/EqqZD
 +ETFJZN6N7RVrwwDLGIDpOv5BkoTlarBmbYSKW4nuNMTXhME6iCSpKIGQ4r3+zVox4bo
 EAr4DzQmjcQvOPFIsop+szK3bOO8BsP9T/5ege35MKa02vGE/tYYfITbwwsR6AsIbLNq
 PZv8yblFJFpcTeDleKNGgVF5DP8K4ZewQfSyxKTCrZGP6+13+UG07CjbusaVkX8tPpT+
 zdPfYptIsoIoVJj78JHXxGj7RZcvQ8SWgN29auSGosoj+u1MsPcK24d7Yo4SLhGvctv0
 Xspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707825734; x=1708430534;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NDuO1yoG1D7/XJGzTiSB0HfRJ9/QIMB6S76Ai8lLnLY=;
 b=a+AaeqfiPWhmLMefYyIz+QZFN1uzErC58JzQH9zAl9VCOlrNMra7hGAOroKN4+yrlw
 iMZHRiuweEvjqFdV4WzsnF69iOl0r0pmxQxzXc9DkRqD7BvSUxv9olnSawktqUATRhxN
 d8RcQurxDztUxNKGP0V4wbAX2PuHBQ7R8+MwWqOm8WHEP/Lz+D1X71NQAMrm82PcF+09
 ZHiycqnUA5uQimkGYJKry1D4m1XP+uoCn6apqXl8Kfh6Tayh+jw53UgDLtPuZhyx9sN3
 9wO/0ewox3HRU+gQR0wCcZXkf1JK+ri/QcJhp40ndDqNiD8Vtf8g9+whu/YeEyGJ15es
 uBtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2Ds5bUZ2B7wDEPR595tB6IGjwUGd6gGbICqLEdeA+yXw7dpkN1zlOd3rZaBSEG05Y/aRt13F5vP3BtlAKmCxsPytcZvUj4Q==
X-Gm-Message-State: AOJu0Yyo+CGE18TvrJ2nfkPB5gOSvrOIK2mCGyVQU14Mm3ELGmSUOZCQ
 quws+aJZCwSgxdJ/LOesIc978J5/OwBGRHC6askAlYotELwTb9pxzRZiRCuJSc4=
X-Google-Smtp-Source: AGHT+IGur+wbZD2yUeBm3JhLiO1/vzzkr/lKJUPMzoRfq4ekHVogWhm8LpJQvHMql0zFWfd3MIprsA==
X-Received: by 2002:a2e:7803:0:b0:2d0:a52d:5510 with SMTP id
 t3-20020a2e7803000000b002d0a52d5510mr6549932ljc.39.1707825733823; 
 Tue, 13 Feb 2024 04:02:13 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXR6e91YgO3aY37n7c6JtVojful7CgVRLHd4R9TIyxDwLJPl4v0EruBsCz0hJsqCtf3ksdsJKSPl3zN0MVjWAq6GR6H8DbFS2rJ0+Rhzz1HT2+VbytjguDSiVYv/yIhCL/of32ZNabJarCFUB9i+OJFwtsAo0OGmkDEEgQko/s8jYAlD9oGnsU3HNIXy++9EdxqeYjmWCx8SRNyUxCVk6egUbo+88ZMaKFTvzxOJY0U1FcHaVJc0xJ1b8omteLYrQPypUP2LcBxpxnuhFzvitDPVJo3sTJHoawudODm6u9AEvPh7q5Gl961SHqb/iVoY/VSbG4njmY=
Received: from m1x-phil.lan ([176.176.128.243])
 by smtp.gmail.com with ESMTPSA id
 y19-20020a05600c20d300b00410e8ef51cbsm4525823wmm.31.2024.02.13.04.02.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 13 Feb 2024 04:02:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>, Ani Sinha <anisinha@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/7] hw/isa/lpc_ich9: Remove unused 'hw/i386/pc.h'
Date: Tue, 13 Feb 2024 13:01:48 +0100
Message-ID: <20240213120153.90930-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240213120153.90930-1-philmd@linaro.org>
References: <20240213120153.90930-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 13 Feb 2024 12:02:47 -0000

Commit c461f3e382 ("hw/acpi/acpi_dev_interface: Remove now unused
madt_cpu virtual method") removed the need for "hw/i386/pc.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/lpc_ich9.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
index 3924eec483..b39d840ccd 100644
--- a/hw/isa/lpc_ich9.c
+++ b/hw/isa/lpc_ich9.c
@@ -41,7 +41,6 @@
 #include "hw/isa/apm.h"
 #include "hw/pci/pci.h"
 #include "hw/southbridge/ich9.h"
-#include "hw/i386/pc.h"
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/ich9.h"
 #include "hw/pci/pci_bus.h"
-- 
2.41.0


