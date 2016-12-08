Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cEwBI-00039y-BC
	for mharc-qemu-trivial@gnu.org; Thu, 08 Dec 2016 05:44:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33187)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cEwBF-00038A-6k
	for qemu-trivial@nongnu.org; Thu, 08 Dec 2016 05:44:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cEwBE-0004ms-Bo
	for qemu-trivial@nongnu.org; Thu, 08 Dec 2016 05:44:01 -0500
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35134)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1cEwB9-0004iG-1o; Thu, 08 Dec 2016 05:43:55 -0500
Received: by mail-wm0-f68.google.com with SMTP id a20so2699662wme.2;
	Thu, 08 Dec 2016 02:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=NQFO9qwne9uc1bsFWz2PDRXqPKmpUs+FNLtP0yp3nQs=;
	b=SPdopLq74hnez0lodfLQceETsEw/d3n7W+oA8kRt/xhMOGREQ3V3Lbc0vsncEIOunE
	5/lRV6l/Kz8a6NhG6p4m6L3heyBmIYVqekEUipkDHmH834sZFqSylFgjkymxg0sFl6Fl
	dJ3EaT58YnxExqCKIwFOKrl/29M1iN8aaAGB7c/orwDV6BuW9yxfosqOK7RBVNuq4htF
	BoDDokc3ZvuK4patEG3ql77wyqkL8saOXc8I0kLQW2rPIHYxgK3tzUYq+x5Z0QAEilaH
	Z8+fUXD+pyPDyUG4jrcqCoF+OGoNobM7q4V7CSww2Z7pucq9AYA1DrJvz6RSeRJB9IeW
	eXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=NQFO9qwne9uc1bsFWz2PDRXqPKmpUs+FNLtP0yp3nQs=;
	b=ewTB3PbHyvZWHu76vpwuNNIEItHjJbQTF9e4g+FCmpJ1katLcqRrIW0aGaLyBzLCLh
	jvqMkm5gjQejflKg4qi3DSBPQsG/fi5sq8ufxMDeS0INtdMB6nSVcnpeRqcDyWNlAcKz
	bXdImANrj3HA5ecdNqbjTrz68nat1CXWo7jBefkOXssAZiP21LIeYz3f7xW0NF70Cnu8
	3WEKIUBn5C4ufZCpMODYcdSORIijnjGif5uv3kVM+jtSv+IvIQtOeG8nA6aZexFC/G2k
	N+jHlFyv6hhgp36ObN9AJmUp41gQe3yI2x7XMlk0rO+KOZ0Zo9ixX8M7H9AO7A13TmK+
	PhLQ==
X-Gm-Message-State: AKaTC03lgISpxWFlwF9DQoet1BDUmuxWSOmtjwQn4sVbRMIklvcuAsBtNe59SiN0NMqM9w==
X-Received: by 10.25.28.145 with SMTP id c139mr21895829lfc.167.1481193773691; 
	Thu, 08 Dec 2016 02:42:53 -0800 (PST)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id 37sm5516402lfw.31.2016.12.08.02.42.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Dec 2016 02:42:53 -0800 (PST)
Date: Thu, 8 Dec 2016 11:42:52 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: Andrew Gacek <andrew.gacek@gmail.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org
Message-ID: <20161208104252.GH9606@toto>
References: <CAHgzvFi2wjPtJzU9hXzdaZsbYr085VCbjfsiUeVc5XnUR8arHw@mail.gmail.com>
	<293c3354-b11b-a31f-39dc-b7264ad0bb24@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <293c3354-b11b-a31f-39dc-b7264ad0bb24@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.68
Subject: Re: [Qemu-trivial] [PATCH] cadence_uart: Check if receiver timeout
 counter is disabled
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
X-List-Received-Date: Thu, 08 Dec 2016 10:44:02 -0000

On Thu, Dec 08, 2016 at 08:50:40AM +0100, Laurent Vivier wrote:
> I CC: Xilinx Zynq Maintainers.
> 
> Laurent

Thanks

> 
> On 07/12/2016 22:12, Andrew Gacek wrote:
> > When register Rcvr_timeout_reg0 (R_RTOR in cadence_uart.c) is set to
> > 0, the receiver timeout counter should be disabled. See page 1801 of
> > "Zynq-7000 AP SoC Technical Reference Manual". This commit adds a
> > such a check before setting the receive timeout interrupt.

We could also try to disable the timer when rtor is zero but I think
that exposes a bunch of corner cases that would complicate the model a bit.
So IMO, this patch is good.


> > Signed-off-by: Andrew Gacek <andrew.gacek@gmail.com>
> > ---
> >  hw/char/cadence_uart.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/char/cadence_uart.c b/hw/char/cadence_uart.c
> > index 0215d65..54194b1 100644
> > --- a/hw/char/cadence_uart.c
> > +++ b/hw/char/cadence_uart.c
> > @@ -138,7 +138,9 @@ static void fifo_trigger_update(void *opaque)
> >  {
> >      CadenceUARTState *s = opaque;
> > 
> > -    s->r[R_CISR] |= UART_INTR_TIMEOUT;
> > +    if (s->r[R_RTOR]) {
> > +        s->r[R_CISR] |= UART_INTR_TIMEOUT;
> > +    }
> > 
> >      uart_update_status(s);

Since you are not modifying the IRQ state when the timeout is disabled, you can avoid calling uart_update_status too (because it will only end up recomputing the same state).

With that fix:
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Best regards,
Edgar

