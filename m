Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1k5W1G-00060O-6J
	for mharc-qemu-trivial@gnu.org; Tue, 11 Aug 2020 11:16:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k5W1E-0005xd-MG
 for qemu-trivial@nongnu.org; Tue, 11 Aug 2020 11:16:52 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:48616
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1k5W1C-0000bC-5a
 for qemu-trivial@nongnu.org; Tue, 11 Aug 2020 11:16:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597159008;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=KfV6MlMMv/Z9hpG/beg9L0P5B3H+p/ZNuociKVfN5U4=;
 b=e95Slw22TDTHoZ5eBEVSFeLvO7DBpF3hE0k0Cmywy84lwY5Kl5+cH0vTBj6ESEQXqwuLiw
 6eKdI3k/l6dsy8n2m/IjOF7BqlBi2BZuLSAPEOpwxugKgaye/gnhKhwfbju/lusO+as8I9
 rHTcVIQYRfd8qghgCpwBow36xD//Rv4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-8TuQSeFrNB-iZnO-LwegMg-1; Tue, 11 Aug 2020 11:16:47 -0400
X-MC-Unique: 8TuQSeFrNB-iZnO-LwegMg-1
Received: by mail-wm1-f72.google.com with SMTP id z10so913996wmi.8
 for <qemu-trivial@nongnu.org>; Tue, 11 Aug 2020 08:16:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KfV6MlMMv/Z9hpG/beg9L0P5B3H+p/ZNuociKVfN5U4=;
 b=Lked3doFQhBTmD2Cagc1LvJ2lKEZLReRWnBkbUBMpeLSC7VYxBLLnBTyY9j9XqJ00i
 O+XkhyT366UoJBmhC3eGlnbO+DbHfJnn4KfFs17/XK63xlL1yDistHtOrrVYTnoxv5kV
 uYak9xBdmMgMOrfdpSAlfPvzviyerCeSTWk6aNBxjdJUReMhx5bPYohvAwSlZ8Yjb9X3
 mpnYvXjNQ8EgGlCfw3RAxnvAhSW7tn83Is1gQC09IcHON7KTN+h8ZVOfwdmclMWr1kPs
 bxW2DIh3rGVvugP+aUBJV1jzpsCkLEvjf/OG/0oq5lEsuSznTVgbtJY3x4ehudNgL9HG
 xX5g==
X-Gm-Message-State: AOAM531pkV4hZ3ZkYlSokLNPXBfm/xKlt4vCHQWG7oo8zBzPQ5p7z0ZD
 kgB+UN3JkVhsBk5pGBx4f3e3hcLpdn1PT82l61CqGvF7xrbHUHs9We6P5j88HO1v7CGzaVc9v1R
 JPs1iVz+p2GpbWrKg0w==
X-Received: by 2002:a1c:984d:: with SMTP id a74mr4689815wme.140.1597159005646; 
 Tue, 11 Aug 2020 08:16:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUKhJwRU8DQJUdvJ23weH1I+VDGDrybtGCUxRVV0jgtqCCmvTHGp09ka1aY3aEln2ZhbCpQg==
X-Received: by 2002:a1c:984d:: with SMTP id a74mr4689800wme.140.1597159005451; 
 Tue, 11 Aug 2020 08:16:45 -0700 (PDT)
Received: from localhost.localdomain (121.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.121])
 by smtp.gmail.com with ESMTPSA id b2sm5550421wmj.47.2020.08.11.08.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Aug 2020 08:16:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH-for-5.2 0/3] trivial: Remove 'and and' in descriptions
Date: Tue, 11 Aug 2020 17:16:40 +0200
Message-Id: <20200811151643.21293-1-philmd@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/11 06:40:20
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
X-List-Received-Date: Tue, 11 Aug 2020 15:16:53 -0000

Remove duplicated 'and' in comments.

Philippe Mathieu-Daudé (3):
  hw/i2c: Fix typo in description
  util/qemu-timer: Fix typo in description
  util/vfio-helpers: Fix typo in description

 include/hw/i2c/i2c.h | 2 +-
 util/qemu-timer.c    | 2 +-
 util/vfio-helpers.c  | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.21.3


