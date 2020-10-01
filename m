Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kNzmf-0007Ly-Lr
	for mharc-qemu-trivial@gnu.org; Thu, 01 Oct 2020 10:42:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kNzmd-0007KK-9h
 for qemu-trivial@nongnu.org; Thu, 01 Oct 2020 10:42:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kNzma-0002Dx-Ug
 for qemu-trivial@nongnu.org; Thu, 01 Oct 2020 10:42:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601563327;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=13dFYoU6KvfqYyBOP1RLSUELKZQPOuaHJ8QYH3lau34=;
 b=K7ykEsaW/2idENbniZyrroDaVKA39z4PYeii3ht+vOX5D0U2ruTzfBnt9eCgZF82l7j9mn
 AFvu6WC/L5sNVvyep3zYKKPNx3yP9nZTooymWNT2AnnqECvCg1wzJf/DPjOrdGnD7c+IgU
 cPIgmYX5fSlExujI9aQQ55xa1GMs2dg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-RkkmOHMPNvqKJykj49EG0A-1; Thu, 01 Oct 2020 10:42:06 -0400
X-MC-Unique: RkkmOHMPNvqKJykj49EG0A-1
Received: by mail-wm1-f72.google.com with SMTP id s24so983574wmh.1
 for <qemu-trivial@nongnu.org>; Thu, 01 Oct 2020 07:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=13dFYoU6KvfqYyBOP1RLSUELKZQPOuaHJ8QYH3lau34=;
 b=WRYSDn7a8015PalyUWYLyyYzQuL0faz/DYQrLcI0OtBVI153wjcaqgUAi9qAuRqklg
 v19aV5eM3d/12jSMukLMlBaY3wiV0FhR6JWlCSPaqGSqG4x2qC6TqO+RN4V/gAXWb8HH
 A5MPyc5exJlW0VyGtIu+VGqiJARs6HczhA2gNvM4MckIOqndHM+cGtpnmn7/13qo4usL
 dIFjOIZwmY4JdP/X5Wwj37RTS1OgsUfZsrKCt/b3SfGiqDYrYZVjs+DDtNWgGDM+D3Qh
 o+uknhQmDJOc+wws3uZjZ9//KJY110yvQ5OP7c+SjIMjHbKsFMyQbAJzIfAtSi1gz3xa
 Fxlg==
X-Gm-Message-State: AOAM530ZSGlN4c7Af990t8VXBXFZ2IP4JRm6PbZk8jXWECNHgJATzxfu
 3jP4UGE2UoO8WXU8CSTtXHvZOomoYcJXyV5LNu00mho7paSFmi6UHoMgARZ3A/+53pnyRxh//iL
 nrnUlkQMu71uong+PjA==
X-Received: by 2002:a05:6000:151:: with SMTP id
 r17mr9251134wrx.311.1601563325319; 
 Thu, 01 Oct 2020 07:42:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrzt9S3V7X1vy2AEYQIyqcVrhP7bOQbPWynLiIbO1fC4A1y5IZ7wB2zXD9goNUo4cVKkvc5w==
X-Received: by 2002:a05:6000:151:: with SMTP id
 r17mr9251103wrx.311.1601563325121; 
 Thu, 01 Oct 2020 07:42:05 -0700 (PDT)
Received: from x1w.redhat.com (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id o194sm301374wme.24.2020.10.01.07.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 07:42:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>,
	qemu-devel@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Richard Henderson <rth@twiddle.net>, Markus Armbruster <armbru@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v4 2/3] target/i386/cpu: Restrict some of feature-words uses
 to system-mode
Date: Thu,  1 Oct 2020 16:41:51 +0200
Message-Id: <20201001144152.1555659-3-philmd@redhat.com>
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
X-List-Received-Date: Thu, 01 Oct 2020 14:42:12 -0000

The feature-words properties are not used in user-mode emulation,
restrict it to system-mode.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/cpu.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 2eec53ca22..9f72342506 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4607,6 +4607,7 @@ static void x86_cpuid_set_tsc_freq(Object *obj, Visitor *v, const char *name,
     cpu->env.tsc_khz = cpu->env.user_tsc_khz = value / 1000;
 }
 
+#if !defined(CONFIG_USER_ONLY)
 /* Generic getter for "feature-words" and "filtered-features" properties */
 static void x86_cpu_get_feature_words(Object *obj, Visitor *v,
                                       const char *name, void *opaque,
@@ -4666,6 +4667,7 @@ static const char *x86_cpu_feature_name(FeatureWord w, int bitnr)
     assert(bitnr < 32 || !(name && feature_word_info[w].type == CPUID_FEATURE_WORD));
     return name;
 }
+#endif /* CONFIG_USER_ONLY */
 
 /*
  * Convert all '_' in a feature string option name to '-', to make feature
@@ -4783,6 +4785,7 @@ static void x86_cpu_parse_featurestr(const char *typename, char *features,
 static void x86_cpu_expand_features(X86CPU *cpu, Error **errp);
 static void x86_cpu_filter_features(X86CPU *cpu, bool verbose);
 
+#if !defined(CONFIG_USER_ONLY)
 /* Build a list with the name of all features on a feature word array */
 static void x86_cpu_list_feature_names(FeatureWordArray features,
                                        strList **feat_names)
@@ -4853,6 +4856,7 @@ static void x86_cpu_class_check_missing_features(X86CPUClass *xcc,
 
     object_unref(OBJECT(xc));
 }
+#endif /* CONFIG_USER_ONLY */
 
 /* Print all cpuid feature names in featureset
  */
@@ -4987,7 +4991,9 @@ static void x86_cpu_definition_entry(gpointer data, gpointer user_data)
 
     info = g_malloc0(sizeof(*info));
     info->name = x86_cpu_class_get_model_name(cc);
+#if !defined(CONFIG_USER_ONLY)
     x86_cpu_class_check_missing_features(cc, &info->unavailable_features);
+#endif
     info->has_unavailable_features = true;
     info->q_typename = g_strdup(object_class_get_name(oc));
     info->migration_safe = cc->migration_safe;
@@ -6941,6 +6947,7 @@ static void x86_cpu_initfn(Object *obj)
     object_property_add(obj, "tsc-frequency", "int",
                         x86_cpuid_get_tsc_freq,
                         x86_cpuid_set_tsc_freq, NULL, NULL);
+#if !defined(CONFIG_USER_ONLY)
     object_property_add(obj, "feature-words", "X86CPUFeatureWordInfo",
                         x86_cpu_get_feature_words,
                         NULL, NULL, (void *)env->features);
@@ -6957,7 +6964,6 @@ static void x86_cpu_initfn(Object *obj)
                         x86_cpu_get_unavailable_features,
                         NULL, NULL, NULL);
 
-#if !defined(CONFIG_USER_ONLY)
     object_property_add(obj, "crash-information", "GuestPanicInformation",
                         x86_cpu_get_crash_info_qom, NULL, NULL, NULL);
 #endif
-- 
2.26.2


