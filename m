Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ydzcq-0005ci-LF
	for mharc-qemu-trivial@gnu.org; Fri, 03 Apr 2015 07:19:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54697)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ydzck-0005Wf-UN
	for qemu-trivial@nongnu.org; Fri, 03 Apr 2015 07:18:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ydzca-0008Np-IC
	for qemu-trivial@nongnu.org; Fri, 03 Apr 2015 07:18:54 -0400
Received: from mail-ig0-f179.google.com ([209.85.213.179]:36833)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Ydzca-0008Nd-ED
	for qemu-trivial@nongnu.org; Fri, 03 Apr 2015 07:18:44 -0400
Received: by igblo3 with SMTP id lo3so4571952igb.1
	for <qemu-trivial@nongnu.org>; Fri, 03 Apr 2015 04:18:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=hTsxD48HheE4ir50ykANr6Py93fPXt2VDwcIxOcOF0Y=;
	b=QAlYfoB0Jb00nbwBxRir9FyZkOq5QYEeISD3b4TMCRZYD3m0/t6lktcry1vVV8BINE
	DwTpQixmsrtqBRuGoR6sWo2fL0+u5b+f1Ig7ZCy4FnIiLW0Phd4xe0pbapP2mCqYsW/q
	vB+oTq5RQq6N4HJO9l4E3t39AFtvT4OSFQfUyTNx9FXegf7E00rZRSnJx9/UZY+Nkcjm
	3nlUdGn11XLUDX5K0LUjxxliQfWcZxTLo6w6DcFqJPkxTnwYKkbbM24PDJ2ARJwWPB8z
	vDXvvHiHEZ3ecZnWg2RXD8Ukd5Os539ni841SRYjuEKuJ14/0EA8ff6Uzn5bmEtUMHTD
	6UvQ==
X-Gm-Message-State: ALoCoQmByEpqPyZPPIJ00l7d+j8iaI2YUILzKX2pxW9dsGBUGCAzE3E7HbWcpj3G9yj58fZK2/Uk
X-Received: by 10.50.137.37 with SMTP id qf5mr3827330igb.1.1428059923635; Fri,
	03 Apr 2015 04:18:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.51.201 with HTTP; Fri, 3 Apr 2015 04:18:23 -0700 (PDT)
In-Reply-To: <CAPyFy2B=rTfz+6JyVmufLTOxsddXyJWDD0wAGROqbodeNicUtQ@mail.gmail.com>
References: <1427911244-22565-1-git-send-email-emaste@freebsd.org>
	<551C5DE7.70904@redhat.com> <551C5FAF.7010303@redhat.com>
	<CAFEAcA-CLb6WNqgxjsys=kfDoTe9KEeNZ8W-7ax=A1dqBVo0eQ@mail.gmail.com>
	<CAPyFy2B=rTfz+6JyVmufLTOxsddXyJWDD0wAGROqbodeNicUtQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Apr 2015 12:18:23 +0100
Message-ID: <CAFEAcA8nyMCnYOAhjfYxJ1q6Ei_04L5Jr2ERrMUQaE+KCqKDRw@mail.gmail.com>
To: Ed Maste <emaste@freebsd.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.179
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qtest: Add assertion that
 required environment variable is set
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
X-List-Received-Date: Fri, 03 Apr 2015 11:18:59 -0000

On 2 April 2015 at 20:31, Ed Maste <emaste@freebsd.org> wrote:
> On 1 April 2015 at 18:45, Peter Maydell <peter.maydell@linaro.org> wrote:
>> Also irritating is the way it silently requires
>> the binary to have a name in the shape it was
>> expecting, which can catch you out if you were
>> trying to set it to a wrapper shell script that
>> invokes valgrind or something...
>
> I don't really have enough context to propose a good user-facing
> message with a tip for manually executing this, so hopefully someone
> else can provide one. I just noticed one other instance that already
> had an assertion on getenv("QTEST_QEMU_BINARY") being non-null.

Yes, that was just me venting about something that caught me
out in the past rather than review comment on this patch :-)
Sorry for any confusion.

-- PMM

