Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tv9Wx-0007QF-Qs
	for mharc-qemu-trivial@gnu.org; Thu, 20 Mar 2025 02:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tv9Wr-0007Pc-CP
 for qemu-trivial@nongnu.org; Thu, 20 Mar 2025 02:37:21 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tv9Wp-0003hU-M8
 for qemu-trivial@nongnu.org; Thu, 20 Mar 2025 02:37:21 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-22401f4d35aso5977405ad.2
 for <qemu-trivial@nongnu.org>; Wed, 19 Mar 2025 23:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1742452638; x=1743057438;
 darn=nongnu.org; 
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8pbdE8VlFJqequFn1LDdLzAu8z2hVLr16uI3jFECb34=;
 b=hAjZayHQYwrzF0zX5eH9DCe4ShqPQxYE0K2Buzuy6oSyRJBkLHqt0jBLCQBuOb0hZ5
 H6WBtX1/HQuthGzA2Lfy3a7NfrHZN010cVWLA49CZ6ZAFML262LDoL1mz7f/8F2ChxER
 mGyRzBg03GrEG9KGzw/k3EABOjYGhBzLnp0iOAgHQV/Sxp7xzL3gGnZH9lqwgKaCjYet
 otQGzB1xOteL+gAT+e0ZY31JoEOc9HSUFeZV+L3JjnPcc01lJ60eiky72/VsLBwWzpIU
 Pg0HVc11y0CwtXZgfImmEdCbBbepRC1ZfCSNvJGphJj8bL5rEG4mpGox8zp45UNBk8Rd
 EG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742452638; x=1743057438;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8pbdE8VlFJqequFn1LDdLzAu8z2hVLr16uI3jFECb34=;
 b=IFiIPglcVniHLXWOGGcAd2I+45JkXqovpsjeUsuNKBKw9NklP431NmVMTTcdY9IN5/
 tP5fnWEf8hwTgDxf2wTdqR5ZptocPBr3fE+NF9H2DjIPoWuXjLdNNgGy3HynC6Mq9L3V
 rwbJEoGnaL0++C2VpblkfPBiGpvO6Ti245WvhBBShcj9znFkiQndvsORR5nvwmCvRH2K
 M5JTqQnFEQCLZVyAqIJYapJb7nAotOZbwBxI2qXX5nwhMuU0mtwCJaRkuaSWue1ygh5Y
 xfj3KqmlBsJD1S1/wMQZfiJHHlOV3sux5D9LqWuLUHruu/4WyL01R1WBsm5MeuP0hk2i
 RhCw==
X-Gm-Message-State: AOJu0YzDXRRNz4cWTEsP5VmmkmI/qAke19xGg6aw9tyPXX81G5Cuh4Em
 uBCB+T7s4pcX1PrK4NDwCwfG5C/uXuZDMxIQi+NhxvG0rkK+vH6f5cPJoKUKAxF3Giw2HGjAnCl
 wHac=
X-Gm-Gg: ASbGncttgYvEBSKnIAUA95+VeoCpDcPUgtyO5NAUyZeLTrzZ6KnpyHFjp2cOinNA/Sw
 +9oIrT538hvI34Au6Yf79Pj1U6brue4pxjcSs1/OAvQ+WJ5cqA0/BnWCdG+GbweyBbpQ/ICvUOB
 aRz5kh+2Rc75hHvZ45fgjia1XlFlpDp0nTjpuH0Zb4DGxPSXaJhCw4KObsp5kKnjvjFFAp8rsCc
 qZLRT2XU4HWMl8obHgo4ULkkA+TaYvGY0dwuPT3dQTIORUcrYBznoiOf69YNuFk4ynEkLhCguf2
 iVdg5q7Bd6VSHMHjkpR6fC8uV4Me7g4UOsGvEwL8dS5rAOnr
X-Google-Smtp-Source: AGHT+IEK6rIs4iEaIMtGYn8ae5qfoVBxNIH9T1+g6vaS1Am0DHbyTZO7cvAMP3BNmq0TqUuGk0spaQ==
X-Received: by 2002:a05:6a00:3a25:b0:736:4644:86e6 with SMTP id
 d2e1a72fcca58-7376d62c910mr8152118b3a.12.1742452637650; 
 Wed, 19 Mar 2025 23:37:17 -0700 (PDT)
Received: from localhost ([157.82.207.107])
 by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-73772f84ef7sm2417931b3a.6.2025.03.19.23.37.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Mar 2025 23:37:17 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
Date: Thu, 20 Mar 2025 15:37:10 +0900
Subject: [PATCH] mailmap: Update email address for Akihiko Odaki
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-mail-v1-1-28ddad2aea47@daynix.com>
X-B4-Tracking: v=1; b=H4sIAJW322cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYyMD3dzEzBxdg9QUMxMzY2OjVFMLJaDSgqLUtMwKsDHRsbW1ACTCR+t
 WAAAA
X-Change-ID: 20250320-mail-0ed646332e58
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, devel@daynix.com, 
 Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mailer: b4 0.15-dev-edae6
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 20 Mar 2025 06:37:22 -0000

It's too late but better than never.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 5f6df414e1f7..33fe75400fe3 100644
--- a/.mailmap
+++ b/.mailmap
@@ -67,6 +67,7 @@ Andrey Drobyshev <andrey.drobyshev@virtuozzo.com> Andrey Drobyshev via <qemu-blo
 BALATON Zoltan <balaton@eik.bme.hu> BALATON Zoltan via <qemu-ppc@nongnu.org>
 
 # Next, replace old addresses by a more recent one.
+Akihiko Odaki <akihiko.odaki@daynix.com> <akihiko.odaki@gmail.com>
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com> <aleksandar.markovic@mips.com>
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com> <aleksandar.markovic@imgtec.com>
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com> <amarkovic@wavecomp.com>

---
base-commit: 825b96dbcee23d134b691fc75618b59c5f53da32
change-id: 20250320-mail-0ed646332e58

Best regards,
-- 
Akihiko Odaki <akihiko.odaki@daynix.com>


