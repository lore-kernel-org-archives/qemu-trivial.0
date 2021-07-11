Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1m2gsf-000144-Pt
	for mharc-qemu-trivial@gnu.org; Sun, 11 Jul 2021 17:20:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2gse-0000z8-1J
 for qemu-trivial@nongnu.org; Sun, 11 Jul 2021 17:20:52 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:39550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2gsb-000632-3i
 for qemu-trivial@nongnu.org; Sun, 11 Jul 2021 17:20:51 -0400
Received: by mail-ed1-x536.google.com with SMTP id v1so24295442edt.6
 for <qemu-trivial@nongnu.org>; Sun, 11 Jul 2021 14:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LpZV3fun63v2eOatoraszDgm/Jvu1rtiTMMVxKPews4=;
 b=wRizJfPVD8yOcXE9GL737pfukGwztFM7GuI/B+3Zpg7I3FPwdbBm6Yc1luTKsd07SD
 Lmm8TOaffph2c3AHXIwJi7El366ss3g6Uhzp7qRLo2ROlz9LUeN3ulX4x9oMSw8gTfaT
 YY1D1KpvnNO1uNOq+2KOUIjdQyqBlaY0ubKk4Lfw0zkGKsAsD0uHORCnFNqtNkAyDOLB
 sRUq87dHDL60BXNo3IQMItYnCj4lfVLMtrSSdFSIj0gCYe7YyPUk+agoTigLkvgGFNYu
 qKgeooEF4/Hh+Mv5G26HZ/1ZT6CIvPY033LBWtWRZOxMvcm+G0lAF1PFkX5tMAnomWE7
 H4UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LpZV3fun63v2eOatoraszDgm/Jvu1rtiTMMVxKPews4=;
 b=ATNbmIwG09W01Uounza3dsnDDKJsociSR18xcUCEK1QIQrZX+u2U3sUGWci+CM6M1m
 pw9Da5lVu9s4AY1SWlNT33uRD3IkoGXdzYQRv8LLQrIpb8yCpeLLQqpJhAMPK7+LPETh
 AOaMqaF92hYf27hvhBl7O2Cj0TRzsT6Mrnds4f4QRPi5vqLxIljQQUvE1SpABRoaADVZ
 QCwgVPzwrZb6xP3aEKVQ5teeOa6EngFx9S4f19qiw9blZ24fDr8lsUgK+GJp9YYv/Ss4
 Ic1WKzDsJShdsEfewJ3V72MLZSIcwN/A+Z94tndstQzRK8Gi+ThFhK+OhcMNA8YqYl3s
 /g4w==
X-Gm-Message-State: AOAM530QG8n8U2WKziknlolMtV5rp4oZ93G0KsSgk7pcJbS9X7McOZYV
 mPYcS9Pox3JLgyFDh8vMpW7k2h6bl4XR/AY6DN+xew==
X-Google-Smtp-Source: ABdhPJxFiBLELVmQaiK+Zr7hVQqkw6rMOWs2Kqfr9HTK/O9G1Ar9fWDAGov/hqiXKeo37ipe/+IAsr76wS+TvRpevPM=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr59366726edt.100.1626038447404; 
 Sun, 11 Jul 2021 14:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210709202824.578187-1-laurent@vivier.eu>
In-Reply-To: <20210709202824.578187-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 11 Jul 2021 22:20:08 +0100
Message-ID: <CAFEAcA-W0CJzxnNT8XfYRxNqhOoPzwpi0Kc8j4qqtS+u=Ek9aA@mail.gmail.com>
Subject: Re: [PULL 0/9] Trivial branch for 6.1 patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Sun, 11 Jul 2021 21:20:52 -0000

On Fri, 9 Jul 2021 at 21:32, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 05de778b5b8ab0b402996769117b88c7ea5c7c61:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2021-07-09 14:30:01 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-for-6.1-pull-request
>
> for you to fetch changes up to e28ffe90fde5702aa8716ac2fa1b4116cdcc9e61:
>
>   util/guest-random: Fix size arg to tail memcpy (2021-07-09 18:42:46 +0200)
>
> ----------------------------------------------------------------
> Trivial patches pull request 20210709
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

