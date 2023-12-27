Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rIPlN-0005ao-VE
	for mharc-qemu-trivial@gnu.org; Wed, 27 Dec 2023 03:59:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rIPlM-0005aO-NI
 for qemu-trivial@nongnu.org; Wed, 27 Dec 2023 03:59:40 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rIPlK-0001bn-RD
 for qemu-trivial@nongnu.org; Wed, 27 Dec 2023 03:59:40 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40d5ae89c7bso7803365e9.2
 for <qemu-trivial@nongnu.org>; Wed, 27 Dec 2023 00:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703667577; x=1704272377; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZO8r5vybfdlMZbd51MFjCtKOQi9ZtzsOoJk4O8XdZ4Y=;
 b=k3vDUywhEAj+etqDCrw8iom9yOE+bvxEhoTF8QPPF6flSx2hbcXNaFqP+/H4oEzmQ9
 eKhEBgT9RdzJy6GL2LOPttpNCXw6BahiHpXydaXo/CnlGVxY/P+9527vnsIIcUetqvI0
 irXpsUeWLXEBFXlCRncPICRs8ZXZd3lyVjCs3MseXghFDCCrNOo9nENxQnd0mPgQdOMb
 PqFYqcLsEEhR1CZShniZFH7dtkbJ+a78f6uWwA2fWDWhBit+VvwmrFwqTktona2zQz/c
 UEZwdVQ4h/O+eCTklNCJa3x3Bs3PSQq5a5AQ0mWxARvDLZ1yAriFir9uBxLHS3sSjiln
 fm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703667577; x=1704272377;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZO8r5vybfdlMZbd51MFjCtKOQi9ZtzsOoJk4O8XdZ4Y=;
 b=iqSzIWNrPf23x6n/c6MGGtYoujyQJj/joeZRNTdPr1Yvry04YwjL9rpInQkhhPzcw3
 G8auD3xGON0uEeqrz/yEKp9kK1h7z5Ku+Q+moPsHVl5FwQokPoHtOaSxPzM5GucaWKox
 IV1sjLWYv+vUsi8R3MPEKGIdfXzHlWyXD6V6C5d+Qiy5RGRN572YrgHt0tn8tSF0Ipty
 l2yJHaf9eEMlWNESMGC5wHKpAvSSnIeFv3RaEE1nfjzm2JVGzXEEO3bzTodXxZPpIGSw
 hshkXaBK9JRRtz5pyTZMRdjVQz2p3SoIClDATJKm003rauaRA8d5yFRLF5NOSsgdrXWL
 vWXg==
X-Gm-Message-State: AOJu0YxWsEc+YtlAo7+MlFsG0Su7F2PBpVthHST6/KH8itNhbkbHp14s
 Y4gwQueC8KNmONcG3U3VnWUNorTvxQqmVQ==
X-Google-Smtp-Source: AGHT+IFw3LgEZ04VLlvQi/877s2RwssSPKpELFLVu2o+RlT8TtCtwA73CHf7StKwubiohhzQMbl/dg==
X-Received: by 2002:a05:600c:34d0:b0:40d:5a40:1a29 with SMTP id
 d16-20020a05600c34d000b0040d5a401a29mr1182759wmq.34.1703667577175; 
 Wed, 27 Dec 2023 00:59:37 -0800 (PST)
Received: from m1x-phil.lan ([176.187.218.122])
 by smtp.gmail.com with ESMTPSA id
 df2-20020a5d5b82000000b00336be33649csm7017976wrb.9.2023.12.27.00.59.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 27 Dec 2023 00:59:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] mailmap: Fix Stefan Weil author email again
Date: Wed, 27 Dec 2023 09:59:34 +0100
Message-ID: <20231227085934.18158-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
X-List-Received-Date: Wed, 27 Dec 2023 08:59:40 -0000

Commit 5204b499a6 ("mailmap: Fix Stefan Weil author email")
corrected authorship for patch received at qemu-devel@nongnu.org,
correct now for patch received at qemu-trivial@nongnu.org.

Fixes: d819fc9516 ("virtio-blk: Fix potential nullptr read access")
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index e12e19f691..ecdb063c35 100644
--- a/.mailmap
+++ b/.mailmap
@@ -60,6 +60,7 @@ Ian McKellar <ianloic@google.com> Ian McKellar via Qemu-devel <qemu-devel@nongnu
 Julia Suvorova <jusual@mail.ru> Julia Suvorova via Qemu-devel <qemu-devel@nongnu.org>
 Justin Terry (VM) <juterry@microsoft.com> Justin Terry (VM) via Qemu-devel <qemu-devel@nongnu.org>
 Stefan Weil <sw@weilnetz.de> Stefan Weil via <qemu-devel@nongnu.org>
+Stefan Weil <sw@weilnetz.de> Stefan Weil via <qemu-trivial@nongnu.org>
 Andrey Drobyshev <andrey.drobyshev@virtuozzo.com> Andrey Drobyshev via <qemu-block@nongnu.org>
 BALATON Zoltan <balaton@eik.bme.hu> BALATON Zoltan via <qemu-ppc@nongnu.org>
 
-- 
2.41.0


