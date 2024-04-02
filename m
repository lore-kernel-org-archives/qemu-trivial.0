Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rrcQu-0001pn-3V
	for mharc-qemu-trivial@gnu.org; Tue, 02 Apr 2024 07:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rrcQo-0001X6-Ln
 for qemu-trivial@nongnu.org; Tue, 02 Apr 2024 07:36:01 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rrcQm-0007uc-6Y
 for qemu-trivial@nongnu.org; Tue, 02 Apr 2024 07:35:57 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a46de423039so291834666b.0
 for <qemu-trivial@nongnu.org>; Tue, 02 Apr 2024 04:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712057749; x=1712662549; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VWutY8z9bkN7X3i9ljyrwrRwmS6njDciQ2k14IDKqCs=;
 b=H4pK7QpMvixMEkcPMyeivtmiz9sNwrD55jjAd0rq9V1WDFc8V6ZR3Ol1hFNCuE1xc6
 FVyQrmtseHit9+LRoKir4CZSBFfa0OtBCkEixmgFJf0MEylOL/Ev6X4Tphbud6Dzd+Nj
 EFPG9R2xECsD3sSfB76nol7PlEGTOFz/xEb/+NdtrqpiwJ2q5rw7HMgPPkuEeJnl8WpV
 rRV2ouJgUaC/zOJrmWO3SzlVZR9Pq0uQ9lbBHxkLlIf0FJhlkl9xx8mW7A8HE1duq5hp
 xUxYUrMjRJfIHXzBPJgjT6OAsp91/PJpgO9FbfqpsVg6Be8sdJ2QEu98uQafirZiCQ8M
 iv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712057749; x=1712662549;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VWutY8z9bkN7X3i9ljyrwrRwmS6njDciQ2k14IDKqCs=;
 b=Y3LbLN5V0oob12rtSzJHq+hglQ1EuQ/58UKZmsOvGBGc2DhAjesTQfmn3d5Q7kbkDq
 VmdYp/gYoT7WVX4twX+b2+Ix7HKeTW5S/knClAhh21ky9ULzUDNgz7I+ZeD+Ojtb1DSY
 0UWGt5oH5g0dwT/zU+SfEsNfQij1wopo9aC7EdJzFkAdTFCV6rP3pJalGwGT/tHPhujp
 iRJZnWl4znflDQyyXTmYjN+MVvSKDkgC586I2/RPmOs2ltnUTbiJpNMujOMPgU1Uat2l
 yIZeCVkrxLegqGG35Yr4j7FufQFtDBL8TXrSddr6LI6BAe5QoZ/a45Uv3D1uF89heJoJ
 Queg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGpvQdPRZ28CO9YGH6Q6pf7CaS1ICFDaTBRCZUl7ZkT3WO0NBAaiDz4+sVV5I1lY+/0plaVw2qXPz6Xcm1TMF3nlbBaQoBxA==
X-Gm-Message-State: AOJu0Ywc1Cvo5wLjIMa/jZRqTZHXTm30Eyb8rVK3PZXh1qnq2zX7czNm
 AX7jR8l3haGN+RbMCz0W9CppLw51728+6erJF05vLBb660xw+KLpFd5zcjAn2OERR3CP4RRGEEv
 +6/g=
X-Google-Smtp-Source: AGHT+IEQsg21cB6W9vrfwrwLITswJ7VcBzCSo3sy77cqGUdeuomccEaiW/O+xtz1TxqFimULyCkwuw==
X-Received: by 2002:a5d:4c44:0:b0:341:906b:3351 with SMTP id
 n4-20020a5d4c44000000b00341906b3351mr1302992wrt.0.1712057419779; 
 Tue, 02 Apr 2024 04:30:19 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.202.91])
 by smtp.gmail.com with ESMTPSA id
 bo15-20020a056000068f00b003434c6d9916sm5496356wrb.110.2024.04.02.04.30.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 02 Apr 2024 04:30:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org
Subject: [PATCH 0/2] scripts/checkpatch: Do not use mailmap and check
 qemu-trivial@ author
Date: Tue,  2 Apr 2024 13:30:12 +0200
Message-ID: <20240402113015.66280-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 02 Apr 2024 11:36:02 -0000

- qemu-trivial@ is not checked
- mailmap hides the mistakes we want to catch

See https://lore.kernel.org/qemu-devel/60faa39d-52e8-46f1-8bd9-9d9661794880@tls.msk.ru/

Philippe Mathieu-Daudé (2):
  scripts/checkpatch: Avoid author email mangled by qemu-trivial@
  scripts/checkpatch: Do not use mailmap

 scripts/checkpatch.pl | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.41.0


