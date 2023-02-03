Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNt3r-0008Ni-6I
	for mharc-qemu-trivial@gnu.org; Fri, 03 Feb 2023 05:12:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNt3f-0008LF-FM
 for qemu-trivial@nongnu.org; Fri, 03 Feb 2023 05:12:40 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNt3d-0002F4-Q0
 for qemu-trivial@nongnu.org; Fri, 03 Feb 2023 05:12:39 -0500
Received: by mail-wr1-x42a.google.com with SMTP id a2so3893787wrd.6
 for <qemu-trivial@nongnu.org>; Fri, 03 Feb 2023 02:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2FPU8hqewqby+6DslWjG6sYp4oJe8crQF3hcWKmfIIg=;
 b=dYYulEIFPBC87aUd9KEbUMujovwFfFH/mIdIaP7LwyEUV84+y0XSU09HHBTvHRRZ9Z
 u3nn+xQP2eGsSjJEY1B7EyBSS/7EpI7pViIZt2J+qHi3WOLiCXGfXqOqJLKQCs4CDmIb
 TYg9yXfgLvHHKou09dG9w+Glxo4VXT3VF9fgUvhFTbLKA24ze2omwYwji/Ja//t1I1YH
 bBnOvWurZS5WeBwLgNeB9Mnii/x9jWK1HZeKuPhOplDIHJifyUUnJblkFGC7WknVmggx
 UG9XvVmEq4RMb/19AzrBbnUQ9Yt5QiJbskJCLjsgjwLFIv/kiyaVzt2HgdDjZh3KLoP1
 NjMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2FPU8hqewqby+6DslWjG6sYp4oJe8crQF3hcWKmfIIg=;
 b=Q9bqpohUG0HJk63YZZ4CYx3U7qVajeWnjzJcccUqYaYAMQsc2pNqDCKXPRnT/GTzTL
 04uu3CpqhkR+N39xvxuUuTjuO0m67IRiAIbFsG74NPUswDdj4Apc0XuWaplplB61EnCp
 1U7U+PVPeDz71xVidC9zDuL0kbHBpzAwtvCneTEdtz7ezhTxCLFWhf9WWEWKP1psNKkE
 OLh2m30bRWNr0wwDU6s38OceUeSqAd8pEu10IwypRjw5onjmYbfebBKdRZ2LxLcGZk8n
 nyIE9LPOp+koreC/U+7l/xN7dotMpAmJkQT2PtuQA2zfYKRKUy2kVF08bbzNWF51beyT
 3TvQ==
X-Gm-Message-State: AO0yUKV0sdsZU2ZLdi0vmh5B/NGJ0EpNMy2JysJ74mfaP3ay6ilKQmWv
 t326YRmou/ptQ7Uj3tHhOIHISQ==
X-Google-Smtp-Source: AK7set+vojEuY3vRhc6FNM8BbEG77AMeOM2e8YqIzaUsimDzP9UpxWM9mB8DXlM4IazIFSIW8JBBOw==
X-Received: by 2002:a05:6000:384:b0:2bf:db79:4c6e with SMTP id
 u4-20020a056000038400b002bfdb794c6emr11976086wrf.63.1675419156978; 
 Fri, 03 Feb 2023 02:12:36 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m10-20020a5d624a000000b002c3ce97ec38sm1402383wrv.115.2023.02.03.02.12.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 02:12:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/4] hw/qdev-properties: Constify Property* in
 PropertyInfo::print() handler
Date: Fri,  3 Feb 2023 11:12:22 +0100
Message-Id: <20230203101224.25796-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203101224.25796-1-philmd@linaro.org>
References: <20230203101224.25796-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
X-List-Received-Date: Fri, 03 Feb 2023 10:12:41 -0000

The pointed Property structure is accessed read-only.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/qdev-properties-system.c | 2 +-
 include/hw/qdev-properties.h     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/core/qdev-properties-system.c b/hw/core/qdev-properties-system.c
index d42493f630..a982de1354 100644
--- a/hw/core/qdev-properties-system.c
+++ b/hw/core/qdev-properties-system.c
@@ -799,7 +799,7 @@ invalid:
     g_free(str);
 }
 
-static int print_pci_devfn(Object *obj, Property *prop, char *dest,
+static int print_pci_devfn(Object *obj, const Property *prop, char *dest,
                            size_t len)
 {
     int32_t *ptr = object_field_prop_ptr(obj, prop);
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index b5a0ab34f3..39959c3432 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -34,7 +34,7 @@ struct PropertyInfo {
     const char *description;
     const QEnumLookup *enum_table;
     bool realized_set_allowed; /* allow setting property on realized device */
-    int (*print)(Object *obj, Property *prop, char *dest, size_t len);
+    int (*print)(Object *obj, const Property *prop, char *dest, size_t len);
     void (*set_default_value)(ObjectProperty *op, const Property *prop);
     ObjectProperty *(*create)(ObjectClass *oc, const char *name,
                               Property *prop);
-- 
2.38.1


