Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fgWyN-00068U-FY
	for mharc-qemu-trivial@gnu.org; Fri, 20 Jul 2018 11:05:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fgWyG-00063a-NK
	for qemu-trivial@nongnu.org; Fri, 20 Jul 2018 11:05:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fgWyF-0000R5-ME
	for qemu-trivial@nongnu.org; Fri, 20 Jul 2018 11:05:28 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:37873)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fgWyF-0000Qm-Gu
	for qemu-trivial@nongnu.org; Fri, 20 Jul 2018 11:05:27 -0400
Received: by mail-oi0-x242.google.com with SMTP id k81-v6so21882359oib.4
	for <qemu-trivial@nongnu.org>; Fri, 20 Jul 2018 08:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JVS0R1oXtwoY+jBepgkZayWd0fXinyrwdSVYBdL1vyQ=;
	b=RZ7NXF52euf7iKvqzQy1cAYnq6f9HGxzRa1qrafUHpP2T9gXZiYWvrcSVbEhlbB1sc
	7lEyh7Vv3E8wt36dzanjbEigoXOGulywe7JElFH3GDXnLHSn0vjSHXF63mARo3VQ1RCm
	50FXYd5cyj2oSeFNy2rKt+FTPUvLzs1RYjS+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JVS0R1oXtwoY+jBepgkZayWd0fXinyrwdSVYBdL1vyQ=;
	b=XIFzr9iTUjssolcumJB7H0xS18fXtiOjctzpxRk7OSKljNrZ8eoG1NDS+3LDcI1Ef8
	JMB74EgjbaS1FdgRZmhzgbAUF1zqjOiKrYLSivmqiwXUJiWJr18bE+8A6f1cqm9hdt8W
	P5iH/QM5L9NJTLjEwp1nI/14FTXEnzRpDev0pL1BKdGailPSd5n+jxGaODOssf2nk8qE
	SUQje4i+y+C4ftkMxRtlkfcH1hB6H+QXoSSYwKjw2+N5AIZWr3ArUzoGuNnK+vFMEmoo
	8SRTAb12dG5sivwisuPZ5X2LapFkC8+q+xUe0xm+mTzgcoEwlYbM2/CX5cs/2ruCON3e
	t1fQ==
X-Gm-Message-State: AOUpUlGvqvn8Um8hfTYbBY0RJ7QFN0n3RDXCMROH9wF4nalzgSvQax8C
	Og1I/GcFIu1SiYHw3HonB18eifg1bDpdIjD/2fMGjg==
X-Google-Smtp-Source: AAOMgpdMEYFkgLmaNs1FZSAG/bcfmm11v3cScPCWtgx/ont/MCy0eVG21wP+svKbME9CRJkgrzE10o5YTA+bgitckyA=
X-Received: by 2002:aca:a982:: with SMTP id
	s124-v6mr2610345oie.80.1532099126918; 
	Fri, 20 Jul 2018 08:05:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Fri, 20 Jul 2018 08:05:06
	-0700 (PDT)
In-Reply-To: <20180718061027.10980-1-sw@weilnetz.de>
References: <20180718061027.10980-1-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Jul 2018 16:05:06 +0100
Message-ID: <CAFEAcA9GD5ApmZJUeCMfTZnQJsFaKbceP6G2Q_QXCWYm8mow2g@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: QEMU Developer <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Alexander Shopov <ash@kambanaria.org>, Kevin Wolf <kwolf@redhat.com>, 
	Aurelien Jarno <aurelien@aurel32.net>,
	=?UTF-8?B?w4Frb3MgS292w6Fjcw==?= <akoskovacs@gmx.com>, 
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?B?T3phbiDDh2HEn2xheWFu?= <ozancag@gmail.com>, 
	Fam Zheng <famz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-trivial] [PATCH for-3.0] po: Don't include comments with
 location
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
X-List-Received-Date: Fri, 20 Jul 2018 15:05:34 -0000

On 18 July 2018 at 07:10, Stefan Weil <sw@weilnetz.de> wrote:
> Those comments change often when ui/gtk.c is changed and are not
> really useful.
>
> Add also a new translation for German (still to be done for all other
> languages).
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---

I think I agree with Philippe that we should split out the
mechanical change from the significant one.

thanks
-- PMM

