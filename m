Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kABam-0007no-7V
	for mharc-qemu-trivial@gnu.org; Mon, 24 Aug 2020 08:28:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kABak-0007nZ-4W
 for qemu-trivial@nongnu.org; Mon, 24 Aug 2020 08:28:50 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:42243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kABah-0001h6-OS
 for qemu-trivial@nongnu.org; Mon, 24 Aug 2020 08:28:49 -0400
Received: by mail-ej1-x643.google.com with SMTP id j25so2462764ejk.9
 for <qemu-trivial@nongnu.org>; Mon, 24 Aug 2020 05:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0+IWJpKj6mxCkscyGhEufFMt2vJpj0/TILSpee/6VgE=;
 b=ywpANhWyq4jIrnCBaB0SNPUK39RMBp9sE3bvC90PVTPk0842NZrRh+VZt6VarfyTBu
 RJmcTiGAF8iXsIyECOMlbGLWbdfNUOpMGkpaM0IYB8iBP56LyBVGZc+GPp8uA9pe6SGK
 grcdmKyrn839t1jSOBaq1J3V/YjuKTKcQceYZMwg4gPFBMQZLyxtup8o2mp0l5FoPsBj
 hgL7Eo0ZW+xAq+/y6boteQPQPwnIv/9rFLEFfjKSkbiUU0k2K1n8JR1ip6nMlXkdyCXh
 9GaNNyvKGiRcNROScY9+KH9aVpptFedRWnf4mJtwyfvOFQOnvoymhz6HcIUGaAxr0zk8
 mqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0+IWJpKj6mxCkscyGhEufFMt2vJpj0/TILSpee/6VgE=;
 b=jevLh980MzKf7PMRTCIpaF7m4ujRF39hGV+84w11bWRGM4cYrwJUoB5tkStVfDBC7x
 NbMG4/jZaHa/KIm1gOyUTHRHROCpJXVE3OwsNtHhZK/A0MLm9IQuuTXQQjJIjddYP+sT
 pDszw7J4RyghIBANO1UxhfqPIxdkE+N0grKwo7Q8fLfLb6Tnbvdk6fCNv/IBcgbu3djR
 HaEB0BaNGsSsQLDzW2WW5hXFx2VPRvjTpFNrnMt+zEeXcPdW/KQGzBUObhHDZgFjxQnU
 OVgaa1PVkjISCRIrUepV4LK4h8s5h2acG5F3ylrrrbTDaDcX93+7geW7viT0GxkG+dd/
 adig==
X-Gm-Message-State: AOAM531YpEKQmmHhW0nfuJJHgtUUPR/ojy9O9Hxgi8ZOKGDKEArgEjxl
 5dqks0XRKDCFz6xYycRIm523mfe6Ywg+2nzBYrP9xg==
X-Google-Smtp-Source: ABdhPJxJQh33fCbzBnaXuendl50c76RCEsOti1DBQ4ShtAIzx3fRwMbbdDv5dWIUZr1qN6OC/2KYgTovXv356xwvPDQ=
X-Received: by 2002:a17:906:d8ca:: with SMTP id
 re10mr5114312ejb.382.1598272125942; 
 Mon, 24 Aug 2020 05:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200812101500.2066-1-zhaolichang@huawei.com>
 <20200812101500.2066-8-zhaolichang@huawei.com>
In-Reply-To: <20200812101500.2066-8-zhaolichang@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Aug 2020 13:28:34 +0100
Message-ID: <CAFEAcA_8MhCzgXrz9xX_u-YHnq-WZveux1M1tJ+tNAmgYP10UQ@mail.gmail.com>
Subject: Re: [PATCH RFC 07/10] block/: fix some comment spelling errors
To: zhaolichang <zhaolichang@huawei.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Mon, 24 Aug 2020 12:28:50 -0000

On Wed, 12 Aug 2020 at 14:42, zhaolichang <zhaolichang@huawei.com> wrote:
>
> I found that there are many spelling errors in the comments of qemu,
> so I used the spellcheck tool to check the spelling errors
> and finally found some spelling errors in the block folder.
>
> Signed-off-by: zhaolichang <zhaolichang@huawei.com>
> --- a/block/block-copy.c
> +++ b/block/block-copy.c
> @@ -318,7 +318,7 @@ static coroutine_fn int block_copy_task_run(AioTaskPool *pool,
>   * Do copy of cluster-aligned chunk. Requested region is allowed to exceed
>   * s->len only to cover last cluster when s->len is not aligned to clusters.
>   *
> - * No sync here: nor bitmap neighter intersecting requests handling, only copy.
> + * No sync here: nor bitmap neither intersecting requests handling, only copy.

This should read "neither bitmap nor intersecting requests handling"

thanks
-- PMM

