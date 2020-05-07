Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jWfNL-0000aG-Ht
	for mharc-qemu-trivial@gnu.org; Thu, 07 May 2020 08:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jWfNJ-0000YE-SS
 for qemu-trivial@nongnu.org; Thu, 07 May 2020 08:11:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50108
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jWfNI-0001Gx-9J
 for qemu-trivial@nongnu.org; Thu, 07 May 2020 08:11:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588853494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WXJhLr707GAro0x/lPPxvDDPBClKZHR4OxgwVVUQXTk=;
 b=TdbEkYA4PWHS+UxTd1xsw6bMARFWJSB0km+jHKlnVs41bqc79ZDHyzVlxnG+3lUjuO2TV9
 0PCnHZVpx1jrmHF9p9uJbyma8lP2++Bdk4sN7KLJf3HhXZXGNBWxFvR+VkRf8EYgYxbS2c
 CNTJEwXlD72Jt8DTcjh7E792kROhH4M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-ALxZn9UbOvGVj0LlK7SGZw-1; Thu, 07 May 2020 08:11:32 -0400
X-MC-Unique: ALxZn9UbOvGVj0LlK7SGZw-1
Received: by mail-wr1-f71.google.com with SMTP id f15so3326243wrj.2
 for <qemu-trivial@nongnu.org>; Thu, 07 May 2020 05:11:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yTYs/7LkEfogfRI30nNyX19tU1pCrHNjgRH6+AlkyQA=;
 b=I6BcxMx/zVtL8A1rrEptJ8TjPyDVHrNiXUSrECRv3aR/lfb7nefDoNktJfBJmeZ9Lz
 x5C6CV01RlBA5zgAtxja9hCyka8FdQZ9OVzvsJbQR1jKnnahhp2zTSm9+sm+wfsVj/A5
 ZCHB1PtuKa4FZspghW9qb9MhNOZ2m/WwZ9PkrxHjHXTkrIO+o41OfQuI4IsIrw3ZZZvm
 FxebMqyP5WTtVhE475ZwY0wxocj+gKAPOxJG3hURFDBh/eJEyA/+Zj1O2rV1DO8MZ72L
 hbXLUiX9jpZeIjs6DMhfng3A1TkeJoHQWtfzZRQWZwEgSTrvNBSUYEVr1qb391KIa924
 RA5g==
X-Gm-Message-State: AGi0Pub2GZbKPaCBxE7J/pwNnWofT3ML+ow0tystTLsVPILLg7RICaBG
 NJbup5BgepQ/byi0doOQMH9lPs1HDpfVvyy5lUhcNXGuu42UyxTb0DBr43qCDe1CmyJpeeBb6WH
 UF2SbGngd7Ulf4Mj1Lw==
X-Received: by 2002:a7b:c3d4:: with SMTP id t20mr10476661wmj.170.1588853491025; 
 Thu, 07 May 2020 05:11:31 -0700 (PDT)
X-Google-Smtp-Source: APiQypLCtgWXWINTmrgRox/aMCvHxradNRPTJJI0CLUwfBCJ+dgc2mdPI09iywS4/diAAAQAzOLosA==
X-Received: by 2002:a7b:c3d4:: with SMTP id t20mr10476646wmj.170.1588853490848; 
 Thu, 07 May 2020 05:11:30 -0700 (PDT)
Received: from x1w.redhat.com (248.red-88-21-203.staticip.rima-tde.net.
 [88.21.203.248])
 by smtp.gmail.com with ESMTPSA id y7sm8188462wmb.43.2020.05.07.05.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 05:11:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH 0/2] block/block-copy: Fix uninitialized variable in
 block_copy_task_entry
Date: Thu,  7 May 2020 14:11:27 +0200
Message-Id: <20200507121129.29760-1-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 03:15:48
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Thu, 07 May 2020 12:11:38 -0000

block_copy_task_entry() might be written differently to avoid
the initialization. This silents the warning and let me build.

Philippe Mathieu-Daud=C3=A9 (2):
  block/block-copy: Fix uninitialized variable in block_copy_task_entry
  block/block-copy: Simplify block_copy_do_copy()

 block/block-copy.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

--=20
2.21.3


