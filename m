Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hTmLG-0004GJ-9T
	for mharc-qemu-trivial@gnu.org; Thu, 23 May 2019 07:57:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40174)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hTmLE-0004F1-8E
	for qemu-trivial@nongnu.org; Thu, 23 May 2019 07:57:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hTmLD-00024T-BY
	for qemu-trivial@nongnu.org; Thu, 23 May 2019 07:57:00 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:44116)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hTmLD-00023y-71
	for qemu-trivial@nongnu.org; Thu, 23 May 2019 07:56:59 -0400
Received: by mail-oi1-x244.google.com with SMTP id z65so4113029oia.11
	for <qemu-trivial@nongnu.org>; Thu, 23 May 2019 04:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=NZDEYEz5nD7XS3id+akGIIH+Yn6baWTOmRiQPpPliAM=;
	b=B7IqlLLrYVFEDJEBzBf57E56eW+EnSDVdyLi0xapbXFWIyo+Ye0sEBfC2h21aO5qOz
	mQW5gmxDHSmCCsNBsgwijKlwhvWC53+5Xd3xgm0C+gmwkFwqrIAnRH3NrGwdABScrCFX
	kat2p1fzv6coZbfDxIE7gxAqRypFqP7i0yxIaitRVNORzyVy/+uBvLOY3PdkgCZ2XnAf
	7VNRAfgMxg1oQBS/Bjvy9uBfvuFNLvhUteB/Qr3RHe/ePiGJTpyEXI9Dptya+xlVyU/s
	DydKeg/dejbOHQ673ZbInhsW2ZW4h4crcarGPtFaUMGt3SpPnZQIa+mroxb9n/MVxNxT
	TvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=NZDEYEz5nD7XS3id+akGIIH+Yn6baWTOmRiQPpPliAM=;
	b=peJ5uBICOoRP1QeLTbl/yPhuHSjFZ8V+eVK60WL33pOHceM+1mm7zceLrji6Z7tWqn
	45+m+SF2/wKwzhtR3j7uY0yGz7PLxP34AZEx9nCt7jCjzKACM8qXrArPDpdV6p8keWoM
	1s8vd5E36/WOfSjk9GV4KZnGWGN9nA42ryBowp7Pax9tMKaCMPXcgh4bk21F3VU8QZ1e
	nUdje77j4RswrUQ4FKs5/5xdqiE+d4cbZMwV4OWIU6d5noXhAaw3h90EhCZcrVQMdE/v
	ueglagkAxb+9xHmZjbM6ff03vqVVgiZicjVg/KfG5J6G2eCqHe8FjEVlMWkaLiJirKTb
	4T2A==
X-Gm-Message-State: APjAAAVn6yu6tstgFc1Mi02fwRAdTcLkYmEe/syRszDM39xSlDHprIZd
	wsKEwEhOxccYofVvjzYoTTtNvJWcVLEhGSG5vm66kQ==
X-Google-Smtp-Source: APXvYqx8TShlZQ7WnClyodAMyAeiO8vmzd5+CFcsE1NtRZEMP2/LmgAmb82s9aSLT0HAmBHdXOsMEFu4KIERXqvItVE=
X-Received: by 2002:aca:5785:: with SMTP id l127mr2344269oib.48.1558612618333; 
	Thu, 23 May 2019 04:56:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190522160723.31484-1-laurent@vivier.eu>
In-Reply-To: <20190522160723.31484-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2019 12:56:47 +0100
Message-ID: <CAFEAcA9LtfvZOgqSN=b19kprFL_6CEfBcXynqbfn1LniGHdPhQ@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Tony Krowiak <akrowiak@linux.ibm.com>, 
	Eric Farman <farman@linux.ibm.com>, Farhan Ali <alifm@linux.ibm.com>, 
	Pierre Morel <pmorel@linux.ibm.com>, Juan Quintela <quintela@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Cornelia Huck <cohuck@redhat.com>, 
	Michael Tokarev <mjt@tls.msk.ru>,
	Alex Williamson <alex.williamson@redhat.com>, 
	Halil Pasic <pasic@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>, 
	qemu-s390x <qemu-s390x@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 0/9] Trivial branch patches
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
X-List-Received-Date: Thu, 23 May 2019 11:57:01 -0000

On Wed, 22 May 2019 at 17:13, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit a4f667b6714916683408b983cfe0a615a725775f:
>
>   Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20190521-3' into staging (2019-05-21 16:30:13 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>
> for you to fetch changes up to 2d9574bdbed69b374116c59259f6bd14f7dfad7f:
>
>   pci: msix: move 'MSIX_CAP_LENGTH' to header file (2019-05-22 17:35:27 +0200)
>
> ----------------------------------------------------------------
> typo fixes, TYPE_XXX usage cleanup, comments update,
> virtio-mmio trace functions cleanup
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

-- PMM

