Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jYSDi-0006yH-MT
	for mharc-qemu-trivial@gnu.org; Tue, 12 May 2020 06:33:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jYSDh-0006vR-81
 for qemu-trivial@nongnu.org; Tue, 12 May 2020 06:33:05 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:45912
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jYSDg-0007Vy-I0
 for qemu-trivial@nongnu.org; Tue, 12 May 2020 06:33:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589279583;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FN/9Q7LqiT7yOKM3lyj2/vvjplGjuC96R8PuYHJ2hZI=;
 b=gZIU0Ww45T4NOkydmmW8o3DwsdQh6YE2PlmO9wbkJqyEnzAuKPWPoEwvrsS1lUl/rv6YJ5
 DVphspOgjdWRfOp4CSD1+e18naRMtqbZu96GAs2zlegfaTRv4ZvcFxU9T8AkG/aoo3uLmD
 PLQdUDyds05qxOmcLDkofGQjs75MuxQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-138-eJgUZ960OS28Ve5_LNrTQg-1; Tue, 12 May 2020 06:33:02 -0400
X-MC-Unique: eJgUZ960OS28Ve5_LNrTQg-1
Received: by mail-wr1-f70.google.com with SMTP id f2so6740080wrm.9
 for <qemu-trivial@nongnu.org>; Tue, 12 May 2020 03:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FN/9Q7LqiT7yOKM3lyj2/vvjplGjuC96R8PuYHJ2hZI=;
 b=SdV5KB1jmoqZcR396Yscz+uLxIE4hmOohnK9mATqWTYgilMw8Z7eLcsUUU3RoUKK5V
 PRXT8QG/c3aLtvJ6woGX/Vkv+3flp0/2mU1s6kCN/n0d4R2DOBAKOrrAHCZ+4rD/kdsE
 Bda2f/pil9FVfaTFX39w+QoeUacvXLwa+gY+9zAeAt7vGEfv1ALq6/eydMRdbkDuS5QQ
 dkFdT/Cgn/nJBkWHXXlWT+r8wXoF++6Vf4SHuP7JlggVxr8Zfo4XozEGl4XWjV3Mz2Wr
 O/JpDe0oFI0h15EgJHb3ETJbUTZQ8hbjBxKKFIbKX5DsL7o8k0me92qGYZ7KEDe276fX
 S3kA==
X-Gm-Message-State: AGi0PuYiGmpprnNK8596xn9XNV5DCBfDTjtoglCmQDKArFAh2cUU8WQd
 Pu6+vJDCr9tg5LnNgd7DvpEq3drkfnSzC+rp9tS8tLsfSv7+9I/pvzVI+/TXCsF6tZ6tg49mKnV
 QZ3RTveAfqbia0PBSKw==
X-Received: by 2002:a1c:a3c1:: with SMTP id m184mr18797667wme.91.1589279579782; 
 Tue, 12 May 2020 03:32:59 -0700 (PDT)
X-Google-Smtp-Source: APiQypLoVobmiuPPC5yzEHiFpfHm0s+HDrmev5jafrGVEC8Jo2mwsLRcy5dqC4UGFChZXKNb5cxJ4A==
X-Received: by 2002:a1c:a3c1:: with SMTP id m184mr18797645wme.91.1589279579565; 
 Tue, 12 May 2020 03:32:59 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id v131sm3712043wmb.27.2020.05.12.03.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 03:32:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, kvm@vger.kernel.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PATCH v4 4/6] scripts/kvm/vmxcap: Use Python 3 interpreter and add
 pseudo-main()
Date: Tue, 12 May 2020 12:32:36 +0200
Message-Id: <20200512103238.7078-5-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200512103238.7078-1-philmd@redhat.com>
References: <20200512103238.7078-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/12 02:02:05
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
X-List-Received-Date: Tue, 12 May 2020 10:33:05 -0000

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 scripts/kvm/vmxcap | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/kvm/vmxcap b/scripts/kvm/vmxcap
index 971ed0e721..6fe66d5f57 100755
--- a/scripts/kvm/vmxcap
+++ b/scripts/kvm/vmxcap
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python3
 #
 # tool for querying VMX capabilities
 #
@@ -275,5 +275,6 @@ controls = [
         ),
     ]
 
-for c in controls:
-    c.show()
+if __name__ == '__main__':
+    for c in controls:
+        c.show()
-- 
2.21.3


