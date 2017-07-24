Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZkYb-00075Z-6A
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 17:06:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59246)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dZkYZ-00074z-39
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 17:06:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dZkYY-0004I6-Av
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 17:06:23 -0400
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:35258)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dZkYY-0004G7-5C
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 17:06:22 -0400
Received: by mail-wm0-x235.google.com with SMTP id c184so35952612wmd.0
	for <qemu-trivial@nongnu.org>; Mon, 24 Jul 2017 14:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=sRUo1TKlG/t3gZ1s2n+4rdOmcZYMAelaD26SMo0+D1A=;
	b=FASs0IiPVc9dUvArVyAMiCtiTtsZW9PYh5oVTpf4RRjy1YLW/A/o26VeY7QReJoewJ
	HFwLRodvmiSBQfK6tuiPz2PfjmXxfW43It+qGIFVHhRtm53FWTlkhpCIKw3Wz4cpc3nz
	J5+dBQyk1Qocre6hs7d5oP/D2I8f7NU3TdRmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=sRUo1TKlG/t3gZ1s2n+4rdOmcZYMAelaD26SMo0+D1A=;
	b=CmrxLS3fJElb6FiS4C1JMbWH0P4E/JXgpk9MDZW+wqcWuYjMm1NIcumyAkBGTy1BRS
	0w5EgqLkd8AmZZ5dkJE4/MOVUjH5H9Uz6dVZvNo/yt01ui86yeVRxN8acMdMklHilzb+
	QaJwOX/e6DUvAptjFUUFGrfSNrFBEuiPSjqVj6Xlb6BI76RGlb1ZpPYaOkce3SGR0y4t
	yaR1EiTUuVKORSmZxcRC8yP4r19U3TPloWdytKWhHCLFtxfqyYFpjQtptciT1vLBYVus
	eygOWEXYkyFclhCiGUCskEknGRPokUouGxURis3AfGmK9L3j/zfxRpI7v+XmrarNuBa4
	rang==
X-Gm-Message-State: AIVw113L4N4nk+/pKwfzb+WIi+Uh1VqsNcfyCsyg5H/K8jzhdlePAc9i
	2sysTBuBdfXN9QVgn/VYy9ZmcndOJGPn
X-Received: by 10.28.193.138 with SMTP id r132mr6041656wmf.155.1500930381111; 
	Mon, 24 Jul 2017 14:06:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Mon, 24 Jul 2017 14:06:00 -0700 (PDT)
In-Reply-To: <20170724182751.18261-21-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-21-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Jul 2017 22:06:00 +0100
Message-ID: <CAFEAcA9RvWoL0cr=irYQ0iphHT9E4pqoQKTW+Bu28uoEJGR3mA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Eric Blake <eblake@redhat.com>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::235
Subject: Re: [Qemu-trivial] [PATCH for 2.10 20/35] arm/boot: fix undefined
 instruction on secondary smp cpu bootloader
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Jul 2017 21:06:23 -0000

On 24 July 2017 at 19:27, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> In a ARM multicore system, write_secondary_boot() only initializes fixups=
 for
> FIXUP_GIC_CPU_IF and FIXUP_BOOTREG, while smpboot[] also uses FIXUP_DSB.
> This results in write_bootloader() using uninitialized fixupcontext[FIXUP=
_DSB]
> instruction in the bootloader code...

Hmm? The code does:

    if (arm_feature(&cpu->env, ARM_FEATURE_V7)) {
        fixupcontext[FIXUP_DSB] =3D DSB_INSN;
    } else {
        fixupcontext[FIXUP_DSB] =3D CP15_DSB_INSN;
    }

so fixupcontext[FIXUP_DSB] is guaranteed initialized,
as are FIXUP_GIC_CPU_IF and FIXUP_BOOTREG, which are
the only fixups that the smpboot[] code uses.

thanks
-- PMM

