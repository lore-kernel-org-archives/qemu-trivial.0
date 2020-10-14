Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kSc3C-0000VC-Cd
	for mharc-qemu-trivial@gnu.org; Wed, 14 Oct 2020 04:22:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kSc38-0000Tp-EW
 for qemu-trivial@nongnu.org; Wed, 14 Oct 2020 04:22:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kSc36-0007ci-Jw
 for qemu-trivial@nongnu.org; Wed, 14 Oct 2020 04:22:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602663735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uuJppHX+C4z8kNnV/PTvBxvxulI+CAK/tNaO7ZCrtiU=;
 b=J3xixPyzoTY1/WC0BCg6ZrwyZgGDSiZj5Vv3qhpo/mfXrWiDjJt3KieL5Uwl15S45yeJiH
 QSSpQrf8UeFAubHWU4fXvjAYsNMypplENUR24miJ/vx6t27zWSLE2NhV9TiNROSPFLZcAC
 dlNxPd28VJHnPV8qoZpDvcMT7BLjMC0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-gHMddjbRMEWamG0vLlOuUg-1; Wed, 14 Oct 2020 04:22:13 -0400
X-MC-Unique: gHMddjbRMEWamG0vLlOuUg-1
Received: by mail-wr1-f70.google.com with SMTP id q15so964276wrw.8
 for <qemu-trivial@nongnu.org>; Wed, 14 Oct 2020 01:22:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uuJppHX+C4z8kNnV/PTvBxvxulI+CAK/tNaO7ZCrtiU=;
 b=aNpWyd98ATl5pYBsffP3Z2S/epUuRABgREwXaWUkDnIbyXI8f0tF7a6874aGy+5gKH
 MzefHUkENP9ekxmHrbrc+44KnBen6qw7CfavUjFiQWDWW9NoGKCskM41J76xcSlHocNt
 PTL7QVmRDuAybPWGD/M7zYxPXr8BDz4oIVsGYY8FWKdBRE9Tun7zEmjDiEKE83UdalH5
 wyBn3AnassDDo7PMhL/xUIqhMs07sriTKlnUr58GJRLjon33p4K+DVpkqK+kJZiQhpGk
 3hxNCMQTFUiPWFXaRnEmSBDiKG+PBKNL8NxiRhWQbu7Nt+bVHAxVGUECGr3uCtwOz9Or
 ZUMQ==
X-Gm-Message-State: AOAM531ceu6J7hJ8Ud/VxiHp8AgEXivIibbBdLjeawmgtEae75Zpi1RP
 6yrafgpG7KzJrXqn5jhEdshQoJt7Vc95yiOZEj+hkO1iF77R3XgVAfpW0Phi0JgX3dXUzXqAhl1
 MpqbFodJqs6feUR15Xg==
X-Received: by 2002:adf:bbca:: with SMTP id z10mr4329826wrg.403.1602663731763; 
 Wed, 14 Oct 2020 01:22:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxy7c6kVKxNkSYE9n3ECqdxhMH6e5mO3f2Twcvri5oyjB3JBqQHQeKmEDKmsMD5AQ3eJUs7Q==
X-Received: by 2002:adf:bbca:: with SMTP id z10mr4329810wrg.403.1602663731576; 
 Wed, 14 Oct 2020 01:22:11 -0700 (PDT)
Received: from x1w.redhat.com (106.red-83-59-162.dynamicip.rima-tde.net.
 [83.59.162.106])
 by smtp.gmail.com with ESMTPSA id 30sm3713287wrr.35.2020.10.14.01.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 01:22:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] buildsys: Help git-diff adding .gitattributes config file
Date: Wed, 14 Oct 2020 10:22:09 +0200
Message-Id: <20201014082209.3712625-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/14 03:37:33
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
X-List-Received-Date: Wed, 14 Oct 2020 08:22:20 -0000

Since commits 0979ed017f0 ("meson: rename .inc.h files to .h.inc")
and 139c1837db7 ("meson: rename included C source files to .c.inc")
'git-diff --function-context' stopped displaying C function context
correctly.
We can help git-diff by providing attributes to the .[ch].inc path
names. See:
https://git-scm.com/docs/gitattributes#_generating_diff_text

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitattributes | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 .gitattributes

diff --git a/.gitattributes b/.gitattributes
new file mode 100644
index 00000000000..3d2fe2ecda8
--- /dev/null
+++ b/.gitattributes
@@ -0,0 +1,2 @@
+*.c.inc         diff=c
+*.h.inc         diff=c
-- 
2.26.2


