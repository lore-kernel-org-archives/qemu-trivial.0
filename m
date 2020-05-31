Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jfL30-0004sA-Km
	for mharc-qemu-trivial@gnu.org; Sun, 31 May 2020 06:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jfL2y-0004pt-Ju
 for qemu-trivial@nongnu.org; Sun, 31 May 2020 06:18:28 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:54374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jfL2x-0003aR-1O
 for qemu-trivial@nongnu.org; Sun, 31 May 2020 06:18:28 -0400
Received: by mail-wm1-x343.google.com with SMTP id g10so378881wmh.4
 for <qemu-trivial@nongnu.org>; Sun, 31 May 2020 03:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=TC+KShbAfWjzNpM1uWWNF7YuYCcmsAs2/CAoKJZm8g4=;
 b=C18/Cq1Muwq2Qgsj3xnYA1UK4CM0FeAmsdCaQxybEei1IugyjOAYTlQjjP6FJALBzZ
 Ps0wU6PEqyvkVm9pZ+NOJjLjTwwkD9V4vk180y2MXwUZXY7oo6UsGUDQUIKZpS0APW5u
 OaAykp8Xti6hES0gEkvjL9Ml7E5PopZQ4H8ZiGAJCPi0tE/HXbtmtdHfLe+UhDFJpfsH
 96FTQnuq7BcmCLmfGeAfjW3795ce8XPfBl+GD0XLPLr80H8Pxf6FLMzH7GxKMKIAYvD8
 VCOvZ3IhywybM+5i2hIJLutRcYtPw07iBWhtTS3fYM1+0cIRs24ioHlkrjK1j8AJ/2JV
 hLKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=TC+KShbAfWjzNpM1uWWNF7YuYCcmsAs2/CAoKJZm8g4=;
 b=UVzWLh67exDvtHxuqG9j4OPGFtEnsrOYlnli+REdPxYNUegV1k9rEhwSHi0yv/F2uF
 4bZPtfxB7trDk5JZKT2PDSh9JaPzynpL0gMLDUiKBxifHR1mqv9VGG6yxY8jkcSwZnVr
 dOCZbpsrlAVLzR3A4hI1JJ/zi50Ohs7hW72B3rZu08vHVP0+yHbpL4SUx1poEm3Qyy0z
 sSAWbGUXIz1+ox/dYNo2B91rZTjfnTssOIiNUUXdgOxuxFeDMVhuAbG6XLo3DF60k7PG
 J7wZBTgI8VqetIRUwBANNzVWZGfK02ujIvuukBjGcfg+WYJqi6qupFW5gq2G55s70cmj
 ryMA==
X-Gm-Message-State: AOAM530mE/n2CyoqA75Z9987b4hPo3T8TZVMgvkT/IGl3PFq9FN266F/
 Uze9ji0kSvL8OfZfSlYnq6Rqfw==
X-Google-Smtp-Source: ABdhPJwULgtxZvygEFdRg5uJjqbUHVIRwAB9Hdy6eWTS8b1NNCyyea0I4zTLEaNfx0XAPC6gKIOS9g==
X-Received: by 2002:a1c:5683:: with SMTP id k125mr17582603wmb.55.1590920305487; 
 Sun, 31 May 2020 03:18:25 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id k14sm16689810wrq.97.2020.05.31.03.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 03:18:24 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8E3A61FF7E;
 Sun, 31 May 2020 11:18:23 +0100 (BST)
References: <20200530092306.26628-1-f4bug@amsat.org>
 <20200530092306.26628-6-f4bug@amsat.org>
User-agent: mu4e 1.5.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>, Fam Zheng
 <fam@euphon.net>, Magnus Damm <magnus.damm@gmail.com>,
 qemu-trivial@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 5/5] .travis.yml: Test SH4 QEMU advent calendar image
In-reply-to: <20200530092306.26628-6-f4bug@amsat.org>
Date: Sun, 31 May 2020 11:18:23 +0100
Message-ID: <87blm4v24w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Sun, 31 May 2020 10:18:28 -0000


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> From: Thomas Huth <thuth@redhat.com>
>
> Now that we can select the second serial console in the acceptance tests
> (see commit 746f244d9720 "Allow to use other serial consoles than default=
"),
> we can also test the sh4 image from the QEMU advent calendar 2018.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Message-Id: <20200515164337.4899-1-thuth@redhat.com>
> [PMD: Split tests/acceptance/boot_linux_console.py in previous commit]
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  .travis.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/.travis.yml b/.travis.yml
> index 564be50a3c..e2003565d8 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -293,7 +293,7 @@ jobs:
>      - name: "GCC check-acceptance"
>        dist: bionic
>        env:
> -        - CONFIG=3D"--enable-tools --target-list=3Daarch64-softmmu,alpha=
-softmmu,arm-softmmu,m68k-softmmu,microblaze-softmmu,mips-softmmu,mips64el-=
softmmu,nios2-softmmu,or1k-softmmu,ppc-softmmu,ppc64-softmmu,s390x-softmmu,=
sparc-softmmu,x86_64-softmmu,xtensa-softmmu"
> +        - CONFIG=3D"--enable-tools --target-list=3Daarch64-softmmu,alpha=
-softmmu,arm-softmmu,m68k-softmmu,microblaze-softmmu,mips-softmmu,mips64el-=
softmmu,nios2-softmmu,or1k-softmmu,ppc-softmmu,ppc64-softmmu,s390x-softmmu,=
sh4-softmmu,sparc-softmmu,x86_64-softmmu,xtensa-softmmu"
>          - TEST_CMD=3D"make check-acceptance"
>          - CACHE_NAME=3D"${TRAVIS_BRANCH}-linux-gcc-acceptance"
>        after_script:


--=20
Alex Benn=C3=A9e

