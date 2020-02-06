Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1izgXN-0006yl-Ef
	for mharc-qemu-trivial@gnu.org; Thu, 06 Feb 2020 07:45:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53798)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1izgXK-0006oS-A9
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 07:45:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1izgXI-00022N-Uh
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 07:45:38 -0500
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:40055)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1izgXI-0001yO-Lh
 for qemu-trivial@nongnu.org; Thu, 06 Feb 2020 07:45:36 -0500
Received: by mail-wr1-x442.google.com with SMTP id t3so7007542wru.7
 for <qemu-trivial@nongnu.org>; Thu, 06 Feb 2020 04:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=hYKVDDnLkIb4korsbU1DIAO8nK8iHZ0NEk0p10/SQ1k=;
 b=Ie/mczwVjSwBuFnQ7fmDku7jex302OT3gY6FDsWSUWquyGcoIKwp8+4ml6CicKnsYH
 TXCRX2gCU3EC6AkhjCiVhP7nXb47LU03/viMp4eYpDTyRsfUYCd+QHYES09t12//LADy
 GBqb6rw9YGp//d/8COSqfpqLKlYnTkmrqr4OXgJU0f3nesnNOdtuTQ9Mykj/WU8uUVsr
 X0JN9S06k9bBRukpQdScrlABMbngeX8TY5zeGYucR5dQ1pUlgayyKb4VDPnRzeEWMySg
 UDAbxnYoFUioGhwqDVkAmgOx8pFTPLl+eNMtLbWLhkkqff7tnzZ/906tIAdSto+BYxlJ
 CGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=hYKVDDnLkIb4korsbU1DIAO8nK8iHZ0NEk0p10/SQ1k=;
 b=C6U+YBM7F9fZVNKCVVZVDwq4aNnaiB60ZSTXT69IOmX5erWz1XuR8mwRTS5nzBWZQ+
 4SMh7Z33YKYCprp8neOEAwAwyhNq7GL7fXEqbvgPxX6l9tBf8PLdhAVLevPicGX236Hp
 VmokBLsSIOlfEdFUnNMtJtpHc+mnu8CBG5THSb0Dgt+B1BtkdmgqIUucDwX1A6KD4Bvd
 6KoZ935SjPZClOepjc8ukG6N5Ohy385isjEgWlHUi5F65q+/fX872FvA1IAoW3OkmqWs
 DembUak8CDpoC0hfFOMbPs7yNh2RJJcHsdd1ikj7kcPfxafXMN8iEGeC9lTMZsQrM8Wx
 izJg==
X-Gm-Message-State: APjAAAVIGyvgRcaub1aP9lu3uWxuaPM4CH0nSdGtt9+UK3gGgj0eIoWF
 D6Omr8i9wPCuV9pZRZdf+ElByA==
X-Google-Smtp-Source: APXvYqzpzCbyDfUBZrSkZTVyclSOFPXOXf8MX+l1rWTf7GzIDyR3+JrJ1KhGKKUPUz5Jpq7MxmHGYA==
X-Received: by 2002:a5d:4085:: with SMTP id o5mr3609457wrp.321.1580993135299; 
 Thu, 06 Feb 2020 04:45:35 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g18sm3405662wmh.48.2020.02.06.04.45.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 04:45:33 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 33C291FF87;
 Thu,  6 Feb 2020 12:45:33 +0000 (GMT)
References: <20200206093238.203984-1-kuhn.chenqun@huawei.com>
User-agent: mu4e 1.3.7; emacs 27.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: kuhn.chenqun@huawei.com
Cc: qemu-devel@nongnu.org, zhang.zhanghailiang@huawei.com,
 qemu-trivial@nongnu.org, richard.henderson@linaro.org
Subject: Re: [PATCH] tests/plugin: prevent uninitialized warning
In-reply-to: <20200206093238.203984-1-kuhn.chenqun@huawei.com>
Date: Thu, 06 Feb 2020 12:45:33 +0000
Message-ID: <87d0ar995e.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::442
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
X-List-Received-Date: Thu, 06 Feb 2020 12:45:39 -0000


kuhn.chenqun@huawei.com writes:

> From: Chen Qun <kuhn.chenqun@huawei.com>
>
> According to the glibc function requirements, we need initialise
>  the variable. Otherwise there will be compilation warnings:
>
> glib-autocleanups.h:28:3: warning: =E2=80=98out=E2=80=99 may be
> used uninitialized in this function [-Wmaybe-uninitialized]
>    g_free (*pp);
>    ^~~~~~~~~~~~
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>

Queued to plugins/next with Thomas' single line suggestion, thanks.

> ---
>  tests/plugin/bb.c   | 2 +-
>  tests/plugin/insn.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/plugin/bb.c b/tests/plugin/bb.c
> index f30bea08dc..8b9da23a04 100644
> --- a/tests/plugin/bb.c
> +++ b/tests/plugin/bb.c
> @@ -22,7 +22,7 @@ static bool do_inline;
>=20=20
>  static void plugin_exit(qemu_plugin_id_t id, void *p)
>  {
> -    g_autofree gchar *out;
> +    g_autofree gchar *out =3D NULL;
>      out =3D g_strdup_printf("bb's: %" PRIu64", insns: %" PRIu64 "\n",
>                            bb_count, insn_count);
>      qemu_plugin_outs(out);
> diff --git a/tests/plugin/insn.c b/tests/plugin/insn.c
> index 0a8f5a0000..c83b1c0157 100644
> --- a/tests/plugin/insn.c
> +++ b/tests/plugin/insn.c
> @@ -44,7 +44,7 @@ static void vcpu_tb_trans(qemu_plugin_id_t id, struct q=
emu_plugin_tb *tb)
>=20=20
>  static void plugin_exit(qemu_plugin_id_t id, void *p)
>  {
> -    g_autofree gchar *out;
> +    g_autofree gchar *out =3D NULL;
>      out =3D g_strdup_printf("insns: %" PRIu64 "\n", insn_count);
>      qemu_plugin_outs(out);
>  }


--=20
Alex Benn=C3=A9e

