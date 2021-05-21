Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lk2UE-0001PN-T2
	for mharc-qemu-trivial@gnu.org; Fri, 21 May 2021 06:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lk2UD-0001KR-6i
 for qemu-trivial@nongnu.org; Fri, 21 May 2021 06:34:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lk2UA-00080g-8d
 for qemu-trivial@nongnu.org; Fri, 21 May 2021 06:34:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621593269;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=y2zUMjfiqJQZLSQRM+1tfkQFEDkIuExBkp9si0rOSRA=;
 b=RhMGxoo/SrmmVd7dzhBHJvtTeA+oRfJ2uRI6ByL/k0niw9ihqoDfqPndWLOlI/ucQWl/pe
 BL/DTAqOD7Ti0OnZ9csg01XRnb8QsIx7/ToD66qtkMkDuqqKNmcr6z9NgW7azWRR9jv5Vw
 /QO2BINlriZHPhTYFS9DhJfL/GxO/w8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-gOUxBscgPxKCzp8RNwJMxQ-1; Fri, 21 May 2021 06:34:26 -0400
X-MC-Unique: gOUxBscgPxKCzp8RNwJMxQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 n2-20020adfb7420000b029010e47b59f31so9189625wre.9
 for <qemu-trivial@nongnu.org>; Fri, 21 May 2021 03:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y2zUMjfiqJQZLSQRM+1tfkQFEDkIuExBkp9si0rOSRA=;
 b=PE8xUhdGtzlzKa+xsAxckKfw/vQJW+HHz9citIFJzu9rD6GMBEbWYXtFrGzqffxhNI
 CvF06OB/gStH9gNaZ0pXL7BoF2qpE6m7WpfgRbuRsXuwouVl3/ph2OuMlJGEijI+boBe
 OIb7Js5bUjHzVM5j1RtrFeZmZV339ntVUqlu2M9SNJumnVxe65c2NbEZtrwDJ981v+v3
 8SxIo7HlUXELEDSSDp605cyk0D1Qtnxz9Vk01Jc/I+Pr6lfdSpPaSiile6Qhe7/EmyWH
 EzinM1bUOmGsnDsvH+D+1xqys3sHPm+s8VCzNZH5JfZcZTtWhTJM+6u5+UaQfERHLndq
 bBiw==
X-Gm-Message-State: AOAM530bUI/CnJ5zfMVuE3545ReOoE8puQvJtVtt3r7Iz6cuaH6hBwnO
 rThQHqlhoh0wMHisd9Jr/0wDFdRlzoYfvXgzy46fb1qEHGgq0srId8FzvQjjx+FaR5Yf4qUi+Fj
 lDW3fbElO2gOEZVs19A==
X-Received: by 2002:adf:d231:: with SMTP id k17mr8607268wrh.78.1621593265725; 
 Fri, 21 May 2021 03:34:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzACT4oQx/HMD5anNqL5Z5wMDFPKbgoePMCG57Qc1HWr3R0IRttxi6d/QCoJGm154sHsK6Vrg==
X-Received: by 2002:adf:d231:: with SMTP id k17mr8607258wrh.78.1621593265586; 
 Fri, 21 May 2021 03:34:25 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id o8sm1624630wrs.60.2021.05.21.03.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 03:34:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH] meson: Fix 'interpretor' typo
Date: Fri, 21 May 2021 12:34:23 +0200
Message-Id: <20210521103423.2780345-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 21 May 2021 10:34:33 -0000

Fix a typo from commit fa2f7b0b9b7 ("meson: Warn when TCI is
selected but TCG backend is available").

Reported-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 1559e8d873a..230a0e4b558 100644
--- a/meson.build
+++ b/meson.build
@@ -247,7 +247,7 @@
       error('Unsupported CPU @0@, try --enable-tcg-interpreter'.format(cpu))
     endif
   elif get_option('tcg_interpreter')
-    warning('Use of the TCG interpretor is not recommended on this host')
+    warning('Use of the TCG interpreter is not recommended on this host')
     warning('architecture. There is a native TCG execution backend available')
     warning('which provides substantially better performance and reliability.')
     warning('It is strongly recommended to remove the --enable-tcg-interpreter')
-- 
2.26.3


