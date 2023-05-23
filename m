Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q1LJS-0004k5-4q
	for mharc-qemu-trivial@gnu.org; Tue, 23 May 2023 02:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q1LJN-0004iE-0m
 for qemu-trivial@nongnu.org; Tue, 23 May 2023 02:15:57 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q1LJH-0005v2-80
 for qemu-trivial@nongnu.org; Tue, 23 May 2023 02:15:56 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-309d3e8777cso2208680f8f.0
 for <qemu-trivial@nongnu.org>; Mon, 22 May 2023 23:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684822549; x=1687414549;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hxpaBQnYbq6uneZzMMpOzN8+mfUPhtC8eR0rzpaDnw4=;
 b=cOLW07yOtva/dc0Gb+LZZkb2LkaTSj8NdQy6E0hR8OUnA3kOIn0G854B1ch42O1PE3
 sS+pzzr8FwALC0H4iwph1afBUW/RBNcAWpy8XG6hjCpCUfJD8B3VYe6zopnzKLc8qz9O
 In99XjFFb8vqy2c0gpGmxZFaMkDyhd0o9upxahhvc20bnjT5AyAHwDSdOATIWemg0HW4
 /7bOCE5PLdlAVW49PSrXz7ZPFTobVwkngU/XWakMlf6+3PhsCbv5gteQ+yycFGn9+l8h
 gMwfPFtIVnP8fm6JM+cCC48zxpW1+Je50yuBarYtX1aaoomT4KSOkzHjj7Lk838WLBQY
 mZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684822549; x=1687414549;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hxpaBQnYbq6uneZzMMpOzN8+mfUPhtC8eR0rzpaDnw4=;
 b=hFADLKB+vVh2a+Scff5Udn/ipNl7odXBCt8ywNPTliM7SxNc9AVP9Fa/OYW1TgZI6Y
 UDaPnYrkmZPTYmMH5rpmyXE+wwXWk7wP/mQcgc1JHW3k6jO5rI9/LhMThdM92//nwL7s
 C+J0UYX9meZe/uAb22bDCmTLlkFfALoHzJQMxsY7kTs66i6QLrrskWFz53V8PErkgyyB
 DiEED3xzmVvQFdqTOFdvNvm3MycNGHoMjpSZYa24rpQnXInNPMMtaVXxiCBergKPNTVF
 fic/ZdjeqIDW1ojZOnrp/B99ouhxruIluk7WswWWFNaaDo+y7bjjPtpjgQtJiPDSbAsJ
 NzWA==
X-Gm-Message-State: AC+VfDyobcp7rnLrg3n5Odrt2FQl0sXlgslrJqZmQvVAZciwug12ZaWL
 oxlVUl8nAl9HfDBYB41iyzTrXdJLS8494kXWyY8=
X-Google-Smtp-Source: ACHHUZ7zGGWH3QUOY00Ym7qvFGgvGWis41KLejy5KUb582e9okenGQFf0EvcXq5Ay/ANFib9qBtP8w==
X-Received: by 2002:a5d:658c:0:b0:309:596f:e5a8 with SMTP id
 q12-20020a5d658c000000b00309596fe5a8mr9020981wru.4.1684822549343; 
 Mon, 22 May 2023 23:15:49 -0700 (PDT)
Received: from localhost.localdomain
 (vil69-h02-176-184-48-94.dsl.sta.abo.bbox.fr. [176.184.48.94])
 by smtp.gmail.com with ESMTPSA id
 k1-20020a7bc301000000b003f50e88ffc1sm13948454wmj.0.2023.05.22.23.15.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 22 May 2023 23:15:49 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/ppc/openpic: Do not open-code ROUND_UP() macro
Date: Tue, 23 May 2023 08:15:46 +0200
Message-Id: <20230523061546.49031-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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
X-List-Received-Date: Tue, 23 May 2023 06:15:57 -0000

While reviewing, the ROUND_UP() macro is easier to figure out.
Besides, the comment confirms we want to round up here.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/ppc/openpic.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/ppc/openpic.h b/include/hw/ppc/openpic.h
index ebdaf8a493..bae8dafe16 100644
--- a/include/hw/ppc/openpic.h
+++ b/include/hw/ppc/openpic.h
@@ -55,7 +55,7 @@ typedef enum IRQType {
  * Round up to the nearest 64 IRQs so that the queue length
  * won't change when moving between 32 and 64 bit hosts.
  */
-#define IRQQUEUE_SIZE_BITS ((OPENPIC_MAX_IRQ + 63) & ~63)
+#define IRQQUEUE_SIZE_BITS ROUND_UP(OPENPIC_MAX_IRQ, 64)
 
 typedef struct IRQQueue {
     unsigned long *queue;
-- 
2.38.1


