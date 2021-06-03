Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lojVB-0006Qx-5e
	for mharc-qemu-trivial@gnu.org; Thu, 03 Jun 2021 05:18:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lojV9-0006Pu-4w
 for qemu-trivial@nongnu.org; Thu, 03 Jun 2021 05:18:55 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:46906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lojV7-0002LA-A6
 for qemu-trivial@nongnu.org; Thu, 03 Jun 2021 05:18:54 -0400
Received: by mail-ej1-x62a.google.com with SMTP id b9so8127615ejc.13
 for <qemu-trivial@nongnu.org>; Thu, 03 Jun 2021 02:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DqVQzqcTJHgEovXWufo2ZLAulEmw6zmTSYrtNAcDa/8=;
 b=WE4sZyn2CubqkHSFxvSAmkpHJLbp8m0w12ZQ9tI/Z7SAgU+YFyeoULnWEUmXm/VDxZ
 8pTrg3IHiuRS1QQ4LlmOwMe1W7y/M8E+vpTHykEXzEqt7UZ+6eAysVZ/XWPbO+uTE8Bz
 +IrZaxWh7js4QaCliU3Q2UYAuNp3/Y6NXXHqXP+SIQRpUUK8SSg0PHQlVk7p5pKMANHw
 AfDo4biJVEi/pVBDjgpGxq3TanNJ524eslpfyv8Eo0jZXfW12lng8MLmHQUbzvR6yi2a
 mvesH/1h6NPh7R0hZI8Lop6Peio+GYAvI7fQ/51grvj2NhatjdhIt2ky9Ii1z6/2fueQ
 0cxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DqVQzqcTJHgEovXWufo2ZLAulEmw6zmTSYrtNAcDa/8=;
 b=sCNfkjoMN2Z/W49X3PKEiDWt/hX7Bybv4D/F3rR+4oo397bxJfAzH2VD3tsggcPAh2
 Kls00/EO390M9obi6w55QfrzD7phgoGKfUCs4Iv/RDAsjh/eEaW2qdIw8oibudaVnTZy
 DJVBYYk3G+u0xZRqynTq8uOEYuc9S/0nO0vq5gV/tAOtlAxOYjaS+btuHwHJ5hnupopO
 opDvyjo5UWuPamLxLRIzGJ6qmePQ0p5d4Fb4grmSV/lLHIvXq8FT5Z4puMI1PZwZ63yO
 8H4iB+LQksSfLP3Tf3ZRwdcv+OdL5oM14s6Vi3lGWlW2dzDVUUCt9sLn/SiiLpJdDnQf
 i+gA==
X-Gm-Message-State: AOAM531T2yXK5vF/v46O5dyEVQorOU11bpZJe4mjA5fbZcCE4KGsjE15
 WDn/nvHdYiBqFDJ9sQ8cTVV7TcZitavw81LoyF3oUg==
X-Google-Smtp-Source: ABdhPJxz8ZKwsPjqjwy87fEOwdOeDNCrGruNISpfi2MQH39qMIkuvFjsMBJb4wcCQgBmTCjYq505m8vLrLV9xepNZbU=
X-Received: by 2002:a17:907:9047:: with SMTP id
 az7mr25813394ejc.4.1622711931280; 
 Thu, 03 Jun 2021 02:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210503161422.15028-1-dgouttegattat@incenp.org>
In-Reply-To: <20210503161422.15028-1-dgouttegattat@incenp.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jun 2021 10:18:18 +0100
Message-ID: <CAFEAcA9xmF4V_r1HburngKXWKJgU6vFoKkpJ8QbsRSi3wG_sOQ@mail.gmail.com>
Subject: Re: [PATCH] docs: Fix installation of man pages with Sphinx 4.x
To: Damien Goutte-Gattat <dgouttegattat@incenp.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
X-List-Received-Date: Thu, 03 Jun 2021 09:18:55 -0000

On Mon, 3 May 2021 at 17:14, Damien Goutte-Gattat
<dgouttegattat@incenp.org> wrote:
>
> The 4.x branch of Sphinx introduces a breaking change, as generated man
> pages are now written to subdirectories corresponding to the manual
> section they belong to. This results in `make install` erroring out when
> attempting to install the man pages, because they are not where it
> expects to find them.
>
> This patch restores the behavior of Sphinx 3.x regarding man pages.
>
> Signed-off-by: Damien Goutte-Gattat <dgouttegattat@incenp.org>
> ---
>  docs/conf.py | 1 +
>  1 file changed, 1 insertion(+)
>
> FYI: For more information about this behavior change of Sphinx, see the
> relevant issue: <https://github.com/sphinx-doc/sphinx/issues/7996>.

Thanks for this fix; sorry we didn't pick the patch up earlier.
I'm going to take it via my target-arm tree.

-- PMM

