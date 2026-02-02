Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5D7E7DF13
	for <qemu-trivial@archiver.kernel.org>; Mon,  2 Feb 2026 17:42:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1vmxwh-0001FZ-Sh; Mon, 02 Feb 2026 12:42:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vmxwf-0001F6-R4
 for qemu-trivial@nongnu.org; Mon, 02 Feb 2026 12:42:41 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vmxwd-0005QE-UT
 for qemu-trivial@nongnu.org; Mon, 02 Feb 2026 12:42:41 -0500
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-b886fc047d5so894981266b.3
 for <qemu-trivial@nongnu.org>; Mon, 02 Feb 2026 09:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770054158; x=1770658958; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A5iEbnZiMI5JktEUcqTFYwNIYDAbh15eacXWSPeJSYw=;
 b=YZz2ji//mvpBefkveEKx9vGUfagAFxAgMFX9k3PXZr9GxWFijs74yuFXf7Uc/JYKq1
 bWEPXuk5+JNAkmhFgldmZmzzWcsLHVlrWKWBx5VMSxs+0O6pBSp0dqJXI9Ynrra54hEz
 kQR6608cs6j8QyCe6yl/3QTQl3ozP9jwxYufoxURW9pdnaWHBBi9kRBMepHNI41AmOCj
 LRHu8E+w7taWrOcLz6fmpk10hvZgCRAceBqoTk78F7eNrbU0auwhRtjrHW2J1SDSmep3
 EEmpGagOXuT0rfuNtiwy5JFm6JlhNlDh+qRC030HmsjiejLHFoYxLyJq0J7SgfTvTu5o
 1ggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770054158; x=1770658958;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A5iEbnZiMI5JktEUcqTFYwNIYDAbh15eacXWSPeJSYw=;
 b=BEzUwe6knZlAts84kmePbZW9vR0kaCQkbCmeRqt8ZrghRYCK9lepvAWjNnaFThfnwD
 cLcg981g0HLyey9BT0mOfzF32TM7L7RbpbVowgPwSStPMYJmmLk+Pi3IReFu8Rdq3mta
 BbpQEMMukUGvvEuzgR61Fe3DNjvTilE+4N4Zzj2jz3mT5P0EEalz5oQJz9Wt40zSZk+B
 uPnb7XNgkaaDIX9j19Dl1ultWwcz4JI+1ARGc4WES0D5+Vv/udVD2JxIFbJOPq1Fsy1m
 6Yk0p84xV5EdqaIXxhJVshKVf1D2oQcUfNGRhvFF6mDI7uPHXvI1yDOLsyw6yr00P4Lf
 N44w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF477rD8uZ+kZrzMkwS3/96f5lycEfPgUBAm13g2FRQp9YSRQDhC3NYBPufRQI5KXXp2TiiE83JWaqZdQ=@nongnu.org
X-Gm-Message-State: AOJu0YzmWNasLf+5G7ErN3yv2nxKUzp6Dvo/gnbSlzpgVdtcqPXWKxQu
 TdjyDsunP/6WSpiINkJ3fzDjgTxGWfpZb7SWzJgsQNKtcwVOhofvOV8OR0cuG9JRzvY=
X-Gm-Gg: AZuq6aLPLbeziWLG3p0Mcohp/5p3hPG7uqPLGZl6V8vt9kxnx9Gmmcx8X7mmo+Lck72
 Mnc65dadu2HT7Fd7AmPA9XbKGqkwybBnORP1co08c8zAVxbhlw48DiQiDA+kmVoAgSI859b9WrA
 6s6yneMC1zR4kU0/yC/TvCf6lZOx7Y5HoBQoAxGurwZdDCu9RKNvxoaarTgKuGUypL2jeESovda
 HHNbopcEBNWo+34thXHbI2D0lkyQ3wWuwIxfCbETIHW2+aV0odJUMhfD2gg5NBCunDyuHEWqsor
 Er7HL+6lvNwb3h96yMl4+UdPKxlwvSpJLQWIwpKZfkOMK014dqCCB0Vh782qefiTXxpPs1x/fPT
 co7w7V7dCEP2JW+9Dm6V/pSZOjlfEMW0809nEfG6dN44fhj5LOB1AMGbjfK0aKpv+hCWUl76P8n
 bC22pFXJHwL96Hjd4hMsOjCA==
X-Received: by 2002:a17:906:ee86:b0:b8d:7c0f:5bfc with SMTP id
 a640c23a62f3a-b8dff7241camr757121366b.64.1770054157848; 
 Mon, 02 Feb 2026 09:42:37 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8dbeffed15sm884542866b.31.2026.02.02.09.42.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 09:42:37 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 50A9A5F7D8;
 Mon, 02 Feb 2026 17:42:36 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>,  qemu-devel@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>,  qemu-trivial@nongnu.org, gustavo.romero@linaro.org
Subject: Re: [PATCH] configure: Remove duplicated entry of --gdb in the help
 text
In-Reply-To: <35b3750b-31ab-4120-8edd-74aa1ae5f0bf@redhat.com> (Thomas Huth's
 message of "Tue, 20 Jan 2026 13:02:59 +0100")
References: <20260114155355.82096-1-thuth@redhat.com>
 <878qe0jfgs.fsf@draig.linaro.org>
 <bc463c63-ec0c-4666-a9ed-7c53e02a24c4@tls.msk.ru>
 <35b3750b-31ab-4120-8edd-74aa1ae5f0bf@redhat.com>
User-Agent: mu4e 1.14.0-pre1; emacs 30.1
Date: Mon, 02 Feb 2026 17:42:36 +0000
Message-ID: <87tsvznisz.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

Thomas Huth <thuth@redhat.com> writes:

> On 20/01/2026 12.31, Michael Tokarev wrote:
>> On 1/14/26 20:01, Alex Benn=C3=A9e wrote:
>>> Thomas Huth <thuth@redhat.com> writes:
>>>
>>>> From: Thomas Huth <thuth@redhat.com>
>>>>
>>>> Since --gdb has recently been added to meson_options.txt, the help
>>>> text shows up twice in the output of "./configure --help":
>>>>
>>>> =C2=A0 $ ./configure --help | grep gdb
>>>> =C2=A0=C2=A0=C2=A0 --gdb=3DGDB-path=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 gdb to use for gdbstub tests [/usr/bin/gdb]
>>>> =C2=A0=C2=A0=C2=A0 --gdb=3DVALUE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Path to GDB
>>>
>>> It's a shame to loose the default value - is there anyway for the meson
>>> version to show the auto-detected value?
>> Maybe we can drop this line from meson but keep it in ./configure?
>
> The meson stuff is generated automatically, so no clue how that could
> be done in a nice way?

I tried the other way around and squashed the meson_options_help text
with:

  20260202174123.1943748-1-alex.bennee@linaro.org

>
>  Thomas

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

