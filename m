Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k99aH-0000vY-Ul
	for mharc-qemu-trivial@gnu.org; Fri, 21 Aug 2020 12:08:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k99aF-0000v2-Lu
 for qemu-trivial@nongnu.org; Fri, 21 Aug 2020 12:08:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:20177
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k99aC-0003cH-Vc
 for qemu-trivial@nongnu.org; Fri, 21 Aug 2020 12:08:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598026079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wss4PuFuftaUGSiEsj4ZhHDH2Wc88qjKeJrLN5JbRXc=;
 b=Lk9IexiLQAidQTY2EdDJmshKq/zAVW6GMsVUftSujPNQkklABI+G6+00HqpG3QEUwJ5+xC
 6Ru1LgfYMVUXAy5pkHIoPuZ2nLqG2PkeIFQ+PZ+i36fpW8refiyrrlAVqZIIIqwS7shYew
 j4lMQ08NhcyGRsd8lV7B/3Fb5Twy2T0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-lk6bpqHrN3q4ydOM7fH1Ng-1; Fri, 21 Aug 2020 12:07:57 -0400
X-MC-Unique: lk6bpqHrN3q4ydOM7fH1Ng-1
Received: by mail-wm1-f70.google.com with SMTP id r14so977370wmh.1
 for <qemu-trivial@nongnu.org>; Fri, 21 Aug 2020 09:07:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wss4PuFuftaUGSiEsj4ZhHDH2Wc88qjKeJrLN5JbRXc=;
 b=gioyyhzvV0MJoYkTBm2sa5qLB7AwmUdGPt1CFIyRXdlJpudbQp7WB/o9L/txfGc+eQ
 RFlZEStcbdMMGX8yQKftVuePuTOxBoo0G9zRKejTuFhSFMwEddZOVfxK750S7oR6lfza
 jqzo+f2bNn49+52MEJqb1GFwB0OxcZcRQGeXRtNNJRmatGdrAgQM6WWU69GxxJiWGcWj
 vlrXDZKDPkz51iZk1+/DqA4Ukc/iBzNfs3vW4la4ISkCNKrsxSSY27xvcvxgFNUohueR
 XcSXMuNQyz82NnbfvjZc/Y5Q2EaRlB7Ad5o/rTZrPsA7j6ifpg16U+bL/qLm7i8ZWy9/
 ddcw==
X-Gm-Message-State: AOAM533WYn/LTNTx5PFlnFK1nVn1AuLKBYEQQAF13zve76zbI4KU0W0h
 Ur/5sXoMZxkDwLi4pZ9i4zx+oa7s7q+cbdo1eXVNJeq3roeLTEaViLy/hdqn7AePUbKFphTIPEc
 QSC8oPG4y5OHE7ys6uw==
X-Received: by 2002:a1c:1fd1:: with SMTP id f200mr2900088wmf.53.1598026075995; 
 Fri, 21 Aug 2020 09:07:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznHPD8Rs6+Hk+d229OCWyTs0vuuvAnm620mS7Ms1K53kveJMdT9pctIG5LfBYo/Xxj4KeIpQ==
X-Received: by 2002:a1c:1fd1:: with SMTP id f200mr2900056wmf.53.1598026075650; 
 Fri, 21 Aug 2020 09:07:55 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id g7sm5350957wrv.82.2020.08.21.09.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 09:07:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 0/2] meson: Build qemu-keymap when configured using
 --disable-tools
Date: Fri, 21 Aug 2020 18:07:50 +0200
Message-Id: <20200821160752.1254102-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/20 23:41:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 21 Aug 2020 16:08:03 -0000

Fix --enable-system --disable-tools builds.

Marc-André Lureau (1):
  meson: convert pc-bios/keymaps/Makefile

Philippe Mathieu-Daudé (1):
  meson: Do not consider qemu-keymap a 'tool'

 Makefile                    |  8 ------
 meson.build                 | 11 ++++----
 pc-bios/keymaps/Makefile    | 56 -------------------------------------
 pc-bios/keymaps/meson.build | 56 +++++++++++++++++++++++++++++++++++++
 pc-bios/meson.build         |  1 +
 ui/meson.build              |  2 +-
 6 files changed, 64 insertions(+), 70 deletions(-)
 delete mode 100644 pc-bios/keymaps/Makefile
 create mode 100644 pc-bios/keymaps/meson.build

-- 
2.26.2


