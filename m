Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mYPsA-00023f-Ne
	for mharc-qemu-trivial@gnu.org; Thu, 07 Oct 2021 05:39:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYPs8-00022h-6K
 for qemu-trivial@nongnu.org; Thu, 07 Oct 2021 05:39:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYPs6-000571-TP
 for qemu-trivial@nongnu.org; Thu, 07 Oct 2021 05:39:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633599566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=O6gHvl+V3DdX2ER9EkW+g056NvC3DDNHig7lmoGLbJo=;
 b=CooGdwqSFugXqurl115kbS3QHQlJ47J03CHpyHwmegOmc8vaRMlgmqdcdIa3qSM+DsrgNy
 KHmpEd5dQPAMJOqmuGM0tl+BV2c99bvAKy+JEJ7UwmaD1I97IzIpkt1cYjiusJGcZqF4pL
 zwahLnEOXyJTYQVWhwjBCG10f2eYcAs=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-a5jfZIz6Nay4wF-3NbUeNw-1; Thu, 07 Oct 2021 05:39:19 -0400
X-MC-Unique: a5jfZIz6Nay4wF-3NbUeNw-1
Received: by mail-lf1-f72.google.com with SMTP id
 bq35-20020a056512152300b003fd45087a72so4089852lfb.9
 for <qemu-trivial@nongnu.org>; Thu, 07 Oct 2021 02:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O6gHvl+V3DdX2ER9EkW+g056NvC3DDNHig7lmoGLbJo=;
 b=ioXrtTVSPNl7ZILKsgUfCoeKny153nalin5tTJ/geFMr19CDUCv2YCRnf01IGdADgR
 n2g3DGX765Im1U1tTOFUPl07C3vMz6dlf4y98l8vl/MjmAM4hCnemy4J+LEfkRkdRFFg
 tw9VMwrhdHKP5aAdYXF/aIwY+N3IzuoxSdYn23sa0lSgXhYvG/su/E2UJvfhWTL85u9k
 k28cGHN5tAFvDVVBaMk3EyannKD0ANdap8vbadiYvsOX/BgZNdyPmd1A5GTCvonQFJah
 iaDDgncc9EHhDtAx9k3DDNzTAHY9zJ8juUIy4cmkF9/68Kz9i0dF5YoLjvXr3k6vEhQo
 t87w==
X-Gm-Message-State: AOAM533ySJ0f4KQ6OU7+hb3hDYjHP5ETj6gvP35HhnQn30snmpunfJo+
 +Mk2iT9/WVOkaq7C+H+onSRPyJ34tiV9GbqUPcrT8dtU0fbkK60XUmi/oxfeJMlOrWQksyRC6dZ
 0qhXHTR9W9U6Do01EDA==
X-Received: by 2002:adf:8bdd:: with SMTP id w29mr3973299wra.49.1633599070021; 
 Thu, 07 Oct 2021 02:31:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmb3/xqoaRaAuKDWYmQaFbK3pyag8zv1KmFFp4HwgS6gazHzy07Y0Cn9G47LKatWfvrSQbXw==
X-Received: by 2002:adf:8bdd:: with SMTP id w29mr3973266wra.49.1633599069841; 
 Thu, 07 Oct 2021 02:31:09 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id c18sm8144571wmb.27.2021.10.07.02.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 02:31:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] MAINTAINERS: Add myself as reviewer of 'Machine core' API
Date: Thu,  7 Oct 2021 11:31:08 +0200
Message-Id: <20211007093108.323223-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Thu, 07 Oct 2021 09:39:28 -0000

In order to help Eduardo and Marcel with the machine
core API, add myself as reviewer. That will also help
me to learn more about this subsystem :)

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 50435b8d2f5..b0a7bf36aa4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1617,6 +1617,7 @@ F: pc-bios/bios-microvm.bin
 Machine core
 M: Eduardo Habkost <ehabkost@redhat.com>
 M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
+R: Philippe Mathieu-Daudé <philmd@redhat.com>
 S: Supported
 F: cpu.c
 F: hw/core/cpu.c
-- 
2.31.1


