Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z7S2j-0007lK-Ko
	for mharc-qemu-trivial@gnu.org; Tue, 23 Jun 2015 13:31:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49188)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z7S2h-0007i4-Gw
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 13:31:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z7S2e-0005vI-D6
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 13:31:27 -0400
Received: from mail-vn0-f47.google.com ([209.85.216.47]:36771)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Z7S2e-0005v6-9h
	for qemu-trivial@nongnu.org; Tue, 23 Jun 2015 13:31:24 -0400
Received: by vnbg1 with SMTP id g1so2613799vnb.3
	for <qemu-trivial@nongnu.org>; Tue, 23 Jun 2015 10:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1OioQIswd9JVjKJWwGD42E9Or5DTq9fs0jwQWhm22HI=;
	b=G1K7sb85omXI/150uD78RxzWNvbI2aLJESBdaTLQbWbdDrjCl2IGtHa/Gb+hFad1OH
	5IaWK/JoInM0OFiG5EeZaYg4lN2YhTgUY8jLTeYW1NHXRNw3f99JsP5MtfBTRoSwiKgd
	65hS0uw1uxUCZ3dUE+tyh8jh0+dnEnf6IQLyItSsB77d0oakL36X5g1iVr8XRsMJvkmy
	xWetKsqZMEMcoD4PBLoUXkjbRgm83nj+VUfD9aRs0n4+SzmdJ9rwhnpWjDoyG6U7quwG
	plKZpSoPZjO9EhY2XSbLWLMUdNv4ap0SgKkbC12tb0F9MZwSKoEQi2U87mONnTKw5pzX
	UdOA==
X-Gm-Message-State: ALoCoQkDDYr93752gCncSpgG5iTmMq32lIg33HuHxh1cJm1VQ577dWkZlXavhfdJpWGlUeyEqUAJ
X-Received: by 10.52.113.97 with SMTP id ix1mr32606667vdb.1.1435080683858;
	Tue, 23 Jun 2015 10:31:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.135 with HTTP; Tue, 23 Jun 2015 10:31:04 -0700 (PDT)
In-Reply-To: <558960A3.5010509@redhat.com>
References: <58e7daaa2977c903b46c3b0dde64e81ce191b5d6.1435062620.git.mprivozn@redhat.com>
	<CAFEAcA_AYg5okJgU61CYQasH9yY8rjsQQxpLq5xPvFyHLtJdgw@mail.gmail.com>
	<5589543B.1020309@redhat.com> <20150623144917.372248b1@thh440s>
	<558960A3.5010509@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Jun 2015 18:31:04 +0100
Message-ID: <CAFEAcA9Rx6AyWqVuOAgyXE236v5dsB7xhRCMx+WNkZMU3p21Ag@mail.gmail.com>
To: Michal Privoznik <mprivozn@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.216.47
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Thomas Huth <thuth@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Makefile: Properly order
 build targets 'all' and 'check'
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
X-List-Received-Date: Tue, 23 Jun 2015 17:31:28 -0000

On 23 June 2015 at 14:35, Michal Privoznik <mprivozn@redhat.com> wrote:
> Yeah, that could work too. For some reason I thought that having it
> there would result in making 'all' just under tests/. But Now that I
> tried it out it works just nicely.

Have you tested both "build in the source tree" and "build in
a separate directory from the source tree", by the way?

thanks
-- PMM

