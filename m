Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mUmjV-0008JU-VT
	for mharc-qemu-trivial@gnu.org; Mon, 27 Sep 2021 05:15:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51092)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUmjP-0008I1-Nc
 for qemu-trivial@nongnu.org; Mon, 27 Sep 2021 05:15:28 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUmjN-0006Tx-TJ
 for qemu-trivial@nongnu.org; Mon, 27 Sep 2021 05:15:27 -0400
Received: by mail-wr1-x433.google.com with SMTP id s21so10378625wra.7
 for <qemu-trivial@nongnu.org>; Mon, 27 Sep 2021 02:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XIUwrOMRtuq2HjpYrAvMSG7B5JaPwc4NjYIYoTpHMYc=;
 b=TG181ztWWbUaEq58V2vaz38x44sNg5ixx4s1fZyEDksU/hMdwD7vPJifueaobbYcau
 +G2URCv0sYvS3tW25TQVYb6ePD3xkm6YyKtR8g4NIzA7FySIY3q2CEbvBFlVKlvPzwzx
 k7EN0xGraumP2bCSgbqUYrTUEdFIs0UpjmSfsuV+4wtMDQzVaGAM1uwqCx+jW+SDQ4nU
 TU6E0Gmjfj4/Q9u5SXVqkV0jyFAoYEs9+lAo/aHVIRmooURKjNGHnJFRI6J0SJup+w0m
 L08EVhqyiojVV0UChPVFfukJGfJHTdntE8iptBghg5t8QMnpc9Ygtlun8WpExNtN/VZ3
 ObGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XIUwrOMRtuq2HjpYrAvMSG7B5JaPwc4NjYIYoTpHMYc=;
 b=uOXsQ2sT++oxvG9l5qH31ryvgWy5wW0PdNbDp5PnUqRsFQnFEeEtKsM2lrDaKIQi23
 zAjF52HrIi8EXiRyMYXaD1dVWeqn2+IvWAXv/IM2U0vAWd6K8Yvd27Sk1nkB/4F0adG8
 ALr/vD9tFWxNaQBi2CTY82iWKZ1xGGeO61b7/PohUfTFgaRMAHSxzuKZ2vZwK2/sEIX4
 Lnb78p+yH4lctzLXShYq/hUNetzpdt3Zu81M/4cSNlJrp7r1/lA9BEzBOC0nPU8x+me8
 sIc+69/syOvepPiTfpBxhRew0ORtsek89sr6MqlgC3NhGqr8IjA9w/UwFuOTv5Z36ob9
 fcSw==
X-Gm-Message-State: AOAM530E8OjDAkwrm3ulFvTZMFo/KoXVUdJZLahGgAm1E7vyNQv2AA5x
 UvnuTcgdcji3JDXLir2Z1VbM0znuLDXuUFSADnKFMg==
X-Google-Smtp-Source: ABdhPJzuVPY2YPjPKa9USN//6Gv8405ac1Hfl6pcWvCgXkq5VKugcxSkGVJR7yV0lvXIInSfDXNMmleJ5EsQH50auI8=
X-Received: by 2002:adf:f185:: with SMTP id h5mr27256317wro.302.1632734124306; 
 Mon, 27 Sep 2021 02:15:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210926220103.1721355-1-f4bug@amsat.org>
 <20210926220103.1721355-2-f4bug@amsat.org>
In-Reply-To: <20210926220103.1721355-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 10:14:31 +0100
Message-ID: <CAFEAcA_pRwZz=cK7=EjTsffhfhkXA-WvfecYWQ16sHYW+yQJBA@mail.gmail.com>
Subject: Re: [PATCH 1/2] bsd-user: Only process meson rules on BSD host
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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
X-List-Received-Date: Mon, 27 Sep 2021 09:15:28 -0000

On Sun, 26 Sept 2021 at 23:04, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Reported-by: Warner Losh <imp@bsdimp.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  bsd-user/meson.build | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/bsd-user/meson.build b/bsd-user/meson.build
> index 03695493408..a7607e1c884 100644
> --- a/bsd-user/meson.build
> +++ b/bsd-user/meson.build
> @@ -1,3 +1,7 @@
> +if not config_host.has_key('CONFIG_BSD')
> +  subdir_done()
> +endif
> +
>  bsd_user_ss.add(files(
>    'bsdload.c',
>    'elfload.c',


So, what's the reason for this change? The commit messages and
the cover letter don't really explain it. Is this fixing a bug
(if so what?), a precaution to avoid possible future bugs,
fixing a performance issue with how long meson takes to run (if
so, how much effect does this have), or something else?

thanks
-- PMM

