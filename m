Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cem8V-000343-Db
	for mharc-qemu-trivial@gnu.org; Fri, 17 Feb 2017 12:15:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38524)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cem8T-00033o-Ot
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 12:15:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cem8S-0001Ai-PS
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 12:15:57 -0500
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f]:37075)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cem8S-0001A2-It
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 12:15:56 -0500
Received: by mail-wm0-x22f.google.com with SMTP id v77so14915262wmv.0
	for <qemu-trivial@nongnu.org>; Fri, 17 Feb 2017 09:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FrTs7tv5bqEsSMw/h8KwVcv4WV1Cd6IFFdvqDJGypLM=;
	b=dZx4AbCcEb5BtPyCDQGmtZtXQH6w4UoC5K56Kbj8SNX8QuML4v1yhlMzqUeIKfnpeC
	exDDaAndA+R/c14CS+jISD+09gAvKbI8KOlpODUp8SqypsOfVod5GooToEJbvAy0CTq4
	x6ycmsIui3F+Dy2PvcOjy9UVXKm01rmYkb3GA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FrTs7tv5bqEsSMw/h8KwVcv4WV1Cd6IFFdvqDJGypLM=;
	b=ICuHw2OToeus2/XUvcfTXBCh//+o6ekTIPVpHB0J2WrOPB7JoBGsQocM4E3pwKLSg4
	eOGjRWrq23ZBKNOeL2AYDzRaS8oSWI/cET+xz2o/oYvIlzpwC16T/rUAyILogNYRx3v7
	vVgj1Zo8HBNHAHMU/oGQZnOKSDwy0dvbZH/2wyicqN1MscogxRwN0lagnoVul4aYZ2WU
	MQX9CLFDKaGijHx1YA1cKkrQCaChrx4dYnOVLv+XhP2QxvnWnw/p3NrPxvVj86LlQu1B
	VhR+nt5CGxUYChnfht5nfa6e8f4e7Tm5saEwMMltXohYzPJOc7TpbmdSIlyZe+M3ZCbA
	wfbw==
X-Gm-Message-State: AMke39kb/X+WZh/J/cs6r3cz/2Xtr6g2n7DUyVZcubPrZopGcCp/CoTQ5IhpSzFFHLCi17RAF3t88dYbT0uX+9qr
X-Received: by 10.28.55.199 with SMTP id e190mr4567431wma.92.1487351754998;
	Fri, 17 Feb 2017 09:15:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 17 Feb 2017 09:15:34 -0800 (PST)
In-Reply-To: <CABHMSTWN2KdAXDjEEbyWio6rNM2FuDk_NUj40mFW0HdyZFu68g@mail.gmail.com>
References: <CABHMSTVDnAxAvpp81+z_2fkAFO7tazLJs3cFXpuDuuGQj-Ek-A@mail.gmail.com>
	<1933406e-2576-e687-3545-a72f3b999310@redhat.com>
	<bf1410bc-bc6d-bb29-5591-55634f25d487@redhat.com>
	<CABHMSTUsZy0u4b1b84YC5CgafKvD-Zms5dCQ=31+XnQphUQxLA@mail.gmail.com>
	<20170217064327.GB21716@lemon.lan>
	<CAFEAcA8_f8SVX+rirAFBJ76ZiXaKUwh9uO0AeBFoR7G_q8pGDg@mail.gmail.com>
	<6ab86cf8-4780-ca76-f648-ac0ce211e27b@redhat.com>
	<CABHMSTWN2KdAXDjEEbyWio6rNM2FuDk_NUj40mFW0HdyZFu68g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Feb 2017 17:15:34 +0000
Message-ID: <CAFEAcA_N1j9tpxEBROG6D1per9vDMPZeuRyM93BRzNT5ZK3q0Q@mail.gmail.com>
To: Chad Joan <chadjoan@gmail.com>
Cc: Eric Blake <eblake@redhat.com>, Fam Zheng <famz@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22f
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
X-List-Received-Date: Fri, 17 Feb 2017 17:15:58 -0000

On 17 February 2017 at 16:54, Chad Joan <chadjoan@gmail.com> wrote:
> so if we can test and
> approve even /some/ of the more popular mail clients (ex: gmail,
> thunderbird, outlook, etc) for use, it would help newbies A LOT.

Pretty sure we've seen mangled emails from all of those.
The problem is that most email clients will automatically
wrap long lines, which is fine for text but breaks an
inline patch. Changing trailing whitespace in patches is
also a common issue.

The documentation in "git help format-patch" has a section
"MUA-SPECIFIC HINTS" which says that gmail's web interface
is definitely no good, and Thunderbird defaults to the wrong
thing and requires a bunch of config changes which you'd then
have to switch back to your preferences for normal mail when
you're done sending patches. Outlook is so hopeless for
patch mail it isn't even listed :-)

The kernel docs have a longer list of mail clients with
notes about suitability:
https://kernel.org/doc/html/latest/process/email-clients.html
but the set of "just works" clients is very small.

thanks
-- PMM

