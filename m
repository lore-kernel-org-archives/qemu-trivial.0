Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hP8S7-00047N-HG
	for mharc-qemu-trivial@gnu.org; Fri, 10 May 2019 12:32:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hP8S5-00045o-St
	for qemu-trivial@nongnu.org; Fri, 10 May 2019 12:32:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hP8S4-0005bU-SL
	for qemu-trivial@nongnu.org; Fri, 10 May 2019 12:32:53 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:44036)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hP8S4-0005ak-KJ
	for qemu-trivial@nongnu.org; Fri, 10 May 2019 12:32:52 -0400
Received: by mail-oi1-x242.google.com with SMTP id y25so4950350oih.11
	for <qemu-trivial@nongnu.org>; Fri, 10 May 2019 09:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=8cZGTcLmscMd4H9XexQ5d3094/QqXT+RRvWEAig6Xis=;
	b=u/BNld0WvkO5/OlvluVnbm00GumqOA0lS3UV6SR7ngKY0ZM+X++mCruvNFY0nhBtJd
	nQKxs+K8d3YghcCIskyYfBOPi+5IqVSgpguhFi+HetanJi8KdGex6G5WwdNwxjpKcq1n
	qOY4RbXfkIc5mhCxk46Qrrp7T5RMeYD44kWU0on2gHncZJ3V1mDkKyzgEf2e13QsSrxD
	WIBmLXmS2LOpxd2HMI4E3KsebVWHixcJVOsUHeTVxbLbYBC8k0WMsiIpPIdXnyF97hL8
	Iz0h+WPCKxoo+CcDUHwIKJrNmx/Jwv620PhNwsoFmpKTQBZlxHADT1FDAsF3juUTm9Pn
	w4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=8cZGTcLmscMd4H9XexQ5d3094/QqXT+RRvWEAig6Xis=;
	b=Eqta2vCAlLWWBOD8srkEMNdLr/4iulDduw/NBK2onKPVbX9zPs0EJD37qmnLmiB6vG
	RH6CKvAGzb81pY49cA+moObgglWZG2zD6GkzEu6hQhCEWBWk4WPMaD3hsw3bXzvKDuVV
	3dEdo83a8dwTFppbmomgmcl4r204EVMJnBc3Hxcqk0S1x5b9palhXrE7KrLfTspneHrW
	AkIUWrNmsbWyBdupHS60bqck7fy7FYkDDtTADYAUu03hKAemLMjNkTH3lSN8tBtMnnnm
	9/UQKkDNJrBOom0gF/WPCEDzNCYBV3EeWY2x/gu3+QE/lhDROVyQ68LYQxDL1FjaVBqq
	Mzkg==
X-Gm-Message-State: APjAAAUAVGlI2BZ4aFpWuWlVHwUpqaWO/iyonXIzVj81uP5WW0OZ3nOu
	yOTc8VqLt9wKbYtVkACnn7lxo2eH91AyEJtemWCJQA==
X-Google-Smtp-Source: APXvYqxrfsy9fUxj+v8x5h+uoHO56qozzbv6ghO6x8hE736FPs/EoHn0I9KlAsL+UaBEHQ56uux6iP2LPa5JEh/Su8w=
X-Received: by 2002:aca:b783:: with SMTP id h125mr5720244oif.146.1557505971501;
	Fri, 10 May 2019 09:32:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190502185835.15185-1-laurent@vivier.eu>
	<CAFEAcA9-hAU5dxUmSWtbvrPEXE-nCP1uLvLbOby-_EXZ27o+8g@mail.gmail.com>
	<87sgtv4wjo.fsf@zen.linaroharston> <87imulaude.fsf@dusky.pond.sub.org>
	<87tve53sy7.fsf@zen.linaroharston> <87zhnw58pa.fsf@dusky.pond.sub.org>
	<CAFEAcA-s0UYr0VW3ccG07r=BiGCVtDHkRb6yW0X_ev-zAkOxvw@mail.gmail.com>
	<87o94amjud.fsf@dusky.pond.sub.org>
	<CAFEAcA8h8ry3XiT1dUOZknTYK78_W=_b3R4CzfFNnS_Z1G9Bww@mail.gmail.com>
In-Reply-To: <CAFEAcA8h8ry3XiT1dUOZknTYK78_W=_b3R4CzfFNnS_Z1G9Bww@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 May 2019 17:32:40 +0100
Message-ID: <CAFEAcA_WNeY_jLHzyJn1qfU=6-omUFi2Hw67YGeOrRSZd68qnw@mail.gmail.com>
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
X-Received-From: 2607:f8b0:4864:20::242
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
X-List-Received-Date: Fri, 10 May 2019 16:32:55 -0000

On Fri, 10 May 2019 at 17:25, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Fri, 10 May 2019 at 16:05, Markus Armbruster <armbru@redhat.com> wrote:
> > I tried to reproduce on a ppc64 box in the gcc compile farm, no dice.  I
> > double-checked config-host.h has #define HOST_WORDS_BIGENDIAN 1.
>
> On s390:
>  git clone git://git.qemu.org/qemu.git qemu-tmp
>  cd qemu-tmp
>  mkdir build
>  cd build
>  ../configure
>  make -j3
>  make -j3 check V=1  # passes
>  wget https://patchew.org/QEMU/20190313162812.8885-1-armbru@redhat.com/mbox
>  git am mbox
>  make -j3
>  make -j3 check V=1 # fails

For completeness, the commit I got from git clone was efb4f3b62c69383a7308.

thanks
-- PMM

