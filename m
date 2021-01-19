Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l1p5p-0008Rh-Ao
	for mharc-qemu-trivial@gnu.org; Tue, 19 Jan 2021 06:22:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1p5n-0008Qf-SH
 for qemu-trivial@nongnu.org; Tue, 19 Jan 2021 06:22:35 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45695)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l1p5l-0006dz-Li
 for qemu-trivial@nongnu.org; Tue, 19 Jan 2021 06:22:35 -0500
Received: by mail-wr1-x433.google.com with SMTP id d26so19334787wrb.12
 for <qemu-trivial@nongnu.org>; Tue, 19 Jan 2021 03:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=CyhEIwRlwVnBn9aB4qPZtXfEMlJn7mRs+0RkiF7RofY=;
 b=jiNrfIIxyAzLtZXia6lTdFdNyFZJ/lmpNPbNcZapvMshelaperGTXDXoXM9AYXfCqu
 D99+1q09nPmWMygW46jX8VFN7LUAcARSG9PEiY+nrwyFp6g9OODdn90d0Hllk7W2wuiK
 Gd7yfBi22jq2EOo1vLyaPAHICcX4Zg9OKialn4hpLDMe7CpvG4I74+j3wnHvU8vHQec6
 qEqW9d/YX85Rd64tuiHlFTTV3RQSdVjNgPIP1cXmHERYd372/FLhKtPNJaa31VwadgTy
 EQgevRU0KN3Ude0bwBTPqGf6MYXnvyJqMZrhm1IWnYsOPDi3QxwuUuTiJm+xHJRaRlyM
 a6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=CyhEIwRlwVnBn9aB4qPZtXfEMlJn7mRs+0RkiF7RofY=;
 b=Ebafs+zSk5+PXmFyz0CXZxg1assc/X4Mz8iEmVUgK2HL4tlhtPnmDRiu//oJ5ptggg
 a1+aah/Qtk1NMcV1/bIAsDnUZZtt3L9WYv1P0Xvb+10AlU5EH7zGgykXD+SGIRay6niz
 zgYiY57ycQW6/Ext4n/9Og7K35V0x67VegPqJxFT+JIM5+xzrzwJYCGMngvOnXj9iKpp
 2MxtEOHbyaYvnCLcPTvScUgK9O+uRuWyGz3or/N25L/ap+T3kBGWjFF83K7Y1ihbmK7u
 bhFGj50GRksUifP1eezcZP8uDmetxqIiZUhs0SuDr6pSYLylIW2KpFn63/agMBmOEEFW
 yHOw==
X-Gm-Message-State: AOAM5319NGZjCQmlqxcoleGQ9xpV6XsMhpX2oXdEU5bu6GKABjqwrI1y
 HHn2R0or/Mug4kdvFYAkXFTSd2P2K2ADjq1N
X-Google-Smtp-Source: ABdhPJw9XOZse3dEjtcQ1sQ4yN/ru7xweoEX/q4iZ9T/OMLWMPXufuLd8r+07HY1pcuWC4rhuNJbxw==
X-Received: by 2002:adf:ffc8:: with SMTP id x8mr3893067wrs.158.1611055351628; 
 Tue, 19 Jan 2021 03:22:31 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id u205sm4176433wme.42.2021.01.19.03.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 03:22:30 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F26A91FF7E;
 Tue, 19 Jan 2021 11:22:29 +0000 (GMT)
References: <20210119052120.522069-1-f4bug@amsat.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
 qemu-trivial@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>
Subject: Re: [PATCH] tests/docker: Fix typo in help message
Date: Tue, 19 Jan 2021 11:22:25 +0000
In-reply-to: <20210119052120.522069-1-f4bug@amsat.org>
Message-ID: <87bldluq6i.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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
X-List-Received-Date: Tue, 19 Jan 2021 11:22:36 -0000


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> To have the variable properly passed, we need to set it,
> ie. NOUSER=3D1. Fix the message displayed by 'make docker'.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Queued to testing/next, thanks.

> ---
>  tests/docker/Makefile.include | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index 0779dab5b96..bdc53ddfcf9 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -209,7 +209,7 @@ endif
>  	@echo '                         before running the command.'
>  	@echo '    NETWORK=3D1            Enable virtual network interface with=
 default backend.'
>  	@echo '    NETWORK=3D$$BACKEND     Enable virtual network interface wit=
h $$BACKEND.'
> -	@echo '    NOUSER               Define to disable adding current user t=
o containers passwd.'
> +	@echo '    NOUSER=3D1             Define to disable adding current user=
 to containers passwd.'
>  	@echo '    NOCACHE=3D1            Ignore cache when build images.'
>  	@echo '    EXECUTABLE=3D<path>    Include executable in image.'
>  	@echo '    EXTRA_FILES=3D"<path> [... <path>]"'


--=20
Alex Benn=C3=A9e

