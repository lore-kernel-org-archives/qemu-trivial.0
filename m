Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e7lE4-0005xg-Vs
	for mharc-qemu-trivial@gnu.org; Thu, 26 Oct 2017 12:41:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e7lE2-0005wa-7z
	for qemu-trivial@nongnu.org; Thu, 26 Oct 2017 12:41:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e7lE1-0001VX-DS
	for qemu-trivial@nongnu.org; Thu, 26 Oct 2017 12:41:46 -0400
Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241]:54121)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e7lE1-0001Uz-5V
	for qemu-trivial@nongnu.org; Thu, 26 Oct 2017 12:41:45 -0400
Received: by mail-wr0-x241.google.com with SMTP id u40so3779448wrf.10
	for <qemu-trivial@nongnu.org>; Thu, 26 Oct 2017 09:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NTenEeKESlmecacNY3omZ3h7dxw8+tw4YqI8uB633FU=;
	b=eNwanRQc7/6f8FJmYM3CjDMVD0ffQ1eQMUzFS0UKbBsZ1qM+77QWt4ImZGjDregTP9
	Sd7oTx2kJbHJrvCna2P5bFNGjN+ZLfhEdbZtT0ToPKV3D8UaCHlXIf0uUFb1VU5h9LuG
	iwOS2fqx7A2qX2Ryt9tpTzg0E/e3Y8l/rw2Uw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NTenEeKESlmecacNY3omZ3h7dxw8+tw4YqI8uB633FU=;
	b=A4BhLAAgeRscOp/g1rdxbNRKl8/SHrS2UyZcDKZVzJ5oFUbclZRlAlwEd01fBTX50L
	TCXTQwzfiRgLN75HD+thPbyqfiPrc7ymzW+jQ2wTOMtgBgAiRZB2dXOdBFJL+nUI2B0G
	OnLJJGSrj7UbN+oY2s6Duv49RNkWRDHysmwl7PDDRpTQ8Su6FaToGGcXIVYpzC12l6lu
	Dp8xHTlZ3h/OylkXzNrsmh6UdiThIt4JrJNtl/wgOJ0ksWBYicmKCO+hu20H8KpWNYWl
	NWoaDuLIy9EpHFrRZaB9VIriHKA6EqLf1qheo6LyfCp2EYCciv91CdWV+m6zhGswbl2c
	Fweg==
X-Gm-Message-State: AMCzsaXhhLK5wDGlADIrGmhzCBtW5PVo1uFI9LgYgM3v66Y0HeKhWdl5
	js3XfTWKobWIMLXtpIZg5iTkkdR5eH+crpMHCTkYqg==
X-Google-Smtp-Source: ABhQp+S4lLqpeecbXMs62+a27zGdHIkB3gruq95eyMXQYe/rCiBTpzZoM+9dbXpZgviTo5g46QTlFQbwJNx7EAOwD5Q=
X-Received: by 10.223.143.54 with SMTP id p51mr5579791wrb.138.1509036103762;
	Thu, 26 Oct 2017 09:41:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Thu, 26 Oct 2017 09:41:23 -0700 (PDT)
In-Reply-To: <CAHmME9qSJSPjANce_cWN6nm=qJsncfczgk7PoPa0xkOHmZjLUA@mail.gmail.com>
References: <20171023122719.17199-1-Jason@zx2c4.com>
	<CAFEAcA_PM5Fjx2Pk58h75p9vaZwFcusQdXuwy9tbDtc=EaoOJg@mail.gmail.com>
	<10e16ca3-175b-9f34-65e7-031b883b7201@amsat.org>
	<CAHmME9qtBiuAEnkCeuMd7EdeZveTVa4UOf+AQhMCFye0SYJY=Q@mail.gmail.com>
	<20171026133445.kemzfgvpbmtcogsl@kamzik.brq.redhat.com>
	<CAHmME9oyBvAV8FF9QMHyF46n8Ct6KZqThQVih2ipQmivD94Cag@mail.gmail.com>
	<CAFEAcA8O6YyS1tSzaydckFpsqpb8HXgW5PJe-VTWud_5YGdW5A@mail.gmail.com>
	<CAHmME9pE79krWx-zD=VGiScT4c=4TZ1wVxYFiF3m+8wsx9Fqeg@mail.gmail.com>
	<CAFEAcA9XoeXDCQCmRBehntWSo0WGRBsaMDmC8QCqgU1K8jAF_A@mail.gmail.com>
	<CAHmME9qSJSPjANce_cWN6nm=qJsncfczgk7PoPa0xkOHmZjLUA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Oct 2017 17:41:23 +0100
Message-ID: <CAFEAcA-bKPNwJpcny=1azScO8bzHsi0Ou+m3rYPq-=v52Gf26g@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andrew Jones <drjones@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [Qemu-arm] [PATCH] hw/arm/virt:
 support 4 serial ports
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
X-List-Received-Date: Thu, 26 Oct 2017 16:41:47 -0000

On 26 October 2017 at 17:36, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> On Thu, Oct 26, 2017 at 6:34 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> Reordering it would break existing users of the trustzone uart,
>> whose command lines would stop working.
>
> I thought this was the reason for all of those virt26, virt28,etc
> types -- people who want stability code the revision into their
> scripts. Everybody else then gets the latest.

Those are primarily about migration compatibility -- you should
be able to live migrate a guest from QEMU 2.6's virt-2.6 machine to
QEMU 2.7's virt-2.6 machine. That's a stricter requirement than
the compatibility we want to keep for non-versioned machines,
where generally we don't want to break command lines but are OK
to make changes if they don't break those existing uses.

Command lines get baked into all sorts of scripts and so they're
effectively part of QEMU's "ABI". People don't like it when we
break their previously working flows :-)

thanks
-- PMM

