Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uClfR-0007O2-Ut
	for mharc-qemu-trivial@gnu.org; Wed, 07 May 2025 16:47:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uClfQ-0007Ik-9O
 for qemu-trivial@nongnu.org; Wed, 07 May 2025 16:47:00 -0400
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uClfL-00037o-Pg
 for qemu-trivial@nongnu.org; Wed, 07 May 2025 16:47:00 -0400
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-2d5e5e21b92so234854fac.0
 for <qemu-trivial@nongnu.org>; Wed, 07 May 2025 13:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746650814; x=1747255614; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ub+oD40WAPydF2GdZl0ptFBPrvXnH1JqhWmWJzcddoI=;
 b=e8/mSVF9+A6wqmpQ+f4UaBfwu1fLgh2K7kfLF9puEq5aA6uU8W+v6WvDqqCxVIQU9E
 2eKt4ORcMPUd57yI7+W+FSAijFG4LvGTvb8Ee79bKZW86wynpyGjKBvEHaRuHsxu5PRR
 9XX9daedTqAE/dd1qwZsAlBU24CaCZMqYSipUjqbp/ZiMF0CWGlueNcbde+raoVN17Bm
 CaOTax8M+n/Efk3zFw1uXcImOFBQ5hrLIqJJ27L00mgOLiB2k2RShLHjWlYk62ByaVzR
 MhXpP154uz1zQDaNdh3BId+9kgKC1pksGgftMXaiFIIzQeXESgOefpXyK/WoszDWrTGt
 0F6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746650814; x=1747255614;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ub+oD40WAPydF2GdZl0ptFBPrvXnH1JqhWmWJzcddoI=;
 b=fxhOthmQav3H1TtupGfgakvWlIQd3RMOoqRcEGUIMXsC+DvhHVrzf73bL1tzD25dal
 aYOna/BiuoxWE/qMRSE0x61ag56UQvJsnJr/jbK3GwQnRKmGL/WIdA6J4YCv8Qx0TkLm
 BqqeZt8698RkB1VjChcNDNK8l9DeUrAcd7bMbFVGaO68sCr9j+b6tW7Il5Kopm+BqrcK
 Ot1vhjhh4Bbpe8pkn9UkbrJj81jwmdhlZvdGZvgyIvnmnGHfZ/9s9AEXwJugiCQ3NuK/
 XYye3not3iD1F6xiKw/axeHN4nN1YVnJVudQTcOLI4AlBWtVW+MbC6AFFGIFzGBz1O6U
 d9tA==
X-Gm-Message-State: AOJu0YwJ6ztKRAmYJCwstuebHEis8AI6kMBf20EGxGoxNH/EfmI3BRD3
 YrfrQqbew2FEq0NxvmFbMpamtBMrYH8ZHXZ0kdqDZk0hXxINkIY3JwCggJ+fsh8=
X-Gm-Gg: ASbGncvYlp992Mm1BIQLr1rPvTLS2bgJXrZaltWmPo+4Z0S1nT6Fi1KahR0to/1skwc
 W2Bz1I7GV5fc8ppmE1v/NX5awnXpLfCQT46J/A/uhTfoq2cYAZf8SGZMzVzwO7M1ujFSPFrOtiF
 rUDh3gRCiyS3wYbbUdcC40a3AISateNiOpzByAnhDLvwhkeuZueTND7ehL+ml4qChs4b+zywra8
 2viJL5gHtDCgpaex9NwU1e3fYoGdFiG5h8XFGt5DA7aUwgGixqIqVQrg5CyspsaZj7s18Mnqrz2
 Z0qu2TNOeP4TmjwknAoZRXox1kX8j2vdh0vbW3NVhlRrxa2x
X-Google-Smtp-Source: AGHT+IFc0VU0cXn+LODppNE4D0mvR3Cn71Aqv1XwI4RBdk+TxcW3ZHpqblag3/GGMH0TyqyVWq8ZLA==
X-Received: by 2002:a05:6870:7308:b0:2c1:4090:9263 with SMTP id
 586e51a60fabf-2db819c5a58mr639531fac.35.1746650814007; 
 Wed, 07 May 2025 13:46:54 -0700 (PDT)
Received: from gromero0.. ([200.150.181.215]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2db5cbc7d1fsm920933fac.11.2025.05.07.13.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 13:46:53 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	thuth@redhat.com,
	gustavo.romero@linaro.org
Subject: [PATCH 1/3] linux-user: Fix typo in comment
Date: Wed,  7 May 2025 20:46:24 +0000
Message-Id: <20250507204626.139507-2-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250507204626.139507-1-gustavo.romero@linaro.org>
References: <20250507204626.139507-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::31;
 envelope-from=gustavo.romero@linaro.org; helo=mail-oa1-x31.google.com
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
X-List-Received-Date: Wed, 07 May 2025 20:47:00 -0000

Fix the duplicate "of" preposition in a comment.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Suggested-by: Thomas Huth <thuth@redhat.com>
---
 linux-user/mmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index f88a80c31e..002e1e668e 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -645,7 +645,7 @@ static abi_long mmap_h_eq_g(abi_ulong start, abi_ulong len,
  *
  * However, this case is rather common with executable images,
  * so the workaround is important for even trivial tests, whereas
- * the mmap of of a file being extended is less common.
+ * the mmap of a file being extended is less common.
  */
 static abi_long mmap_h_lt_g(abi_ulong start, abi_ulong len, int host_prot,
                             int mmap_flags, int page_flags, int fd,
-- 
2.34.1


