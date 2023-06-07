Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1q6p50-0002Pp-0B
	for mharc-qemu-trivial@gnu.org; Wed, 07 Jun 2023 05:03:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1q6p4z-0002N3-0l
 for qemu-trivial@nongnu.org; Wed, 07 Jun 2023 05:03:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1q6p4x-0008MX-Jc
 for qemu-trivial@nongnu.org; Wed, 07 Jun 2023 05:03:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686128623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hogVfhhg00EJA/XGUN602uwS3PNVXGeY/2ZIORjD97s=;
 b=OBTw8VLFoZ9sJ+1ZbGKT5E8sZtVepX8SV3i0CsCBnXFlIO2hQ9ruwzR4DBiV+ueFaDQoG6
 9Wc1iyPFbXH9wxCI/IGibD+srhT45EbXTXMhhRGnSszf38D5HLoGCqH+nQjtLbBKdICOuq
 zl+TlkyoPrltZXK7N0H3SYPnN/DLNv0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-29-jsMSXacjP1uO_zWzbNCKJQ-1; Wed, 07 Jun 2023 05:03:40 -0400
X-MC-Unique: jsMSXacjP1uO_zWzbNCKJQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-97455ea1c14so487123466b.2
 for <qemu-trivial@nongnu.org>; Wed, 07 Jun 2023 02:03:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686128618; x=1688720618;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hogVfhhg00EJA/XGUN602uwS3PNVXGeY/2ZIORjD97s=;
 b=GHQ9kvnLTfW70NjMKog/om/expurlw94SgWBNJbFZZbPTgo2ofAgkX1G4z/EuHd/Ny
 d6Z+dbnnb0Ya9fUoCLPdI82G0pL5YuJO4daP2tI12vPWNkECel8ID6LdsU+58ZAS/7xa
 rPTWhBqTQF+SqlhaiLpxlwzDEo5ygis/atjFXWnWdc8U3+0JsYXYsk1jDjrP0SeYYu0e
 zg38/KE5eOpBMzU7bg5ILi+FoLvQLpZRzv+FuOLdf1D5JeeKtbABD3H5t3ulUAGKwidR
 paEN80cPsE9ExA5Vde6uW8O7ayhJoHMIb0yqSyeXUPSGMDDl3Uq8xO1xvpUG9a2zchex
 KfKw==
X-Gm-Message-State: AC+VfDxrhJYuPku5RsAmXFjPrQ+5M77KMKKmgsvnOClH+1epqfStNLOv
 NZKAQ0APmPf792to1Yv/sZ6FOhXHBQMkHWscTMN+2nUadWjtYfvGoadAUMjJqw6FTQPLz3L1Rsd
 LMW41VJOg9Fu5zztFbPeaG3GYbw==
X-Received: by 2002:a17:907:2d8c:b0:971:484:6392 with SMTP id
 gt12-20020a1709072d8c00b0097104846392mr5092628ejc.38.1686128618252; 
 Wed, 07 Jun 2023 02:03:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4MLVfDp3AXeUyYe1gqMH+zHAty91KQ1k3mbO+akkKOmZvwERjBQ8AfSxAwTuJ8U2VZFv7B3w==
X-Received: by 2002:a17:907:2d8c:b0:971:484:6392 with SMTP id
 gt12-20020a1709072d8c00b0097104846392mr5092614ejc.38.1686128617991; 
 Wed, 07 Jun 2023 02:03:37 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a1709062f8200b00977ecf6942bsm2828035eji.90.2023.06.07.02.03.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 02:03:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH] meson: fix "static build" entry in summary
Date: Wed,  7 Jun 2023 11:03:36 +0200
Message-Id: <20230607090336.59424-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 07 Jun 2023 09:03:45 -0000

Fixes: a0cbd2e8496 ("meson: use prefer_static option", 2023-05-18)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 553c8e0b9c5..34d0444ffbb 100644
--- a/meson.build
+++ b/meson.build
@@ -4088,7 +4088,7 @@ summary_info += {'QEMU_LDFLAGS':      ' '.join(qemu_ldflags)}
 summary_info += {'profiler':          get_option('profiler')}
 summary_info += {'link-time optimization (LTO)': get_option('b_lto')}
 summary_info += {'PIE':               get_option('b_pie')}
-summary_info += {'static build':      config_host.has_key('CONFIG_STATIC')}
+summary_info += {'static build':      get_optin('prefer_static')}
 summary_info += {'malloc trim support': has_malloc_trim}
 summary_info += {'membarrier':        have_membarrier}
 summary_info += {'debug graph lock':  get_option('debug_graph_lock')}
-- 
2.40.1


