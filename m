Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1uClfQ-0007Jl-Hq
	for mharc-qemu-trivial@gnu.org; Wed, 07 May 2025 16:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uClfO-0007Ce-Kh
 for qemu-trivial@nongnu.org; Wed, 07 May 2025 16:46:58 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uClfJ-00037X-Dl
 for qemu-trivial@nongnu.org; Wed, 07 May 2025 16:46:58 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-2c2c754af3cso340733fac.3
 for <qemu-trivial@nongnu.org>; Wed, 07 May 2025 13:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746650811; x=1747255611; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EhPrnWrrEa3D6POxudXMd7e4Z/b8W/qudNgP3sQ1aLE=;
 b=vQFELfWQtJi+uqYsJ273wSSgYFHbfZZlAi91CbPHlbnlar8j6QaP/ypmW+kOXPwXDH
 g90tnETYqWv6NTqgP6KoRYNFT1+RvktiVyMtKiOtWknlT1PEkZFptJX/hUeq06k6yUNS
 iqETttIHUyyTqzYPDdoGfNW73cJjcsbVX59W3ixA9SAmz/Epx3F8oiqBolKjuj1PGQjJ
 qpjv94zfMEpR+DE1UsoGe6+tuq2j3+aRq3NJiY4cdNhfCrhzdpp9GSAejJq8XGcBp0qT
 lermtuhzLyKT+nXHFTRlZPHmxK0XquD3muZFVMvmwwkTDiyxa08NfuCrGg0a//otSsr4
 HkwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746650811; x=1747255611;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EhPrnWrrEa3D6POxudXMd7e4Z/b8W/qudNgP3sQ1aLE=;
 b=nztY9tgswJiuOGCIgBiOctyLPlMRxpLPNB1v2oZ2jdc9VXeLIwYxvHomxVQZMPnCXE
 aON/vtBd0LkAAcP3LsJyszbfgWK+QP2SIEylRRulCe77nFs5b+i4zNi9QSlyfWyw40Xo
 EqjjsCPpVb/53vP9kKhUyV5Igq0hpiDZ9O0G4Yv4y3aQUIk+DlI3/zzuSdsmW9bb7wsJ
 vKfKNZ39SawPZhgmOddNfl52ggWEFtt4aSFSZ324VCx/vcseQHBcdYcu4z5mAt4Wmcs/
 nVeEVl42iYG3ef+BqVSXcCiIpKizHZzqghLRD99I9cN3RfqGBqM5D44uwrljnNYNLjDy
 BrJA==
X-Gm-Message-State: AOJu0YyrgNsKAShmPBksTXyi0U4/ROiamLXWCuk6jrekGpa2f3PlCwpp
 E9VSXYQqj4QVqzFn/+WOM9GWPY5NDCwdnGrbkRda5ree8RZ3wjjKOJevMV+Kp1U=
X-Gm-Gg: ASbGncuLs9/YIRo6dqfDP/TdyZ4SdHUb015KHrasUEAYN0kXfJ0aOVV6C8KtNAXQePW
 X8o7ZpPscsPwUQpLPq86fwsd0wteI8UxXk4Id7/wUdf/aCiO4/66hv6odilE9CWO7xBwgedlIAA
 EgFLvAoFtNQHg2T11nVudtRefhAVxEKZkkFU279HJYmegbySEvsF/Apxyjhezwq8iVczyLhA7Vq
 hjYaiHfqCzj6uQUPanFtb1aMHGUbK09q+iKxDqWgYnX+2bTlwxa75BjR53Qf5KP9HMxZ+sJPNJX
 jyOtY8DBBeQghlYEH2JzH81jLyiZ4SkmR10nVk1yZBl2qJVi
X-Google-Smtp-Source: AGHT+IH7/ieVTBFFKIEGbzu2A6yU9xqQJKw8wAvcdGFHCv25joYaS7oXC37//qPBJNx37uLpjrfvVg==
X-Received: by 2002:a05:687c:2246:b0:2b8:e6f2:ba7e with SMTP id
 586e51a60fabf-2db81400b71mr607967fac.12.1746650811089; 
 Wed, 07 May 2025 13:46:51 -0700 (PDT)
Received: from gromero0.. ([200.150.181.215]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2db5cbc7d1fsm920933fac.11.2025.05.07.13.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 13:46:50 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	thuth@redhat.com,
	gustavo.romero@linaro.org
Subject: [PATCH 0/3] Fix typo in comments
Date: Wed,  7 May 2025 20:46:23 +0000
Message-Id: <20250507204626.139507-1-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=gustavo.romero@linaro.org; helo=mail-oa1-x2d.google.com
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
X-List-Received-Date: Wed, 07 May 2025 20:46:58 -0000

Nothing exciting in this series, just typo fixes in comments.


Cheers,
Gustavo

Gustavo Romero (3):
  linux-user: Fix typo in comment
  Fix typo in comments
  Fix typo in comments

 block.c                             | 4 ++--
 hw/display/apple-gfx.m              | 2 +-
 hw/xen/xen-hvm-common.c             | 2 +-
 include/exec/cpu-common.h           | 2 +-
 include/hw/xen/interface/io/blkif.h | 2 +-
 linux-user/mmap.c                   | 2 +-
 qapi/machine-target.json            | 2 +-
 qapi/qom.json                       | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.34.1


