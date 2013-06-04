Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjyHK-0004ok-8A
	for mharc-qemu-trivial@gnu.org; Tue, 04 Jun 2013 16:56:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59048)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1UjyHI-0004o3-1J
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 16:56:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1UjyHH-0007vt-46
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 16:56:23 -0400
Received: from mx3-phx2.redhat.com ([209.132.183.24]:52226)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>)
	id 1UjyHE-0007vR-K4; Tue, 04 Jun 2013 16:56:20 -0400
Received: from zmail15.collab.prod.int.phx2.redhat.com
	(zmail15.collab.prod.int.phx2.redhat.com [10.5.83.17])
	by mx3-phx2.redhat.com (8.13.8/8.13.8) with ESMTP id r54KuIet019036;
	Tue, 4 Jun 2013 16:56:18 -0400
Date: Tue, 4 Jun 2013 16:56:17 -0400 (EDT)
From: Alon Levy <alevy@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <827414769.14303662.1370379377725.JavaMail.root@redhat.com>
In-Reply-To: <CAFEAcA9oj-yCdsQck4oJPc__MyfrroMB2aFKSxTx1=PYfS2WCw@mail.gmail.com>
References: <1370377419-31788-1-git-send-email-alevy@redhat.com>
	<1370377419-31788-2-git-send-email-alevy@redhat.com>
	<CAFEAcA9oj-yCdsQck4oJPc__MyfrroMB2aFKSxTx1=PYfS2WCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.5.82.11]
X-Mailer: Zimbra 8.0.3_GA_5664 (ZimbraWebClient - FF21 (Linux)/8.0.3_GA_5664)
Thread-Topic: use qemu_pipe_non_block
Thread-Index: uAILXgL8BgG+tc1XJQ/MYWbv9WpAjg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 209.132.183.24
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/5] use qemu_pipe_non_block
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
X-List-Received-Date: Tue, 04 Jun 2013 20:56:25 -0000

> On 4 June 2013 21:23, Alon Levy <alevy@redhat.com> wrote:
> > --- a/hw/display/qxl.c
> > +++ b/hw/display/qxl.c
> > @@ -1797,15 +1797,11 @@ static void qxl_send_events(PCIQXLDevice *d,
> > uint32_t events)
> >
> >  static void init_pipe_signaling(PCIQXLDevice *d)
> >  {
> > -    if (pipe(d->pipe) < 0) {
> > -        fprintf(stderr, "%s:%s: qxl pipe creation failed\n",
> > -                __FILE__, __func__);
> > +    if (qxl_pipe_non_block(d->pipe)) {
> 
> Surely this can't compile? -- this function doesn't exist.

I am abusing my right to post to this list, sorry. I didn't actually try to compile.

> 
> thanks
> -- PMM
> 
> 

