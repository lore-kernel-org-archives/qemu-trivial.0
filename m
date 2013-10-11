Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VUi6n-0006s6-GZ
	for mharc-qemu-trivial@gnu.org; Fri, 11 Oct 2013 15:10:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48613)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VUi6h-0006oh-7u
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 15:10:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VUi6a-0007Bj-BW
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 15:10:39 -0400
Received: from mail-la0-f41.google.com ([209.85.215.41]:46610)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VUi6a-0007BR-4V
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 15:10:32 -0400
Received: by mail-la0-f41.google.com with SMTP id ec20so3903712lab.28
	for <qemu-trivial@nongnu.org>; Fri, 11 Oct 2013 12:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1IoAihvZu5mpRxqmO/3FLg3T/HUPQqhNXHoTGuQDdUw=;
	b=PBQItexnuFrJ/bHVzMO2+5FmY4EIQ02Z6edZIZnzV0yoOU2qgkLUPa+tcCODLOHG1S
	D8tmUHorQvi7aN2ZnUcQYh2f19SvRifWYRi/HZQ5KG26TWGJFDDrvdVmVU444/eNAEEK
	euz1cCqVDLqPKSITyxujYcFcyrN4CUXaM6aV9AO06xgkwu3jM/COHLrgYHYmUAmokmn3
	ffqeXapmigrplbBZEoLmt01Fln4Z2VPC1XH3Hh+KLet+UczT6Gi4KFm1C+karaun5/lA
	f87x+e883XzUZ12rhdLh6HUkXKYKct6hSHzqzQ+J8cGsJ98TmP+pP5SROgTnbwQ6xK+r
	+T7w==
X-Gm-Message-State: ALoCoQnuIri8FUSHamOdAAKFCZSw8i+PmdMFyxG7GliAr4xuQWlvF6Y2PM2Vt/SZyfGeyIpWuJhr
X-Received: by 10.152.10.99 with SMTP id h3mr17663763lab.13.1381518631241;
	Fri, 11 Oct 2013 12:10:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.161.232 with HTTP; Fri, 11 Oct 2013 12:10:11 -0700 (PDT)
In-Reply-To: <1381496638-29127-1-git-send-email-petar.jovanovic@rt-rk.com>
References: <1381496638-29127-1-git-send-email-petar.jovanovic@rt-rk.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 12 Oct 2013 04:10:11 +0900
Message-ID: <CAFEAcA8HGFUT8P3unP0FfaxsrORm1uHewEb_8DrKFqXqY8wtJg@mail.gmail.com>
To: Petar Jovanovic <petar.jovanovic@rt-rk.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.41
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Riku Voipio <riku.voipio@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Petar Jovanovic <petar.jovanovic@imgtec.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: pass correct
	parameter to do_shmctl()
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
X-List-Received-Date: Fri, 11 Oct 2013 19:10:43 -0000

On 11 October 2013 22:03, Petar Jovanovic <petar.jovanovic@rt-rk.com> wrote:
> From: Petar Jovanovic <petar.jovanovic@imgtec.com>
>
> Fix shmctl issue by passing correct parameter buf to do_shmctl().

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

It would be nice if you gave more detail than "shmctl issue"...
(for instance there are some known issues that affect some
architectures but not others, cf
http://lists.gnu.org/archive/html/qemu-devel/2013-02/msg00447.html)

thanks
-- PMM

