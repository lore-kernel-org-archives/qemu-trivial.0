Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cePVI-0006GV-E3
	for mharc-qemu-trivial@gnu.org; Thu, 16 Feb 2017 12:06:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38626)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cePVF-0006E2-Mr
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2017 12:05:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cePVE-0003wG-Ih
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2017 12:05:57 -0500
Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235]:34828)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cePVE-0003w8-D4
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2017 12:05:56 -0500
Received: by mail-wm0-x235.google.com with SMTP id v186so71641475wmd.0
	for <qemu-trivial@nongnu.org>; Thu, 16 Feb 2017 09:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9ECw8QmxzlwpS0H7ZxgYxTprN1fwvpN9dMMLyw3nZHM=;
	b=BW66mp3XwEj/qBjcS+HIrjJIRuyiAHMOfYk2gCpOe5EoFkLttayTsvqD4JCkKth7QL
	k/98lFBwVYMHO3bCy1Zg6RnLxegL2kUu1FpvHR+Z5tkfNgE5BuFircwRDKzvQ88+aeoA
	JPKl0eRx0hqZFy3iL3hXKXtcDRpifuNR59s1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9ECw8QmxzlwpS0H7ZxgYxTprN1fwvpN9dMMLyw3nZHM=;
	b=IXPpNV1twwAAqOSDmbLphZMyvsUI+kMQooj8QymYrUplvW3jpNgxW7IyFz7wLGhXx+
	Enfeg/EDwU8d6IlyBiXyR1/uUJHax2swS8WTvWvT5niVZ0PKG+UpN4CJy5KO6jXXiILZ
	Wrlw9R1T5Gk048QtH6Jnt4dPfFy5Cjg4DOOJVPoWmH0zpMJ+Q8vYGwspy6p7eOEZqb1L
	yOyRZ5N/a51PQAbEkNognREf4iocjOEQwWSkiLeYQPtlbxf+Yc4CXc5BfVlOOpFtfdHE
	D+eU4RY/r8exDtVKaubmZ3TP7Ezv/D2r+t6qbeVraIiShU039zlp22r/AAL4dR1Wh/78
	u0aA==
X-Gm-Message-State: AMke39ljge8bpYt41g3zk1RPJcgAO5Z62DtACKLS6slfyM28sP3aolSJu41Bys7bPgmrP6o8ghGW8WMu6Tn5UEMi
X-Received: by 10.28.189.135 with SMTP id n129mr3237230wmf.92.1487264755073;
	Thu, 16 Feb 2017 09:05:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 16 Feb 2017 09:05:34 -0800 (PST)
In-Reply-To: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
References: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Feb 2017 17:05:34 +0000
Message-ID: <CAFEAcA9Em0dC7Bj73q+EQS0=nAZWGLGGoRjrT0nZq51XgEG-5w@mail.gmail.com>
To: Chad Joan <chadjoan@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::235
Subject: Re: [Qemu-trivial] [Qemu-devel] Fix build break during
 configuration on musl-libc based Linux systems.
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
X-List-Received-Date: Thu, 16 Feb 2017 17:05:59 -0000

On 16 February 2017 at 16:30, Chad Joan <chadjoan@gmail.com> wrote:
> Hello,
>
> This is a one-line patch to the configure script that will allow QEMU to be
> built on musl-libc based Linux systems.  This problem is only noticeable
> when QEMU is built with --enable-curses.
>
> Detailed reading material if you want to know where this came from:
> https://bugs.gentoo.org/show_bug.cgi?id=609364

Thanks for the bug report and the patch. I'm a bit confused
about why it's necessary, though. We already define _GNU_SOURCE,
which the musl docs say implies _XOPEN_SOURCE:
 https://www.musl-libc.org/doc/1.0.0/manual.html
Is that not true for your musl, or is our configure script
failing to pass -D_GNU_SOURCE when building the curses test program?

If we do need an explicit define of _XOPEN_SOURCE I think we should
do it at the same place where we add -D_GNU_SOURCE to the cflags.

thanks
-- PMM

