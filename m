Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hP8Ll-0006AE-R9
	for mharc-qemu-trivial@gnu.org; Fri, 10 May 2019 12:26:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hP8Lg-00067h-Pj
	for qemu-trivial@nongnu.org; Fri, 10 May 2019 12:26:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hP8Le-0001kY-W1
	for qemu-trivial@nongnu.org; Fri, 10 May 2019 12:26:16 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:41779)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hP8Le-0001a9-RO
	for qemu-trivial@nongnu.org; Fri, 10 May 2019 12:26:14 -0400
Received: by mail-ot1-x344.google.com with SMTP id g8so6088834otl.8
	for <qemu-trivial@nongnu.org>; Fri, 10 May 2019 09:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=sPfzql6A26Y7SGTwPH39Gt8yMgNkTb9ZzSWCy7itmZk=;
	b=GCfhutfp51798vAFOvO7Zy3D1XU5IoY9JwH5ezuclDJcECt6Ld+bufQt/u1I0OUcwd
	FvwCVy/TCqJhd7YsCTIszh2DPgSAiwdS2LtysJlZTTDikG8BaKkxb5Sm1QAw19oUl5yc
	WTpPSqqOYauAnRRob8KUBRVNhM89vcOMTft0ML0GfEe9NHZCHcbwNyMqvRKGt35r9lV+
	AMFigQbiy3kwI9rbhpKMt5ulnGnWpdNVuBOJBCbhZgAOgYTHj/qdaR8q074T2WeSIAsN
	p2yW5ckleUW1wkGThIXbE3bFVFgtZOkCpwCVI00lGuKNECVbxGONNiOJ+GTmUQZz+v74
	/u/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=sPfzql6A26Y7SGTwPH39Gt8yMgNkTb9ZzSWCy7itmZk=;
	b=P0TKNbaG9yl1aEJEKKmSw9VtVGoTiqhYyQTDzSeHrQj7l+iBpJqy37zfUDlymAyj6r
	WvJSpURGlfi47dEq5uqt6ptEVSrqCTaappCr5mpr/2sx81GmfU94TXRziJto/+76wdcg
	tUpg6l9ciR0mxph0aTnQNhcE3GnT5yct3/6zt2cyZnMpcAqTtp5TzxGvlTg4XoFQI3nD
	FgJm8Q60QC5lwyyseuPXYgqHjegVofpgKuvMc5f7lTWfAUP7zyGhwG9NYDM0U0ZWuyZ9
	wbfwS/4QD1kGhCMbt29xEBW8WniK1Gm1R2Hgf6UvXWHHYKnjiUu8USiJ91PBCEQoZUDN
	SLiw==
X-Gm-Message-State: APjAAAXp0ry1C4q3fEUrieQw3HO3E/vk0ew0bbiCP+UjPZfY5m2zUXNr
	j7r455ms+j8vTXF1A4VvyYB3k3zQMpRKPeP9U6ZY8A==
X-Google-Smtp-Source: APXvYqyG1UinZ5zsgWCI4aoeysMgy9qNIN/HkXdKKDs0hQeA/iHpnsrFosQl+0jArC32IOqdT79ICfb1DxRvFYGYj/k=
X-Received: by 2002:a9d:61c6:: with SMTP id h6mr7368004otk.316.1557505568390; 
	Fri, 10 May 2019 09:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190502185835.15185-1-laurent@vivier.eu>
	<CAFEAcA9-hAU5dxUmSWtbvrPEXE-nCP1uLvLbOby-_EXZ27o+8g@mail.gmail.com>
	<87sgtv4wjo.fsf@zen.linaroharston> <87imulaude.fsf@dusky.pond.sub.org>
	<87tve53sy7.fsf@zen.linaroharston> <87zhnw58pa.fsf@dusky.pond.sub.org>
	<CAFEAcA-s0UYr0VW3ccG07r=BiGCVtDHkRb6yW0X_ev-zAkOxvw@mail.gmail.com>
	<87o94amjud.fsf@dusky.pond.sub.org>
In-Reply-To: <87o94amjud.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 May 2019 17:25:57 +0100
Message-ID: <CAFEAcA8h8ry3XiT1dUOZknTYK78_W=_b3R4CzfFNnS_Z1G9Bww@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	Eduardo Habkost <ehabkost@redhat.com>,
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	Jason Wang <jasowang@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	Laurent Vivier <laurent@vivier.eu>,
	Fabien Chouteau <chouteau@adacore.com>, 
	QEMU Developers <qemu-devel@nongnu.org>,
	Aurelien Jarno <aurelien@aurel32.net>, Gerd Hoffmann <kraxel@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>, 
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Michael Roth <mdroth@linux.vnet.ibm.com>,
	Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/13] Trivial branch patches
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
X-List-Received-Date: Fri, 10 May 2019 16:26:20 -0000

On Fri, 10 May 2019 at 16:05, Markus Armbruster <armbru@redhat.com> wrote:
> I tried to reproduce on a ppc64 box in the gcc compile farm, no dice.  I
> double-checked config-host.h has #define HOST_WORDS_BIGENDIAN 1.

On s390:
 git clone git://git.qemu.org/qemu.git qemu-tmp
 cd qemu-tmp
 mkdir build
 cd build
 ../configure
 make -j3
 make -j3 check V=1  # passes
 wget https://patchew.org/QEMU/20190313162812.8885-1-armbru@redhat.com/mbox
 git am mbox
 make -j3
 make -j3 check V=1 # fails

thanks
-- PMM

