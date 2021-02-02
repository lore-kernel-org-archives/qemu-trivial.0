Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1l6unf-00038O-Go
	for mharc-qemu-trivial@gnu.org; Tue, 02 Feb 2021 07:28:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6und-00034c-PP
 for qemu-trivial@nongnu.org; Tue, 02 Feb 2021 07:28:53 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:41879)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6unc-0000bn-1l
 for qemu-trivial@nongnu.org; Tue, 02 Feb 2021 07:28:53 -0500
Received: by mail-ed1-x536.google.com with SMTP id s5so9803507edw.8
 for <qemu-trivial@nongnu.org>; Tue, 02 Feb 2021 04:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=hYvDtVlpAIxKd2kqmX8DMzyrmJwQTbWMEa+7BWN3hVE=;
 b=Mz66wzwmLCaET4hP161id2q9WIDNgCT5c8r1KmZ1GSfNrIkd7Z11gwfYXxfMMIteO6
 uPlubjmJJ5BrIwSwpxVO6zi5Or8TpmByGNIjmT5ox05N3eLWN9bT6XbA+Rj3d7utJvog
 OGDq9JABeeGs7TZqOS+4DaWhDilbavi/cG7imXLwTUguT8UEBouvbR8RBpVxgUXssA3P
 15Bh+Vdn7lmUQsGGOrhB8x06DmVeT7YKnk7sPDawS2AzQf8QhfiwB5DtwoAekjvAPOjP
 Q57N6XfmSauIppJmcT4z+DSmBKyCbX5rLPsqw2h3xkZcToJBL3tsEtkUXpuaclWX6gyJ
 4vOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=hYvDtVlpAIxKd2kqmX8DMzyrmJwQTbWMEa+7BWN3hVE=;
 b=QxyqIdnEMIoU9FfJqkSbTippO5iIjbCzwmvim1uIiiH4Ok3UtHfw3wM1hckZGxje+c
 8GVRr+Qsuj7Lj9JH45FovuuoTvtGG+aqw9wiwJfV41CX5OfMbElffHupIoXAIrKUwlDN
 DdfRLTnwGznCQSSWfXuCfYoOZPrCaxoZib9ApsM6KnOmMy0cx+K9RASB42wdd/OWKv3f
 a2SbAlXamTrtoMQ2aqacJF3Uzb2zB1RzvmrLVZKRAGlOZuQerBUJ+SJpqUGlbvc/6GgO
 BDv1TQR2+gwvN3Fw7b3s78F20bI4JW5l5fMKUfAUmy+GC2nXHC3CqkZsPcPj/e0H1jmm
 vaHw==
X-Gm-Message-State: AOAM530LOF7vYumaaEWhH6KcIx1YvITDwaLwUGGADNuOx4EBoQvYW1bF
 HpHuBVROplFSUZNi6CE7otW+5pO2YyN4U4Rs9NjWLQ==
X-Google-Smtp-Source: ABdhPJwFSjA+EVAY6n9WDd5UX42kJeqHWbNGHST77Rr8jnodsq64NVR7v4ay2BCBfO1IZt8wjJ7BKBSTqbxAAISpC0o=
X-Received: by 2002:a05:6402:31ac:: with SMTP id
 dj12mr23029427edb.44.1612268930443; 
 Tue, 02 Feb 2021 04:28:50 -0800 (PST)
MIME-Version: 1.0
References: <20210131151410.318649-1-f4bug@amsat.org>
 <20210131151410.318649-3-f4bug@amsat.org>
 <20210201081826.yx34xjzbgsiwzcpd@sekoia-pc.home.lmichel.fr>
In-Reply-To: <20210201081826.yx34xjzbgsiwzcpd@sekoia-pc.home.lmichel.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 12:28:39 +0000
Message-ID: <CAFEAcA8eDgsGY_Vq5SRuv9HxHY8Qz2j86A0PmKuHfj=H2wm7kQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] hw/arm/raspi: Restrict BCM2835 / BCM2836 SoC to
 TCG
To: Luc Michel <luc@lmichel.fr>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 QEMU Developers <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>, 
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
X-List-Received-Date: Tue, 02 Feb 2021 12:28:54 -0000

On Mon, 1 Feb 2021 at 08:18, Luc Michel <luc@lmichel.fr> wrote:
> On 16:14 Sun 31 Jan     , Philippe Mathieu-Daud=C3=A9 wrote:
> > KVM requires the target cpu to be at least ARMv8 architecture
> > (support on ARMv7 has been dropped in commit 82bf7ae84ce:
> > "target/arm: Remove KVM support for 32-bit Arm hosts").
> Wow, is there absolutely no way to do that then? What about using an
> ARMv8 and starting in AArch32 mode? Is that possible with KVM? I guess
> it might not be strictly identical as spawning the "real" CPU...

"Support hardware-accelerated emulation of older v7 CPUs" is
not a design goal of the virtualization extensions; you can't
do it. KVM does support having a guest CPU which is AArch32 for EL1,
but that will never be a v7 CPU, because it will be the same as
the host CPU, which will always be v8.

In general I would prefer that we don't try to do stuff to
make KVM kinda-sorta-work on random 32-bit boards by stuffing
in a not-the-right-type CPU, because this increases our
security boundary massively. At the moment we can reasonably
say "only the 'virt' board and one of the Xilinx boards are
security-critical".

thanks
-- PMM

