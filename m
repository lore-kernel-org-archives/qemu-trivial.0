Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jpqib-0007QE-1G
	for mharc-qemu-trivial@gnu.org; Mon, 29 Jun 2020 06:08:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jpqiZ-0007OB-Te
 for qemu-trivial@nongnu.org; Mon, 29 Jun 2020 06:08:51 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:34802)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jpqiW-0005eO-V5
 for qemu-trivial@nongnu.org; Mon, 29 Jun 2020 06:08:51 -0400
Received: by mail-wr1-x443.google.com with SMTP id f7so12931419wrw.1
 for <qemu-trivial@nongnu.org>; Mon, 29 Jun 2020 03:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=s0Cr7cpNk+Q6SRN257PXKSNt9ZQQcco5k4Bs94Hjc1o=;
 b=A1XqwAkVvuZS+rcJ8kjH/DP6rxbr0V3K3j4UL3TYpSCs4ehFynUaPZmBI3i+/ZnX27
 s8GKx2r6CAkjR+X4Xxo8XezpdupRPfu8kbbE5FOneqm41US5Tvt4kRI97SwFu5sdhE7r
 DqUq+EwF2hjHuwxBvHSEhpARToF6yCLZiXm0YUibb7o51Ae1K6Ot60RrqnxME0MuCMZf
 dhM+bHUjmlTGed/eWqd3jq56limrWBan0e58hQtxoREo8tmeMQ2DSMCxNvNkmvX0b728
 TZsmNkckkTA2hYtx1WzI9+IsIEKIQwUY/2vYyToGD6c/jOh46GjhRHE/CIvXdtV0KKo1
 L/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=s0Cr7cpNk+Q6SRN257PXKSNt9ZQQcco5k4Bs94Hjc1o=;
 b=mtG54KlaQc/Aj/5fqejRqPd1t+bZLuMQg4zOLGWn96asGAVtOr8TH+v2Kp+yNCv5f/
 Rog+KORK9mCsX6hNx7cA+ROXNZbkk8uDtB0Zg9yu0Quex7yYfj8SW/JfZzfWXZfFLis7
 2sUoN8SJV5RvJ7b2etqYvJ9MvcnerrrwuA/iz7CVhfzD37yIawX3fBXYUi8dLXzRAk6j
 UZgzbWYlB9gDCAOHOMn6/iqsnfLm/EO849WGfwqwK7nln7cYF3Tdav/Pfd10M+va+oHr
 6SvbIA/WbCPM0FDTIG4RgKfCOY+QPvSJhhl517x9+6lxo1EpgZS3P0QRUYQpebP9T1Hq
 /TyQ==
X-Gm-Message-State: AOAM5317g4nGEOSMhty7eUzjIkgLRogXPdwWnDCxeUTWV1OqEovMszQb
 bkmcxI1VNjwwYHiYNiaI/YW0EA==
X-Google-Smtp-Source: ABdhPJz6KS7z6Kh9QP/Qev61b/baXXREE1TfM89rI+PMMiKaOHbc6jvfshmvqqBCWHL+K+vN/bI4bw==
X-Received: by 2002:a5d:4611:: with SMTP id t17mr15482350wrq.243.1593425326718; 
 Mon, 29 Jun 2020 03:08:46 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l18sm25072941wrt.59.2020.06.29.03.08.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 03:08:44 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 321351FF7E;
 Mon, 29 Jun 2020 11:08:44 +0100 (BST)
References: <20200629094934.2081180-1-dinechin@redhat.com>
User-agent: mu4e 1.5.3; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Christophe de Dinechin <dinechin@redhat.com>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Michael
 Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] trivial: Respect alphabetical order of .o files in
 Makefile.objs
In-reply-to: <20200629094934.2081180-1-dinechin@redhat.com>
Date: Mon, 29 Jun 2020 11:08:43 +0100
Message-ID: <87sgeerxp0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::443;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 29 Jun 2020 10:08:52 -0000


Christophe de Dinechin <dinechin@redhat.com> writes:

> The vmgenid.o is the only file that is not in alphabetical order.
>
> Signed-off-by: Christophe de Dinechin <dinechin@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  stubs/Makefile.objs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/stubs/Makefile.objs b/stubs/Makefile.objs
> index f32b9e47a3..1df8bb3814 100644
> --- a/stubs/Makefile.objs
> +++ b/stubs/Makefile.objs
> @@ -19,10 +19,10 @@ stub-obj-y +=3D replay.o
>  stub-obj-y +=3D runstate-check.o
>  stub-obj-$(CONFIG_SOFTMMU) +=3D semihost.o
>  stub-obj-y +=3D set-fd-handler.o
> -stub-obj-y +=3D vmgenid.o
>  stub-obj-y +=3D sysbus.o
>  stub-obj-y +=3D tpm.o
>  stub-obj-y +=3D trace-control.o
> +stub-obj-y +=3D vmgenid.o
>  stub-obj-y +=3D vmstate.o
>  stub-obj-$(CONFIG_SOFTMMU) +=3D win32-kbd-hook.o


--=20
Alex Benn=C3=A9e

