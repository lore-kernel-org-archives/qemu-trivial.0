Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sjDXq-0003UM-F5
	for mharc-qemu-trivial@gnu.org; Wed, 28 Aug 2024 03:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1sjDXp-0003SJ-1o
 for qemu-trivial@nongnu.org; Wed, 28 Aug 2024 03:56:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1sjDXm-00062D-PD
 for qemu-trivial@nongnu.org; Wed, 28 Aug 2024 03:56:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724831801;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kq10LHxOXDbRo88hXcndnj4lAOuankdm6ReuOHRrwqw=;
 b=WYepHr0P6cW1BXemV9KxnYWYxuLGSO1wfAnt/fE4IDnjnGVMF5I/R3LpmBXDBpwkE3iCYO
 nSxlkZzRiGXarupJckNW6JEVdkWxxsf9uJZtkkb3eDuQ4Tsj3wVPaAL3iOyzTGbTXWUJV6
 xgPQMyqytTdV386/JnC9ArtmgCu17nM=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-zQXihTUuNSafUYSgj88erQ-1; Wed, 28 Aug 2024 03:56:40 -0400
X-MC-Unique: zQXihTUuNSafUYSgj88erQ-1
Received: by mail-pj1-f72.google.com with SMTP id
 98e67ed59e1d1-2d3d45c308fso6913409a91.1
 for <qemu-trivial@nongnu.org>; Wed, 28 Aug 2024 00:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724831799; x=1725436599;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kq10LHxOXDbRo88hXcndnj4lAOuankdm6ReuOHRrwqw=;
 b=DMuwYqtuEromHq3UVQxqEJdpUYdmnlBWmYs9rguOYL3CpTNMiwtW6vlJaWo0Tf+LFX
 nYysaJPBp6/9doLeWVGIJpEsqPVQpqIui/ppqzWfh7Vs9bfSUqGZFdKFM5M1pN42RPs6
 8evVoTQXdfLGUQ0XQNZklPVrZI/snwIidSic0x4J4Eh8D5JG5g8kEcLS98TEuvRJeeMR
 OAM295MHb/78lRBs+HSN7XhjeL2V3rxly/eps+HQMt2l/UMrZXQExU82U6R/uxceNWEt
 K4lr69NkqS4W2LS3QTdKw4l3MkESAsfMtCGfavXc+79eOq394It4g28hnrRzqo9IuHhU
 C/iQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUwZsGfKtL2Ee/TmKm0KhDG4JvKh8yTY3rjbnnY7/IaPe4znQCuseQkVSaWLAS17vAnmrgrLo9D/loJtg=@nongnu.org
X-Gm-Message-State: AOJu0YxCVfcFq1z2SkzxljwoIJcvhbJZIVtC+YwYVJRtoPNqzc417dXk
 IH+6H1ESawv7VoPRdLaW3o2Lq5TEbcjaTxrD2jK/WkwNBJnE1VoS7YtXS38ZXkKdM0KPOINiAO4
 ozOMZqtt71SD4QI+wYqGqPgrDFCXBnmUhcVka3NTVQ1jpMARmGboHY/8=
X-Received: by 2002:a17:90a:a40d:b0:2c2:deda:8561 with SMTP id
 98e67ed59e1d1-2d646d8db89mr15714473a91.41.1724831798850; 
 Wed, 28 Aug 2024 00:56:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2JrQQJGRZpEtnU+Iuqg2wKgC65zCQObHf+/APfm7PNxJUpyKYxYDP3jmy4R+4M6BaFxzwsQ==
X-Received: by 2002:a17:90a:a40d:b0:2c2:deda:8561 with SMTP id
 98e67ed59e1d1-2d646d8db89mr15714462a91.41.1724831798366; 
 Wed, 28 Aug 2024 00:56:38 -0700 (PDT)
Received: from localhost.localdomain ([115.96.157.236])
 by smtp.googlemail.com with ESMTPSA id
 98e67ed59e1d1-2d8445fbf0dsm1013534a91.19.2024.08.28.00.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 00:56:37 -0700 (PDT)
From: Ani Sinha <anisinha@redhat.com>
To: 
Cc: Ani Sinha <anisinha@redhat.com>, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, zhao1.liu@intel.com, pbonzini@redhat.com,
 armbru@redhat.com
Subject: [PATCH v5 0/2] Some refactoring
Date: Wed, 28 Aug 2024 13:26:27 +0530
Message-ID: <20240828075630.7754-1-anisinha@redhat.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.133.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-List-Received-Date: Wed, 28 Aug 2024 07:56:45 -0000

replace fprintf() with error_report() in kvm_init()
refactor code in kvm_init() to move core vm creation operation to its
own function.

CC: qemu-trivial@nongnu.org
CC: qemu-devel@nongnu.org
CC: zhao1.liu@intel.com
CC: pbonzini@redhat.com
CC: armbru@redhat.com


Ani Sinha (2):
  kvm: replace fprintf with error_report()/printf() in kvm_init()
  kvm: refactor core virtual machine creation into its own function

 accel/kvm/kvm-all.c | 106 +++++++++++++++++++++++++-------------------
 1 file changed, 61 insertions(+), 45 deletions(-)

-- 
2.42.0


