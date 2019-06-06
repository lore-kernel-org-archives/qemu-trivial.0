Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hYt11-000090-U1
	for mharc-qemu-trivial@gnu.org; Thu, 06 Jun 2019 10:05:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49125)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYt0x-0008UI-Jf
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 10:05:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYt0v-0001IZ-Ji
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 10:05:11 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:33024)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hYt0t-0000j5-Ti
	for qemu-trivial@nongnu.org; Thu, 06 Jun 2019 10:05:09 -0400
Received: by mail-ot1-x342.google.com with SMTP id p4so2084899oti.0
	for <qemu-trivial@nongnu.org>; Thu, 06 Jun 2019 07:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=z1TSuep6MC3GMp5QGERdQF65GkCDphddgb7kjwfjrkE=;
	b=r6qQrL+rJUN0rLwLc7SeAopdn7R7DEI2Sx/AiA2Qle0tWe+fRNKdIcHWxfujOxSJ1y
	G7RliykVU8+zjH9sR2IP+S5CRIlSvuZtSPC8fqfMvSaMSXrFRSkCZnYYVJiRbRyixlhJ
	J94fCcoV5iPVf2ZGwgZ4FAPYT7Ezt67r/m2RooeEPjypik2aJMcsscW1uUUP7Jb7i3dM
	ngzE4hGtRkSngerUTrxE7wGEafOpT1xK0tWAC22CQZcm2j9MANF5MkUtBXsnxTMqeNyW
	fSOR5bfGLwQ/HlscpAjPQ4mED0uKifcipJgx4ljw6MKqfJD/UH6p8/mlS8h0WOAEgLsX
	YPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=z1TSuep6MC3GMp5QGERdQF65GkCDphddgb7kjwfjrkE=;
	b=m67RKOh4hZM9pbtnM2tidzAe9sFW/YWj+K8gGF9z/8pX+Sc27PnFWQ1iqJgLTREx0q
	Qt/8dj7RO6UMAm2jmIWY4TKfgE0CG21LZC2158FziymP0ETHTADhrKMLWgGWdEPp7jdz
	ZNIP7Tkr42k4Coqybzw1w9/DhuuhhttPsnp+lnoauidfK39dym+k18g4avquV1cw1Tpj
	+xGvll+aR8Z1lUwnqNSq3FkT0SfIMXcNXIFzecrP562KFPyhIQxmgnBoQxt92OyLpvhU
	+IZk7aJI+ETyChFaMGSruygBhSFWUVd1QhQLDO/s0bhoxgDuOz3BQgIhhr93JnbsRHek
	KVOg==
X-Gm-Message-State: APjAAAX3LOIoFwLe1eqQ/jdIMrYIBqdVLapUVqdkCPMdSoCv1mb7X51b
	uUzOH65a4rFkArT5K4zWXdIW4BqExfRdLa6pz1bPaQ==
X-Google-Smtp-Source: APXvYqyuSP7IdHek/hJkuwNI58fkOX0Rf+yJOE3QI+FMh8L8VpFQDCiwyOSjtX4w8QuZRPy+CLk/TKoBPxwfbmrlTUU=
X-Received: by 2002:a9d:6b0d:: with SMTP id g13mr15038024otp.91.1559829902787; 
	Thu, 06 Jun 2019 07:05:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190606110625.32127-1-laurent@vivier.eu>
In-Reply-To: <20190606110625.32127-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Jun 2019 15:04:51 +0100
Message-ID: <CAFEAcA-aPY=6hAzvhkYw3Bz3Mi-iVXyDPNGguYWZXaFWpfdCpQ@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Fam Zheng <fam@euphon.net>, 
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	David Hildenbrand <david@redhat.com>, 
	Michael Tokarev <mjt@tls.msk.ru>, Gerd Hoffmann <kraxel@redhat.com>,
	Juan Quintela <quintela@redhat.com>, 
	Aleksandar Rikalo <arikalo@wavecomp.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@de.ibm.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	Yuval Shaia <yuval.shaia@oracle.com>,
	Alex Williamson <alex.williamson@redhat.com>, 
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	qemu-s390x <qemu-s390x@nongnu.org>, Cornelia Huck <cohuck@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, Michael Walle <michael@walle.cc>,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/16] Trivial branch patches
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
X-List-Received-Date: Thu, 06 Jun 2019 14:05:13 -0000

On Thu, 6 Jun 2019 at 12:18, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 47fbad45d47af8af784bb12a5719489edcd89b4c:
>
>   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2019-06-04 17:22:42 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>
> for you to fetch changes up to f1114d321246f9177072923e1c2a20e7aab82700:
>
>   hw/watchdog/wdt_i6300esb: Use DEVICE() macro to access DeviceState.qdev (2019-06-06 11:55:04 +0200)
>
> ----------------------------------------------------------------
> Trivial fixes 06/06/2019
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

-- PMM

