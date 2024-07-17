Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sU5Cx-0003rA-Fn
	for mharc-qemu-trivial@gnu.org; Wed, 17 Jul 2024 10:00:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sU5Cs-0003qP-2C
 for qemu-trivial@nongnu.org; Wed, 17 Jul 2024 10:00:34 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sU5Cp-0008Rw-Uy
 for qemu-trivial@nongnu.org; Wed, 17 Jul 2024 10:00:33 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-427c4843df5so4297645e9.0
 for <qemu-trivial@nongnu.org>; Wed, 17 Jul 2024 07:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721224829; x=1721829629; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FHIcAsY8i/uctUZuPeh8Vzd8dmu0Izzx+CInGK+n1jU=;
 b=N2HSN4YGVYYQLY9fwDMPiRIlVrEIkB0wBB8oX6NlML0nv6/pBRkM1Tz31G90THabAp
 sITAkn1l3QB4DWeIwwdb4JdbJfBKeZRO35bLpkeOE0cvewJ1CYGUh91bauUeIGXFoGFf
 QRMG+oqQhp/FNyKFTbmMWYPeOIjrQu/l+stwXLdzs7BtSlh2rUDG24mZ7kX0LsSHz1mR
 nbgUwzE3NBM0vpYax6mMHKxL6SGcfB9chgLUuo6nUxdt2Gzsuzdw/A4hsGr11TEI5ZFS
 mgTkd/Y0j5v7VT1qe+hf4adktuxylINyju1EKMIn2DcKwn0bL34Uzx9zPoF/VkCJvSJT
 JDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721224829; x=1721829629;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FHIcAsY8i/uctUZuPeh8Vzd8dmu0Izzx+CInGK+n1jU=;
 b=rRpl1HtPmIv3C7QNuq2fQdYY1q+fvfqmeFOvZOHiYZ63eqXi8IZcazTxBmGFsFjkXC
 Jd5N1ueSVhwUZ5NByXT27VRajRMrOKGCVgsxd8BnZaCfp3PWpwFS8botSOO/u6NXM1Ep
 mTch79DfK19Gu6kM/OFbc4u1WyZfZ+utDr4jQYL/IXSpbua12pmybrLtq8XW+yL8MnqD
 OAupn8K7ecmmDa3rtpVo+tIf1DJsc8OOTTPF74RGTlFS0SbxdQ6nXjPzVW0kBBoPOxGM
 JPGAYhjjcg6QB/8EkvvcU49RkgjiDmEe78Se22pKP9QJLeGUVvHjnBN0X8b0H5kt3dRR
 bAfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8+F4GhkVBKWKEro//yLGZicjRLxq3hz3WX2ACKuiNgT7O4D7IxTZiGu2EcWXkifhI7WWVUozaRrEZ8ei3pDOkokqEJ/8L9w==
X-Gm-Message-State: AOJu0Yzowrhemk7kfcF7J/4BsxWlzaTwqdU7L4+swlECQ0EfgXs259i8
 KrDgZP6bC3v+w6DcEf+Uv3PkU3AFZS5NTd3EXhHkYmcEElEx75KR8Pj4+F+So7Y=
X-Google-Smtp-Source: AGHT+IHYjJJELgTXrMKTjxA122dyrxiF4b7r14wjlGidgbOSH95I18aBqD6AGJ1KRwmZKxDiMBxIHw==
X-Received: by 2002:a05:600c:4f56:b0:426:6f17:531 with SMTP id
 5b1f17b1804b1-427c2cb15cbmr16078185e9.13.1721224828687; 
 Wed, 17 Jul 2024 07:00:28 -0700 (PDT)
Received: from localhost.localdomain ([176.187.208.21])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f27877dsm202323515e9.26.2024.07.17.07.00.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 17 Jul 2024 07:00:28 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, Dehan Meng <demeng@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] MAINTAINERS: Cover guest-agent in QAPI schema
Date: Wed, 17 Jul 2024 16:00:25 +0200
Message-ID: <20240717140025.66397-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 17 Jul 2024 14:00:34 -0000

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7d9811458c..af4db698de 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3219,6 +3219,7 @@ M: Eric Blake <eblake@redhat.com>
 M: Markus Armbruster <armbru@redhat.com>
 S: Supported
 F: qapi/*.json
+F: qga/qapi-schema.json
 T: git https://repo.or.cz/qemu/armbru.git qapi-next
 
 QObject
-- 
2.41.0


