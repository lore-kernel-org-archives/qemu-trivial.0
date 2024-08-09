Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1scHdE-0002W0-Ff
	for mharc-qemu-trivial@gnu.org; Fri, 09 Aug 2024 00:53:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1scHdD-0002RR-7i
 for qemu-trivial@nongnu.org; Fri, 09 Aug 2024 00:53:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1scHdB-0008Fn-SM
 for qemu-trivial@nongnu.org; Fri, 09 Aug 2024 00:53:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1723179216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=s9N1cyy+ecX5HWtxGg4Tr3VQQ2fgXCoD73nkgydtGB4=;
 b=Ry2+CEADDwe0olAVbZ/4p7WP7xJwAGqk/gbZ60w9LMryVbORG66MjGap6xe6i4eJIpPYtt
 qvJc4DepGSRk+j+PfqMCflrk8F92wmk+oUiYLi45Y6ocpQYUF8LlQGv0RyMk7qJD9A40ld
 Kes6Yh/aobL8Z7PE8wpShaMO5AU6Bmc=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-0kPlEXKSPwqGBOsWIPkdZg-1; Fri, 09 Aug 2024 00:53:35 -0400
X-MC-Unique: 0kPlEXKSPwqGBOsWIPkdZg-1
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-1fc51ea72abso17938865ad.1
 for <qemu-trivial@nongnu.org>; Thu, 08 Aug 2024 21:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723179214; x=1723784014;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=s9N1cyy+ecX5HWtxGg4Tr3VQQ2fgXCoD73nkgydtGB4=;
 b=aIyPQAX9LuLliy9sX7r9SsaP8DNo+ygTQmrWgCAv29EjJZblcnf9qgdjsS/ItFUWUv
 zfiAHV3yTqFfpvC/hAQRqTkXQrC1+nSwtE7Fwx8+xvsJmhg9fAjx/CjFqj3ZhUEpub4P
 NAGfu1tbxdJCdqKw4jaZELB68gEhRBu2tE4I5CiAsnNhnw+pBNVdH6aGUG/PO0P0zCK2
 mLzeT2oVi6uOkk99XTbSSjnoCf58benTW3UOsPt5f1UQILMyXJdxmANC+5Fic5g1Vzce
 13WXvrcKY4ahmSCARCfH4nKIkcyN3nFLHqteSft6YdOwnmwz3CI+KQvZp+kDPjmdnNwR
 DaFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwm904cZ3akhx+kzt+mOtOV2Fz4WXWx2pgVtgwijopflFUv12wvvudggdmXB0+RyumiYJbGbLRuMYs6oRRVWC2QtQntDjiEg==
X-Gm-Message-State: AOJu0YxuYXmNrL//lWCLRwMOptaiNx8Pp/Dmicxd7jCIee47WIwVCzCD
 OoE+HpnEHIOm+Gqap+GDJU2ixTHK5VdtMqrsF9RZ0P/m0nwcJeGwiPG6+MxejuhhGZ1iygbjXLX
 wErkS/12UWga0bsFqSVq746Gi6B6v0KdAspa7wviF/Q0t0clyBInfavI=
X-Received: by 2002:a17:902:da8b:b0:1fb:95b3:722f with SMTP id
 d9443c01a7336-200ae61a99fmr2625555ad.60.1723179214570; 
 Thu, 08 Aug 2024 21:53:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEz8fNSTwk4w4hgHlo5t97I3+nftttPm+QNRguV4oATgAkQnN2dkRyUeSnrahM8NlB5q5PlVg==
X-Received: by 2002:a17:902:da8b:b0:1fb:95b3:722f with SMTP id
 d9443c01a7336-200ae61a99fmr2625435ad.60.1723179214170; 
 Thu, 08 Aug 2024 21:53:34 -0700 (PDT)
Received: from localhost.localdomain ([115.96.114.241])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-1ff58f6a540sm133516895ad.118.2024.08.08.21.53.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 21:53:33 -0700 (PDT)
From: Ani Sinha <anisinha@redhat.com>
To: 
Cc: Ani Sinha <anisinha@redhat.com>, qemu-trivial@nongnu.org,
 zhao1.liu@intel.com, pbonzini@redhat.com
Subject: [PATCH 0/2] Some refactoring
Date: Fri,  9 Aug 2024 10:21:51 +0530
Message-ID: <20240809045153.1744397-1-anisinha@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 09 Aug 2024 04:53:39 -0000

replace fprintf() with error_report() in kvm_init()
refactor code in kvm_init() to move core vm creation operation to its
own function.

CC: qemu-trivial@nongnu.org
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


