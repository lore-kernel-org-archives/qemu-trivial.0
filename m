Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nlymg-0001mm-RR
	for mharc-qemu-trivial@gnu.org; Tue, 03 May 2022 16:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1nlyme-0001cd-KX; Tue, 03 May 2022 16:06:08 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:52956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1nlyma-0008Qt-0Z; Tue, 03 May 2022 16:06:08 -0400
Received: by mail-pj1-x1030.google.com with SMTP id e24so16285834pjt.2;
 Tue, 03 May 2022 13:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CdOKV/thj8b18wgN2+zK8yNjMAUbJZ9uaJbaHRQKzI8=;
 b=OqUNV4VNDJQfS/c0EutpsebETsyoP1/QQ58yceVaFyZAqvV6oFb7qmO2T4L0qXYXuJ
 nLYoAzPOHK2qnv77oNtPNLNmni1fDKzx9bxoJSAVL4Q3gt/U4PBQdqY0BQWP10O90jSu
 z9ai/C1189QkmX69L7GVwzv5Md8UtZ9Ghq2bXTs+ZP5us8C1UnhGExnWlvW9e9z9CjwY
 PgqvKzLtSpuOYSbecgvP06WJXL2uLld5NspasIt3/NkYAVg2M8RFVlooM2xLT6xhZ348
 hv270JcWBzq2VEejF+C0VlTEGZvZFp8OYTJB6lCH315qsCoWpIG5QPPoaPViTOAjB1fc
 1p7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CdOKV/thj8b18wgN2+zK8yNjMAUbJZ9uaJbaHRQKzI8=;
 b=Ay0aWAbFSvwrroENZDIu2jHMclzth/YeKEeMZhY85q5oPjuFsV4wbQUwK+7KUYQhfn
 ke4pc9UqIe99XDlQxB848Ci4BAD4baxcavo3u5AwMv7jDLAApZ8kfqcwV5Toq8s5jdLH
 6NEejQ7PyaHTeODMxuFTYBN/8Ibv+1WQvQU8kX1ArYW1iOaVGcliXnULtKA9g8FfhdhS
 TCgHenuSFKoiU1eux+bCrGsr353JKWdWrCB3jIa2h6dYU044tGK44tv2981haRO7vcL2
 gFHmicn7e+/9qiiC2z+SpY5y47LPEYatiP/YnILBaP/gto1SosBJtGgyliUAlOV/wvWV
 31Jg==
X-Gm-Message-State: AOAM531zQ/q+TCAejiRLo5LBS9nBKSqutPvyWplDLHNH6jy1k+f0uuSW
 eSvommtb//v8HgqzYVDSwEFcq7Zmgls=
X-Google-Smtp-Source: ABdhPJz6F4Juf8zq90qBWwPyRPlw/i8CkLLV57B1gVnvuW0oFIAQc29Ba2YnDBtnjkjahbbGeHY76A==
X-Received: by 2002:a17:90b:3910:b0:1dc:515e:1b12 with SMTP id
 ob16-20020a17090b391000b001dc515e1b12mr6563372pjb.107.1651608361516; 
 Tue, 03 May 2022 13:06:01 -0700 (PDT)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id
 q26-20020a63505a000000b003aa8b87feb5sm13670148pgl.0.2022.05.03.13.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 13:06:00 -0700 (PDT)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 Yonggang Luo <luoyonggang@gmail.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 2/2] gitlab-ci: Upgrade mingw base package.
Date: Wed,  4 May 2022 04:05:24 +0800
Message-Id: <20220503200524.1868-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.36.0.windows.1
In-Reply-To: <20220503200524.1868-1-luoyonggang@gmail.com>
References: <20220503200524.1868-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
X-List-Received-Date: Tue, 03 May 2022 20:06:09 -0000

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 .gitlab-ci.d/windows.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index 1df1630349..47f6073773 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -16,7 +16,7 @@
     }
   - If ( !(Test-Path -Path msys64\var\cache\msys2.exe ) ) {
       Invoke-WebRequest
-      "https://github.com/msys2/msys2-installer/releases/download/2021-07-25/msys2-base-x86_64-20210725.sfx.exe"
+      "https://github.com/msys2/msys2-installer/releases/download/2022-05-03/msys2-base-x86_64-20220503.sfx.exe"
       -outfile "msys64\var\cache\msys2.exe"
     }
   - msys64\var\cache\msys2.exe -y
-- 
2.36.0.windows.1


