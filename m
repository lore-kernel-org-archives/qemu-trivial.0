Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1scHuR-00020f-SK
	for mharc-qemu-trivial@gnu.org; Fri, 09 Aug 2024 01:11:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1scHuQ-0001ws-MX
 for qemu-trivial@nongnu.org; Fri, 09 Aug 2024 01:11:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1scHuP-0002lq-Dn
 for qemu-trivial@nongnu.org; Fri, 09 Aug 2024 01:11:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723180284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=58ShCAkzJcml0FgLuMrrLrERMQozVUybMjRiQDJjA7o=;
 b=X2afCDJlNiJVr5b42kfjZHcJdoHKIM43GnJV39qvCOd6YcwdpnNcSgjr7ToUJsNGTczfOW
 y3ogbgDnK8l6TC6sixmdKKLi+4Jr6TI1hXBaxcwXhe4a1spn+O1ZCE/9EB/0S0amOr3/ZN
 jiCRAgq6KYClrwEZIjzjj18UJP9azd4=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-nRXbbetBPAi_QG0_ArtsJg-1; Fri, 09 Aug 2024 01:11:20 -0400
X-MC-Unique: nRXbbetBPAi_QG0_ArtsJg-1
Received: by mail-oa1-f72.google.com with SMTP id
 586e51a60fabf-26123f60850so2211040fac.3
 for <qemu-trivial@nongnu.org>; Thu, 08 Aug 2024 22:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723180279; x=1723785079;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=58ShCAkzJcml0FgLuMrrLrERMQozVUybMjRiQDJjA7o=;
 b=YrTwD49tYAEbhk49+6YmZRR8gCtUr7PW/4rYx5yRZsSu7/ty4ysxrq8bhsgBNgrnbu
 o5INgwbBYrt8aIaKj5I6TOR4tNpix6qZjRTwmwtg+ibWpIr1JP4gjliKOi57ntI2x3EW
 fXR+LOxeb+Wi+MkpY2zkjfrke/VDFzvkzQcxjJIfCAToHvv3oHBam1cICVVTrm3XP4wN
 WX7ANQpwQf1m7bZoU4sNkgYtibdk+Nfz7sT9+0ZB8XFcc6WIfUjBFW8qGjWP26zytmF2
 rojtClnWHXDF0a5qwD/Iq8amA+cU2ya+smpUWljR66L93+OQhe/GsPFmgWa1DKQLgq6P
 25BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgquE0WbX09SPlnOF8+zuMtp1AF1JdojTSDrsIFVFma7aEFmnJd+G38vMbji4LZDSQSf/cGXGeAc2xQfXzZ7LBeBr60WoZTQ==
X-Gm-Message-State: AOJu0YwdV611iSxq5DIh4ZfxpavusxojeO6UU+7mlGNd0g6dapiYb2XO
 dZLYI0Eto2andOsfTW5xPhzWKRJs/RbprVRq35AcpZPgKe50vQ8TtNVK4a+YvJ6eTan/pu8ZGiW
 DYLvIBGCviuYVXsSW2xXK9MCoxDDL0NOQZOXe5RkCeRrEVOjE/6htA/M=
X-Received: by 2002:a05:6870:218b:b0:259:8420:8e3b with SMTP id
 586e51a60fabf-26c62ce7605mr485543fac.21.1723180279337; 
 Thu, 08 Aug 2024 22:11:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9wJwPJ18iuXVXiRxPpCF6mEQKkjilyoLGwm1T+o/eo09QZnOhH9lIsNrzz+sIn/CLlHKX5g==
X-Received: by 2002:a05:6870:218b:b0:259:8420:8e3b with SMTP id
 586e51a60fabf-26c62ce7605mr485529fac.21.1723180278997; 
 Thu, 08 Aug 2024 22:11:18 -0700 (PDT)
Received: from localhost.localdomain ([115.96.114.241])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-710cb2e52bfsm1961777b3a.145.2024.08.08.22.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 22:11:18 -0700 (PDT)
From: Ani Sinha <anisinha@redhat.com>
To: 
Cc: Ani Sinha <anisinha@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, zhao1.liu@intel.com, pbonzini@redhat.com
Subject: [PATCH 0/2] Some refactoring
Date: Fri,  9 Aug 2024 10:40:52 +0530
Message-ID: <20240809051054.1745641-1-anisinha@redhat.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.141,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Aug 2024 05:11:26 -0000

replace fprintf() with error_report() in kvm_init()
refactor code in kvm_init() to move core vm creation operation to its
own function.

CC: qemu-trivial@nongnu.org
CC: qemu-devel@nongnu.org
CC: zhao1.liu@intel.com
CC: pbonzini@redhat.com


Ani Sinha (2):
  kvm: replace fprintf with error_report() in kvm_init() for error
    conditions
  kvm: refactor core virtual machine creation into its own function

 accel/kvm/kvm-all.c | 106 +++++++++++++++++++++++++-------------------
 1 file changed, 61 insertions(+), 45 deletions(-)

-- 
2.45.2


