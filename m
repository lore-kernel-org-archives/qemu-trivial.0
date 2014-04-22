Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WcgDk-00068V-Ow
	for mharc-qemu-trivial@gnu.org; Tue, 22 Apr 2014 15:19:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WcgDf-00066e-10
	for qemu-trivial@nongnu.org; Tue, 22 Apr 2014 15:19:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WcgDY-0002Cs-FJ
	for qemu-trivial@nongnu.org; Tue, 22 Apr 2014 15:19:02 -0400
Received: from mail-la0-f43.google.com ([209.85.215.43]:55973)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WcgDY-0002CY-7n
	for qemu-trivial@nongnu.org; Tue, 22 Apr 2014 15:18:56 -0400
Received: by mail-la0-f43.google.com with SMTP id c6so53040lan.2
	for <qemu-trivial@nongnu.org>; Tue, 22 Apr 2014 12:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1lohBEqqy4HU9g8BcrcWGGY5HnggkhvkJKUn4CgtX4A=;
	b=LePmw3cm/KHXjqwpmhE9v6RDofTozhnnX2echYF8XwJIHXw0nviQveMqlN3UheXmn4
	8BBoPPh8hGwO/PXPAV2QI07I95hjlQqolxn2liO2Ixu/wfDwSIVzg9ykpbChBxtU3pKE
	iMJEHne2DesD7ZaJXPnVXDZ/+m730mE2Mc/tanYQsm+DQKTEyPLWVQZl0CN/elfuIXwF
	kCvGMIXycUWHzu1D+gojQ575ZiVQktomWN8X+a8RVfFfKXZIwR+oXp0QVLi0PffecLuo
	+TBjs3OKWWLMI3gtvus4I4m4PNMmJ85xIBHTf19mzFSzyhzbw1JA2y0p076RwMeKDovA
	suYg==
X-Gm-Message-State: ALoCoQlncyYMs9um6ydEuFJdfPNEWTkHOnHBbN7Oi3WKRtEMRJ2XTsbcGckmNeEVVnSkgtXGUrDY
X-Received: by 10.112.137.193 with SMTP id qk1mr2678372lbb.53.1398194334507;
	Tue, 22 Apr 2014 12:18:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.180.233 with HTTP; Tue, 22 Apr 2014 12:18:34 -0700 (PDT)
In-Reply-To: <5356996A.5090502@redhat.com>
References: <5353B7F9.4060803@gmail.com> <5355349E.6060601@redhat.com>
	<53569371.6010404@suse.de> <5356996A.5090502@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Apr 2014 20:18:34 +0100
Message-ID: <CAFEAcA9E6E7qt9X1QfQm3Gaa4PGt21MNdSB6ok94ht3zQK459A@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.43
Cc: Chen Gang <gang.chen.5i5j@gmail.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] vl: Avoid to close
 stdout after finish 'writeconfig' option
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
X-List-Received-Date: Tue, 22 Apr 2014 19:19:08 -0000

On 22 April 2014 17:31, Eric Blake <eblake@redhat.com> wrote:
> Hmm, maybe we should update the qemu wiki?
> http://wiki.qemu.org/Contribute/SubmitAPatch doesn't mention the qemu
> preferred style (you pointed to the GNOME style, but at least GNU
> coreutils explicitly prefers lowercase).
>
> At any rate, I'm not going to reject a patch based on capitalization,

Yeah, it doesn't really seem worth trying to enforce niceties
of style here -- the effort required doesn't seem to really match
the benefit, and we already have a lot of hoops we make new
submitters jump through. "[file or area being patched]: [reasonably
descriptive short summary]" is about the limit I personally feel
comfortable insisting on.

thanks
-- PMM

