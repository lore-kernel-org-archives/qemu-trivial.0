Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rZn1j-0002In-KS
	for mharc-qemu-trivial@gnu.org; Tue, 13 Feb 2024 02:16:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZn1h-0002Hl-C1
 for qemu-trivial@nongnu.org; Tue, 13 Feb 2024 02:16:21 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rZn1e-0007tf-88
 for qemu-trivial@nongnu.org; Tue, 13 Feb 2024 02:16:20 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3394bec856fso2946340f8f.0
 for <qemu-trivial@nongnu.org>; Mon, 12 Feb 2024 23:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707808576; x=1708413376; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Cj9qCj9mT2tt5rgoG2stTmiFvC9CmzQUn4FtQx8Dgyg=;
 b=Nyugot3aKozmEN3Od4aVM4pM7pkounGGNXLkw0W5IVimYeo7vi9p45XlNjOPKcyLb0
 ucwVi14PwNoqAH587zDLvN/o5As9DxqXHBts89vViw0MNsrA7uEPWssDKS8TjjL+EWvW
 L2XGrstl/QWtDKZpRqYbpowyGfwJMJpP1XPz+lgx4vGkWs+R7TlMO6OdnOBYo2Nn9qxu
 T+PvwZrcgmXPQH17j6cwgtfzYzv2IlmxmSXT+m+VxgDAt9zXvlaIQ/z8wyxnCkPUTBeI
 N06qJQ6lMMbeVcp05CjT1Lb9P0+eNdJ5qoXcKy7w9a/vHY+vGfMV8DoZudZLOL5KCSUq
 aNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707808576; x=1708413376;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cj9qCj9mT2tt5rgoG2stTmiFvC9CmzQUn4FtQx8Dgyg=;
 b=ZCLcv8F6eR6cmjXmliAoMTIhkBvhY575x3XFZio0kqDfz5zpVzCjxEcFhz+ZLjckgL
 /l90nRD/4if5mxXSM/QzlY1nt/WeGeiBBWXWXfcsZaxuSY1Cn927nrE57DnkkOCeGd2y
 6Zqic90wY/NVGD4OF5LMzk/cuvZtMTFYqEKs8wjRj6CFhJP3fU7TRa6Qj4xN9DBKL/LA
 ntgB0a+qPJFsAqYQqVNJfeahr9kuUaaSHu3DL4j0zuuS01OR2sR7rsfE01O3R2ATMghI
 URfCXyR+JVnnDePkyPT9R/eNrE4AA/4CJaFcAt8NDvFftBURTzfSJi90OsiR02MW4gZL
 5NJA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX62N/PmOev752ndEg6+X89uOXIKoBrMiCYCBTVUFVs0RuQAiy0zacjCHw8dxiCOD5GP4Z5P+WJsRE+pi3pUmqF5LVI3bSXYA==
X-Gm-Message-State: AOJu0Yxm1FMmVtQxbvtUJynuyk/YVOwQrSIP0B6Bzox51zjFxEpQ76+H
 Vtga6imheBquEUs2wEPIpRd6K6WXXZcUbgyYwBvHybw4U9yzf7OOpVHu79CZPdk=
X-Google-Smtp-Source: AGHT+IHrTLLFI1tqRrznVpJefkYRpov81hxKrswb+qr8oG1krRE3F60MHN+PzxhK8sZc6q4GGy5DPA==
X-Received: by 2002:a5d:680a:0:b0:33b:58c7:8281 with SMTP id
 w10-20020a5d680a000000b0033b58c78281mr1332042wru.10.1707808576417; 
 Mon, 12 Feb 2024 23:16:16 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWXMyN4Ms6ScJQQh7dqSy6GHbE06UMgK9JZeeYZ9dG7RPFxdwmu0sY+47koNoHh+ljrad1MOEabRm2rvp9PCAl+NJ8Nd7UUfsfFBbWB4V2mbZNhg2jCeHDCnJqMdbFPnKjt8CD/WqqGG7w9iyiK/JUF2m3CtU2AamnOdVAvdLlrXPBpDdlpYbblD6okSn/zo+kuRXcrite5nUivZiblO/1spB3ldJUanQTHWmwBfAOQWhXGyV1vlGieRg==
Received: from m1x-phil.lan ([176.176.128.243])
 by smtp.gmail.com with ESMTPSA id
 dv5-20020a0560000d8500b0033b483d1abcsm8709565wrb.53.2024.02.12.23.16.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Feb 2024 23:16:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/i386/sgx: Use QDev API
Date: Tue, 13 Feb 2024 08:16:13 +0100
Message-ID: <20240213071613.72566-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
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
X-List-Received-Date: Tue, 13 Feb 2024 07:16:21 -0000

Prefer the QDev API over the low level QOM one.
No logical change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/sgx.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/hw/i386/sgx.c b/hw/i386/sgx.c
index 70305547d4..9176040f8f 100644
--- a/hw/i386/sgx.c
+++ b/hw/i386/sgx.c
@@ -286,7 +286,6 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
     SGXEPCState *sgx_epc = &pcms->sgx_epc;
     X86MachineState *x86ms = X86_MACHINE(pcms);
     SgxEPCList *list = NULL;
-    Object *obj;
 
     memset(sgx_epc, 0, sizeof(SGXEPCState));
     if (!x86ms->sgx_epc_list) {
@@ -300,16 +299,15 @@ void pc_machine_init_sgx_epc(PCMachineState *pcms)
                                 &sgx_epc->mr);
 
     for (list = x86ms->sgx_epc_list; list; list = list->next) {
-        obj = object_new("sgx-epc");
+        DeviceState *dev = qdev_new(TYPE_SGX_EPC);
 
         /* set the memdev link with memory backend */
-        object_property_parse(obj, SGX_EPC_MEMDEV_PROP, list->value->memdev,
-                              &error_fatal);
+        object_property_parse(OBJECT(dev), SGX_EPC_MEMDEV_PROP,
+                              list->value->memdev, &error_fatal);
         /* set the numa node property for sgx epc object */
-        object_property_set_uint(obj, SGX_EPC_NUMA_NODE_PROP, list->value->node,
-                             &error_fatal);
-        object_property_set_bool(obj, "realized", true, &error_fatal);
-        object_unref(obj);
+        object_property_set_uint(OBJECT(dev), SGX_EPC_NUMA_NODE_PROP,
+                                 list->value->node, &error_fatal);
+        qdev_realize_and_unref(dev, &error_fatal);
     }
 
     if ((sgx_epc->base + sgx_epc->size) < sgx_epc->base) {
-- 
2.41.0


