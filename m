Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jqfzb-0007nC-UJ
	for mharc-qemu-trivial@gnu.org; Wed, 01 Jul 2020 12:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jqfza-0007lG-1R
 for qemu-trivial@nongnu.org; Wed, 01 Jul 2020 12:53:50 -0400
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35]:36937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jqfzY-0005ay-Af
 for qemu-trivial@nongnu.org; Wed, 01 Jul 2020 12:53:49 -0400
Received: by mail-oo1-xc35.google.com with SMTP id m38so1455403ool.4
 for <qemu-trivial@nongnu.org>; Wed, 01 Jul 2020 09:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G0YDtel2+4amDgDy+g6yLLU/PrAyUYJbvLciqhWoWn0=;
 b=Q4d1z4+5Pw2Iirk+6ZJCFbWOjCQcQXGG03dkNjn/N9qqhxYgS4anAnIuTY7orZ1/LH
 bSRu5sEBtSE58PLLt2liMqXVdDGGVTWcdE5Ng7pgTX7mq2AQL2IMjy2oLJpi235Mbea+
 9b3Z3YlLAiAW89day7moThG0NGkYNASRxrFGQP6eJSwVik8bgrUVR5kUcWAjqGNHKEQU
 agbaoo1T+jeT1p8uq2zJnVIFNL1yK9QSPxgRvWuNK+SgtgKKRjEQ7DZcDvjNYQ+ar1DD
 aQRMhnKfl2rC3yDF4H7PVZYA75XQyg9Zt+//42u2RrUCqWwdggfMcecmdpyuY5xJeWxr
 CdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G0YDtel2+4amDgDy+g6yLLU/PrAyUYJbvLciqhWoWn0=;
 b=DppQfmBpIKglJE/baF657bdnKQ9KEbrl57RBLy8b4Dm7NlL8k00xuHzuVmrkBXhzJU
 E1c1hEMrhLdo00M7wmlpLd2aQO62hNEw4aEDnVKG2twLw+i/68sutWjC4+Kb3pTlVSNo
 KeJkmf+7kCiipoFEkpbvFR+bvU7Uqr+eOJlL6pn5kzSpN4LIOQ/K1uFqtuGixHEuYdWz
 omrg/ZpQjVkzKalbEjNk6KEBcNR8+tXkW2gBYvuTLan/wfWDNwOgnKw7k5anrNHRrzNS
 tGm0h+pdK1JnDId9PDr2Rg/aASQBUknyR/C0Dv2T9HIEbhG62JZia4YptfwHXXE3lM8a
 f7YQ==
X-Gm-Message-State: AOAM5300sS9LRxt9nCNl/bwHWxNvfq8rhTOnbYOre/3BH+Ng1DrkJpCl
 ZNX7HXDhrSIsdgAoTvcWoZPnJuZTo82RHYKqD6MQcg==
X-Google-Smtp-Source: ABdhPJwI1s4A+70zOFSBr9VLTl6/i9Fj9j8VFyi/9Fosna5D8Okjw1Eiam1cNztYQwEta/OOfi0xARg/N+6mWFS9aeo=
X-Received: by 2002:a4a:9653:: with SMTP id r19mr1317397ooi.85.1593622426520; 
 Wed, 01 Jul 2020 09:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <CA+XhMqzjjrfxXeSENBQuHzTe4TRMWV5GOdqPkD3bo17T3ufR1A@mail.gmail.com>
 <1058ccbd-b4bb-9413-abc5-ae89076a58e1@redhat.com>
 <20200630082301.6vybzwmg4pviuwob@sirius.home.kraxel.org>
 <CAFEAcA8jkzf8+d5AyAVH2HJ544TyHsM4xP5tpWsKiJbJtWMjKw@mail.gmail.com>
 <20200630165356.2ka2ltwmrfjb5msn@sirius.home.kraxel.org>
 <3eb3c266-1a83-9f40-4760-1ab2578ae5d6@redhat.com>
 <20200701151524.wogl4ihbdevgf4bt@sirius.home.kraxel.org>
In-Reply-To: <20200701151524.wogl4ihbdevgf4bt@sirius.home.kraxel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Jul 2020 17:53:35 +0100
Message-ID: <CAFEAcA_ik-vD7N62kK2PY-Seepkgr2SsYPAj71KPJ6D1nCjgTw@mail.gmail.com>
Subject: Re: [PATC 7/9] Skipping drm build, unsupported
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>, 
 David CARLIER <devnexen@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc35.google.com
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
X-List-Received-Date: Wed, 01 Jul 2020 16:53:50 -0000

On Wed, 1 Jul 2020 at 16:15, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> > > Ah, that is the problem.  Yes, DT_CHR is an non-posix optimization which
> > > allows to get the file type directly, without another round-trip to the
> > > kernel.  If that isn't available you can stat() the file and check
> > > ((st_mode & S_IFMT) == S_IFCHR) instead.
> >
> > Even when d_type and DT_CHR is available, there are filesystems where the
> > Linux kernel reports d_type of DT_UNKNOWN, and where you are best having
> > that code also falling back to an fstat().
>
> Given this isn't perforance critical at all it is probably simplest to
> avoid non-portable d_type altogether and just to the fstat
> unconditionally.

> @@ -53,6 +50,12 @@ int qemu_drm_rendernode_open(const char *rendernode)
>              g_free(p);
>              continue;
>          }
> +        fstat(r, &st);

Don't forget to check the fstat return code in the final
version of this patch :-)

thanks
-- PMM

