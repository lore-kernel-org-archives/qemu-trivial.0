Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sixqD-0004Hq-Hf
	for mharc-qemu-trivial@gnu.org; Tue, 27 Aug 2024 11:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1sixqB-0004Gq-Ou
 for qemu-trivial@nongnu.org; Tue, 27 Aug 2024 11:10:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1sixq9-0000VV-R9
 for qemu-trivial@nongnu.org; Tue, 27 Aug 2024 11:10:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724771436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FidGmXnxpG6f8PpoDrv303//AyAsBhaUgdFoIqfgnDc=;
 b=MWCI0PUSc74l0fEOmNV6v2xxDWnTEFXdHaZ4SqOzTdM3dDk+s0HAGEcaCr7QeSqi6F6jrQ
 SRYscJQp5+exWqwykzm2u/VPInRRjjpny+zUJOiP2HpFnW/BkZT4V4YeEATuoiw+zKcoQS
 ujqS7x6btOVpT4elBjaagGWwFBVWDIM=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-B012PelbNem8uZFn-jXyYA-1; Tue, 27 Aug 2024 11:10:34 -0400
X-MC-Unique: B012PelbNem8uZFn-jXyYA-1
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-71440a7cd08so5151452b3a.2
 for <qemu-trivial@nongnu.org>; Tue, 27 Aug 2024 08:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724771433; x=1725376233;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FidGmXnxpG6f8PpoDrv303//AyAsBhaUgdFoIqfgnDc=;
 b=PMfQl51h1TN9oOXHfikhf6PNuOEuJItSnZfrtYXkRp93L0OCQRW8t6raFKWOcr9m4x
 Rlv/FEL6qBZMU9cQsD8+kt52s7ytCSO4wgoSqUzYj7498xEqCfX//X6a3I23bopL73jf
 r64mW1uPrSDC3W0vAbIfmmP9va75Z/A9rr2THUlWmmlzX4QlpJCFz4s6HA9FBj8emQ02
 oXi4Yg8oQSJyaLNGFSOGTzPnOxDHqihzY7A9KjmvtPiGvkSfr4/xi/kmaYVTcV0B0Y7f
 yuVrqV9LZZsGYwFCK8kdb8tG0dvl6Jk8c7NpfdU8YyCKB/sIsLo1sdDXLyKuzFxp8hgw
 wrrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzEPd7XV/WhTvNTxvnRi/2QNMCLeqHCOHJN1G/V31hR67BLJ6KnsaqXFhNeRhLCGKP46s6wMC/5OFUUBc=@nongnu.org
X-Gm-Message-State: AOJu0Yw/bDEY4plz3f+Y/eRZMF3YtaI3MTstuQ7dCVHd5+hajVHZQz+I
 YTaBqszsxOmDRMxBQN9ePYJ8Ka27sNbdQeI/lcT1RxKoWvMSZGY8uj17BdaRSIOrPcnNT3qFEqL
 zn7HgRCeJuEyfMBvIekj6G4XlMEUp9CDHr9WraIA6j/GtLqzn8GtMdlY=
X-Received: by 2002:a05:6a00:3c8b:b0:70a:f65e:b13d with SMTP id
 d2e1a72fcca58-71445e73722mr15425768b3a.27.1724771433087; 
 Tue, 27 Aug 2024 08:10:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlpqBQKIWl8ufEwOHqy+tmzdMjRRi8eswppCnEysYfgdJcZX+AGTQ60Jv9FaPnnjB7kPt5Ig==
X-Received: by 2002:a05:6a00:3c8b:b0:70a:f65e:b13d with SMTP id
 d2e1a72fcca58-71445e73722mr15425722b3a.27.1724771432540; 
 Tue, 27 Aug 2024 08:10:32 -0700 (PDT)
Received: from localhost.localdomain ([115.96.30.188])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7143430636esm8679062b3a.165.2024.08.27.08.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 08:10:32 -0700 (PDT)
From: Ani Sinha <anisinha@redhat.com>
To: 
Cc: Ani Sinha <anisinha@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, zhao1.liu@intel.com, pbonzini@redhat.com,
 armbru@redhat.com
Subject: [PATCH 0/2] Some refactoring
Date: Tue, 27 Aug 2024 20:40:20 +0530
Message-ID: <20240827151022.37992-1-anisinha@redhat.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 27 Aug 2024 15:10:40 -0000

replace fprintf() with error_report() in kvm_init()
refactor code in kvm_init() to move core vm creation operation to its
own function.

CC: qemu-trivial@nongnu.org
CC: qemu-devel@nongnu.org
CC: zhao1.liu@intel.com
CC: pbonzini@redhat.com
CC: armbru@redhat.com

Ani Sinha (2):
  kvm: replace fprintf with error_report/printf() in kvm_init()
  kvm: refactor core virtual machine creation into its own function

 accel/kvm/kvm-all.c | 106 +++++++++++++++++++++++++-------------------
 1 file changed, 61 insertions(+), 45 deletions(-)

-- 
2.42.0


