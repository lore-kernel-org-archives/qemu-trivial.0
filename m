Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1njMkA-000564-1A
	for mharc-qemu-trivial@gnu.org; Tue, 26 Apr 2022 11:04:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njMk6-00053z-T5
 for qemu-trivial@nongnu.org; Tue, 26 Apr 2022 11:04:42 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:45049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1njMk5-0005Tt-7N
 for qemu-trivial@nongnu.org; Tue, 26 Apr 2022 11:04:42 -0400
Received: by mail-yb1-xb29.google.com with SMTP id e12so4629251ybc.11
 for <qemu-trivial@nongnu.org>; Tue, 26 Apr 2022 08:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PIJrMVEyGd5MpYV8h1wf6heX3GRjHxNZyi8HWic22uE=;
 b=Mt8241MyNXD+rvbRkCPeMU/wlj81qkWrNInet8lkDCvQ/p1Qsol4gQvpA1S5HeZcV0
 tHWJld50OQlMWbqVKvOkScLCDqTUq5gXTmvo9aRp8D7nZru2CTqsDdq0akNq4ibLM6xe
 nDaQHlO566dhiUlFtFzbMSCF7yF4OmRLLXsSBnKZFfw8m7t7iXnws+jX34/GWBoXd158
 UiwLijHgqX2Bqu0/bKrBlgIDoMa8B6mAT7CbWzhbes2CqYY9sA0fYyumPUHMqyGeLjQS
 UnmriDcnWRAf9JD/ymHJ73uAHzhaCjq+5WNsaS9ZDoGkurws7GadPy7ncc00EWhzwcoa
 WcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PIJrMVEyGd5MpYV8h1wf6heX3GRjHxNZyi8HWic22uE=;
 b=0079oVkyxt6z3Iaw5cQR44NBzPIR87t+jNOeGmspHb0t+76orm/w5cMhAPiyyFp4pc
 S+fq9X96oeCktEZdqkluVVIahokhZpqWSXFrITSlZ/q06ry+remObBhJkufXciGf9shx
 1In7Va/W5WMp0a/P25Wzszl2vDCRXIFuB9bVQ/ZtYqusbFYo+pC3ok8Mtv1Aea4m02CU
 LDhC3CivBDmRFD17lmCC5zrtWJvgT/YsivF9mbTmrS/Xeok7+8KgcUjX5HuddN6UlA/I
 9pdb+beW0J2gKF+oTZgVrfDz0sXvVPmWxeSJ7xzDpX/MY4YS7ipqOlNui+G3A7wREVv+
 7wYA==
X-Gm-Message-State: AOAM532h1F/TS92/vrRxntAAEdZ9gun2npUYw+I8Z21T8B/GXSs9Ip8J
 Hq8QOvOvrxDcKDPqAdoA5DpYq5Lz4B198c7UURupalxaY4w=
X-Google-Smtp-Source: ABdhPJyFxEkxAERkolRUpkU/t7575EdbqcsCPTlh0NU5SyrCB+oFVF5LMlHSDFl7ptKXfdx0qcDGL9xlxaXhQphx5Hw=
X-Received: by 2002:a25:cf4d:0:b0:645:755c:a5af with SMTP id
 f74-20020a25cf4d000000b00645755ca5afmr20588226ybg.140.1650985478795; Tue, 26
 Apr 2022 08:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220318173038.3350098-1-peter.maydell@linaro.org>
In-Reply-To: <20220318173038.3350098-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Apr 2022 16:04:27 +0100
Message-ID: <CAFEAcA_5=5uauENSDRYQdaXJQJ5pnf9eUBHicA3LWjyScZ2SuQ@mail.gmail.com>
Subject: Re: [PATCH] Fix 'writeable' typos
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Tue, 26 Apr 2022 15:04:43 -0000

On Fri, 18 Mar 2022 at 17:30, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> We have about 25 instances of the typo/variant spelling 'writeable',
> and over 500 of the more common 'writable'.  Standardize on the
> latter.
>
> Change produced with:
>
>  sed -i -e 's/writeable/writable/g' $(git grep -l writeable)
>
> and then hand-undoing the instance in linux-headers/linux/kvm.h.
>
> All these changes are in comments or documentation, except for the
> two local variables in accel/hvf/hvf-accel-ops.c and
> accel/kvm/kvm-all.c.
>
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Ping for this to go via qemu-trivial now 7.0 has been released
(patch has been reviewed).

thanks
-- PMM

