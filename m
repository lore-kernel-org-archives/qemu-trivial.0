Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bAdmw-0000g1-H0
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jun 2016 09:44:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41065)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bAdmt-0000dT-MP
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 09:44:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bAdmh-00019H-CJ
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 09:44:51 -0400
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:35900)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bAdmh-000195-7T
	for qemu-trivial@nongnu.org; Wed, 08 Jun 2016 09:44:39 -0400
Received: by mail-vk0-x236.google.com with SMTP id g67so11503451vkb.3
	for <qemu-trivial@nongnu.org>; Wed, 08 Jun 2016 06:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aRAu1PVzd1TMc0CTpOGRCgA+KGVkwESYjNbr4b37CD0=;
	b=E12dVy55Ayol2KjZSw1/CTaLReW3aiTqfBrtUMk/IUVJhRAqahE9n5/X4uKU2g+RKD
	ZM0AFBdkjqla7z7K9fB7haWW2IT0PIVlHi+agdDzvCQ5G8J4X7Q+RDRQFBiARtMr7Pqv
	BIy9A7sIhtouYXDxIHRfILtRB4rDxt5zAQgkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aRAu1PVzd1TMc0CTpOGRCgA+KGVkwESYjNbr4b37CD0=;
	b=UIVfMWy/gCohFY0w0jjqVk3VLZNyC7KpWNOfewjau1hMn3Yp04IM+OdRz+Um7CyCVP
	OL0fiXMwyCcOLkSN+OGYlv8vGBhGMVtIM7GR2p6n98mkb9a0LJ1ZWz8YEHwyZ/Syru+F
	SXnS8tbivS+jEtoIAVhjP2QxzzEL/FwYnj5EYlQ33oPkIEZ8r8urVRqhFhZ3LkM23XlD
	B/jeXqSt3hy3uIeeKS/E6Po7eBgsq4CDlS95ld/7p3oFxiNZbptGDS03TT5447zz3qYm
	53u749BM0Fa2N2PZRl/GLQhYdCvktRyxqOkv/TMUVRGbWJvPk6plvk+XjGFIy+GRFD1m
	R1hA==
X-Gm-Message-State: ALyK8tLcl1oJSie4p/1B6B+KQmkea0V5bByVW+OHMSgT1oxRriDZaOOc4i7Mh2UePRGsIPhkutu1yFEfuGbghwsT
X-Received: by 10.31.142.202 with SMTP id q193mr2419571vkd.37.1465393478606;
	Wed, 08 Jun 2016 06:44:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Wed, 8 Jun 2016 06:44:19 -0700 (PDT)
In-Reply-To: <cover.1465312856.git.mjt@msgid.tls.msk.ru>
References: <cover.1465312856.git.mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 8 Jun 2016 14:44:19 +0100
Message-ID: <CAFEAcA9Ouv_YgNiUomTzEgwR=3xTu3E0KG5VkZ87bjk=k6KR0Q@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/51] Trivial patches for
 2016-06-07
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
X-List-Received-Date: Wed, 08 Jun 2016 13:44:52 -0000

On 7 June 2016 at 16:22, Michael Tokarev <mjt@tls.msk.ru> wrote:
> This is another attempt to push trivial queue, previous was on 2016-06-05.
> This is the same set, except that I dropped patch "pc-bios/s390-ccw: Use DIV_ROUND_UP",
> and updated "Fix linking relocatable objects on Sparc" as per previous comments.
>
> I'm not resending everything, only the new sparc patch.
>
> Thanks,
>
> /mjt
>
> The following changes since commit 79cecb3520606c55f427752c0a7a4add8afe2413:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2016-06-07 15:30:25 +0100)
>
> are available in the git repository at:
>
>   git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2016-06-07
>
> for you to fetch changes up to 30f549c2f30de65c7cbb30614b838d5478d6221b:
>
>   hbitmap: Use DIV_ROUND_UP (2016-06-07 18:19:25 +0300)
>
> ----------------------------------------------------------------
> trivial patches for 2016-06-07
>
> ----------------------------------------------------------------

Applied, thanks.

-- PMM

