Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VheOC-000446-Th
	for mharc-qemu-trivial@gnu.org; Sat, 16 Nov 2013 06:50:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47204)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VheO7-00042Z-DU
	for qemu-trivial@nongnu.org; Sat, 16 Nov 2013 06:50:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VheO2-00033i-Oo
	for qemu-trivial@nongnu.org; Sat, 16 Nov 2013 06:50:07 -0500
Received: from mail-lb0-f181.google.com ([209.85.217.181]:35891)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VheO2-00030C-I8
	for qemu-trivial@nongnu.org; Sat, 16 Nov 2013 06:50:02 -0500
Received: by mail-lb0-f181.google.com with SMTP id q8so2295148lbi.26
	for <qemu-trivial@nongnu.org>; Sat, 16 Nov 2013 03:50:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=np/kbfrwbWbM6mq7Gsu4rBMydKjTq8LBMkA7lsWI2LQ=;
	b=esmtxx9HoAYCu5Am0WKMP5WE9GRNx4hx9rAXyYOQ7O7WuKE3KnlCxNymayhs2r3Moo
	jheQ/qQqYl6r0tCHogEUULovLjT3oBms/iVkfL5F9ijunTOFj3WtAXist+7Cp8kSyqAf
	DaNuIDMoQ6UYxCUhDcC2/pRdw85rHLGDYTcL2wJ8yY4/D17CXJb7/lUD5xXuKYh9wKON
	rwpyv+Z/jpPxn19jbLAPkea8pUaNxLjS+zgUpJdU3YSU0BvUPcu3bdqMJZLB3OySVJWS
	r/shiUsnUoGede9R/UCoDgCdQdSXucVYR/lQNTRa/U1gyGZO+nEpMU0FNfjmCGsE1Ye/
	UFng==
X-Gm-Message-State: ALoCoQm7t7SqrtuuCP+l8rSMKJIl1cIJnZgCuhpqMJqzaNrxiiFuAfht5afQxFOyy90fci1M9A0i
X-Received: by 10.112.142.138 with SMTP id rw10mr79247lbb.69.1384602601090;
	Sat, 16 Nov 2013 03:50:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.161.232 with HTTP; Sat, 16 Nov 2013 03:49:41 -0800 (PST)
In-Reply-To: <52875AE6.5070506@msgid.tls.msk.ru>
References: <1384452423-7831-1-git-send-email-sw@weilnetz.de>
	<528743FA.50508@msgid.tls.msk.ru>
	<CAFEAcA83Q1nQtHWB+BRByfw+FzP-O7j9h5Dgch9Oya1nbOQf1g@mail.gmail.com>
	<52875AE6.5070506@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 16 Nov 2013 11:49:41 +0000
Message-ID: <CAFEAcA-fG98chwzbHNNOybMPXGSoVtSVHW1kUp11rzLU4jbaiw@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.181
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH (1.7?)] configure: Use -B
 switch only for Python versions which support it
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
X-List-Received-Date: Sat, 16 Nov 2013 11:50:12 -0000

On 16 November 2013 11:45, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 16.11.2013 15:10, Peter Maydell wrote:
>
>> Just a question since we were discussing this on IRC -- are you going
>> to remove the non-buildfix/bugfix patches from the trivial queue so
>> the buildfixes go into 1.7?
>
> Yes, please see http://git.corpit.ru/?p=qemu.git;a=shortlog;h=refs/heads/trivial-patches ,
> since 1.7.0-rc0.  I can remove a few more patches from there, but I don't see why.

Yep, that looks OK to me (obviously it's Anthony's call though).

thanks
-- PMM

