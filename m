Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4SnR-0002zD-Gw
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 10:24:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4SnL-0002yu-36
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 10:24:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4SnK-0006Lm-G4
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 10:24:35 -0400
Received: from mail-wr0-x235.google.com ([2a00:1450:400c:c0c::235]:46438)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e4SnK-0006LY-93
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 10:24:34 -0400
Received: by mail-wr0-x235.google.com with SMTP id l1so1892139wrc.3
	for <qemu-trivial@nongnu.org>; Tue, 17 Oct 2017 07:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=j7pijBPYZlkRZLDLgoQaZu9MCi2d1iwfdqz/xN70WNw=;
	b=kSKVLLxzQWQibcO4Re1SzON4h14A8jrdFFxfVOdvYH/2qpUm2kYMqW8bP611bYBtmZ
	+v4k9jug80kspx9w9xPkuP3MYp4/eX/0JnlDOuH5HcLQUA/mCheSckHakzwWN/OA7QSV
	1wzV5B9yXNX4u0vUwa1luHix5NA11dwKHqc2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=j7pijBPYZlkRZLDLgoQaZu9MCi2d1iwfdqz/xN70WNw=;
	b=aljuTfRV6IkUS17v7MA5P1SXkHslqksVmHUTLZcck/Co0CZefrqTwNcso5NYGybkGN
	K/hD10VvXQpmEJP5N74poXadonmJcX7gBmNQE7O1KKqpvlgD5GK723sL5DcFy3FNUe8V
	yfmAXa+nLuxTkybHwMgi7bZkEJJ3me0G6pW9Q9NBq2My22umZytRzP1aXKgWUCi5AgWj
	xDRdV14WPWsAFYN4c44y9rO5SUhYwEZ35jdpGoCinNvKCjleXw+YZwHl+Ra/DnSl3OsD
	fBJIEghRFE5WW/cAH1b18JG6nHl9L7IymF2NkAONCIxtRYUPR5nJMWf7YfMEajiuncXJ
	UQnw==
X-Gm-Message-State: AMCzsaXhXC6grGIxjk2UUumHOTPDwavlKBGA6MHwPiyTjuuLdiCQEZiW
	IpEftNdP8UPzFY6rBIZMdl0rM+ikg34czIPQXhYMdw==
X-Google-Smtp-Source: ABhQp+QrtR3esINYlakPavwW80OznlbQ0O9S6/HtpZ6cMpvCk/tVt66MALzS/rUXNZG71R2y7FECNsHOHap+fipbDdE=
X-Received: by 10.223.160.233 with SMTP id n38mr4283648wrn.177.1508250273326; 
	Tue, 17 Oct 2017 07:24:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.195 with HTTP; Tue, 17 Oct 2017 07:24:12 -0700 (PDT)
In-Reply-To: <1abdfc6b-6e23-0949-84b1-bd1b1f6121c3@vivier.eu>
References: <20171017141311.22194-1-james.hogan@imgtec.com>
	<1abdfc6b-6e23-0949-84b1-bd1b1f6121c3@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Oct 2017 15:24:12 +0100
Message-ID: <CAFEAcA_nxVJBm-jym_XrURDmUZDCaDgOdJgwpXcWyXb=wQ5KCg@mail.gmail.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: James Hogan <james.hogan@imgtec.com>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::235
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] Update James Hogan's
 email address
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
X-List-Received-Date: Tue, 17 Oct 2017 14:24:41 -0000

On 17 October 2017 at 15:21, Laurent Vivier <laurent@vivier.eu> wrote:
> I don't understand why you need to update the .mailmap: updating the
> MAINTAINERS file should be enough to have the correct address with
> get_maintainer.pl?

A mailmap update is also useful if you care about your ranking
in the 'git shortlog -nse' high score table :-)

thanks
-- PMM

