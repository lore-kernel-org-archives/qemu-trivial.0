Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T8Zfq-0002Af-8j
	for mharc-qemu-trivial@gnu.org; Mon, 03 Sep 2012 12:38:54 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49690)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T8Zfn-00026x-Hm
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 12:38:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T8Zfl-0006Od-Q9
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 12:38:51 -0400
Received: from mail-ie0-f173.google.com ([209.85.223.173]:34121)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1T8Zfl-0006OS-Ll
	for qemu-trivial@nongnu.org; Mon, 03 Sep 2012 12:38:49 -0400
Received: by iebc10 with SMTP id c10so3546151ieb.4
	for <qemu-trivial@nongnu.org>; Mon, 03 Sep 2012 09:38:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=aHIVpTwk+CIJp5CJ3OG7ZvqihVWObYnnQnkLegTyiv8=;
	b=Wvzqp1m4NNcFN2cPIdCbLqbzUpEVqqWCvv6+YtJlFYG+vWI6qajOO4IOA8rhLABE3N
	UGmW+rNKFHoR8VDGPAPG6Ik7qM0xCifXMQf7fMiJu4ECZHOO3vpfHqhgs/6739StPZkS
	EWTYEgOsgwpXs9xWYuT4NG5naYdyeIdhV1FH7ofLca7vJOpWq5VlYtZbexzH/8SbQhN7
	IqtpDmb/2q3JrDob16HyW8fUzzmrPqnIbtrDZp9V0Vh17f/9D46516isBTBeBmFc1Iqa
	rHNOm8yfIV5iS+BYgSr/dvye9m+Q6+EK1hAZR72vyL85HgZWvzhFUpbpACfm+DxFOGnC
	C0gA==
MIME-Version: 1.0
Received: by 10.50.186.132 with SMTP id fk4mr3053139igc.41.1346690329023; Mon,
	03 Sep 2012 09:38:49 -0700 (PDT)
Received: by 10.50.19.36 with HTTP; Mon, 3 Sep 2012 09:38:48 -0700 (PDT)
In-Reply-To: <201209031828.15426.yann.morin.1998@free.fr>
References: <1346591386-22698-1-git-send-email-yann.morin.1998@free.fr>
	<5044CFBC.9050800@suse.de>
	<CAFEAcA88-bBA57REcsfU+FmLr7J2y_qD+n+_G_mBp6f1EtxuBw@mail.gmail.com>
	<201209031828.15426.yann.morin.1998@free.fr>
Date: Mon, 3 Sep 2012 17:38:48 +0100
Message-ID: <CAFEAcA-4CMyAONn5QOb7PKi0Zv=pioEOxgCLEZBmSM7t+Cgv7g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQm8TXI0R4yl9/55YrYuzBgNFNrY5mtEI432CbhVQxCM6ZVxuh3f8TBajj/Q2qonUVFl+ry+
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.223.173
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/2 v3] Fix static linking
	for cURL and SDL
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Sep 2012 16:38:52 -0000

On 3 September 2012 17:28, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> On Monday 03 September 2012 17:44:51 Peter Maydell wrote:
>> Personally I think it might indeed be a good idea to just say
>> "statically linked softmmu isn't supported" and forbid it, unless
>> somebody has a good use case for it...
>
> I personnally have such a use-case: provide run-everywhere qemu softmmu
> binaries that do have minimal requirements on the distro they'll be
> running on, especially when the distros can be very different (in kinds
> and in age).

...have you audited all of qemu's library usage to confirm that it
doesn't use any of the bits of glibc that don't work in the static
linking scenario? I'm reasonably confident that the linux-user binaries
are OK, much less so for the system binaries...

-- PMM

