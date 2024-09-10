Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1snzPj-0004JI-Tl
	for mharc-qemu-trivial@gnu.org; Tue, 10 Sep 2024 07:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snzPO-00043X-8l
 for qemu-trivial@nongnu.org; Tue, 10 Sep 2024 07:51:47 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snzPM-0006We-43
 for qemu-trivial@nongnu.org; Tue, 10 Sep 2024 07:51:45 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a8a6d1766a7so81155666b.3
 for <qemu-trivial@nongnu.org>; Tue, 10 Sep 2024 04:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725969102; x=1726573902; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jXVRH9YeP0ZiPm2lygL9nbSRmpHSfMI7+KyJVmSsa5o=;
 b=k20B9Ic2+PjXDq9gym96FkYd0llwBrvuVlwCBjcW6xIKhiaaJs2jLNWeqO9hGouCHb
 V8cD1gvRTAChtr1p0sqyBER4Hdmnx2e5SuUHSi6YV2jrGie3sLEZN4PlErIuXjZPU/9A
 pUYnT/zZS09mDwnkRLmyh8p+EXTJDWicvHLMy6BsmeAfn/V4r5CZ2L+QFhoqrgNCHNg+
 5lAxypdrqA8WZ+AZcsEwE35xqwUvFvaSQf8sBd1wyqv+4/qawwPYczvXbMP+nzja0I5S
 UuMPc1IwFpICYfnif+ru6i3BgSpa9OmvZjG5HZgDlcJ94PCWVmOXOSDAac0Wz7otC7IY
 OQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725969102; x=1726573902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jXVRH9YeP0ZiPm2lygL9nbSRmpHSfMI7+KyJVmSsa5o=;
 b=ZY6lJnKqREcxix2cyJ4YxLNeelIATvtWui/mR7SNeOjyDWOmmpJVYGbb9XASFhgG/u
 J3mtmkZ89fPphqB1udJFzLsVNkjDDqevGluQd1xKN6a6sBb4vWQF9xdxYx3LGgNkSrH3
 /pUG9lONQ0aIIXMNIQk3HjlyP592I7fq0wEMWEFqTNMN+qMCwA8NdTc+1fzTuMYGXHIP
 kMu16HxYfO9NOChfwpJOQpN++7GfVqXFdWB93zzD9CQmJNNZHS4aekZR04fmIwfGJekS
 cNms9b8hVFzZ3g8aDwGqiW/DFhi6J70aXv/TMzCQRcx6G3+y2xloOGXet/p6EbpICZ02
 FiWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaDzzdCG56Vb6ATVpSycShtJUG0PAJ3HhWek4SeFId87Wn9miHZBrc/BKGprNrY+KXXeTo+Yh0KiIJBIY=@nongnu.org
X-Gm-Message-State: AOJu0YyMsppxmz1AGR5cjCaWkmB/+K2kojKdworrwruoz53fVsBOjBim
 kMUxUnqxirjB4FrW339WeNhv9zl6q89V0CrqbDTVS1OsiL/JPOkMl9oIeJeY0s4=
X-Google-Smtp-Source: AGHT+IHANiqzoDhLHXkZ+7YDJTBf9QB5nv+4ZFl+FghKC5mMc1hNExSS+O15VQg1lfHahdvDTYlmIw==
X-Received: by 2002:a17:906:f5a4:b0:a7a:9ca6:528 with SMTP id
 a640c23a62f3a-a8ffaaad1d0mr44706766b.11.1725969101866; 
 Tue, 10 Sep 2024 04:51:41 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.217.32])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25950cdcsm474155966b.58.2024.09.10.04.51.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Sep 2024 04:51:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/5] NSIS: Simplify license description
Date: Tue, 10 Sep 2024 13:51:27 +0200
Message-ID: <20240910115131.28766-2-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240910115131.28766-1-philmd@linaro.org>
References: <20240910115131.28766-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x634.google.com
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
X-List-Received-Date: Tue, 10 Sep 2024 11:51:53 -0000

Since the "2 | 3+" expression can be simplified as "2+",
it is pointless to mention the GPLv3 license.

Add the corresponding SPDX identifier to remove all doubt.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 qemu.nsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/qemu.nsi b/qemu.nsi
index 564d617d11..b186f223e1 100644
--- a/qemu.nsi
+++ b/qemu.nsi
@@ -7,7 +7,7 @@
 ; This program is free software: you can redistribute it and/or modify
 ; it under the terms of the GNU General Public License as published by
 ; the Free Software Foundation, either version 2 of the License, or
-; (at your option) version 3 or any later version.
+; (at your option) any later version.
 ;
 ; This program is distributed in the hope that it will be useful,
 ; but WITHOUT ANY WARRANTY; without even the implied warranty of
@@ -16,6 +16,8 @@
 ;
 ; You should have received a copy of the GNU General Public License
 ; along with this program.  If not, see <http://www.gnu.org/licenses/>.
+;
+; SPDX-License-Identifier: GPL-2.0-or-later
 
 ; NSIS_WIN32_MAKENSIS
 
-- 
2.45.2


