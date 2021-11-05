Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mj0BQ-00010N-UK
	for mharc-qemu-trivial@gnu.org; Fri, 05 Nov 2021 10:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mj0BP-0000wk-QF
 for qemu-trivial@nongnu.org; Fri, 05 Nov 2021 10:27:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mj0BL-0008PM-TR
 for qemu-trivial@nongnu.org; Fri, 05 Nov 2021 10:27:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636122421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kRqyJC/JV+6B11q5unZLQCsXiO1VFs66KXHe5SIeVtg=;
 b=BOp0aOa54O62knhxozauVF5VOgjhgOEFEX1lcq5uq7KYS4ASB1B2Eg/Ij1trQKWr0RaWEh
 wEhOtnnrt0mlnSLukNYrW+49p6AgjfgRvqW526zhwG87VmZOPiTo1289+5DusIR2MdYM8a
 /Qynyk3zswhYXJkP6xLQcvjPtd3/NWc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-hC097rCcP5qi76MflG3HAg-1; Fri, 05 Nov 2021 10:27:00 -0400
X-MC-Unique: hC097rCcP5qi76MflG3HAg-1
Received: by mail-wr1-f71.google.com with SMTP id
 h7-20020adfaa87000000b001885269a937so1252179wrc.17
 for <qemu-trivial@nongnu.org>; Fri, 05 Nov 2021 07:27:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kRqyJC/JV+6B11q5unZLQCsXiO1VFs66KXHe5SIeVtg=;
 b=gr41A8NAOo0XtEFrnFyzaV8/ubKvuIEpNVAqYdq6bskWHzVpzmitw2W8kUwESWi6Dm
 5fcNQw1FiymlIJQD79W4lTa5Wn8ksNmwODHbBH5BVkcIjFiYaqLDe7g+vZgpFqJ3zifY
 gP3GL4EW0w/YfYzq9FcS5O2He9QYX+l/eKbE2gT8s4mVa/YYwF44jQahePLK3x7xY6Ol
 0LcC1ClsAs6Xc6M945ytE5nPbov32h01S+fqgb5/RAFRgYZPdrJhsj8/Nu1tdlcjJTDU
 4yP4CV8jf5HaYmZJvkDnh0mxq2iKiVKta0wJNYt3U4Xoi96ZePDfPN7hThbZDyENxKCN
 Dmvw==
X-Gm-Message-State: AOAM5306xrs06WMpoJ8zi8L0xLJjoMzEN6Qe5FHHqX3vU4fgExpBjAOu
 Xsar6USxSdMwIwl2hWmb8AyVQwCOBGknW/j9JuPEQbfEax/LS8xf6x6LgtUpT6tgHG8XgxLStw1
 LFhMZ9zmVS5ISU/784g==
X-Received: by 2002:a05:6000:1141:: with SMTP id
 d1mr1905588wrx.342.1636122419339; 
 Fri, 05 Nov 2021 07:26:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNKA0brfXbUbNdgtoxtTB8FpI8d0pMyjoPIuMqeTYMNNXVtQNlLU1FWwa7fhX0/dDU/+rBjQ==
X-Received: by 2002:a05:6000:1141:: with SMTP id
 d1mr1905547wrx.342.1636122419073; 
 Fri, 05 Nov 2021 07:26:59 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id j10sm8064281wru.15.2021.11.05.07.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 07:26:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: libvir-list@redhat.com, John Snow <jsnow@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] docs/about/deprecated: Remove empty 'related binaries' section
Date: Fri,  5 Nov 2021 15:26:56 +0100
Message-Id: <20211105142656.145791-1-philmd@redhat.com>
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
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 05 Nov 2021 14:27:08 -0000

Commit 497a30dbb06 ("qemu-img: Require -F with -b backing image")
removed the content of the "Related binaries" section but forgot
to remove the section title. Since it is now empty, remove it too.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 docs/about/deprecated.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 56f9ad15ab5..5e514fb443d 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -370,9 +370,6 @@ The ``I7200`` guest CPU relies on the nanoMIPS ISA, which is deprecated
 (the ISA has never been upstreamed to a compiler toolchain). Therefore
 this CPU is also deprecated.
 
-Related binaries
-----------------
-
 Backwards compatibility
 -----------------------
 
-- 
2.31.1


