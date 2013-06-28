Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UsYNG-0003z2-Et
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jun 2013 09:06:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44651)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UsYNC-0003wA-GG
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 09:05:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UsYN6-0008Q4-W1
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 09:05:58 -0400
Received: from mail-la0-f50.google.com ([209.85.215.50]:33832)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UsYN6-0008Pi-1T
	for qemu-trivial@nongnu.org; Fri, 28 Jun 2013 09:05:52 -0400
Received: by mail-la0-f50.google.com with SMTP id dy20so2101307lab.37
	for <qemu-trivial@nongnu.org>; Fri, 28 Jun 2013 06:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=lq6nHtUWdyhDBOT+8B/LhujwAi9bxPvZjgqHXIHxAEo=;
	b=H+x6mGlTr8hW2pzvn54Ny83ZijSTQBXXF+e4qBMNpoDxY2m8XF+7JZPWj5SeQPcvB1
	Hc5nbp5Ec3pk5+W+rqdlPvtdeXdWmepQKPr6flRiSPdtSWFpgwS44KBLnJhbzYk2gkAX
	hFVST6VBAcPXjkpgiliYVT/RE/43mVnwmcYH5T8DlKSSl7jMxQQPcDXS67jnYwtJ1alE
	jHa74UYotOlADmGHHxEadUg8VMjQVyQmhLE4bkybre7yeymqIzAoot640RIK9ARUm7Zm
	KUwcOT1HhUh/BfD1xE1vyE6gRG8OZUmGa10bCaR5NHYUlOJThS2Ki5hS06IoFqNREHgc
	uNcA==
X-Received: by 10.152.18.202 with SMTP id y10mr6272682lad.80.1372424750962;
	Fri, 28 Jun 2013 06:05:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.97.146 with HTTP; Fri, 28 Jun 2013 06:05:30 -0700 (PDT)
In-Reply-To: <51CD8985.6020401@redhat.com>
References: <1372101677-46175-1-git-send-email-emaste@freebsd.org>
	<51CD669A.1010100@msgid.tls.msk.ru>
	<CAPyFy2Bzh-nK7zkc3JwvPEd4AYH0CriA1vu_kGqoCXdaAk0i1A@mail.gmail.com>
	<51CD8985.6020401@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Jun 2013 14:05:30 +0100
Message-ID: <CAFEAcA-M9RnRv8TZjcY8C1KgRj+2k8JT1QKrtHhfo6BafNQQWQ@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnjMt3vtVytjEFwtlPaj1oO3vSpuUbgxylkgkoQRHwBdm2/pvYjlsax75dy18FTq+TADPL3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.50
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tls.h: Enable TLS on FreeBSD
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
X-List-Received-Date: Fri, 28 Jun 2013 13:05:59 -0000

On 28 June 2013 14:03, Paolo Bonzini <pbonzini@redhat.com> wrote:
> Il 28/06/2013 14:54, Ed Maste ha scritto:
>> An objection seemed to be that it is not really needed yet, but as
>> pointed out by Peter this isn't really the case.  This patch brings us
>> (FreeBSD) in line with per-thread data semantics on Linux and is used
>> by qemu system emulation as well.
>
> It brings it in line with Linux, even though FreeBSD has the same need
> for TLS as OpenBSD and Windows (i.e. none).  In other words, we go from
> two cases (need TLS and uses it, has no TLS and doesn't need it) to
> three (we add "uses TLS with no need for it").

I don't understand what you mean by "no need for it". We are
already multithreaded in system mode, so this is simply
making FreeBSD do the same thing as Linux. That seems like a
clear improvement to me.

-- PMM

