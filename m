Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lHWX0-0005h6-B5
	for mharc-qemu-trivial@gnu.org; Wed, 03 Mar 2021 13:47:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWWy-0005bX-9R
 for qemu-trivial@nongnu.org; Wed, 03 Mar 2021 13:47:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWWp-00082s-9y
 for qemu-trivial@nongnu.org; Wed, 03 Mar 2021 13:47:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614797242;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8KZhKK31KyfnjQDhDEVhCsxY2Kwq4sGCBZtEFirnrhs=;
 b=PlHTAAMwLP/+grAZlYBVpbJHWaJeyLw6Ah/mdBeyItgBA+EMzwO5mL/JTP83FYBZ9Axz3X
 ERxUfdKAYJFgzC3zh6ED+yGjZVsUdiA5VDhu7SiZqsuof7/Mxu/IaLM89P6C+VaVuQI5RB
 2K3DKUZ5WRxriBXKMP4oPjnXwvJec2M=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-CmkEAI1FM6ySBRxZH8PP4g-1; Wed, 03 Mar 2021 13:47:18 -0500
X-MC-Unique: CmkEAI1FM6ySBRxZH8PP4g-1
Received: by mail-wr1-f69.google.com with SMTP id y5so2735609wrp.2
 for <qemu-trivial@nongnu.org>; Wed, 03 Mar 2021 10:47:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8KZhKK31KyfnjQDhDEVhCsxY2Kwq4sGCBZtEFirnrhs=;
 b=MuWYmnGTaFD0Si00d0Rxsoej/kerZuf8zKhFiO1Ex9i9EeVu9DsFO7ABF+cOcnqhw4
 8riAYiLoT21AkJ0AfCJOadbOua5Kc7CswLTCEV/HpWkAV84OrmbztBHFy2Tbb6YRQfFN
 9jCv3wm+/hoKObhviUkX5YPg//7o90ivZ3nzUnbM3m7XXDqCZlwyF9/rg/GUGFG47wbm
 j03BzIDIaVI8q5P9mzM8CzvlNZlDJNm6oOMnwjQvu7H7sLXd5ky+6DqufOYXGLC9DRXn
 k8OB+RN64JYoTUoZJXj79J+W05/zD2LK92XxuYcc5TXmTKREwCReDDEwvueQVC8cCCge
 EA8g==
X-Gm-Message-State: AOAM533MAnhwwag17EYofM54BDTtbr9B+SkjGxLGku7wmI0Wxy/++pTX
 qXrYryFwTZTKxGn5dG21/AIDch+p2/jQwNMb0HzvNWoGP5xUDYgSaz8bvOWK2Bzy6z1OcXd03+1
 jHdnyHqUVnOzQY6rpUg==
X-Received: by 2002:a05:6000:5:: with SMTP id h5mr12111wrx.97.1614797237294;
 Wed, 03 Mar 2021 10:47:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx4HCfJjsCF5sPq6Cl+Y+hdP+ZJ1b47KHwEHN5NwjCgeUwkyzysRQYLOfHZnxnzpEGqO1bDfA==
X-Received: by 2002:a05:6000:5:: with SMTP id h5mr12094wrx.97.1614797237174;
 Wed, 03 Mar 2021 10:47:17 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y10sm24628852wrl.19.2021.03.03.10.47.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:47:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-trivial@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eduardo Otubo <otubo@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 4/5] qemu-options: Replace the word 'blacklist'
Date: Wed,  3 Mar 2021 19:46:43 +0100
Message-Id: <20210303184644.1639691-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210303184644.1639691-1-philmd@redhat.com>
References: <20210303184644.1639691-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
X-List-Received-Date: Wed, 03 Mar 2021 18:47:32 -0000

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the word "blacklist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qemu-options.hx | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 252db9357ca..8462dc5f158 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4299,12 +4299,12 @@ DEF("sandbox", HAS_ARG, QEMU_OPTION_sandbox, \
     "                use 'obsolete' to allow obsolete system calls that are provided\n" \
     "                    by the kernel, but typically no longer used by modern\n" \
     "                    C library implementations.\n" \
-    "                use 'elevateprivileges' to allow or deny QEMU process to elevate\n" \
-    "                    its privileges by blacklisting all set*uid|gid system calls.\n" \
+    "                use 'elevateprivileges' to allow or deny the QEMU process ability\n" \
+    "                    to elevate privileges using set*uid|gid system calls.\n" \
     "                    The value 'children' will deny set*uid|gid system calls for\n" \
     "                    main QEMU process but will allow forks and execves to run unprivileged\n" \
     "                use 'spawn' to avoid QEMU to spawn new threads or processes by\n" \
-    "                     blacklisting *fork and execve\n" \
+    "                     blocking *fork and execve\n" \
     "                use 'resourcecontrol' to disable process affinity and schedular priority\n",
     QEMU_ARCH_ALL)
 SRST
-- 
2.26.2


