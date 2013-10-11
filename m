Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VUhWl-0001so-8R
	for mharc-qemu-trivial@gnu.org; Fri, 11 Oct 2013 14:33:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39926)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VUhWb-0001pA-P8
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 14:33:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VUhWT-0003y5-7J
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 14:33:21 -0400
Received: from mail-la0-f49.google.com ([209.85.215.49]:34002)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VUhWT-0003xy-0K
	for qemu-trivial@nongnu.org; Fri, 11 Oct 2013 14:33:13 -0400
Received: by mail-la0-f49.google.com with SMTP id ev20so3698258lab.22
	for <qemu-trivial@nongnu.org>; Fri, 11 Oct 2013 11:33:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=j42Js9eVmmZ6KRJDkdyyj9w17zMKscQiC7R5ioE2njw=;
	b=UOjkpSmPoDs5E5SAQnKttA01mbNhZFFbI/+soqPLwyaJXT3WrwiIvA9FZ9H3MW5Eqj
	KE14Ylurj04/PBqhgkBJ+3djjSGq/8zthZ6FoTlR0IEnDkeRO3Nhz1Rh7UREEfWr83Q5
	r801XU8rFw9m2Xy6JE/oEJzHj6VYT7vVIjI3I9tVjfZAmFLikhcfFXWUFwa+xnZRkafs
	QSoGiTH9ukrxOet/AeUgztYg80vTLAqM6DIb7qMNe8bRCWZ7JuERik6MxIkbIL4wCSPX
	Xo+8Y1SjlbeciBwmbTGyIsDuPPQjal2uAL/G4iuLU4Nrn3M84VG6P2miic+JZpnuRBi7
	Zerw==
X-Gm-Message-State: ALoCoQnFlnqVR2lVM9EEOwQtOrllY7o0YHRpcc16XizH/GMvoGDL8MNE8nxUeYUGRRFTcDdkO2g/
X-Received: by 10.112.156.103 with SMTP id wd7mr2109999lbb.48.1381516391494;
	Fri, 11 Oct 2013 11:33:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.161.232 with HTTP; Fri, 11 Oct 2013 11:32:51 -0700 (PDT)
In-Reply-To: <52579626.8020507@weilnetz.de>
References: <1373228703-26226-1-git-send-email-sw@weilnetz.de>
	<037D60EF2A5746E468BF0A04@nimrod.local>
	<CAFEAcA9V_THiPwVwv-gYH14h2kujDnWpGAOSBd95C9W56p3AuQ@mail.gmail.com>
	<51DA438A.8060903@weilnetz.de>
	<CAHR064g-jOt7XaY4G9a7MZRs_qd9REnyyGn8D=mrRoY+J-bXUA@mail.gmail.com>
	<5256FBE7.80207@weilnetz.de>
	<CAFEAcA_KEnRRUCp87K55RanQWHXr2gPBvtk2uQc7hCwjo6S94g@mail.gmail.com>
	<52579626.8020507@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 12 Oct 2013 03:32:51 +0900
Message-ID: <CAFEAcA_it84ovfSmsWV8ObpgWe=yeoyVF8Rk+LaHfmznS530Mg@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.49
Cc: Alex Bligh <alex@alex.org.uk>, Corentin Chary <corentincj@iksaif.net>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Qemu-development List <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Spelling fixes
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
X-List-Received-Date: Fri, 11 Oct 2013 18:33:27 -0000

On 11 October 2013 15:09, Stefan Weil <sw@weilnetz.de> wrote:
> - This lead us to more speed and less memory.
> - Of cause, the result of both method is quite same
> - because it's only difference that coefficient position.
> + This leads us to more speed and less memory.
> + Of course, the result of both methods is quite same
> + because its only difference is that coefficient position.
>
>
> Would you agree on fixing the first line only and removing the two following lines?

Yes, I think that would be OK.

thanks
-- PMM

