Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eYZwS-0004nt-1p
	for mharc-qemu-trivial@gnu.org; Mon, 08 Jan 2018 11:06:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50380)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYZwM-0004iC-0M
	for qemu-trivial@nongnu.org; Mon, 08 Jan 2018 11:06:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYZwG-00078q-Gb
	for qemu-trivial@nongnu.org; Mon, 08 Jan 2018 11:06:21 -0500
Received: from mail-oi0-x233.google.com ([2607:f8b0:4003:c06::233]:34614)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eYZwG-00077b-B7
	for qemu-trivial@nongnu.org; Mon, 08 Jan 2018 11:06:16 -0500
Received: by mail-oi0-x233.google.com with SMTP id a70so1323486oib.1
	for <qemu-trivial@nongnu.org>; Mon, 08 Jan 2018 08:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cZUfC7VrnbxO2MYhic15PShLuC9HpDEBPOR9YI6rUTA=;
	b=f3tsdQkLhFARP7nlK9YssqQ7SLFCft84EJR5QGif1XVVwKLcAafd+we8wrT+E1CyxR
	q7qeU5277CfTUBaaUC1PUxLPWiCnJtSeTPWrsNOuNpM+gS6ca0NGPD83D252rrqmKalu
	Gf88R4yMoO5LD3LhBEOlFQlNZGcnpaU+s0CkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cZUfC7VrnbxO2MYhic15PShLuC9HpDEBPOR9YI6rUTA=;
	b=V5XmBpkiIboEL91O/1S+t1r3MuYx4gpri3PxWU+s49/JeBIC/1NMe3XTWH9Ch82O3n
	YE7yL/g9emN0VW508NYZAwInowMXedSDIfb9DIzARNBt6yWosNl6+Hz2eY2s+22I3qL6
	W1zQvRc4bFy58Owkip29eKJj7M1EyCDzChxHoOXSN+v5xcviwCjA1sIIiJHqpKLaPxv0
	Qb5m2C7Gf8IsEoYMK0adhddE76J51oWwlQ+h2pjV0d3uhB0Ddn3lGWLkGI71agI8ewpy
	Mw2iE8964mHGqIcCSimkZr7RkNCv3WMb9YnKDqEUsdJ/4634cR4IgJRSbloasrUS9poe
	qm0A==
X-Gm-Message-State: AKwxytcz+okD1z5WP9kzo/BjqHeJOfBpRXXS7xuZu8kKKc3pwhaCO/xv
	t1pRHR2mrGkyPAJCdPV/fFwvsXI9C0Ja7dg1l+TCIw==
X-Google-Smtp-Source: ACJfBovaWaBkwL4MkKJ0aErJ9sOMG/hE/MUJXKZvd+QKOnI/GcDmQtVDGIjvkm5wcaCRUsZBDldEZarZBYHhLJsGlCw=
X-Received: by 10.202.252.73 with SMTP id a70mr360544oii.256.1515427575493;
	Mon, 08 Jan 2018 08:06:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Mon, 8 Jan 2018 08:05:55 -0800 (PST)
In-Reply-To: <23123.38373.555937.75671@guava.gson.org>
References: <23118.26328.811644.330716@guava.gson.org>
	<CAFEAcA_iPT14HSkMG4T43H3vykqBu=rFJpBe4idoVh9LFUEJaA@mail.gmail.com>
	<23123.38373.555937.75671@guava.gson.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jan 2018 16:05:55 +0000
Message-ID: <CAFEAcA8E9DxY7AA7fvFze5HFD_aQPn0T4Cn1u+C40Tqs7qefSQ@mail.gmail.com>
To: Andreas Gustafsson <gson@gson.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Kamil Rytarowski <kamil@netbsd.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::233
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] oslib-posix: check for
 posix_memalign in configure script
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
X-List-Received-Date: Mon, 08 Jan 2018 16:06:26 -0000

On 8 January 2018 at 16:01, Andreas Gustafsson <gson@gson.org> wrote:
> Peter Maydell wrote:
>> Can we put this through the -trivial tree? (cc'd)
>
> I'm not sufficiently familiar with the intenal workflows of the qemu
> project to give a meaningful answer to that question.

Sorry, I should have been clearer, that question was aimed
at the qemu-trivial queue maintainers.

thanks
-- PMM

