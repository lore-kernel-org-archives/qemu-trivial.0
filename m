Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ez5jF-0002Ln-GY
	for mharc-qemu-trivial@gnu.org; Thu, 22 Mar 2018 15:18:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42817)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ez5jA-0002IH-HU
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 15:18:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ez5j8-0002FP-SF
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 15:18:20 -0400
Received: from mail-ot0-x22b.google.com ([2607:f8b0:4003:c0f::22b]:43278)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ez5j8-0002Ek-MM
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 15:18:18 -0400
Received: by mail-ot0-x22b.google.com with SMTP id m22-v6so10692309otf.10
	for <qemu-trivial@nongnu.org>; Thu, 22 Mar 2018 12:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6RxeY6euEZxhYAbNdzMXC9j8BvCtveMDyLGwXgNGgXY=;
	b=OIcNWpT7AiHfIDXqS2ni4b/et3JdiuSP3UQSoPpYhXMB0AGT8LDBZ3EYFeccmCohJi
	W/I00oGvcILmhd9+MNjbAM7UvXgfIrowu/u5rgfniEMFqgUGMQts+jEHuJaoged4KMa1
	QPV6noy9GgnhOaXnCFO+Ff/nNRUgk3/LfKnsI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6RxeY6euEZxhYAbNdzMXC9j8BvCtveMDyLGwXgNGgXY=;
	b=O+DXDP1UQJ4yFM/Cg/M/lUwI1k1v49tfgLN+d8AWbsLeDaC+65Ver1EaMHEGGlTO1+
	0YxhEwsFC4VsiKa/Dlas7J0jt+pf3rsk4A/LmW2k61aK4FuRvyIYBNlEZCT8ZgCnYHAZ
	NXUIzTNXQMhbkOp403Q93SF+8lxCFpRZnGvL5Ryr7OnLO3y0rjYk4JrvIZ4mXPMWIp/g
	klBDUZSE1EdYf464b7s3ZzafFyMKABaKEZMfZEpJrkceXvloBUWg6zANky+nb7yXiPMD
	oE+MBA1DG2aVStN+DTQuNEPuKYCIranC9nJNjzy1ATygu37N/0C+VLhwObW1FU4RqShN
	f/+A==
X-Gm-Message-State: AElRT7GeBQePW1N44BegV/BKrCaMHhsaO2x5GlrhSPaAlBWQ6FWywVX9
	Jvj0y2+FT1/G3Pl9shG9V2/BBgwF59VliVkOpzEtTg==
X-Google-Smtp-Source: AG47ELvtb2EQQyKOGpqlXQmOWCr1GRXU9MvdG4OnAHZVcaZAK1pBwI6+ClppdYwQbb3EoFiLhKzc0UMRA0kKvLdKkZ8=
X-Received: by 2002:a9d:2ae1:: with SMTP id
	e88-v6mr17171317otb.308.1521746298042; 
	Thu, 22 Mar 2018 12:18:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 22 Mar 2018 12:17:57
	-0700 (PDT)
In-Reply-To: <6137f1be-98a0-1b3f-6bed-ca94be1b5d1a@redhat.com>
References: <20180322161226.29796-1-lvivier@redhat.com>
	<152174145840.240.3926671265619235661@71c20359a636>
	<CAFEAcA_Uxhrh2L+FghG7y2r7n36rfo41jKw9vdGZYo32nk28cg@mail.gmail.com>
	<6137f1be-98a0-1b3f-6bed-ca94be1b5d1a@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Mar 2018 19:17:57 +0000
Message-ID: <CAFEAcA8K=dBh1SJUWCZtPGphDngiYMjqeVJG5LurSXOZ-KDk+g@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Alexander Graf <agraf@suse.de>,
	Max Filippov <jcmvbkbc@gmail.com>, 
	Yongbok Kim <yongbok.kim@mips.com>, Alberto Garcia <berto@igalia.com>, 
	Qemu-block <qemu-block@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Markus Armbruster <armbru@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>, 
	Laurent Vivier <lvivier@redhat.com>, Fam Zheng <famz@redhat.com>, 
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, 
	Max Reitz <mreitz@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22b
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/4] coccinelle: re-run
 scripts from scripts/coccinelle
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
X-List-Received-Date: Thu, 22 Mar 2018 19:18:21 -0000

On 22 March 2018 at 19:12, Eric Blake <eblake@redhat.com> wrote:
> Or if we don't patch the false negative, you can bypass checkpatch with an
> ugly hack:
>
> return 0 + (...) | (...);
>
> (I'm NOT going to do that bypass - it's too ugly for my taste)

Yeah, that's definitely not something we should be doing.
checkpatch has plenty of false positives anyway, ignoring one
more is no big deal.

thanks
-- PMM

