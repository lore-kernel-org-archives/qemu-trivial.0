Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNzmb-0007J7-GZ
	for mharc-qemu-trivial@gnu.org; Thu, 01 Oct 2020 10:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kNzmZ-0007Ir-Sj
 for qemu-trivial@nongnu.org; Thu, 01 Oct 2020 10:42:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kNzmW-0002DW-GP
 for qemu-trivial@nongnu.org; Thu, 01 Oct 2020 10:42:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601563323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZpPmzecL1JnaAFfxJvQhWfBsNXB+MnX+YoPFlhUhAaM=;
 b=P3ijbhEZ8aSestd45v+4/cmwDy2xMloMIKyYDSvCoCP4iaUG32EaofDXaXzG/Qq0BjFGv4
 P+t2fZ1aWG62bm6S0FnCF0994JpHKNjr/JdYLTY8EaZJDM1x4udmQtO92qXlmShzKRHJ8S
 jQAQApOCUJqd9IH5wFxUxAyQorXCaW8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-359--alQprRGP_Kzd-VF1zMqTw-1; Thu, 01 Oct 2020 10:42:01 -0400
X-MC-Unique: -alQprRGP_Kzd-VF1zMqTw-1
Received: by mail-wr1-f72.google.com with SMTP id d13so2120712wrr.23
 for <qemu-trivial@nongnu.org>; Thu, 01 Oct 2020 07:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZpPmzecL1JnaAFfxJvQhWfBsNXB+MnX+YoPFlhUhAaM=;
 b=DUXvMTe34GOwmBcweAAFXuzvaVwO5DRoFv7Vfrvvl1JmuX921cL+39tIgRiy3cSmbH
 yN0Nq1LVzf/q84U8jKzQhIBlkLmgHRq7/8mNuoAAhDtFoz03ouwXnRRUd5nM1Cma+xAm
 wAF3MjF34V33fIVepcioUBA5iXoj335vSatXLJkY9lU6uEtdehz76OFkoEhVVUvVed6U
 RFyqcuwXJM5FU7w/tbeJCuEBGQZERnPyn1zeFdz+06av+JfNNzgl2WTUl32NbKXGuqC4
 4OGvEoo3M/5TdOQEf9Rv1gnGTed3JcFSdAyu8BdhgPixcqLP/dCQaFBDnU0KuOu3Rc6R
 tReA==
X-Gm-Message-State: AOAM531HtVQjVubKAXnz0z6xv1SV/2nvYdkGJlbJxm1Ytz5vPo6X8a4p
 ibaALA/K+YLZwdl9zXFux1kWzOFcOCAO56dN28mxvERhqc+gVVuZTs1yXTrJrsUw5TdsPxCEtBm
 GPH+Kqkz345r4osGkyQ==
X-Received: by 2002:a1c:1fc6:: with SMTP id f189mr389802wmf.20.1601563319923; 
 Thu, 01 Oct 2020 07:41:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2AAR5AwX//vaLlPmReSLdJYvN2sSBWcXdstcx/2WdlHHsuG5ZThU4FZ3f6fFxfbGf2Mb3Lg==
X-Received: by 2002:a1c:1fc6:: with SMTP id f189mr389784wmf.20.1601563319688; 
 Thu, 01 Oct 2020 07:41:59 -0700 (PDT)
Received: from x1w.redhat.com (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id z67sm235870wme.41.2020.10.01.07.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 07:41:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <rth@twiddle.net>, Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v4 1/3] target/i386/cpu: Trivial code movement
Date: Thu,  1 Oct 2020 16:41:50 +0200
Message-Id: <20201001144152.1555659-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201001144152.1555659-1-philmd@redhat.com>
References: <20201001144152.1555659-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 04:25:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Oct 2020 14:42:08 -0000

Trivial code movement to reduce #ifdef'ry in the next commit.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/cpu.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 3ffd877dd5..2eec53ca22 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4643,16 +4643,6 @@ static void x86_cpu_get_feature_words(Object *obj, Visitor *v,
     visit_type_X86CPUFeatureWordInfoList(v, "feature-words", &list, errp);
 }
 
-/* Convert all '_' in a feature string option name to '-', to make feature
- * name conform to QOM property naming rule, which uses '-' instead of '_'.
- */
-static inline void feat2prop(char *s)
-{
-    while ((s = strchr(s, '_'))) {
-        *s = '-';
-    }
-}
-
 /* Return the feature property name for a feature flag bit */
 static const char *x86_cpu_feature_name(FeatureWord w, int bitnr)
 {
@@ -4677,6 +4667,17 @@ static const char *x86_cpu_feature_name(FeatureWord w, int bitnr)
     return name;
 }
 
+/*
+ * Convert all '_' in a feature string option name to '-', to make feature
+ * name conform to QOM property naming rule, which uses '-' instead of '_'.
+ */
+static inline void feat2prop(char *s)
+{
+    while ((s = strchr(s, '_'))) {
+        *s = '-';
+    }
+}
+
 /* Compatibily hack to maintain legacy +-feat semantic,
  * where +-feat overwrites any feature set by
  * feat=on|feat even if the later is parsed after +-feat
-- 
2.26.2


