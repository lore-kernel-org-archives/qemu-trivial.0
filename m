Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qeEeZ-0005iP-Gn
	for mharc-qemu-trivial@gnu.org; Thu, 07 Sep 2023 09:02:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qeEeK-00056d-DT
 for qemu-trivial@nongnu.org; Thu, 07 Sep 2023 09:02:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1qeEeI-0007ZK-Bu
 for qemu-trivial@nongnu.org; Thu, 07 Sep 2023 09:02:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694091737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pKDzeQlctpkUAsMmGfN8p0M9I6HUXPerO0NUMxheatc=;
 b=fhbj10FLBjRMLwgObkU7AbI7eMURscZNpIlMhpM1R4lLter3zliEv1A5/pW3ZXn65hVnjl
 9azuPj5KwLrKnoqsAjTaoiuKNoA0vXBDzu4SHKpgLSQk51uwOIz4qx8BjOXnZ2IeBm1loz
 rE/S0iJDPyVU9VwxKVJ5RJV5buUdrmo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-Lgr0v5nIP1218wyZD43eHg-1; Thu, 07 Sep 2023 09:02:05 -0400
X-MC-Unique: Lgr0v5nIP1218wyZD43eHg-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-401db0c9d3eso6903655e9.3
 for <qemu-trivial@nongnu.org>; Thu, 07 Sep 2023 06:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694091723; x=1694696523;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pKDzeQlctpkUAsMmGfN8p0M9I6HUXPerO0NUMxheatc=;
 b=kcykOvSkwhXV1fziMft1MxNRW+xUCvR3OhtLXpLGjj02UVNUYXp5yHJZxy2jGaF4bS
 4v9Kk0e0cDQi60+dptfIHDBjPfX20U7ZWmGup5Wiv9Tfs+zsNcEPe78TbQ2auW3GpG1f
 qU//eHWij0QR6wEQLVrVeq8no2gd5CFm73Ylt/r9j2tZMgs8DWsUL/spnFbCdfR4ttkX
 OJoem9mTUxopDGTX9XrTGPMk0+MgztEOLOhPax8CWd/Ny8D4qn+a/gSzzcSVhpMi6pFC
 HQORs54flSjDeXGYizdIOK4/w4SD/twQOeeZIhtYEAI+cLDmT+cfwUqDQG+x9FneI4IU
 K+jQ==
X-Gm-Message-State: AOJu0YzSO/lsrQp9GcszOeCACjjHWARtlUUegXxmI4JAWzPZ3zuMOo5b
 7jtiQDbclI7dA/yv6xd+nZ66YO5FoTeo+aekv2H7b95rETlSmH8dutI87SN6fk+PNxcP2r0WOSg
 RdSfi8jwOxpVUhbYYQQ==
X-Received: by 2002:a7b:c8d6:0:b0:401:4c61:90ac with SMTP id
 f22-20020a7bc8d6000000b004014c6190acmr5058148wml.11.1694091723580; 
 Thu, 07 Sep 2023 06:02:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExU/oI2neSkm8bqrOHI8OYHRclQ7ocSMwwwxfuwHaaftKMd3OQVTpavSGuSEtvCgHI1wta5w==
X-Received: by 2002:a7b:c8d6:0:b0:401:4c61:90ac with SMTP id
 f22-20020a7bc8d6000000b004014c6190acmr5058128wml.11.1694091723314; 
 Thu, 07 Sep 2023 06:02:03 -0700 (PDT)
Received: from [192.168.1.174] ([151.48.237.81])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a7bce12000000b003fc01189b0dsm2436081wmc.42.2023.09.07.06.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 06:02:02 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PULL 51/51] docs/system/replay: do not show removed command line
 option
Date: Thu,  7 Sep 2023 15:00:00 +0200
Message-ID: <20230907130004.500601-52-pbonzini@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230907130004.500601-1-pbonzini@redhat.com>
References: <20230907130004.500601-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Thu, 07 Sep 2023 13:02:27 -0000

Cc: qemu-trivial@nongnu.org
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 docs/system/replay.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/system/replay.rst b/docs/system/replay.rst
index 3105327423c..ca7c17c63da 100644
--- a/docs/system/replay.rst
+++ b/docs/system/replay.rst
@@ -181,7 +181,7 @@ Audio data is recorded and replay automatically. The command line for recording
 and replaying must contain identical specifications of audio hardware, e.g.:
 
 .. parsed-literal::
-    -soundhw ac97
+    -audio pa,model=ac97
 
 Serial ports
 ------------
-- 
2.41.0


