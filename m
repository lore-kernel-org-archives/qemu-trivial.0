Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kABbp-0000Nb-OD
	for mharc-qemu-trivial@gnu.org; Mon, 24 Aug 2020 08:29:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kABbo-0000KC-BC
 for qemu-trivial@nongnu.org; Mon, 24 Aug 2020 08:29:56 -0400
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:32843)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kABbm-0001mk-2O
 for qemu-trivial@nongnu.org; Mon, 24 Aug 2020 08:29:55 -0400
Received: by mail-ej1-x642.google.com with SMTP id u21so10982813ejz.0
 for <qemu-trivial@nongnu.org>; Mon, 24 Aug 2020 05:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BM1LYZDoCM12HJ4LW4k76cjBfkOwdrUd/38fFmKjOf0=;
 b=MLzmiXO3aLO5KpNX35PQNfIfy69hz21gfjPWhY6CIcCOLuIRW4wtwMOnCyCfZCF8rt
 5mbmsqKBCzCsVvuqDHxGbcdxVQOH3LIP6cKGSs3QRhUG6pPCYU8fEyGtWNA1X+J2BD5A
 Ou3akA1dEV+FbxazuHjsVkjRUNfUhR3WzdVw8RW8arqhABimkUUpCzWq03kdTsFAf9N+
 LViPUuioD61c/4ltJ1zemjV7dQ7Xi/dUmw7oY+Wb/hufnyQ/fSsOA10UMg3P84wtnspA
 fd4ukjvseNs8iyM96GFhTmR2gzBW0jOqTXkAmwRKMl+/8NsgqTwSfMda5nIBzdBWpBRZ
 Xx9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BM1LYZDoCM12HJ4LW4k76cjBfkOwdrUd/38fFmKjOf0=;
 b=Ck5RcRvV00Kf04yPdNGUaDQdxCYveYCwp5vVEPUI1pKLcfMNrydsu8hDMzEIxXbnaC
 lQvUrs1Aj/xOAy9wlvARpIdYMdJjeNywDzKGg+ACSsR6WT0XxVqn2f3S7gZhzC1PdJoz
 nFLUwm1LfKZtcR1dn/FcGKBGkXpiKt6Y3UntXPDSFnYL3DE3iHBNxuKM3OA/iGKVb4LD
 VgjGAmN5NfrxfmB4JhgrQRSv44HMhcwt268feJwnqVXrhDcQEUYEnOUREW0jGaSStsWp
 Yfwjlrfcacwz9qQCPbnHUUyc4nAsqLmrMcxdy9seeSJ7emR01GJ2uap6XNDCZc82Jsxn
 BPcw==
X-Gm-Message-State: AOAM530cnaArThceoXK7Eh5izedkUpHLOIRPMlrGhTUs3o1LGOGesJCt
 BWMegAAjanKgFKujEfPVrhF6u70hKCKvYcEomDz+kQ==
X-Google-Smtp-Source: ABdhPJxbjf35YoIdlSGeh29MCqaVFFjjZ2u2bxZSPvKyT39StJrDKEzWJOQEkDajvmpgDEIEf0fF2azFOhTp33pZqSs=
X-Received: by 2002:a17:906:f28b:: with SMTP id
 gu11mr5159219ejb.407.1598272192670; 
 Mon, 24 Aug 2020 05:29:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200812101500.2066-1-zhaolichang@huawei.com>
 <20200812101500.2066-9-zhaolichang@huawei.com>
In-Reply-To: <20200812101500.2066-9-zhaolichang@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Aug 2020 13:29:41 +0100
Message-ID: <CAFEAcA9EAnbCtovwxARkz=E=Ob-KQ1HvrmwzoxrdDTNcsEw3pQ@mail.gmail.com>
Subject: Re: [PATCH RFC 08/10] disas/: fix some comment spelling errors
To: zhaolichang <zhaolichang@huawei.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x642.google.com
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
X-List-Received-Date: Mon, 24 Aug 2020 12:29:56 -0000

On Wed, 12 Aug 2020 at 14:43, zhaolichang <zhaolichang@huawei.com> wrote:
>
> I found that there are many spelling errors in the comments of qemu,
> so I used the spellcheck tool to check the spelling errors
> and finally found some spelling errors in the disas folder.
>
> Signed-off-by: zhaolichang <zhaolichang@huawei.com>
> ---
>  disas/hppa.c                              | 2 +-
>  disas/libvixl/vixl/a64/constants-a64.h    | 2 +-
>  disas/libvixl/vixl/a64/decoder-a64.h      | 2 +-
>  disas/libvixl/vixl/a64/instructions-a64.h | 2 +-
>  disas/libvixl/vixl/globals.h              | 2 +-

libvixl is third-party code, so it's not worth making local changes
to it just for fixing spelling issues (it just makes it trickier
to update to a newer version of the upstream code in future).

thanks
-- PMM

