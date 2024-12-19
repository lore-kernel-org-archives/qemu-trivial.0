Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tOIBy-0007La-Ez
	for mharc-qemu-trivial@gnu.org; Thu, 19 Dec 2024 10:11:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tOI2c-0005sw-Oa
 for qemu-trivial@nongnu.org; Thu, 19 Dec 2024 10:02:18 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tOI2b-0005kL-7U
 for qemu-trivial@nongnu.org; Thu, 19 Dec 2024 10:02:18 -0500
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-38632b8ae71so708767f8f.0
 for <qemu-trivial@nongnu.org>; Thu, 19 Dec 2024 07:02:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734620535; x=1735225335; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VPqPkmRu06PLtD07PG3Rk588BhAhOdUz1634l2fW0GY=;
 b=HWVeSetfFUiiaGFShKJ7nQq6n/5+r9gwKz1nTF0+8ZRbKq4iTn1/37l0YXtpDgRwI8
 0NzoPGkfWwoCQYpHBajN3PPEcBO83Ywzg5H8YePBp6zQdbmvyiLlv6CVfX2442vKWiXA
 eB9HqJWI773z5ROP/rZPT2TTJv/l66IP/zLbetJUjMnAQDFjAwJSZ7Z1uJpMaq1NCMPF
 Za4WXmOI79P3T4UIikMAi/x3+s4a2iQ2YaMytzQtdDyEpxfZzweFHkWb/yQfosIvrbLu
 UG293jcxESo5CYOV+L5XmproxvgQ9W78OLItmeM1jV8qU6GSjhigM35Qdy96MKdAjjYk
 kmPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734620535; x=1735225335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VPqPkmRu06PLtD07PG3Rk588BhAhOdUz1634l2fW0GY=;
 b=ULi0A9drA2ro67q5aS4JLNuYqnDdnfk1AaUexhsOPP64R6oIbxgqUMCb5IjgKv/kpw
 D89KMUJ+NQCnErO2ofp3O9Sf4wB/cMwORwwTmyyDrMJvbVPewSquaNRlhe7+OyRtoZKj
 RfyyKRgKvbdEmkq0EpJoW3k/7FuTQsxCuyjxUqb1qT0jZD70PQg9ui9U54QwBjqrdN6j
 rR+DzcRMAS2qwRqbL62LrCKgCflzhEnYVDGKxvMe5SHAvnm6SqOSQU0TpPoDsEv1+APv
 mduT72YwKQ0JAqEFFfPveKxqg6DnPl5WFeWOER0DjrZjWzrlvQyvLouMwoC1ADcvplPK
 ccRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuI3Ih35Ht1DNEyV5RDppoWDxv+8V+UJBnYWHkwTQ6EERidZJz1QhutRvRtmExE7DcA7RdQBfspJr/BcE=@nongnu.org
X-Gm-Message-State: AOJu0YwgvavNh2/oA4uDSs7C9GIeiecgYg1ZTqBpoT8fojjS/Rhxfh1k
 sF1w9/qIZhJqQYmMt6rFfjgobgz60/Gale3PW84APeWBGUKANLRfXGF3guoAPc8=
X-Gm-Gg: ASbGnctef0XWAr8d8ZQuiV+XZWspkOfN+x5dZvGiSrm9OYt0TUccYdno29RZiyu8Z7J
 32UjN4sL5oMGCmUBwV+iZYs2Se5VJ3LSB9rQMsmgHIBKoH9/hKqMUslzYsV235UXvucn+PAsKgw
 1DcrwaKa1AKtpqlf57FfLAYW6FF8b03OmNzdc4/9Lr0/GqG7oHF9Srw0Z1H8Ho2ScOneQ3PzV+i
 9ScgNhc9MxYnjvwdhEyC1U2ew25U4+47hpPX7T96uD1wFUP86U3cwkUDMy8VTZg8HHCADdLIaeC
 FsGN
X-Google-Smtp-Source: AGHT+IGLoCDAI7+7/qRP8XJ1Hp27f6ADvI/B9bhtUf3E7A2xeNPLoE1KMGzGhPOyBtMhXVXNSi2cew==
X-Received: by 2002:a5d:64a7:0:b0:385:f560:7924 with SMTP id
 ffacd0b85a97d-388e4d30f16mr5741383f8f.4.1734620535409; 
 Thu, 19 Dec 2024 07:02:15 -0800 (PST)
Received: from localhost.localdomain ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366127c493sm19969735e9.28.2024.12.19.07.02.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 19 Dec 2024 07:02:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, devel@lists.libvirt.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/3] docs: Correct release of TCG trace-events removal
Date: Thu, 19 Dec 2024 16:02:02 +0100
Message-ID: <20241219150203.55212-3-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241219150203.55212-1-philmd@linaro.org>
References: <20241219150203.55212-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
X-List-Received-Date: Thu, 19 Dec 2024 15:02:19 -0000

TCG trace-events were deprecated before the v6.2 release,
and removed for v7.0.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/about/removed-features.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 68fe0b47f9f..e3a87f3f555 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -1087,8 +1087,8 @@ processor IP (see `Intel discontinuance notification`_).
 TCG introspection features
 --------------------------
 
-TCG trace-events (since 6.2)
-''''''''''''''''''''''''''''
+TCG trace-events (removed in 7.0)
+'''''''''''''''''''''''''''''''''
 
 The ability to add new TCG trace points had bit rotted and as the
 feature can be replicated with TCG plugins it was removed. If
-- 
2.47.1


