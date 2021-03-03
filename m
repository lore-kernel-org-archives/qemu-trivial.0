Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lHWWN-0004u7-PX
	for mharc-qemu-trivial@gnu.org; Wed, 03 Mar 2021 13:46:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWWL-0004mn-EG
 for qemu-trivial@nongnu.org; Wed, 03 Mar 2021 13:46:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHWWI-0007sW-LG
 for qemu-trivial@nongnu.org; Wed, 03 Mar 2021 13:46:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614797209;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=c6bS7+tsRp1OgzA0OdE2ZRXYYVdxCYuj5fkOVNCrQhU=;
 b=QRoqMlumcklKGft9d4dpt5o9NyaqDiUWKskz5aeL1JutSdlHvxQCeUltQ69NXi8fMU/sYF
 U72WS8DOSRk9qu6TYT7oJvHjyae6Ruz284w/nl+22Leqs77xyddB4RwC6PAwEQsr58KBVg
 b9jq9X9JkLQK177RK14DDDdiMOnWk3I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-E_HVa1ooNjyqTyvziDw40w-1; Wed, 03 Mar 2021 13:46:47 -0500
X-MC-Unique: E_HVa1ooNjyqTyvziDw40w-1
Received: by mail-wr1-f69.google.com with SMTP id 75so845607wrl.3
 for <qemu-trivial@nongnu.org>; Wed, 03 Mar 2021 10:46:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5RVXh3BmUjJ+VyKFXD9xcYy7OKg3Zpbiv8DU+lvm4FU=;
 b=m5fgo+AHr5+r5pOT6zbZ8/NO4LH31/eow5J7Rcphm3vZ9EIJ+iZC6MtC63Kiwk1Cel
 eGfsZgzgzSbSGxwZmPhbKi2pD9GQ51yFzdmjxfgGrYOYQ+t3M3mmjni6PRR+j9ISrRlr
 3XQKzy5+ldL/Q35VPT5vHRqsvKZBxO2k25mFsIjyLW/Tsv/ifnDTboM/a4353Hxb4A2g
 Re58pe7W4VwrjmBEE8ch+IWC3xw/wryfnpXx35sQcoR+KLXHaVrVpJvGh4PfQ3ANuxiH
 1Z0Gtxs7g9jOJFMfZZ0exHkfhbpBjhGGY/hlGUR3YbSncXl+OKCxhFtRYvlv5qRNFXo3
 zDBw==
X-Gm-Message-State: AOAM533Lv4EfzniMjv5+ccQvyfDOQbWeta5dcql3iucRPD+Kuo7p7hiM
 htfbMvQOy4/I158igtS80oCmfHVsYyKsIF1d8ALxE1b/H4+1bgA0MM2RmKmmqlz+4nhZuvvZGq5
 glIVismC4/vLfOkQcPA==
X-Received: by 2002:a5d:5405:: with SMTP id g5mr20058wrv.406.1614797206360;
 Wed, 03 Mar 2021 10:46:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxEWUq0UvgT4WZf8E2zmzv3AVrsyZcByml9jP18e2lzmZ9b51FgYAL0C4x+ty68RmOerP0qHw==
X-Received: by 2002:a5d:5405:: with SMTP id g5mr20035wrv.406.1614797206195;
 Wed, 03 Mar 2021 10:46:46 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y16sm9896351wrh.3.2021.03.03.10.46.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 10:46:45 -0800 (PST)
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 0/5] misc: Replace the words 'blacklist/whitelist'
Date: Wed,  3 Mar 2021 19:46:39 +0100
Message-Id: <20210303184644.1639691-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Wed, 03 Mar 2021 18:46:53 -0000

Follow the inclusive terminology from the "Conscious Language in your=0D
Open Source Projects" guidelines [*] and replace the words "blacklist"=0D
and "whitelist" appropriately.=0D
=0D
Since v2:=0D
- added R-b tags=0D
- reworded seccomp comment (thuth)=0D
- dropped queued vfio patch=0D
- dropped device-crash-test reworked by Eduardo as commit 1a14d4e16af=0D
  ("device-crash-test: Remove problematic language")=0D
=0D
Since v1:=0D
- dropped qemu-guest-agent patches=0D
- addressed review comments=0D
- added R-b tags=0D
=0D
Series fully reviewed and expected to go via the qemu-trivial@ tree.=0D
=0D
[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md=
=0D
=0D
Philippe Mathieu-Daud=C3=A9 (5):=0D
  ui: Replace the word 'whitelist'=0D
  scripts/tracetool: Replace the word 'whitelist'=0D
  seccomp: Replace the word 'blacklist'=0D
  qemu-options: Replace the word 'blacklist'=0D
  tests/fp/fp-test: Replace the word 'blacklist'=0D
=0D
 softmmu/qemu-seccomp.c        | 16 ++++++++--------=0D
 tests/fp/fp-test.c            |  8 ++++----=0D
 ui/console.c                  |  2 +-=0D
 ui/vnc-auth-sasl.c            |  4 ++--=0D
 qemu-options.hx               |  6 +++---=0D
 scripts/tracetool/__init__.py |  2 +-=0D
 6 files changed, 19 insertions(+), 19 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


