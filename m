Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lBFeG-0003o7-Fv
	for mharc-qemu-trivial@gnu.org; Sun, 14 Feb 2021 06:33:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBFeF-0003mu-9x
 for qemu-trivial@nongnu.org; Sun, 14 Feb 2021 06:33:07 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lBFeC-0008MD-7D
 for qemu-trivial@nongnu.org; Sun, 14 Feb 2021 06:33:07 -0500
Received: by mail-wr1-x42e.google.com with SMTP id n4so2214443wrx.1
 for <qemu-trivial@nongnu.org>; Sun, 14 Feb 2021 03:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=fPw1fF0Kvb/PF9f7QnjG8boPggpC6coxDNQGB1L0TFs=;
 b=pfQ04+pAkESyQknPLuy7dnM5OPw/HwsBlB+KG7YXFiObe/iO13W+AWhj5dHKAsaM+Y
 5VjlYw3AFYTOioxy/SXPN/sPDDNnPPj2ETbF8hMICCQdm+Y00Q/cmqv6BbANQmzGmYLi
 k8MD5O5OiIicYPgQAvrREUwg3zZjjTLk9Eq5l1em0s2OmKG10qcBM8pLXCZvp8RbwyXW
 j0iBWna7rdCUh64hDBbFgfTrULXOPv4yW1ZV51sNNsnQ4MpPKh/B8CwR8XKcjkYZt4cB
 E/Q9NOtj4xifWaMb1+FHA76D8xCeQoL2ylVY7yfOcUMsoCC/8PIUcD6mwbFAM/+GXH+P
 e6Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=fPw1fF0Kvb/PF9f7QnjG8boPggpC6coxDNQGB1L0TFs=;
 b=g/T2SXW3eyniMyoiUFwsrllLliFS8QnbARwQCdKSivbjZgU3XcLFESqvd8irH0tzoU
 jdeGKSk6nwLzvgLzfQqMIDM187znltrqT/93j8yFbjXMfRBeKmocONaNSUB7CjkUAIVF
 W0n5ZZ3r2I5PXVVca8Slxs6M7o704o8F8AjUYPiPA44eFZxPdi1hnQs5y4OtGy2omgUD
 bKgvx1iCD2B8fXf3y6+XVuDRBTA6EYpjsSKAECF3D+yzavOh5B8NXALRTfW/Q7LLKEEM
 fdauksdVy/PVgXMrvtnX6p7MOEA0zNIU1zusf7gFvF7adHWa8irhXyW/LM2u5OYp4acG
 shIg==
X-Gm-Message-State: AOAM5338ejyHnWxQtfcAdeyxikstiiCVc7PrQiR6LjHi8hq9KslLJdE3
 i1V9YKGqD5UHXBAVHKH2H36QLw==
X-Google-Smtp-Source: ABdhPJw7IthF01bHHnBIGpG4B933lg7M87mSLWwDtceSCcl/QQMZL53RaRuM8Lluu6iuBzcET7b8QA==
X-Received: by 2002:a5d:6684:: with SMTP id l4mr13815472wru.111.1613302382602; 
 Sun, 14 Feb 2021 03:33:02 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a16sm18231323wrr.89.2021.02.14.03.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 03:33:01 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 216F91FF7E;
 Sun, 14 Feb 2021 11:33:00 +0000 (GMT)
References: <20210131061849.12615-1-vfazio@xes-inc.com>
User-agent: mu4e 1.5.8; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: qemu-trivial@nongnu.org, laurent@vivier.eu, Vincent Fazio
 <vfazio@gmail.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] linux-user/elfload: munmap proper address in
 pgd_find_hole_fallback
Date: Sun, 14 Feb 2021 11:32:54 +0000
In-reply-to: <20210131061849.12615-1-vfazio@xes-inc.com>
Message-ID: <87lfbqc2ab.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Sun, 14 Feb 2021 11:33:07 -0000


Vincent Fazio <vfazio@xes-inc.com> writes:

> From: Vincent Fazio <vfazio@gmail.com>
>
> Previously, if the build host's libc did not define MAP_FIXED_NOREPLACE
> or if the running kernel didn't support that flag, it was possible for
> pgd_find_hole_fallback to munmap an incorrect address which could lead to
> SIGSEGV if the range happened to overlap with the mapped address of the
> QEMU binary.
>
>   mmap(0x1000, 22261224, PROT_NONE, MAP_PRIVATE|MAP_ANONYMOUS|MAP_NORESER=
VE, -1, 0) =3D 0x7f889d331000
>   munmap(0x1000, 22261224)                =3D 0
>   --- SIGSEGV {si_signo=3DSIGSEGV, si_code=3DSEGV_MAPERR, si_addr=3D0x84b=
817} ---
>   ++ killed by SIGSEGV +++
>
> Now, always munmap the address returned by mmap.
>
> Fixes: 2667e069e7b5 ("linux-user: don't use MAP_FIXED in pgd_find_hole_fa=
llback")
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e

