Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sTjPt-0000pq-9V
	for mharc-qemu-trivial@gnu.org; Tue, 16 Jul 2024 10:44:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sTjPr-0000j5-RK
 for qemu-trivial@nongnu.org; Tue, 16 Jul 2024 10:44:31 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sTjPf-0003AS-DN
 for qemu-trivial@nongnu.org; Tue, 16 Jul 2024 10:44:31 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-58c2e5e8649so9959228a12.1
 for <qemu-trivial@nongnu.org>; Tue, 16 Jul 2024 07:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721141054; x=1721745854; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9rzLZmf8wi3VJrCA9+xiQjVWImQTbreBpuPWfZU1qY4=;
 b=ejPZ+WUMRG+zUnrqRJr5YCo2iUX8oe/tHFv9tgYikez02z+7msW7Ast23OQ0qdMieD
 fwQIRVwqkOCFBUUMe8FWB2Uc2mjNlnmAqtpatzf0+sFDjm7zlfZJ7BMMnQn3o4Gf0/KX
 nNVSqm8yj5bWqCm+7WwYcREDycZnUhXAR/k27Tn1zuR9VrcHgchzyXhc120u4E+eiMfr
 dQRaSFjAbDR0oAPjshi/d7J6vOp57OLz1iKP3tDT/rji7MxCendY2zgrjB71R/NRiyI7
 nat5TDBdTFwlgaJmErxeXfmzqeVgZXsfefb1eucxLKX80WJBqzAKSjfeSq7qhy6b3kpK
 4aIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721141054; x=1721745854;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9rzLZmf8wi3VJrCA9+xiQjVWImQTbreBpuPWfZU1qY4=;
 b=mbb9Rtade/D2gbrhebCtsktmTy6BcVjKFcZVOIM1Hhp+ps2nvIJ4yl1wtAaj3LmUVe
 f3DXFHqAn0kV05HsvsNKOwZAdydR9lBJYnFg92qSyMDDes7Borg7MnmezC7OEsqf2DKO
 onqNbrL2sNy3ZcoVwWbEs/8/jqB/giPWOV4LlnnGBZbGuTsS1gJ3bOVURnSiLVTAA1TY
 U1J0orlZfdi6cf4MxAM478DdY2a7XbsqhogzqDEon6QXO/bn7V/qF8uNouIyrI+CcSlG
 GCT44d2iGEgh1n3wiMllepPtNly4pD6vpq+pA+vI7Ylk32PcCHPXuId4yU9y2rTS55NB
 fHXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUppxAwOFXzajemKGSHxI/hZU3dp9VW4Xx/7q684ZfMTjtxia3TSKe3UALBgYH/cN30gmCm7OVfmtZpw1X2zFRfcWTiEiQONg==
X-Gm-Message-State: AOJu0YzC/slm0XDotalG/qJ1J0ey6FncMig0LhXmV2n8wRriy3sAFfhp
 5ShVYPCwOiKOrCo+YVPCMljDPF331CJw8i4eEQAYPF7tbU5Y6sXkg1gOqucDJ1I5LHzT5KdqItP
 cwmeITSE3ocfX7HK3HX6qdggDvaJfAEjzmZTHew==
X-Google-Smtp-Source: AGHT+IH+pfyzhanmtTgdevkSavrsq2jJEwGbbZH1+Byxa3hOocfhpE2M0MSLdPAmHe8xZbLhKTyn1Qk3Wrwr2BE0vSQ=
X-Received: by 2002:a05:6402:3594:b0:58b:bb69:763e with SMTP id
 4fb4d7f45d1cf-59f0ac09412mr2071906a12.7.1721141053847; Tue, 16 Jul 2024
 07:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <20240713160353.62410-1-me@samjakob.com>
 <CAFEAcA82m+8K8rWDMBehPp=NGUezHZPn1LVoyU3DJ3LWq+ZnAw@mail.gmail.com>
 <3e35a80c-fa0f-41f5-8a63-30a873fb3bad@linaro.org>
In-Reply-To: <3e35a80c-fa0f-41f5-8a63-30a873fb3bad@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jul 2024 15:44:02 +0100
Message-ID: <CAFEAcA_jA9BnBRYZK8b15ibp7SFw0PNKb7H=-xs4p=ttOesahg@mail.gmail.com>
Subject: Re: [PATCH] hw/display/bcm2835_fb: fix fb_use_offsets condition
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: SamJakob <me@samjakob.com>, qemu-trivial@nongnu.org, 
 "open list:Raspberry Pi" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 16 Jul 2024 14:44:32 -0000

On Tue, 16 Jul 2024 at 15:37, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 16/7/24 12:35, Peter Maydell wrote:
> > On Sat, 13 Jul 2024 at 17:04, SamJakob <me@samjakob.com> wrote:
> >>
> >>          It is common practice when implementing double-buffering
> >>          on VideoCore to do so by multiplying the height of the
> >>          virtual buffer by the number of virtual screens desired
> >>          (i.e., two - in the case of double-bufferring).
> >>
> >>          At present, this won't work in QEMU because the logic in
> >>          fb_use_offsets require that both the virtual width and
> >>          height exceed their physical counterparts.
> >>
> >>          This appears to be unintentional/a typo and indeed the
> >>          comment states; "Experimentally, the hardware seems to
> >>          do this only if the viewport size is larger than the
> >>          physical screen". The viewport/virtual size would be
> >>          larger than the physical size if either virtual dimension
> >>          were larger than their physical counterparts and not
> >>          necessarily both.
> >>
> >> Signed-off-by: SamJakob <me@samjakob.com>
> >
> > Thanks for this bugfix; I've applied it to my target-arm.next
> > queue and it should get upstream within a week or so.
>
> Since I'm seeing 2 times the same patch, adding R-b again on
> this one:
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> (BTW Peter the commit description is mis-aligned, if you
> don't mind, correcting it while applying would be appreciated!)

Yep, I already picked up your r-by and rewrapped the commit
message.

-- PMM

