Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hOem9-0006q7-87
	for mharc-qemu-trivial@gnu.org; Thu, 09 May 2019 04:51:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52356)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hOem6-0006oq-QD
	for qemu-trivial@nongnu.org; Thu, 09 May 2019 04:51:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hOem5-0004WV-Pc
	for qemu-trivial@nongnu.org; Thu, 09 May 2019 04:51:34 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:40158)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hOem2-0004UU-JM
	for qemu-trivial@nongnu.org; Thu, 09 May 2019 04:51:31 -0400
Received: by mail-ot1-x330.google.com with SMTP id w6so1571143otl.7
	for <qemu-trivial@nongnu.org>; Thu, 09 May 2019 01:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SUQDvLXub66SmTLB5kPWL99Xoj8+DJYO1pbuhVRCM0I=;
	b=azxAu7Ah77zyZ5qcsZ3Xg+kafzWPO8dl3NsLlgu001DHUz8k23yNy3VTt6WlKAeLtL
	1RCZiu4a/ZEvXfIJ24zlb38jNduqKmoTd3w+ACpyGT6QQs6xLMRDw7UieIeZR636H59Z
	YNvvAbw3ay7jfNZJpRxMlnJF03nY+YZlWrTCmfwN/2wHiJC7pbgjffNGx2Zplr+X1icv
	FaBZWBUnSMTqvTz9Gcm+06aUztFk1yLJ+1qGWggB748muChBCKS3eVUdV+F2vul0QNA4
	QE1i9NybiEuzRg8q7Gh83gjWkjsj4LuRrHwQV8p/LHGqm2d/j8d6fZb42wU6OzLd5h/9
	E4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SUQDvLXub66SmTLB5kPWL99Xoj8+DJYO1pbuhVRCM0I=;
	b=lTlFcFzQ3Qxq3rZEtuAPuRdY2uf8DTc+f3lHXDicFKFSN0EedW+rCCShNvMZaN5F9i
	E66xz/qEj+6KMqSJ+4N2h2a7VPtA2zE4VbA8UDNZsFSfQHYwlVGXPzP+Ap/ioeQa42CL
	KKP3qXdz1QHfo7DEf0bjFxGnRpWJ76y+3D+DuL2J4Ox3LWW2Sd/AEmHTW53zMDNRwfmm
	DIXxzFlxDgPHD12joQ6xhneu1RvxOW64IvcTu7s5o5xLbr1roLgH1iwo4f14kLHdf3U9
	9Gnf3O4Ez27rNtkvR5vF05901+ggxs83xMIIMexpe/we0ru88T45zRyo9P9axqWMrrdA
	7AoQ==
X-Gm-Message-State: APjAAAW0MFZEZfQ10EKXJA37vVC1vxN56geQicHPvulzrBKiEGcpboTH
	w3I4yWgjktsNY8WXNvi8+1fgJM4PUoB0EgUniCVQCg==
X-Google-Smtp-Source: APXvYqwElnrIdcRwCo8EjDOJbydhchynKxgGBKyQbPIFi1QQflz4KELYQgkQX7+0eqTiuy5SRbSZit7+b4xH2WeRXT4=
X-Received: by 2002:a9d:404:: with SMTP id 4mr1609953otc.352.1557391889796;
	Thu, 09 May 2019 01:51:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190503112654.4393-1-laurent@vivier.eu>
	<80fb3313-239a-5828-94fa-d27137bfcb05@vivier.eu>
	<CAFEAcA_y24gpugttDTR-QrJ0fA7JCQeC0XXsR6pjm2rQ19rfCA@mail.gmail.com>
In-Reply-To: <CAFEAcA_y24gpugttDTR-QrJ0fA7JCQeC0XXsR6pjm2rQ19rfCA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 May 2019 09:51:18 +0100
Message-ID: <CAFEAcA9ZRSxPK17Zgx0WuhvjyVATL5-0Mp7LvBtv5O4+UGRVyg@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Jason Wang <jasowang@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Michael Roth <mdroth@linux.vnet.ibm.com>, 
	Fabien Chouteau <chouteau@adacore.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::330
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL v2 00/12] Trivial branch
 patches
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
X-List-Received-Date: Thu, 09 May 2019 08:51:35 -0000

On Tue, 7 May 2019 at 21:48, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 7 May 2019 at 20:10, Laurent Vivier <laurent@vivier.eu> wrote:
> >
> > Ping ?
>
> This is in my queue to process, but there are still a bunch of
> other pullreqs in the queue too; I am working through them.

Wait, I'm confused now. Looking back through my emails you
said "Forget this series, the send has been aborted for an
unknown reason.". So should I be applying something ?

thanks
-- PMM

