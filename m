Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aT9Hy-0004nw-Kn
	for mharc-qemu-trivial@gnu.org; Tue, 09 Feb 2016 09:29:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aT9Hw-0004kj-7a
	for qemu-trivial@nongnu.org; Tue, 09 Feb 2016 09:29:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aT9Hv-0005TI-F3
	for qemu-trivial@nongnu.org; Tue, 09 Feb 2016 09:29:08 -0500
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:33225)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aT9Hv-0005T4-4i
	for qemu-trivial@nongnu.org; Tue, 09 Feb 2016 09:29:07 -0500
Received: by mail-vk0-x22c.google.com with SMTP id k196so51230295vka.0
	for <qemu-trivial@nongnu.org>; Tue, 09 Feb 2016 06:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=QG+qys8IuhETB5cXckFTyKZwwlUGywhe3E9Bq1Ft3Wg=;
	b=GUVPqBhRWz5aZhnUhZE/b6lRFaqOmUbYEvoaZMrhKylQAVqhOEayQ8t5wl7BRDWRYn
	ee/D6ACmJKEigfCdsLkz6Y7xDcAjTuUiQvBcNL7dC98d5XJE9j7RpRxSxlB/cLmHQAiP
	ZWvWIulDmLBxfFPGFzAHzt7yu8i9u5/S5YuiA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=QG+qys8IuhETB5cXckFTyKZwwlUGywhe3E9Bq1Ft3Wg=;
	b=MFG2cVF1q+If8cB9sz/r43zTrE83yZCdVPfVtvSCf0BFaFh4A7sgDjVS7EQ8b8f6o5
	CI/SVnBoyscQhwuD5i8NphMASLuUEFa/GucjdaPb22bEs1ClLNO14CsHiMh3LwFNrRrN
	6UzosM5iXkjz5TcgDMrWHYmTW1gtlJTkbXo3785AlJkdua1P2LmoCwH6ITsbHtFDovei
	x4MUNUgKGzhx0aBQlswm4tyMBh72D/liJmtYXiUbvdpRlqs4gqExrlXKf2GHicGTzd27
	7E6aRCkVBvTheW/d2TM3qYQefxn4wkz7IE5MIfc+NrAT6JRK9/fzQzNNdTTvEywMmTvS
	LKww==
X-Gm-Message-State: AG10YORXIakqD7MVKHNK1HvLHeClh3NSKuJDJLFImhMntMnZY0BqVTL6O15XhQNMeuB9tis+tiF+2h1f7YcRuZXo
X-Received: by 10.31.180.85 with SMTP id d82mr22641902vkf.83.1455028146659;
	Tue, 09 Feb 2016 06:29:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 9 Feb 2016 06:28:47 -0800 (PST)
In-Reply-To: <20160209142120.GM24614@redhat.com>
References: <1455027417-32278-1-git-send-email-pbonzini@redhat.com>
	<20160209142120.GM24614@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Feb 2016 14:28:47 +0000
Message-ID: <CAFEAcA8QG_WagW_5GzuBkyLnuL3v2XX9KkEdiTicLYnWW4UroA@mail.gmail.com>
To: "Daniel P. Berrange" <berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] w32: include winsock2.h
	before windows.h
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
X-List-Received-Date: Tue, 09 Feb 2016 14:29:09 -0000

On 9 February 2016 at 14:21, Daniel P. Berrange <berrange@redhat.com> wrote:
> On Tue, Feb 09, 2016 at 03:16:57PM +0100, Paolo Bonzini wrote:
> include/qemu/sockets.h also has windows.h included before winsock2.h
>
> Presumably it didn't cause a failure for you because everything using
> sockets.h already pulls in osdep.h. A reason to prune sockets.h
> headers perhaps.

More generally we could prune anything including windows.h manually
(there are a dozen or so .c and .h files doing that currently).

thanks
-- PMM

