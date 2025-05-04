Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uBhLN-0007RV-DH
	for mharc-qemu-trivial@gnu.org; Sun, 04 May 2025 17:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uBhLK-0007Pq-QQ
 for qemu-trivial@nongnu.org; Sun, 04 May 2025 17:57:50 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uBhLJ-0005BH-D3
 for qemu-trivial@nongnu.org; Sun, 04 May 2025 17:57:50 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-22c33ac23edso41003315ad.0
 for <qemu-trivial@nongnu.org>; Sun, 04 May 2025 14:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746395868; x=1747000668; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=56ybfnwzUbGIYEktCHIqmHOykTepTgv6Xlf9ny+yrcs=;
 b=Rh7ExY9fsx2UUMBh8pkC/L8n8hCJzjABBmGurLSwrVwpIdPravJusqbAlKXarfVI0v
 SorkEj3mzc1UM4deIB5zKIEuA3e3TBBiYOTWSvjLVROQR6zdrcJpVGznM26Fq6upFUE+
 Hpia/2hunK1aGwYI2zt1xl8r9WtLT2vCtSFo6CYfTqoVZWMY9z3poDeYBpWChGlcnAGc
 p/L7TxweVy4m7L179lxxGZuPKHTX810DfircD7k6ZaNq121bGafcyd2T/jd6GlzSMke4
 fUec6mEs9OMrOQmajmbQKcfxOtbW8rPjLdnbCDaZclolqvi22I9q63eXxs7QBwPyd8Kr
 kM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746395868; x=1747000668;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=56ybfnwzUbGIYEktCHIqmHOykTepTgv6Xlf9ny+yrcs=;
 b=aa7sbIVrRgTO9mq2+lE3Pq6WjN0hvmtldTGq89qeJJhFLYeyEN06s9nFocD9+5oaKu
 u1hqOQqaawecAfuVos8VJEHWVDoSDGqlAJlGTph4W/7QLIXdMAMPjBP+JoI65cDNAJNI
 ZGJ67w6j4HSp8NCwupl3q2zwqRkohyE7tFuRucGiRuJl/BW8Ej4hLgPQ611FbKANdAC2
 9RqH0Plj8kwuVKEnt6V6LVNlpP8txolKeWzHQaRZhUE4pF6EkLXG1tkNiJw3LBswcBs4
 7RFvkzGfC5+z9a3CtgjkG8RfpEMxeLMpc1uF7u3Y4nkcRGDRbgu794xFKQ6i/iaeS/UO
 QsuQ==
X-Gm-Message-State: AOJu0Ywu0TKe3Ic0N8R6VJh/ccwrMbKXhnWBmSjEmHGL4DreQSrx6tde
 Fn6//DXWlCjQjM54dfeirk+pKFjzp+icvwf0USkm1+1fla2fHUw8YxRwQhKrI14=
X-Gm-Gg: ASbGnctM9EEhICrsz210q2z7n2d9BZprmrPfIOOKfHmXk3DPv0bvYLFIU+i5gaVEDQi
 Jma2rhjAv6zVlGq0uIpICeBfYxr3XZxQbAlrHY15R1i9ZexQCqe/g2sT292/SQnOH1y/wnxryEP
 VparwA7OBFR4ZOgd1INMiTYvh0cfRlPtM81dpz8dsn2hz8LK4VgG1+YOwf1zBafm6GiJEf9AKzM
 rIaOCKrvfmwJf9DJFf3uZLafThCRH+dQvblscwZA9gMeyQ7yQ1a6uCTHv3fntscOefFsp9h5kGB
 Ml18aUEfQAQVzmfv3KcmkLYFSh8SX+S5o64MmPeJna4Fm9Pi8Q1uAwYHIlM=
X-Google-Smtp-Source: AGHT+IHVPC4FyzJd0HAZEcXwZiKDeTCdiv/lusHXrf+t9gii4gUOEAFX9IdMsS6N6mTKZEpEIIVhiQ==
X-Received: by 2002:a17:902:d543:b0:21f:85af:4bbf with SMTP id
 d9443c01a7336-22e1e8f569bmr70470725ad.20.1746395868242; 
 Sun, 04 May 2025 14:57:48 -0700 (PDT)
Received: from gromero0.. ([200.150.181.215]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e152204fesm41664875ad.137.2025.05.04.14.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 14:57:47 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, philmd@linaro.org, alex.bennee@linaro.org,
 gustavo.romero@linaro.org
Subject: [PATCH] hw/net/e1000: Remove stray empty comment in header
Date: Sun,  4 May 2025 21:56:32 +0000
Message-Id: <20250504215639.54860-4-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x634.google.com
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
X-List-Received-Date: Sun, 04 May 2025 21:57:51 -0000

In the header file, remove a stray empty comment in the Offload Context
Descriptor struct.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 hw/net/e1000x_regs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/e1000x_regs.h b/hw/net/e1000x_regs.h
index cd896fc0ca..e9a74de6f4 100644
--- a/hw/net/e1000x_regs.h
+++ b/hw/net/e1000x_regs.h
@@ -900,7 +900,7 @@ struct e1000_context_desc {
             uint16_t tucse;     /* TCP checksum end */
         } tcp_fields;
     } upper_setup;
-    uint32_t cmd_and_length;    /* */
+    uint32_t cmd_and_length;
     union {
         uint32_t data;
         struct {
-- 
2.34.1


