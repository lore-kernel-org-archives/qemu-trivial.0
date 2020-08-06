Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k3gPr-0003Md-NN
	for mharc-qemu-trivial@gnu.org; Thu, 06 Aug 2020 09:58:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k3gPq-0003M3-5T
 for qemu-trivial@nongnu.org; Thu, 06 Aug 2020 09:58:42 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:59959
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k3gPo-0005aK-4e
 for qemu-trivial@nongnu.org; Thu, 06 Aug 2020 09:58:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596722318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cepDETQUo+jJLvqnzAfamax3Xlpb/zYuUECWLtj0je8=;
 b=KL9sCULUDN2vnipdnOINf3zzNYu4eNWbno+EfRCuBh234Ll3PxDzWbA523kX1JY776FIYG
 gmVzS+JClVfwphFtXtZJjUlrI6ICH2QA+FcrmwG9E7ZnMEUfhLeq8otcZoXJQHW0UIh0JL
 aZ+PQ3CnhN70QTonvHMb9ZjzmK0XnJg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-pS3VUhmhNVWMsnsSx3NT7g-1; Thu, 06 Aug 2020 09:58:36 -0400
X-MC-Unique: pS3VUhmhNVWMsnsSx3NT7g-1
Received: by mail-wr1-f69.google.com with SMTP id 5so14769501wrc.17
 for <qemu-trivial@nongnu.org>; Thu, 06 Aug 2020 06:58:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cepDETQUo+jJLvqnzAfamax3Xlpb/zYuUECWLtj0je8=;
 b=HhwVwE8xsaD+2Omaap/NprWXVfiKQTl20tjBTUtfxiTxoj3vAR1XcvCT693zYA85NP
 bbhKjxG87WgFV4G/uIBO4vtGFVFwjT8LeZHC835H3dkRxdnMlw431DKERXBctWUnPRb5
 bXuIqWaa+/tOJ0+9lOkc8PuGLCS25Ej4ViwObUexvFD2tm1bbWmFnFG+ItSTI8G3iG9W
 /aWgcUxJqxRaFO8ouyKr9qqs8XwLemElpjQl9wPpPNlCxkKnjiyayDnsY9bZJ69bRlzB
 WGcWQacpxzyAcQqeJF4oePAWnxbd9+pPAUHEAYtoKDJtZM9DC31a5KTCgplQvU51wKWT
 eGuQ==
X-Gm-Message-State: AOAM533Qh27+dRXkYJNPx6tep3pziE7wtz2PA+Q99flqDIy/Rbz0gkQW
 tBjrGgvT6kNOHXjfLAABGFqFgu62Gr+hfC7Dz5688waQS1s/nfJRO3wZgOhVjM1spCUPkC9tZRI
 OsvlfTArEGX3+ykzr5g==
X-Received: by 2002:a1c:a78a:: with SMTP id q132mr8011585wme.27.1596722315219; 
 Thu, 06 Aug 2020 06:58:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9oRQGKeLAuOtaRv/DDBw/3hZKYQxZX/HqoqmzccjeYp8xXjwqcYCpS6RO+sdjl6VDEQqfDA==
X-Received: by 2002:a1c:a78a:: with SMTP id q132mr8011568wme.27.1596722314984; 
 Thu, 06 Aug 2020 06:58:34 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id x2sm7093978wrg.73.2020.08.06.06.58.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Aug 2020 06:58:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH-for-5.2] Revert "mailmap: Update philmd email address"
Date: Thu,  6 Aug 2020 15:58:32 +0200
Message-Id: <20200806135832.2319-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/06 00:07:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Thu, 06 Aug 2020 13:58:42 -0000

This mailmap entry does not work as I expected. I am receiving
emails related to my hobbyist contributions in my work mailbox
and I get distracted :) Remove the entry to keep things separated.

This reverts commit 289371239153b24cb7bd96b6948c6b40b4627a9b.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .mailmap | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 81c2ce0937..2d97a14af3 100644
--- a/.mailmap
+++ b/.mailmap
@@ -54,7 +54,6 @@ Radoslaw Biernacki <rad@semihalf.com> <radoslaw.biernacki@linaro.org>
 Paul Burton <pburton@wavecomp.com> <paul.burton@mips.com>
 Paul Burton <pburton@wavecomp.com> <paul.burton@imgtec.com>
 Paul Burton <pburton@wavecomp.com> <paul@archlinuxmips.org>
-Philippe Mathieu-Daudé <philmd@redhat.com> <f4bug@amsat.org>
 Stefan Brankovic <stefan.brankovic@syrmia.com> <stefan.brankovic@rt-rk.com.com>
 Yongbok Kim <yongbok.kim@mips.com> <yongbok.kim@imgtec.com>
 
-- 
2.21.3


