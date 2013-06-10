Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmAxw-0000FR-4J
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 18:53:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1UmAxt-0000FL-Tf
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 18:53:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1UmAxr-0003ap-B3
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 18:53:29 -0400
Received: from mail-ea0-x22f.google.com ([2a00:1450:4013:c01::22f]:57435)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1UmAxr-0003ag-4S; Mon, 10 Jun 2013 18:53:27 -0400
Received: by mail-ea0-f175.google.com with SMTP id z7so2115744eaf.6
	for <multiple recipients>; Mon, 10 Jun 2013 15:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=w3li502GkEX1vxvncLcAwY7faZvgqQL2uxsd85tbRMk=;
	b=U5ICkd/tBpHXFCNxyRYWalLr6D4u+4jUiVk2y/CZHEC7YRk0Iqs3Y0epMJaiZH3E0x
	4wpjCFockIVR2RFjvVdFb/EKkPUzMAJ1LXASFTqA5PanwvjCyUxptVPY5JFnFCIRpNEg
	v2wV1TZFN/GK4y673Fj0hzUDA2TV7AVpaqDfqNLvenhQ8/UYHGBXZYDpFwo41Prz0tnE
	4gQU5SYlS4Ah/nixdZPhXCfJbIViWq38t+oCAOVY6tH1K98yQkN9lXPWdPbhlvKoF9F5
	3cQvVI/v/YN591KF6jWwzaja3rxso2PTXEhKyWMsWxOhmfJGE4i6W+FnSRFmjWu4+FR8
	eQ9Q==
X-Received: by 10.15.45.194 with SMTP id b42mr6705053eew.51.1370904806123;
	Mon, 10 Jun 2013 15:53:26 -0700 (PDT)
Received: from localhost (h59ec325f.selukar.dyn.perspektivbredband.net.
	[89.236.50.95])
	by mx.google.com with ESMTPSA id z52sm26532476eea.1.2013.06.10.15.53.24
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 15:53:25 -0700 (PDT)
Date: Tue, 11 Jun 2013 00:53:17 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
Message-ID: <20130610225317.GD5991@smtp.vpn>
References: <1370439748-18092-1-git-send-email-hpoussin@reactos.org>
	<51B2E26F.8030106@msgid.tls.msk.ru> <51B563CC.5040907@redhat.com>
	<CAEgOgz6PmZ+gvhH9vVFiVqMvNXOBDn3Y+ny=tW+QHEu-eZ-LcQ@mail.gmail.com>
	<20130610170649.GA31588@redhat.com>
	<CAEgOgz6Y63HOAF+57p+mubiz2ySfLtuuoVJKbign6gxWNJvWtA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEgOgz6Y63HOAF+57p+mubiz2ySfLtuuoVJKbign6gxWNJvWtA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c01::22f
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org,
	=?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] ioport/memory: check that
 both .read and .write callbacks are defined
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
X-List-Received-Date: Mon, 10 Jun 2013 22:53:31 -0000

On Tue, Jun 11, 2013 at 08:30:12AM +1000, Peter Crosthwaite wrote:
> Hi Michael,
> 
> On Tue, Jun 11, 2013 at 3:06 AM, Michael S. Tsirkin <mst@redhat.com> wrote:
> > On Mon, Jun 10, 2013 at 07:14:45PM +1000, Peter Crosthwaite wrote:
> >> Hi,
> >>
> >> On Mon, Jun 10, 2013 at 3:27 PM, Gerd Hoffmann <kraxel@redhat.com> wrote:
> >> >   Hi,
> >> >
> >> >> Maybe instead (or in addition to), we should provide a dummy
> >> >> read or write functions -- instead of fixing each such occurence
> >> >> to use its own dummy function
> >> >
> >> > Makes sense, especially for write where we can just ignore what the
> >> > guest attempts to write.  Not sure we can have a generic handler for
> >> > reads.  Maybe two, one which returns 0xff and one which returns 0x00.
> >> >
> >>
> >> FWIW, I have one in my tree that qemu_log(LOG_GUEST_ERROR's such
> >> accesses that I use for unimplemented devices. It's worthwhile to trap
> >> such accesses and speaking for the Xilinx LQSPI case, my preference is
> >> for some form of failure rather than silent write-ignore. And can we
> >> have an option where a invalid writes have consistent behavior with
> >> unassigned accesses?
> >>
> >> Regards,
> >> Peter
> >
> > Probably not a good idea. Ignoring unassigned addresses
> > is very handy for compatibility: we can run new guests
> > on old qemu and They don't crash or log errors.
> >
> 
> Log errors do not crash QEMU even if they are enabled. They just make
> noise and even then only if you pass -d guest_errors (which we do as
> pretty much habit now for this reason). It is the compromise solution
> between those of us who want to ignore them and those of us who need
> to know about them. The default behavior will still be to ignore
> accesses with no action.

Hi Peter,

I agree that it's very useful to be able to track these accesses. My
impression was that we could track accesses to unmapped (by spec) areas
via guest-errors and unmapped/unimplemented areas (due to lack of qemu
models) via LOG_UNIMP? As the latter are not really guest-errors..

Cheers,
Edgar

