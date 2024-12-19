Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tOI3D-0005xF-7Z
	for mharc-qemu-trivial@gnu.org; Thu, 19 Dec 2024 10:02:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tOI2X-0005sT-Rx
 for qemu-trivial@nongnu.org; Thu, 19 Dec 2024 10:02:14 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tOI2W-0005jX-CA
 for qemu-trivial@nongnu.org; Thu, 19 Dec 2024 10:02:13 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-436249df846so6468775e9.3
 for <qemu-trivial@nongnu.org>; Thu, 19 Dec 2024 07:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734620531; x=1735225331; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sj4tna4Z0twHl9GwjSd+TF0OnlVxhb9xhFrT4hAdmYU=;
 b=f28fNMXpPGltBNUX4znb33GkaeFcWV1tvtyAPrcQ/KtnIxph4q3w1F/qfJUg+kf6yk
 1b9YkRBzyOUfL4vp2iou7irplMCNuDpNIuJoOIuasnskH6TXFN+CLPaets1qmBbmHg8V
 DFoykRUbzD61R/4jweUOJLNi1ylr/pOoS1y3y7vfiVa76pOOrLQ/L0kwnV+8CnRxoA78
 7T+vgXaZegBhPAYmSYay26SdZUMfoc9s20LenJLATyPzCkJLVIvJa3eLZsBqa3oxOyqg
 T3zrmkQA7gdMMM4yKwoFUNC/XnUV62ysyCVGwcajMPySkDy6RyE2EdTqQ+3uJfzXkL45
 IN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734620531; x=1735225331;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sj4tna4Z0twHl9GwjSd+TF0OnlVxhb9xhFrT4hAdmYU=;
 b=eneYjQex2gECCYYSM9yztoCSPXwn+/ny/sxH9kOvpD/oj+EyYe3rFotMI757/mtV0M
 9HGUw9KIZLkErWX8OWEZzjMOJ9MrGI8awihQknYtlTH9kyzur4uMFcjshdwQ1daQ97pf
 zjLR5KCN8VDKzODA7TCXCe/S8j0d+/Pj9hentYWtBRIZi/lVVEfFdtLDFQT+whbtRoKo
 m/N+GgPplbmgLnfx5Mgk/PpNgJjWMnC9xvbC1Y3Uw2wRmGjqvIHiwSVeNQ0kQeYfzOrM
 RsharhkzcOhBYsQBx6mwGtEx+vWcE//xjYvJ9dbHcHAW6SZ9ctrXqqfkpaWLVqCfqaW1
 6rFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfOdH3KJJ7GM2CI8Jslg5SmvAsFhJ5+JV6Iioh7+wfRu5Q0KuCTxENscIdZfPdRcQhccW4+h2N23xAykU=@nongnu.org
X-Gm-Message-State: AOJu0Yx0PCZS4nmc6Gmjg+JdUWj/Ey2cJ2yyOhvuVbs8JyVg6T415qqF
 LaZXgmau7RItVq4Zs9xsh+t1AcmWaonaqGXTtTnYiCJyGh/TWszRH/3ET/BT3eM=
X-Gm-Gg: ASbGncvY2WXplMFxU1G9LcrZFM4r4ekSdiShWD8x85r+XEiymkKg3BnTxze3QjddALq
 /gr74aihw2yEWGtomqBs+nd7uE8qCW0UTeeG5ItaHW3toM48+tkt+a8NY07s6tvldMtvpLjSSrW
 KVY+jAKqyuLMB9OX97XDcZnrF7KFuOPHt77r/aGS7KjHI5jUsIZ4qHgk1UMznBma63A5oOJEPo+
 Y4FR0zopurfk3V1G5MVlQnoZbeCY9EQ9BZ6FO8gmmRJtJXnROcqH4o0Dve5nuZ+fXr34gC7J43f
 0wpH
X-Google-Smtp-Source: AGHT+IE7KKHSAzT043Xr0dOkTrTFtwkzJ9UJzR94dSa8EbX+7orbrwwrIwFTK7EPSax8fFTpnplgrg==
X-Received: by 2002:a05:600c:1909:b0:434:a525:7257 with SMTP id
 5b1f17b1804b1-4365c7c9684mr29636245e9.21.1734620530460; 
 Thu, 19 Dec 2024 07:02:10 -0800 (PST)
Received: from localhost.localdomain ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c8472casm1777613f8f.45.2024.12.19.07.02.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Dec 2024 07:02:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, devel@lists.libvirt.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/3] docs: Correct '-runas' and '-fsdev/-virtfs proxy'
 indentation
Date: Thu, 19 Dec 2024 16:02:01 +0100
Message-ID: <20241219150203.55212-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241219150203.55212-1-philmd@linaro.org>
References: <20241219150203.55212-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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
X-List-Received-Date: Thu, 19 Dec 2024 15:02:14 -0000

Use the same style for deprecated / removed commands.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/about/deprecated.rst       | 2 +-
 docs/about/removed-features.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 267892b62f2..d6809f94ea1 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -75,7 +75,7 @@ marked deprecated since 9.0, users have to ensure that all the topology members
 described with -smp are supported by the target machine.
 
 ``-runas`` (since 9.1)
-----------------------
+''''''''''''''''''''''
 
 Use ``-run-with user=..`` instead.
 
diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 9bebee795c0..68fe0b47f9f 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -518,7 +518,7 @@ and later do not support it because the virtio-scsi device was introduced for
 full SCSI support.  Use virtio-scsi instead when SCSI passthrough is required.
 
 ``-fsdev proxy`` and ``-virtfs proxy`` (since 9.2)
-^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+''''''''''''''''''''''''''''''''''''''''''''''''''
 
 The 9p ``proxy`` filesystem backend driver was originally developed to
 enhance security by dispatching low level filesystem operations from 9p
-- 
2.47.1


