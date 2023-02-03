Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNt3e-0008LA-Sc
	for mharc-qemu-trivial@gnu.org; Fri, 03 Feb 2023 05:12:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNt3Z-0008Ii-Jo
 for qemu-trivial@nongnu.org; Fri, 03 Feb 2023 05:12:33 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNt3V-0002Ej-JU
 for qemu-trivial@nongnu.org; Fri, 03 Feb 2023 05:12:32 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso5661687wms.0
 for <qemu-trivial@nongnu.org>; Fri, 03 Feb 2023 02:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LEOiYrWSQHlsAiuHuhCXDy1Rcvv1RyyMjqSxdpXj0GY=;
 b=bAFZYsXNqhecxi1at/paRgFqbKwLYdYKYGVg2kUH/ZKlEHHHQpGlgpCMXuk1s3BVDb
 ZcHj8NGxXeYdQLsH//cr8HmT4SUHltKwcy4TA5Ep68g13vMm8bNTKmg8/clsNnUsm0Yl
 QzsBS1MG9xikLTSts0a2Rbl2Q+HUCEBlhXSrZgTqLj/EkZ5xMwx8ddtFNoLImAkq+qcF
 rWxsqAjp6gmBw2UUD4ECYh+ZB6fu2FtQ4JjF1KraH7h0B6Wi7ctEG1VtSF0TxMzKTJdF
 VJHUrr/cp/pjBPVAuDiKaOOlXkFJs1qPctE8NI0uf7qZuilhMPKAMbFcvNJFOklpmNUW
 U+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LEOiYrWSQHlsAiuHuhCXDy1Rcvv1RyyMjqSxdpXj0GY=;
 b=fLQLB0OJv0+vF3VHz0jw4SMDOKbMGj9GI/Icsx8Qk6WZpQr3UB0Sdel2vZlPWIFvx3
 YV8Aw42v172rqpt1ntUeIm9NSYf6OMtHloDSClgSj4JUqDUmGg+HlOn/jSxj5huUOosW
 QDXcKJ8N66qFICuD10pcgCEwxNgbyBagGP1G2ailFN3N/OCkdC0p/1l7IFAHlmKCGhiO
 GogMKIpU5bjHm2HdYLHw8Hy5zmoCC6Zg+ymlHrxFYGzVxLm7NyRUw3wVGCottrZhn6Bi
 yj1hb80LqS1RFlmOH51EFNRPVuaDqxCeCbnPbO/iFgn7DPJw2OAIHdJylIDrZprrnabK
 uMGg==
X-Gm-Message-State: AO0yUKXGjDayV54WZdmrSm0bOmPtHk8zGdIeIb4NAHaB60XwnfDEhhb7
 MGbnPAALfyOdYBYdGByrh0tVKg==
X-Google-Smtp-Source: AK7set8Sfx4sgTskc6CJvtmAG4e4O/2we2YFWDFxaPFVcqS51ufENpnZBcGBp7bFDXSckNjoVPDB4Q==
X-Received: by 2002:a05:600c:510e:b0:3dc:59e9:9285 with SMTP id
 o14-20020a05600c510e00b003dc59e99285mr9945129wms.18.1675419147489; 
 Fri, 03 Feb 2023 02:12:27 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c3ba400b003dc54eef495sm2473728wms.24.2023.02.03.02.12.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 02:12:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/4] hw/qdev-properties: Constify Property* in DeviceClass
Date: Fri,  3 Feb 2023 11:12:20 +0100
Message-Id: <20230203101224.25796-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-List-Received-Date: Fri, 03 Feb 2023 10:12:33 -0000

Qualify some Property pointers as 'const' when the
structure is accessed read-only.

Philippe Mathieu-Daudé (4):
  hw/qdev-properties: Constify Property* in object_field_prop_ptr()
  hw/qdev-properties: Constify Property* in PropertyInfo::print()
    handler
  hw/qdev-properties: Constify Property* in PropertyInfo::create()
    handler
  hw/qdev-properties: Constify DeviceClass::props_ field

 hw/core/qdev-properties-system.c |  2 +-
 hw/core/qdev-properties.c        | 14 +++++++-------
 include/hw/qdev-core.h           |  2 +-
 include/hw/qdev-properties.h     |  6 +++---
 softmmu/qdev-monitor.c           |  4 ++--
 5 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.38.1


