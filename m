Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1swmZC-0002Dh-AK
	for mharc-qemu-trivial@gnu.org; Fri, 04 Oct 2024 13:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1swmZ9-0002Cq-V3
 for qemu-trivial@nongnu.org; Fri, 04 Oct 2024 13:58:11 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1swmZ8-0006bu-Cl
 for qemu-trivial@nongnu.org; Fri, 04 Oct 2024 13:58:11 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a8a7596b7dfso424530966b.0
 for <qemu-trivial@nongnu.org>; Fri, 04 Oct 2024 10:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728064667; x=1728669467; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=uml7o5xPPexvJTnvPBC1eXY+yv2rWD3mcFHFe+jiAhA=;
 b=cA3YA5EVRbmC9X9ZMZTbxYuQD69v+WT50kKlmxIYjJ1K8sl4yFJjBUKxAFSDyMqE8+
 G915kZh7UvUTEm2vvCW0Nk2dNYGR9domppblYVAk8npqyc6tNJoKKFlApVDk09SvoCHu
 po3W5gOil2Ar1dR3WB0L6T42TEuJMJnv2F6LXuNwhYd08DOF1be4GETMiPsCrQmEVvWa
 gKGNaPHAgpCCyi9IjjngDWQp3JJv+bFr00vjD1UJLn7jFKAL4s5BafqxJLYRGhSLgBdM
 B0xp4U/ZH/vaqUKTxTZP3WYmllPt9aVNB1o5AI6Ba7QqYzrVuDM4m9lDDou/UMY90xay
 coGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728064667; x=1728669467;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uml7o5xPPexvJTnvPBC1eXY+yv2rWD3mcFHFe+jiAhA=;
 b=DOebZ9LW92lAcCBwpJNsqo86fCYgrkTj1xtVbRvpK2D2Hv42nkFvDcKWB777GSoOfK
 CCb0PF89rq+QYakl2GfZpNJXMFsOkThMfWlHDs3SJXn/PROBJ42XXsTRJIhzORgfZAA2
 nLZ85D65qeY4lCapZG4ayJiAFnLOd1/2zcS7LtZ7O17kcrLkn/dspr/JDyHH2N+Ef0A6
 ATcfaLVBue2NNTh61KkC8wKtFi7TnVMqYS5doNqZ4IEfwsfo1wvbTbE6GGFYL3sYPLOh
 n0bZdtmSP0I+3cxeFy2T+5/n2WNZti+P/vNb7O37s7q5F1D+ch9o0ZfZyjuGvgJIAM06
 tgUw==
X-Gm-Message-State: AOJu0Yym5Uhy9bZTkTxvz01lpkvqY0iuAgFOMxvr3UHQK66vlychvsZx
 G9Za2fLq9O4ggo1X912dx54DtZnK0DuE67t4b0233sMVU6d+WBMO/l2F/xo5j9E=
X-Google-Smtp-Source: AGHT+IGNQlWwarlacwsuvMAbwQEUSjMOA/7FvBUKojT85t4IOkaWs74dqrMKgo71BRsAWBB/V0Rr7A==
X-Received: by 2002:a17:907:940c:b0:a8a:6db7:665d with SMTP id
 a640c23a62f3a-a991cf73a24mr376363066b.17.1728064667363; 
 Fri, 04 Oct 2024 10:57:47 -0700 (PDT)
Received: from meli-email.org (adsl-74.37.6.1.tellas.gr. [37.6.1.74])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a992e6655bbsm23307566b.96.2024.10.04.10.56.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 10:56:36 -0700 (PDT)
Date: Fri, 04 Oct 2024 20:53:39 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>,
 Brian Cain <bcain@quicinc.com>
Bcc: 
Subject: Re: [PATCH] tests/functional: Fix hash validation
User-Agent: meli 0.8.7
References: <20241004130225.217441-1-thuth@redhat.com>
In-Reply-To: <20241004130225.217441-1-thuth@redhat.com>
Message-ID: <kuf60.ek3w2mj9njb@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-ej1-x62e.google.com
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
X-List-Received-Date: Fri, 04 Oct 2024 17:58:12 -0000

On Fri, 04 Oct 2024 16:02, Thomas Huth <thuth@redhat.com> wrote:
>The _check() function is supposed to check whether the hash of the
>downloaded file matches the expected one. Unfortunately, during the
>last rework of this function, the check was accidentally turned into
>returning the hash value itself instead of a True/False value,
>effectively accepting each hash as valid. Let's do a proper check
>again now.
>
>Fixes:05e303210d ("tests/functional/qemu_test: Use Python hashlib ...")
>Signed-off-by: Thomas Huth <thuth@redhat.com>
>---
> tests/functional/qemu_test/asset.py | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/tests/functional/qemu_test/asset.py b/tests/functional/qemu_test/asset.py
>index 3ec429217e..e47bfac035 100644
>--- a/tests/functional/qemu_test/asset.py
>+++ b/tests/functional/qemu_test/asset.py
>@@ -57,7 +57,7 @@ def _check(self, cache_file):
>                     break
>                 hl.update(chunk)
> 
>-        return  hl.hexdigest()
>+        return self.hash == hl.hexdigest()
> 
>     def valid(self):
>         return self.cache_file.exists() and self._check(self.cache_file)
>-- 
>2.46.1
>
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

