Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qqZsZ-0000CT-QW
	for mharc-qemu-trivial@gnu.org; Wed, 11 Oct 2023 10:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqZsO-0008Qq-6G
 for qemu-trivial@nongnu.org; Wed, 11 Oct 2023 10:07:52 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qqZsM-0007FD-P5
 for qemu-trivial@nongnu.org; Wed, 11 Oct 2023 10:07:51 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40651a726acso63798375e9.1
 for <qemu-trivial@nongnu.org>; Wed, 11 Oct 2023 07:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697033268; x=1697638068; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KoDUpCbTedzPU30CQb9d9uvflh1nTk1L9uLqEJ+jbds=;
 b=iLKg3bSopm2nhrNM8L1r2ItPIhTXalwhpy/uFBwIZiov/5866RyzSJqyNyiwTO2qKC
 ULOXhhXCHGkLru4/CZbuJ1E/1ezVmYayZm4tWwcIJfTuxdm/8ZYhvn1aO2lDVp83LqZJ
 1N0Z9a9fO8jYLRhyamDYO1zdXoq8TRL3hkGJPKNcHOsgY2fAfCmZxrU5CZGVGJfcmVsg
 5ZVMcmiAPh1xewS1ylZ3laCAxQtTeaOHcOG9xJuXLCnaWO1x7rwtwIurDP/jeLgH+1RS
 GFxNokI6O7FcH/XQGlogYqaRmOO72+Mr6Xkw0ksOIQmvONG22Kt6pCMZbHK6FJ/stzXs
 NBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697033268; x=1697638068;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KoDUpCbTedzPU30CQb9d9uvflh1nTk1L9uLqEJ+jbds=;
 b=QSP3r2bHjOl5/f1EZj5yatOlnqDEIwXgqbKYgrj3o4HOYI0QU5IDxkB6+iIFNDMtC8
 PK5VTh6lnDtGuIWRcNnM+1ERJQVuj9K6EkroPEMPdPM7jULjJuoQRHe6HrdO55hphzNq
 +pG5o1iC6QjS9j4rGRE/7gIUX5SXLvmI8QHEETXc9gB5TRVp69/JCGS643j4t1GMKoct
 ZI00S9UTH26SxAu5HRPMQgNFptCmgGUiKKUUadx2MyhoA7OZqFUcpGZ0Pbm6et/QbRQF
 U+lLJPDrQDcjuJEUbwkD6l70vNgjJRN3kJ8jrEGxx9KRm8bPJNkwTO3GvAHkvm65kOgs
 EE/w==
X-Gm-Message-State: AOJu0YyK3f79EXCGWeFbM2jgMqiAD+d0624NYPPSIYcjJzqjWYTyFqMm
 eqitc52+jtE4i+CfOAVOc96dLQ==
X-Google-Smtp-Source: AGHT+IHG8C+TqNC8Dic+04CcGJ7nl+DUuX+FlcIogEE0TXokQFlgx18gYzvShoAVRRz5wv2PW8C9WA==
X-Received: by 2002:a05:600c:231a:b0:405:3a14:aa1a with SMTP id
 26-20020a05600c231a00b004053a14aa1amr18051202wmo.18.1697033268480; 
 Wed, 11 Oct 2023 07:07:48 -0700 (PDT)
Received: from m1x-phil.lan (mdq11-h01-176-173-161-48.dsl.sta.abo.bbox.fr.
 [176.173.161.48]) by smtp.gmail.com with ESMTPSA id
 z19-20020a7bc7d3000000b0040641a9d49bsm16646145wmk.17.2023.10.11.07.07.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 11 Oct 2023 07:07:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 1/2] MAINTAINERS: Cover hw/ppc/ppc440_uc.c with Sam460ex
 board
Date: Wed, 11 Oct 2023 16:07:20 +0200
Message-ID: <20231011140721.3469-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231011140721.3469-1-philmd@linaro.org>
References: <20231011140721.3469-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Wed, 11 Oct 2023 14:07:54 -0000

hw/ppc/ppc440_uc.c implements the TYPE_PPC460EX_PCIE_HOST
device, which is used by the aCube Sam460ex board.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Acked-by: BALATON Zoltan <balaton@eik.bme.hu>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9e7dec4a58..8c07d07927 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1482,6 +1482,7 @@ M: BALATON Zoltan <balaton@eik.bme.hu>
 L: qemu-ppc@nongnu.org
 S: Maintained
 F: hw/ppc/sam460ex.c
+F: hw/ppc/ppc440_uc.c
 F: hw/ppc/ppc440_pcix.c
 F: hw/display/sm501*
 F: hw/ide/sii3112.c
-- 
2.41.0


