Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kDpYA-0008GO-Tp
	for mharc-qemu-trivial@gnu.org; Thu, 03 Sep 2020 09:45:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDpYA-0008GH-8P
 for qemu-trivial@nongnu.org; Thu, 03 Sep 2020 09:45:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kDpY8-000193-NE
 for qemu-trivial@nongnu.org; Thu, 03 Sep 2020 09:45:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599140711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=P4jh2niYh7bJWP7dxPOPtR//yRKxWrNKnOiJly1cel4=;
 b=HAWvM/kCKzSUETlskpniftjvdRvah6bqhRp2NkDL6/B9kkOEJXNUPX2Kb3FufP1TX8CQMJ
 e6PJNgHMGcxYRlR8zLyNDNew1tMQ2eVoGgUU5NHM5iWFE5K4OEcAnQv+5VC0ydylVD8hZu
 OCqs7Azzstlst2eFFukA2XttSbGExPs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-uC7ud-O_OeeseRvf7_-8GQ-1; Thu, 03 Sep 2020 09:45:09 -0400
X-MC-Unique: uC7ud-O_OeeseRvf7_-8GQ-1
Received: by mail-wm1-f69.google.com with SMTP id d5so990542wmb.2
 for <qemu-trivial@nongnu.org>; Thu, 03 Sep 2020 06:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P4jh2niYh7bJWP7dxPOPtR//yRKxWrNKnOiJly1cel4=;
 b=KCkkEQXaE1Cimp+r8HOCNqLDhab7oKkbojsQiICZSMwYcLp7vNy85veBYBJIsNw/zV
 2qxL9nernrqxQPWJDjSVoTfVQsarRYNyFA8DN7pbcm69HoYCzSTVabYnYYalJL+oyY2p
 td+h03TV6zZFteaREZ2vmqOubkYWlwRZIEDC0SV2el8vEC3ihVMrXYGgxGBRcxpMAMbV
 R5hRv3rMwCgijD5B1lhXHJU4KJ0qhNhXO8bGxbueSMNZfdcD5jaGPZeOz7kktt6mYys2
 rZn5RiTD9Fqfhiq6k2Ly732p1uFQgeAdYF26xY89kRqHE4EbSIBlgTuvRhmUk7EshqBY
 kWCg==
X-Gm-Message-State: AOAM530jgFk/FboonAOh2fHG1cFJQWiHWgSNIPTNZmAS47j62mAxGN37
 UpuOqUN3P8WtDxJwPQUvGtCac5A7GhKcxKkB4dAoVP4UzcYMJu7nKLciZedx69CHE2nKPFzLRSw
 yXHteYj7LQ3p1IfxnSw==
X-Received: by 2002:adf:ed05:: with SMTP id a5mr2563810wro.364.1599140708661; 
 Thu, 03 Sep 2020 06:45:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCLFyihtNCmruEdp3nkX1omfPo9T8qqtH1353h2gVmdW7hsEwMPvmbajd3JlqWuuaiPkwpPg==
X-Received: by 2002:adf:ed05:: with SMTP id a5mr2563793wro.364.1599140708547; 
 Thu, 03 Sep 2020 06:45:08 -0700 (PDT)
Received: from localhost.localdomain (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id y1sm4345972wma.36.2020.09.03.06.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Sep 2020 06:45:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 0/2] hw/timer/hpet: Trivial format string fix
Date: Thu,  3 Sep 2020 15:45:04 +0200
Message-Id: <20200903134506.440082-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/03 01:47:17
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
X-List-Received-Date: Thu, 03 Sep 2020 13:45:14 -0000

Fix a format string and remove dead code.

Philippe Mathieu-Daudé (2):
  hw/timer/hpet: Remove dead code
  hw/timer/hpet: Fix DPRINTF format string

 hw/timer/hpet.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

-- 
2.26.2


