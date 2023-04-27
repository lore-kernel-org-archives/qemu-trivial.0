Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ps18u-0002tg-Sb
	for mharc-qemu-trivial@gnu.org; Thu, 27 Apr 2023 08:54:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ps18q-0002sT-D1
 for qemu-trivial@nongnu.org; Thu, 27 Apr 2023 08:54:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ps18o-0003xJ-Sj
 for qemu-trivial@nongnu.org; Thu, 27 Apr 2023 08:54:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682600067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2i11gauYtKzpujwiNKXwlF+ueCGrE+rc0CkTsdy1xxk=;
 b=gW1tLvE0ot+NJ1phgkVcJu2PWclfgGb1+t2PC2UGymASMc5iNdXEeO9UC2YKqxjlFehAQy
 jqUpTGllwNpoEtVcuD9L/og5Mdc9MSzL5KOiWRO8ny1H1ECy0a13bCtd//0ngWT7c/KWbk
 XglrR3tVeFUKAujlGK3+NuJ9VjyExAY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-s29pm6UKOSukBai77QrWAQ-1; Thu, 27 Apr 2023 08:54:26 -0400
X-MC-Unique: s29pm6UKOSukBai77QrWAQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-94f271ebbc2so962205866b.2
 for <qemu-trivial@nongnu.org>; Thu, 27 Apr 2023 05:54:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682600065; x=1685192065;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2i11gauYtKzpujwiNKXwlF+ueCGrE+rc0CkTsdy1xxk=;
 b=MILryb71UL7B9SwOP4RIOIPA8UjQUyWMhYjqLHAzUEyN/2sbA9MXtI0YfWGl7G7dGo
 aW+fOe/FPob11M9V38G4XoC4szwxoy3U/caCfiAJ1TU9BG4iz9/MEh7rg+K87udBr4kD
 73WkpLAhzKcCGH3Tj3d72UoMrbCN+9aX/kiacW3PN0SGSeg/MKnp6PBFZoG58EBvXYoN
 XsA/e3RI7VU69V/LrKTVmEVc+wd8ZkI5SAMILuq9JDwAhVM0QlO9+G8G1ttR/C/xVjEc
 1MoqfS/E98WTdaw2QZZAsHKlnH48PJpeQRZ8i0r2D2PsXDCS+qw2kr1r0NGSLreYr/wC
 c/8g==
X-Gm-Message-State: AC+VfDwm+gvJhHegaBYL6VaD/QLrHxIOVLOb1IHZdRm161Zf6UaucqbB
 6QyF0lPM798Up+poAAjUd98I89tuauDGLAqMmBnYV0VPUZhOHXdPbA0uNSKElZOZzPSZFn/XAFA
 KLpNVZ/pMNwdBpgi2eg==
X-Received: by 2002:a17:907:36c4:b0:94a:35d1:59a with SMTP id
 bj4-20020a17090736c400b0094a35d1059amr1612026ejc.14.1682600065314; 
 Thu, 27 Apr 2023 05:54:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4Fzs7lzxX5DTDNR6YolN401XOqKxQvgkCGK75jHRfRBxcJ1TqzeUdW/aAs4znGBh9Y9bHXvw==
X-Received: by 2002:a17:907:36c4:b0:94a:35d1:59a with SMTP id
 bj4-20020a17090736c400b0094a35d1059amr1612016ejc.14.1682600065038; 
 Thu, 27 Apr 2023 05:54:25 -0700 (PDT)
Received: from [10.168.80.215] ([131.175.147.17])
 by smtp.gmail.com with ESMTPSA id
 qb25-20020a1709077e9900b00959b810efcbsm4832766ejc.36.2023.04.27.05.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 05:54:24 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	mst@redhat.com,
	qemu-trivial@nongnu.org
Subject: [PATCH] tests: vhost-user-test: release mutex on protocol violation
Date: Thu, 27 Apr 2023 14:54:23 +0200
Message-Id: <20230427125423.103536-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 27 Apr 2023 12:54:32 -0000

chr_read() is printing an error message and returning with s->data_mutex taken.
This can potentially cause a hang.  Reported by Coverity.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/qtest/vhost-user-test.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/vhost-user-test.c b/tests/qtest/vhost-user-test.c
index bf9f7c4248ca..e4f95b2858f0 100644
--- a/tests/qtest/vhost-user-test.c
+++ b/tests/qtest/vhost-user-test.c
@@ -351,7 +351,7 @@ static void chr_read(void *opaque, const uint8_t *buf, int size)
         if (size != msg.size) {
             qos_printf("%s: Wrong message size received %d != %d\n",
                        __func__, size, msg.size);
-            return;
+            goto out;
         }
     }
 
@@ -509,6 +509,7 @@ static void chr_read(void *opaque, const uint8_t *buf, int size)
         break;
     }
 
+out:
     g_mutex_unlock(&s->data_mutex);
 }
 
-- 
2.40.0


