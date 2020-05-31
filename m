Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jfRv3-0004NZ-Da
	for mharc-qemu-trivial@gnu.org; Sun, 31 May 2020 13:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jfRup-0004CV-BP; Sun, 31 May 2020 13:38:33 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:33223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jfRuo-0004G7-Ir; Sun, 31 May 2020 13:38:30 -0400
Received: by mail-wm1-x343.google.com with SMTP id j198so10509957wmj.0;
 Sun, 31 May 2020 10:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nx6i+AHtHhOPOYC0ludmYEcyPCtH+R6fArfoXhgX/80=;
 b=ecRtJ9+dMcz6HFcCrjMA79m2NLL9pLTe3YlR6u/5U8B/pDwEZnHkpthloUcJD9mdeX
 z4NzrruZHIQ5BDed7AH8zcr/JzgBoZ1wQmFBvCf0zqPlH2VDi3PlRQEl/z3dTDw8CP0R
 VEh2hNdQFoGTa0ucGgNoDbeocX77DmNTTR7f1AuNpakZHtfsid+pCIBY0so133aao2cN
 b+i37OA+ThO+bxJeMeXuuwDMmwuLCLkIY+kfFnePWYnEWyGruAmEtPG2VehLleFSgTQF
 GNo4UF310Aboap3C76RpTvPD64wZq/2auDdcnjb13FWLdoOod69RR73rZOQlRY4ZML6K
 vZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=nx6i+AHtHhOPOYC0ludmYEcyPCtH+R6fArfoXhgX/80=;
 b=XSMgWox6hoVu9S4yXtAk5SJre4jJzi/4ERPAu2rmLHnbIwnvvb7xZSslaNLGdBQNIo
 HtgkObwZ0kSOajHg1HRbCDaR2o3+oUTJp+ZgdIFYX4VEFH9Ae+3J1vfF1k9FFYOullux
 1gNR2p8vHE1ERaUPkf9Ji6Eoa9KmJt97woF4hyZKPzpMFSUmzEfTHP5SOtmMx9Ujqnii
 yCtSqkjqaq8vVLBAM9g6ZRju3QEzNxN3fOifYzThmX532vPDgwGek8N8YBA1nzIajrgQ
 P3ZQhRfoIKKbQGjd/AQJq1nTQet/K0LFxUjta7Htz/ftgVQIsSYQXuv+ZMzSAN5TMI9Q
 sn1w==
X-Gm-Message-State: AOAM532n3Vra+8Shyun1KHsiHCcwFJ7vYgGzL2rDeZ9ks7PQw3v3obUw
 mD5pBP9sIs3ogASRzr06URZmyYX4
X-Google-Smtp-Source: ABdhPJwrR3vwdIenjSppjEGj76X18jhrVpnPd8ljKzuiMJUGDNuZXGPyuZJVIrkrS466Afme7Vb7pg==
X-Received: by 2002:a1c:39c1:: with SMTP id g184mr17816585wma.9.1590946708068; 
 Sun, 31 May 2020 10:38:28 -0700 (PDT)
Received: from localhost.localdomain (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id l19sm7973121wmj.14.2020.05.31.10.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 10:38:27 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@aj.id.au>, Helge Deller <deller@gmx.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 qemu-trivial@nongnu.org, Joel Stanley <joel@jms.id.au>,
 qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 7/8] hw/i386/xen/xen-hvm: Use the IEC binary prefix definitions
Date: Sun, 31 May 2020 19:38:13 +0200
Message-Id: <20200531173814.8734-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200531173814.8734-1-f4bug@amsat.org>
References: <20200531173814.8734-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Sun, 31 May 2020 17:38:34 -0000

IEC binary prefixes ease code review: the unit is explicit.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/i386/xen/xen-hvm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 82ece6b9e7..679d74e6a3 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -9,6 +9,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 
 #include "cpu.h"
 #include "hw/pci/pci.h"
@@ -230,7 +231,7 @@ static void xen_ram_init(PCMachineState *pcms,
          * Xen does not allocate the memory continuously, it keeps a
          * hole of the size computed above or passed in.
          */
-        block_len = (1ULL << 32) + x86ms->above_4g_mem_size;
+        block_len = 4 * GiB + x86ms->above_4g_mem_size;
     }
     memory_region_init_ram(&ram_memory, NULL, "xen.ram", block_len,
                            &error_fatal);
-- 
2.21.3


