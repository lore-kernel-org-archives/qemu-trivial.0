Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rY5Oy-0003Rl-KZ
	for mharc-qemu-trivial@gnu.org; Thu, 08 Feb 2024 09:29:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rY5Ov-0003QI-Nh
 for qemu-trivial@nongnu.org; Thu, 08 Feb 2024 09:29:17 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rY5Oo-0006vO-AG
 for qemu-trivial@nongnu.org; Thu, 08 Feb 2024 09:29:11 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-56061ad3d3dso1827911a12.1
 for <qemu-trivial@nongnu.org>; Thu, 08 Feb 2024 06:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707402547; x=1708007347; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uswSyOm1D4WQ+dn1PI8wLnB3SL0ieGuRJZq33vNjcvQ=;
 b=fIAgp4c5gxEs9YAkIHNgaLL5AdosKEhVDDpG508+Ns7MhPPLC/z4JJKzFLiGfNtYWo
 t4QGzlsFFgaGe+a8CJRZObGAZweatSKiTxCg+cbfta7EufK8cjalxsFkeGaboJ3DyBJF
 wsfiuQ0Ur6Qhdl5rUzuTZ/S15Bwyg8+6gIfByf5D4X9lcCh57spM1Gtl+6vqspGVbDHH
 qLxKEkpBPNWgdrqirZJAbyHG7OObiPJOc2yEcUW/4/E9wFa+m5HM64mxPby4qajcksh2
 EwG/kSEx0gM8n8Ux/A6oRdjokyjfUpQ/BQ/Da7LoLeC+pP3WYo8IyvSRrcTOa8jtzdnb
 fO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707402547; x=1708007347;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uswSyOm1D4WQ+dn1PI8wLnB3SL0ieGuRJZq33vNjcvQ=;
 b=GxEh4WMrGExeH8ACXUahuul1+xZV2LS12I7Yhyb6yoYmH2xb2g+G7Q7wmjXYydm9hh
 9AJXDAM5KYW0PCOnaHned/Vn2I1dTzyWDIbDL4EVx1CgdaNSzdY1Zda3uTP7D36dZF76
 KVyccG/tLuNKowpBtJsIP7hOoodIgnY8GlpgDbzViTXXB/FxAvr3POlRAbwJKUS7wgId
 e6Luhfmrr1xWrKnzakqrspLBcGvFbvLYEmllsK6RiRdLIxAhJTz/n2OWqK5yVdSVi5hV
 LmZonyy8rhUWDWK5pVQUqhn7lVWjAdEKCNRWmdM2g2Qaz94RE47+qd+h0vlfrERBHk+Y
 cIVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoK8FXmMeuTMJdLNvlrx4z9JhCE+BzEU8y+xERihVx0uhc5Q9OjaWWPZRy59YO5jS2jpZNCZyXdEBRKjguD2K+ZmYh3O8WRA==
X-Gm-Message-State: AOJu0Yy9pwiOwFviVCS8flyHOtTUk+uoqkADfTp+13d4W6wFiJ9/um/p
 erirVUfTGBlBhlRlOgfeqKlXsCldlug593GQ8G3xULJ4etfppUkd0GqEm2x+7Ehop+82CFxBhE4
 QRruZ0J/55CW0qnIBfsYUXQGKwi4nicyezHCQIw==
X-Google-Smtp-Source: AGHT+IH/V8FP1ooPtmqO2IuX8FjlUS3TfCc4m47tQr04sKzFZFbA5e5fMV6xAX020IH5gcncK6Tkcn4jD0GE42FKjZg=
X-Received: by 2002:a05:6402:180a:b0:560:24d8:d2d1 with SMTP id
 g10-20020a056402180a00b0056024d8d2d1mr2773675edy.11.1707402547443; Thu, 08
 Feb 2024 06:29:07 -0800 (PST)
MIME-Version: 1.0
References: <20240208101657.15962-1-kwolf@redhat.com>
 <ffe07fee-0cda-4517-a64b-031cb922d806@linaro.org>
 <ZcTjlNeibKUnIDcL@redhat.com>
In-Reply-To: <ZcTjlNeibKUnIDcL@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Feb 2024 14:28:56 +0000
Message-ID: <CAFEAcA_qnVdTh96KsxPRguy--SLD1-xD=Uxp6MzE6dK6e98Cew@mail.gmail.com>
Subject: Re: [PATCH] iothread: Simplify expression in qemu_in_iothread()
To: Kevin Wolf <kwolf@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
X-List-Received-Date: Thu, 08 Feb 2024 14:29:18 -0000

On Thu, 8 Feb 2024 at 14:22, Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 08.02.2024 um 11:48 hat Philippe Mathieu-Daud=C3=A9 geschrieben:
> > BTW using the same pattern:
> >
> > -- >8 --
> > diff --git a/hw/nvram/xlnx-zynqmp-efuse.c b/hw/nvram/xlnx-zynqmp-efuse.=
c
> > index ec98456e5d..d074762a25 100644
> > --- a/hw/nvram/xlnx-zynqmp-efuse.c
> > +++ b/hw/nvram/xlnx-zynqmp-efuse.c
> > @@ -582,7 +582,7 @@ static uint64_t
> > zynqmp_efuse_cache_load_prew(RegisterInfo *reg,
> >
> >  static uint64_t zynqmp_efuse_wr_lock_prew(RegisterInfo *reg, uint64_t =
val)
> >  {
> > -    return val =3D=3D 0xDF0D ? 0 : 1;
> > +    return val !=3D 0xDF0D;
> >  }
>
> Maybe. I would have to know that device to tell if this is really meant
> as boolean. Or maybe it should be written 0x0 and 0x1 to signify that
> it's a register value or something.

This is a RegisterAccessinfo pre_write hook. The docs say:
 * @pre_write: Pre write callback. Passed the value that's to be written,
 * immediately before the actual write. The returned value is what is writt=
en,
 * giving the handler a chance to modify the written value.

So it is indeed returning a register value, not a boolean flag
masquerading as a uint64_t.

> > diff --git a/tests/tcg/aarch64/sysregs.c b/tests/tcg/aarch64/sysregs.c
> > index 301e61d0dd..bdd73bd181 100644
> > --- a/tests/tcg/aarch64/sysregs.c
> > +++ b/tests/tcg/aarch64/sysregs.c
> > @@ -183,5 +183,5 @@ int main(void)
> >          return 1;
> >      }
> >
> > -    return should_fail_count =3D=3D 6 ? 0 : 1;
> > +    return should_fail_count !=3D 6;
> >  }
>
> This one isn't unclear to me, though. This is EXIT_SUCCESS and
> EXIT_FAILURE, just open-coded. I think making your change would make it
> only more confusing.

I agree on this one.

-- PMM

