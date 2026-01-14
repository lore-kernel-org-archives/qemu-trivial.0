Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3D2D3901B
	for <qemu-trivial@archiver.kernel.org>; Wed, 14 Jan 2026 21:34:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vg8Ub-0000BJ-OR; Wed, 14 Jan 2026 16:33:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vg8U1-000853-CJ
 for qemu-trivial@nongnu.org; Wed, 14 Jan 2026 16:32:58 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vg8Tx-0004gs-4J
 for qemu-trivial@nongnu.org; Wed, 14 Jan 2026 16:32:51 -0500
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b8768225837so45037266b.2
 for <qemu-trivial@nongnu.org>; Wed, 14 Jan 2026 13:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768426367; x=1769031167; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JzXfkJQP3HTTv/Iz3UDFpE7UMShn1ruzD17zw8BmbSU=;
 b=HQKHvGQmfEbN2SWCtDjWr6mNv+xD4eUuQtJZxz9IB25QHLp+CHq0TLso+SQgNx1za9
 6PTeP/Bbj04jsqnT3ksNYY0Inwcdt5lnG0gFX7sLMOUDbMh0guFIThwqw+CdspSiCB3X
 VHjXAR5HWr/IfjHyzTisot/Mf1AeMaupfH4FrPiihGdi1RDK7Fc6oclFvjMak0njXN5C
 WvF8QBi5j0LQtucnxC/TMs6TQPFZtSoyIAHT7Rc3QPBq12azxmtV5smm4DVPgruqBzsP
 LIemaxFUF6nFcN0ewnZQNTIgVcH9Ra46t+Y+SZ1qOdLjdlqqE6HjuFXWV7uXQnvTThIt
 q6lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768426367; x=1769031167;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JzXfkJQP3HTTv/Iz3UDFpE7UMShn1ruzD17zw8BmbSU=;
 b=PgHRSKDKmi8IMKbqn4UOyKOmW0LdRoTnreviHacrbHnVK0IWiSh3yYZGvpFMHHSh6H
 zNJAJ0lMj0eE0G/9fGKq3aNho6BWoX3vLu5CKKSRcVW5B5ZpQAOOW0Tpe4Z3AXOj6W7U
 JJnJDQp6HhONJuxc1lzfaC/LSsv+Xj9UDtXanzfLGLVgGUBlhQAbtV+rAx+CGEF3Iowt
 EwK2PTNWxSf8YXXFxBdppooIUuoGVOK/hEUU3sJOfo4loBa/XPdf+8AF+Z6bjGELX7pE
 8P/N7sYn4KTrtSRzlfRDmK3etdXsA2x8txkEgXAAIrycTH6eCCaNE3C6qGBr9IEuraHQ
 aTyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtZXJQbCgYKCe2dtGgxZnf6+pXq3ML/Kpnnm7lBN+iDPZxAlQ7eRy7rynkIvWPPz+IJzqJFUeeQ9I5rWk=@nongnu.org
X-Gm-Message-State: AOJu0YxLEYBllYC5MdoF1UWBDHn+6mOoQrrcoX1ds89EWvTuE6ad97sl
 COSxiWaUouZbOcxwh2syMqYoX8izqhD7u97w4BnvZk3GLm3d3Ay2AkjU
X-Gm-Gg: AY/fxX7YAAG/adc8gtvykmqp6MDb09i25nuwm779S8DQUi0mZ29zksZGkA3dGyHTBoY
 cQsfqP/JZAedIfsKNdHqpHMgg+BNuaSJWS9uxEeUWUg+tEM/7KhsZy3qrBfac8mazpD8xyvLjxI
 +Mj+ootVzkTvi3pRgvUdDQjB077vFGkrhReda0mNvgDRnMNK6KnmukuWjnFwtq3uUkYy0gp5um+
 jU21SwjhzWK1UcnRmZZh+VGCc9EEWxu5l5fyk3tQb8nEd3Ve/hULIo1rBp+ecztNC+6hMKhiNjA
 1h1syM1RovO1CS7Lu7nwF/97Bylf2G7JcBBrbzJSdsX2ZcZGsbtu2fMRtVKKdTnOcnRNtFzbgkq
 l3bbzJQiMY5UBkfFLQkEabxaZfjrnhFvyCYRA8MJ563Re2xISX5DFZ6QLBimADrmhUyiUCx0Ozz
 sx4LTeDeP+ehjt5nwC44yq93X7OlRfOE5/qpKSNI3ez31Fvzd5JGGsOM0HLyz6Pf3tYBtLcQ==
X-Received: by 2002:a17:906:c110:b0:b76:bcf5:a38a with SMTP id
 a640c23a62f3a-b876743fb85mr282319166b.0.1768426367116; 
 Wed, 14 Jan 2026 13:32:47 -0800 (PST)
Received: from archlinux (dynamic-089-012-235-150.89.12.pool.telefonica.de.
 [89.12.235.150]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b87124e1a1esm1081252566b.48.2026.01.14.13.32.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 13:32:46 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 2/2] docs/system/arm/imx8mp-evk: Avoid suggesting redundant
 CLI parameters
Date: Wed, 14 Jan 2026 22:32:27 +0100
Message-ID: <20260114213227.3812-3-shentey@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114213227.3812-1-shentey@gmail.com>
References: <20260114213227.3812-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

Commit 094fd7d36f2a ("hw/arm/imx8mp-evk: Add KVM support") introduced KVM
support for the imx8mp-evk machine. KVM only works with the "host" CPU type
such that it has been made the default CPU type for KVM. No need to repeat
that on the command line.

Fixes: 094fd7d36f2a ("hw/arm/imx8mp-evk: Add KVM support")
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 docs/system/arm/imx8mp-evk.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/arm/imx8mp-evk.rst b/docs/system/arm/imx8mp-evk.rst
index 79600cf39a..e60a422824 100644
--- a/docs/system/arm/imx8mp-evk.rst
+++ b/docs/system/arm/imx8mp-evk.rst
@@ -66,7 +66,7 @@ KVM Acceleration
 ----------------
 
 To enable hardware-assisted acceleration via KVM, append
-``-accel kvm -cpu host`` to the command line. While this speeds up performance
+``-accel kvm`` to the command line. While this speeds up performance
 significantly, be aware of the following limitations:
 
 * The ``imx8mp-evk`` machine is not included under the "virtualization use case"
-- 
2.52.0


