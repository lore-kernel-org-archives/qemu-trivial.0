Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p6C9y-0003y8-Es
	for mharc-qemu-trivial@gnu.org; Fri, 16 Dec 2022 09:58:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6C9n-0003jp-Fs; Fri, 16 Dec 2022 09:57:52 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p6C9k-00022B-Cm; Fri, 16 Dec 2022 09:57:50 -0500
Received: by mail-ed1-x52b.google.com with SMTP id i9so3982202edj.4;
 Fri, 16 Dec 2022 06:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pYiiL9uEZUQsj2MEHzmEwuovZw38/E2BXqeIe9IDu4Y=;
 b=KIgAFAzp65aMz2yt6zJQ2BKZjTwV/znCzDCNw7TB6//fMyHTXm2fXdL+KiyHofz7NY
 ywtvIqwqG+Jm+7UXI+CaNbvDkjwNu9i3G3EqHEdUyIl4rzJpHy0CyTzuexgMJrJBppTp
 ulEACeWFRfMrVyvCA4lCMmojckooEjR2QqbVn7j6h4dMHijDWrLl0pC3MfG/Pd46o9sZ
 0JN/NmVCyIaJq3JZKDiNvlNhyupSG+RQS1SE8YBxA9yLlPS40M0A5gtH0DvKb5s6rdCx
 WCASh6idLJwoML83vrRQfvE3ixlWDk2ZsTHuwTPFPhBFOZU/FpKuLqNqNq4hb3fZ856a
 vIJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pYiiL9uEZUQsj2MEHzmEwuovZw38/E2BXqeIe9IDu4Y=;
 b=vMG/zglJR6Kb3IsRMwVMBJ1eub2NMbSxGPCGUnohdi76Mmd1qJ9VL/+A1575DsK4rQ
 x1GLXAQkspDk4jbWthwH+JUn7nRg1y6M3jQ2o2hPloM3EGeZt0V1JbYKfDNvIntwVIqt
 /c/HlBcgzYEnzUxiDOYdbLCXFOFbcFocF7GStglvJasB+EMrBGX6ZUEoyYpMHWYLw2sq
 4nNK1A6R+syHg8CeDBrKE1oMyX6F6WEBSrRMAS68hvq3s1GlvNrTFcKxJfwSokrzSm4y
 CmDEOgS/MEgLMZUeMBGEaeY68a+uCydWqHBVtbwNuOs5jVtD2UuZCWbeHarHoWn7yDm0
 NViA==
X-Gm-Message-State: ANoB5pn47z2Kjfy3mwCfZ3kWt6S3CDiN2LMIryCzq4iBI0Dg/e3EW8JC
 csgLhTvJQNChOqNh8KEGN75n3UEsTNw=
X-Google-Smtp-Source: AA0mqf7kNh4+Bqa+eRLW1VJozgM2kCGWcPBM1ns9cTPbilN7sid3/lksJytzouP1JScSZDuMOWzoLw==
X-Received: by 2002:aa7:da85:0:b0:46c:b385:83d2 with SMTP id
 q5-20020aa7da85000000b0046cb38583d2mr42155826eds.0.1671202665412; 
 Fri, 16 Dec 2022 06:57:45 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-078-055-138-012.78.55.pool.telefonica.de. [78.55.138.12])
 by smtp.gmail.com with ESMTPSA id
 g18-20020aa7c852000000b00467c3cbab6fsm942225edt.77.2022.12.16.06.57.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Dec 2022 06:57:44 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Greg Kurz <groug@kaod.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 3/6] hw/ppc/virtex_ml507: Prefer local over global variable
Date: Fri, 16 Dec 2022 15:57:06 +0100
Message-Id: <20221216145709.271940-4-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221216145709.271940-1-shentey@gmail.com>
References: <20221216145709.271940-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
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
X-List-Received-Date: Fri, 16 Dec 2022 14:57:57 -0000

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ppc/virtex_ml507.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ppc/virtex_ml507.c b/hw/ppc/virtex_ml507.c
index 13cace229b..f2f81bd425 100644
--- a/hw/ppc/virtex_ml507.c
+++ b/hw/ppc/virtex_ml507.c
@@ -157,7 +157,7 @@ static int xilinx_load_device_tree(MachineState *machine,
     int r;
     const char *dtb_filename;
 
-    dtb_filename = current_machine->dtb;
+    dtb_filename = machine->dtb;
     if (dtb_filename) {
         fdt = load_device_tree(dtb_filename, &fdt_size);
         if (!fdt) {
-- 
2.39.0


