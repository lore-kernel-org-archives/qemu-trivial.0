Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1tRJyj-00011c-LK
	for mharc-qemu-trivial@gnu.org; Fri, 27 Dec 2024 18:42:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tRJyi-00011G-2R
 for qemu-trivial@nongnu.org; Fri, 27 Dec 2024 18:42:48 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1tRJyg-0001FE-Ga
 for qemu-trivial@nongnu.org; Fri, 27 Dec 2024 18:42:47 -0500
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aa69107179cso1264037766b.0
 for <qemu-trivial@nongnu.org>; Fri, 27 Dec 2024 15:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735342961; x=1735947761; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CeHqPtKRdkusRhZWBT4Z4qnn/ZmNQ8VL2ZQ7cJD4NgY=;
 b=tfU+SGTP/mim+3Rv3NS+5gosYO8Zlrgdqe13P57Jo8BdDj5PJuNiSoa27W4LVcO5/H
 IAPeH56a0dNMiQHb62TeDs6PvSdrlr0HpMAPy5F2+Wf8EIVG2MZYdwL+2SLJaIvqpIBp
 QCkk50BbKLymSX2u9aGiWLzLIrh1CP0i+w6Wk+MSQ9sNWbb3I31U73rJwCzOOxp9GsNb
 jN5DpZ/iD5n+dcRfh4OBvRCwJBYq+s/efwbknz+oaaMtsMBE8biebZJDBZAn86rT8u9D
 zJaCs50a0KQCp5SynsPaOM8yQmStiVGwVyUYs0/ck+4klCQbWQrcyafBh4jiCq+Fa/8C
 kMOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735342961; x=1735947761;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CeHqPtKRdkusRhZWBT4Z4qnn/ZmNQ8VL2ZQ7cJD4NgY=;
 b=SiJxbQxgIebVJychp0EPv5e/c3j9PU8DqI6E6fp1AO4He5INWTwuv7lKyQT8Y/CuV0
 SWHb/n7m2YHUTlIN08KiCEBE+jDFcZFUnaGHMOU8L4ufMx8eSdM2F0aEIn8lxPOD3LPK
 wi1l88z4IzMDdyHyNNI+408IlR2EzNlEdsA5IoiuLDtcrA46jRFObPPGozIE98UEwj8u
 Z+ZZ91/Zienv8/XWZ6kwr7r2s3mHBBJMBF3fFTUTMZXlQbhN5uLZIkcO+m6jI41kqgbd
 nnn+C888iqWwaQcYTlzF2y1tHiS/0HxgQJuQtFUEqUx0TOLYFbbmTSztrSbfOBq5zjQV
 jjew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqkEBT151SZBPpiAL5sUXbK8uVixIdTZGVY2jLCwe+jQRtM5D79ITvaa0zzH5mKLFFQuqdY7VGmc0nEbM=@nongnu.org
X-Gm-Message-State: AOJu0Yz321Shqjqgexl0cc2sI9XfnOaExSVKEjoCzHVDjthcCWQB3Wya
 YBKxuIuKGwQzrOF0gyJscnYvgGNQw0HTtq7+AWmWkJhUQ1uHZMrekBsLwzPh672WEFAnRmATCff
 yaPA=
X-Gm-Gg: ASbGncuix9psJ7bx0LRP4DYf/Mrf8+AO/ewVN3wLVrjCdHyAk2jen2zVHfReIqKRxtI
 IkzU2g/mWiI/y3LWfB+9j9JL1JEOWNuDb1Zcj/58mEiIDeNs6Fpu2mWw+vg3AGE+ks/ycsodln1
 Ru/R632FRY1xnKwFrhSQReMNT6D+gpY9eZHni3Vj8aVY6083kv+NG3iWSq5e22w/aHmW45BR1Ye
 GHZFwDAgJsJ2bIyClXGb/fxLNcR7FttMH06cWGdyBaoAX1TLmf96w0=
X-Google-Smtp-Source: AGHT+IGgcu4a3OEtLs3246M8b8Ex9GUNsttt3Csoku/cBw9X9YBjN56hLXHZEINk8ibUgbFC2JsrnA==
X-Received: by 2002:a17:907:7d9e:b0:aab:7588:f411 with SMTP id
 a640c23a62f3a-aac2b94645amr2632043866b.25.1735342961317; 
 Fri, 27 Dec 2024 15:42:41 -0800 (PST)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0efe497dsm1173484466b.132.2024.12.27.15.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Dec 2024 15:42:40 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id B005F5F792;
 Fri, 27 Dec 2024 23:42:39 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Dominik 'Disconnect3d' Czarnota <dominik.b.czarnota@gmail.com>
Cc: qemu-devel@nongnu.org,  philmd@linaro.org,  qemu-trivial@nongnu.org
Subject: Re: [PATCH] gdbstub/user-target: fix gdbserver int format (%d -> %x)
In-Reply-To: <20241227170413.72438-1-dominik.b.czarnota@gmail.com> (Dominik
 Czarnota's message of "Fri, 27 Dec 2024 18:04:13 +0100")
References: <20241227170413.72438-1-dominik.b.czarnota@gmail.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 27 Dec 2024 23:42:39 +0000
Message-ID: <87bjwwlmkw.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 27 Dec 2024 23:42:48 -0000

Dominik 'Disconnect3d' Czarnota <dominik.b.czarnota@gmail.com> writes:

> From: disconnect3d <dominik.b.czarnota@gmail.com>

You might want to fix your author attribution here.

>
> This commit fixes an incorrect format string for formatting integers
> provided to GDB when debugging a target run in QEMU user mode.
>
> The correct format is hexadecimal for both success and errno values,
> some of which can be seen here [0].
>
> [0]
> https://github.com/bminor/binutils-gdb/blob/e65a355022d0dc6b5707310876a72=
b5693ec0aa5/gdbserver/hostio.cc#L196-L213

The spec isn't totally clear on this but it seems the match
remote_hostio_parse_result() as well:

  /* Check for ",errno".  */
  if (*p =3D=3D ',')
    {
      errno =3D 0;
      *remote_errno =3D (fileio_error) strtol (p + 1, &p2, 16);
      if (errno !=3D 0 || p + 1 =3D=3D p2)
	return -1;
      p =3D p2;
    }

So: Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


You are also missing a s-o-b: https://qemu.readthedocs.io/en/master/devel/s=
ubmitting-a-patch.html#id29


> ---
>  gdbstub/user-target.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/gdbstub/user-target.c b/gdbstub/user-target.c
> index 22bf4008c0..4bfcf78aaa 100644
> --- a/gdbstub/user-target.c
> +++ b/gdbstub/user-target.c
> @@ -317,9 +317,9 @@ void gdb_handle_v_file_open(GArray *params, void *use=
r_ctx)
>      int fd =3D open(filename, flags, mode);
>  #endif
>      if (fd < 0) {
> -        g_string_printf(gdbserver_state.str_buf, "F-1,%d", errno);
> +        g_string_printf(gdbserver_state.str_buf, "F-1,%x", errno);
>      } else {
> -        g_string_printf(gdbserver_state.str_buf, "F%d", fd);
> +        g_string_printf(gdbserver_state.str_buf, "F%x", fd);
>      }
>      gdb_put_strbuf();
>  }
> @@ -329,7 +329,7 @@ void gdb_handle_v_file_close(GArray *params, void *us=
er_ctx)
>      int fd =3D gdb_get_cmd_param(params, 0)->val_ul;
>=20=20
>      if (close(fd) =3D=3D -1) {
> -        g_string_printf(gdbserver_state.str_buf, "F-1,%d", errno);
> +        g_string_printf(gdbserver_state.str_buf, "F-1,%x", errno);
>          gdb_put_strbuf();
>          return;
>      }
> @@ -352,7 +352,7 @@ void gdb_handle_v_file_pread(GArray *params, void *us=
er_ctx)
>=20=20
>      ssize_t n =3D pread(fd, buf, bufsiz, offset);
>      if (n < 0) {
> -        g_string_printf(gdbserver_state.str_buf, "F-1,%d", errno);
> +        g_string_printf(gdbserver_state.str_buf, "F-1,%x", errno);
>          gdb_put_strbuf();
>          return;
>      }
> @@ -375,7 +375,7 @@ void gdb_handle_v_file_readlink(GArray *params, void =
*user_ctx)
>      ssize_t n =3D readlink(filename, buf, BUFSIZ);
>  #endif
>      if (n < 0) {
> -        g_string_printf(gdbserver_state.str_buf, "F-1,%d", errno);
> +        g_string_printf(gdbserver_state.str_buf, "F-1,%x", errno);
>          gdb_put_strbuf();
>          return;
>      }

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

