Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNt3i-0008Lu-Jq
	for mharc-qemu-trivial@gnu.org; Fri, 03 Feb 2023 05:12:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNt3c-0008J2-77
 for qemu-trivial@nongnu.org; Fri, 03 Feb 2023 05:12:37 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNt3Z-0002F2-NC
 for qemu-trivial@nongnu.org; Fri, 03 Feb 2023 05:12:35 -0500
Received: by mail-wr1-x42e.google.com with SMTP id j25so636689wrc.4
 for <qemu-trivial@nongnu.org>; Fri, 03 Feb 2023 02:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CrEmjsQWUs+O54UNiVqyUtKQaK97UySf4g9leluZ4II=;
 b=QQwOg9vlwpGMppX49RZ7vpgn7E0+iLi5zWjDrbtM7B9hAOEq3bI8N0OgO/8UmCOVB4
 VQPzh7FQ9wv3wVAk4yz6uC1qX+2xI8N/TT7EkD41A3dUKQUX2ccB4GDw5BLvP7D8y3Bs
 AM44GHLv7fZi39+PqR0h3L5MXBXpNIsoQXxlO/7O3gr6NjG8HQxm1IqcvAhI9oGVXZi7
 1n+JssDgT2dNgB0tSRGuvPqg4Xu18WbuuyaBqeWeCDRrXhD94uYlfCHylK3zXxsm32Hw
 n0/s+vQ8Z3bbzwWrCw38WH7KPfB65DpOiXgnxVCQSGDdgelp2bTX99xSgMpBgAMKtfFw
 XsqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CrEmjsQWUs+O54UNiVqyUtKQaK97UySf4g9leluZ4II=;
 b=CwQf6lw6Ey8/bvFVW7SGMHquKm5EigTzvzrCvhYqe0J8vUc8kdR04WkOjSMdutW3Q8
 miL2VBvvzD1ic2PwiG1qdMWTUO4rpWb15hRXWEwQSgxlYWEoj5gl0/wsfTyv6lTue8Tq
 5u2QnmZMCKEgP3SB1G41UK6Grqvfc26+keDntyGRaExwRh8a7Z1v8tIIwLtOvsHEqNdy
 muE9Abm0Cr3FMqMKUlsRPYsH2oGRf9mzhDokzoMNb2+cmVjOZVOKmxZ8AsjNbS5e0N4Z
 RMG3362C2kQF0qh7esxNHZLHztcmxCORFLpgbM5/aSQRBmFrdNt/n8jexwtLXeW0rIwd
 h3jQ==
X-Gm-Message-State: AO0yUKWl3TKQ6T0W06wjTdHD4GAVRtBXknvdPXZ1N0H9VEGSsc1C2XQm
 gQ+stN2318X1gdKAb90zEDllxg==
X-Google-Smtp-Source: AK7set9939UJFm/XvmsBvTnrb+LLdcfOD1q05umb0m0izfFyaYo8k4AvZXUiNPiCNEWwJn8ZiKXbbw==
X-Received: by 2002:adf:8912:0:b0:2bf:e692:2636 with SMTP id
 s18-20020adf8912000000b002bfe6922636mr9049032wrs.26.1675419152301; 
 Fri, 03 Feb 2023 02:12:32 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bv20-20020a0560001f1400b002bc8130cca7sm1586794wrb.23.2023.02.03.02.12.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 02:12:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/4] hw/qdev-properties: Constify Property* in
 object_field_prop_ptr()
Date: Fri,  3 Feb 2023 11:12:21 +0100
Message-Id: <20230203101224.25796-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203101224.25796-1-philmd@linaro.org>
References: <20230203101224.25796-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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
X-List-Received-Date: Fri, 03 Feb 2023 10:12:38 -0000

The pointed Property structure is accessed read-only.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/qdev-properties.c    | 2 +-
 include/hw/qdev-properties.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 357b8761b5..858c33830c 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -50,7 +50,7 @@ void qdev_prop_allow_set_link_before_realize(const Object *obj,
     }
 }
 
-void *object_field_prop_ptr(Object *obj, Property *prop)
+void *object_field_prop_ptr(Object *obj, const Property *prop)
 {
     void *ptr = obj;
     ptr += prop->offset;
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index e1df08876c..b5a0ab34f3 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -206,7 +206,7 @@ void qdev_prop_set_macaddr(DeviceState *dev, const char *name,
                            const uint8_t *value);
 void qdev_prop_set_enum(DeviceState *dev, const char *name, int value);
 
-void *object_field_prop_ptr(Object *obj, Property *prop);
+void *object_field_prop_ptr(Object *obj, const Property *prop);
 
 void qdev_prop_register_global(GlobalProperty *prop);
 const GlobalProperty *qdev_find_global_prop(Object *obj,
-- 
2.38.1


