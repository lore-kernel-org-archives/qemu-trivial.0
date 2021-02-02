Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l6y2W-0005vV-1R
	for mharc-qemu-trivial@gnu.org; Tue, 02 Feb 2021 10:56:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6y2S-0005qU-7A
 for qemu-trivial@nongnu.org; Tue, 02 Feb 2021 10:56:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:21992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l6y2M-0001jD-7v
 for qemu-trivial@nongnu.org; Tue, 02 Feb 2021 10:56:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612281377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ow8WkzDqwlr6NSlZiItBTXInPAFY5oanHyLWGxhAEug=;
 b=hDd44GY+twKralkCejh80/qvLYTwotnzqGqs6n57IC9K5PHyxKw7s5CcoZfXW345spTFOa
 bIsrdKYRSJ9dxR+geMUrMils19SBgBwU8JPJ+mIZTVR7D/JjTgw5kKgHT+20eZkPsqfb0d
 ANufUU5I8TIQf1LRqFHuvSDWHh6K/wc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-538-9eVeGFsxPiafsGEnEzmyHg-1; Tue, 02 Feb 2021 10:56:15 -0500
X-MC-Unique: 9eVeGFsxPiafsGEnEzmyHg-1
Received: by mail-wm1-f72.google.com with SMTP id k64so1634745wmb.6
 for <qemu-trivial@nongnu.org>; Tue, 02 Feb 2021 07:56:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ow8WkzDqwlr6NSlZiItBTXInPAFY5oanHyLWGxhAEug=;
 b=eHr9yiA5yi1e6vK2bYzzCMXi7WozALrhmUxny8PVVCPBX+is+c185inWaLERZgMrCP
 2fFbIvVK5pvqNT7dLuICr/8UcCLefzLyJ6S+CvpQx/yNYhTam2gnBecn6ZJz257TuXEg
 UW/QOYcU3FfxAeQ6OTq1ZxZnburYke+VtTuG3PT+LhrgM4wPZlDdOO0pviAyq6dTJeqz
 dVlutr041W2qFEX+5sEs/FtzfzW++yZcXDj52bSkuamnEJKxKF0sEXGv06JkpM1ha66E
 EBTQ65PqfuK1r5Nb7JfQiuoHgua3vq8NgnCbtoZg4g3UwzRpHAFR4GHSa5ZD1k9zoUKp
 bYSw==
X-Gm-Message-State: AOAM5332lKQULZPjDM6MPDR3Hihg7b4Qle5pXHaFzIIqUf0sMXbT/HmW
 M6wwtqLmwoC2iTlJFa1AcCa3PE1sxm0NLexIVk4YOXwJlV/5VK39y/DGudR6lBjeJcB8xhQQrkQ
 zlgcpjmx9GrhcUj7Bgg==
X-Received: by 2002:a1c:1fce:: with SMTP id f197mr776464wmf.110.1612281373918; 
 Tue, 02 Feb 2021 07:56:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyH4m873K4it6Y0grf8QOwagFdLutxC4dRftkk54Zl9WfrmECMLpIzM69tGOgaLBxiQ5YKbbw==
X-Received: by 2002:a1c:1fce:: with SMTP id f197mr776448wmf.110.1612281373686; 
 Tue, 02 Feb 2021 07:56:13 -0800 (PST)
Received: from x1w.redhat.com (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id i18sm24635262wrn.29.2021.02.02.07.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 07:56:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] MAINTAINERS: Cover docs/igd-assign.txt in VFIO section
Date: Tue,  2 Feb 2021 16:56:11 +0100
Message-Id: <20210202155611.998424-1-philmd@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 02 Feb 2021 15:56:24 -0000

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bcd88668bcd..838d0f14a59 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1768,6 +1768,7 @@ M: Alex Williamson <alex.williamson@redhat.com>
 S: Supported
 F: hw/vfio/*
 F: include/hw/vfio/
+F: docs/igd-assign.txt
 
 vfio-ccw
 M: Cornelia Huck <cohuck@redhat.com>
-- 
2.26.2


