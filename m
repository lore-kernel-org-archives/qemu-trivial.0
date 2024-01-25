Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rT2gF-0006r4-0M
	for mharc-qemu-trivial@gnu.org; Thu, 25 Jan 2024 11:34:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rT2gB-0006kT-19
 for qemu-trivial@nongnu.org; Thu, 25 Jan 2024 11:34:15 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rT2g8-00027n-Ab
 for qemu-trivial@nongnu.org; Thu, 25 Jan 2024 11:34:14 -0500
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5100c3f7df1so3951487e87.0
 for <qemu-trivial@nongnu.org>; Thu, 25 Jan 2024 08:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706200450; x=1706805250; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=anUa6cuHSmZzzEibxDgwncRp2+N6Aqc5mYUw8MYy6MY=;
 b=MM4SVWXs+fX+UNG98SQN+nuhHOdoEZ0UZN8CCGp19RihZ5wOiV/zXvZqcicT4xpga7
 YJj1NNStjfoXL/gLLknanQLBtkiq3Bmm0cmUisw8IRvnE/SqVEAWyQpL+eShGtrLth0P
 b6q2P4khUCJNkKZJG3QTTJgb0OztLxpPTzh7/imjbc43bZXaSAw2Dkr70N7rhyd5jkn8
 G0YNb3C8jIToUu9HXm8IqJDkXxUhTVqhTB2bQExELsk6+HIUoUgO4DD9v3iD8HrSU8JP
 ia5sCaXm5phomK+mO1IzG60nSen0Mr9eCKhPMpJMwEyAT2y8Y49d1zsmqDewtfoWMtAZ
 O5FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706200450; x=1706805250;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=anUa6cuHSmZzzEibxDgwncRp2+N6Aqc5mYUw8MYy6MY=;
 b=lsw/Xf6CLFMUNQ/HVAAZLCt0LhDnJ7m6TOFlMKVgl48ewzAq0hcDfz4BM4YdieMUN0
 ci3SzRuyV1OW9IgyvMF+4RAJFYHnjmjS+GC66QLKbYbab2okIK9T/qyscdsPeCfc6Vne
 8p2DPuPbiUMBprPJAqa+42O/mSNy0x/DcUcZwPRIU6kN8/Skw0egHmPoyl9fnWVo+t6q
 m0ZS02PwpPrT0GsifejwOIbA2N02cuNsRTJ2hEsArZDp6x5aPwDE3SJZFrHA5SvPXHAJ
 BuEFEYX/9cpu6GvnUia6jFOi5C9ntMLFGccIyw3uzwdbVYa+NIOD1iwLi/9udnT0Csch
 OAHw==
X-Gm-Message-State: AOJu0Yxf99Qu4xb1PdAwVVLVk1H5oxf4Su4YIcp4vNWhJzkQ0yzci97a
 0ELPoc/8wEAsTkeAkL1uzc+4yoMvXRAknws31IY6+z0d1LJGJn5t4VK5igpKUjc=
X-Google-Smtp-Source: AGHT+IHwcJqJ5SFW62w37TyPL/UHvQi9LPJAKHrx3io3CMfSvUeFz5TXNGSQOMOxZ3O1i4q9rYhczw==
X-Received: by 2002:a19:3849:0:b0:510:b6f:bec6 with SMTP id
 d9-20020a193849000000b005100b6fbec6mr56558lfj.39.1706200450062; 
 Thu, 25 Jan 2024 08:34:10 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c358d00b0040ea875a527sm3122208wmq.26.2024.01.25.08.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 08:34:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Subject: [PATCH 01/10] scripts/clean-includes: Update exclude list
Date: Thu, 25 Jan 2024 16:33:59 +0000
Message-Id: <20240125163408.1595135-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240125163408.1595135-1-peter.maydell@linaro.org>
References: <20240125163408.1595135-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-List-Received-Date: Thu, 25 Jan 2024 16:34:15 -0000

Update the exclude list to exclude some more files which don't follow our
standard #include policy.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 scripts/clean-includes | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/clean-includes b/scripts/clean-includes
index 58e1607a82e..bdbf4040240 100755
--- a/scripts/clean-includes
+++ b/scripts/clean-includes
@@ -51,7 +51,7 @@ GIT=no
 DUPHEAD=no
 
 # Extended regular expression defining files to ignore when using --all
-XDIRREGEX='^(tests/tcg|tests/multiboot|pc-bios)'
+XDIRREGEX='^(tests/tcg|tests/multiboot|tests/fp|tests/plugin|tests/uefi-test-tools|pc-bios|subprojects|contrib/plugins|tools/ebpf|ebpf/rss.bpf.skeleton.h|linux-user/(mips64|x86_64)/(cpu_loop|signal).c)'
 
 while true
 do
-- 
2.34.1


