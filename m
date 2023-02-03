Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pNt44-0008Ql-9z
	for mharc-qemu-trivial@gnu.org; Fri, 03 Feb 2023 05:13:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNt3k-0008MZ-TI
 for qemu-trivial@nongnu.org; Fri, 03 Feb 2023 05:12:47 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNt3j-0002GJ-2w
 for qemu-trivial@nongnu.org; Fri, 03 Feb 2023 05:12:44 -0500
Received: by mail-wr1-x433.google.com with SMTP id h16so4145994wrz.12
 for <qemu-trivial@nongnu.org>; Fri, 03 Feb 2023 02:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l1+8RskQqSTqwx3siHFRois+Ev1CScrT5ouMmLra5q8=;
 b=no6afKJ/oUrH+dV5hj59RnhkouyJfbNjD+YNHGViXZnhL3CzFICkXRkX8bJ2EpIPeJ
 xJ9P4ASrNNrzsPSAZ/GZtx3B5+T19bjHJPR+756cC/nfRCVtw8rUw7TkmQAQlX+YJ5N7
 gvXhQS0ClgRS3IVwOWWsT68DuPdMW7Y898R8Ba7LDxCza6gsFszJhRR7fFGv/S9Vquis
 qKX1APCq5z47YoJFB/dO1wYxcNzV0agND0tjb9MQUEJivtD/s1XvftLp1hYR+vPqlwMV
 /zURck/4dMkGQY4qmZcR1cf1KGHOUgI7v2Jhs7bCShn6Q5qNMxpRtIjws9VDGxUe0j4n
 3MgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=l1+8RskQqSTqwx3siHFRois+Ev1CScrT5ouMmLra5q8=;
 b=T5AMv5aQlPYOg/PJjdOgSY2aRKeMHyRl3wtiES8ZRrD5ZqbFzM4ZkUrwx30lqv2Gtu
 qhgAVpe57YFGviIfSXLURhWagdu0DREUZUUtsSHRI4rSer4VIRLtbJsgLMtwendpVFLi
 W8Yo7MlY010KFmt7GMbhAH9K2pswtaMyYLvtu769GBnvHVWouox8UXowGhrj+jIOw3Xv
 ZFOFNZdVoAhu66kWkaDNP7USTxBZGJzLHg2HvvM+rlk4ix0KZkTeNaOR9Q1Z6LxHbRAJ
 KScR/kDVf3RXuLEQouFJA5aSYryg03ZhSThOcJpJOrrsnO5s/93pHHgKQjIPEHJPS4eT
 du6w==
X-Gm-Message-State: AO0yUKWNQNzmul+7HxRYXIXD6Hq9z2ohTMxCy6XAwfO7r16RR5eZJDBj
 V+JR+9r7HuEYlqABJvglt+5J6obEP2Gssnfk
X-Google-Smtp-Source: AK7set9F+0ij/F5/E7b/n+NYpndgRxVgpIlT9toWkVc73+1T7Tc7u2fszRfrpLY1i9k0sg5aLH9O7Q==
X-Received: by 2002:adf:f006:0:b0:2bf:b199:c7ef with SMTP id
 j6-20020adff006000000b002bfb199c7efmr8591914wro.12.1675419161701; 
 Fri, 03 Feb 2023 02:12:41 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l17-20020a056000023100b002bdf8dd6a8bsm1625515wrz.80.2023.02.03.02.12.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 02:12:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/4] hw/qdev-properties: Constify Property* in
 PropertyInfo::create() handler
Date: Fri,  3 Feb 2023 11:12:23 +0100
Message-Id: <20230203101224.25796-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203101224.25796-1-philmd@linaro.org>
References: <20230203101224.25796-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
X-List-Received-Date: Fri, 03 Feb 2023 10:12:51 -0000

The pointed Property structure is accessed read-only.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/qdev-properties.c    | 2 +-
 include/hw/qdev-properties.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 858c33830c..baf9a91b29 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -840,7 +840,7 @@ const PropertyInfo qdev_prop_size = {
 /* --- object link property --- */
 
 static ObjectProperty *create_link_property(ObjectClass *oc, const char *name,
-                                            Property *prop)
+                                            const Property *prop)
 {
     return object_class_property_add_link(oc, name, prop->link_type,
                                           prop->offset,
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 39959c3432..21f399e9a3 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -37,7 +37,7 @@ struct PropertyInfo {
     int (*print)(Object *obj, const Property *prop, char *dest, size_t len);
     void (*set_default_value)(ObjectProperty *op, const Property *prop);
     ObjectProperty *(*create)(ObjectClass *oc, const char *name,
-                              Property *prop);
+                              const Property *prop);
     ObjectPropertyAccessor *get;
     ObjectPropertyAccessor *set;
     ObjectPropertyRelease *release;
-- 
2.38.1


