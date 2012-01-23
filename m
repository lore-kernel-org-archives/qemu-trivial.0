Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RpOPg-00069h-Dj
	for mharc-qemu-trivial@gnu.org; Mon, 23 Jan 2012 13:14:40 -0500
Received: from eggs.gnu.org ([140.186.70.92]:35853)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thigdon@akamai.com>) id 1RpOPd-0005xw-HZ
	for qemu-trivial@nongnu.org; Mon, 23 Jan 2012 13:14:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thigdon@akamai.com>) id 1RpOPc-00015G-DD
	for qemu-trivial@nongnu.org; Mon, 23 Jan 2012 13:14:37 -0500
Received: from prod-mail-xrelay02.akamai.com ([72.246.2.14]:47119)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thigdon@akamai.com>)
	id 1RpOPU-00014t-0T; Mon, 23 Jan 2012 13:14:28 -0500
Received: from prod-mail-xrelay02.akamai.com (localhost [127.0.0.1])
	by postfix.imss70 (Postfix) with ESMTP id 4AB6927C42;
	Mon, 23 Jan 2012 18:14:26 +0000 (GMT)
Received: from prod-mail-relay06.akamai.com (prod-mail-relay06.akamai.com
	[172.17.120.126])
	by prod-mail-xrelay02.akamai.com (Postfix) with ESMTP id 34D4D27C23;
	Mon, 23 Jan 2012 18:14:26 +0000 (GMT)
Received: from texas.kendall.corp.akamai.com (texas.kendall.corp.akamai.com
	[172.28.11.142])
	by prod-mail-relay06.akamai.com (Postfix) with ESMTP id 2FAE047BD2;
	Mon, 23 Jan 2012 18:14:26 +0000 (GMT)
Received: from thigdon by texas.kendall.corp.akamai.com with local (Exim 4.71)
	(envelope-from <thigdon@akamai.com>)
	id 1RpOPS-0003qF-5N; Mon, 23 Jan 2012 13:14:26 -0500
Date: Mon, 23 Jan 2012 13:14:26 -0500
From: Thomas Higdon <thigdon@akamai.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20120123181426.GA14494@akamai.com>
References: <20120123171525.GM32632@akamai.com> <4F1D9D4A.3000104@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4F1D9D4A.3000104@redhat.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 72.246.2.14
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>, Paul Brook <paul@codesourcery.com>
Subject: Re: [Qemu-trivial] [PATCH] scsi: restrict buffer length to
 req->cmd.xfer for responses to INQUIRY commands.
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
X-List-Received-Date: Mon, 23 Jan 2012 18:14:38 -0000

On Mon, Jan 23, 2012 at 12:47:54PM -0500, Paolo Bonzini wrote:
> On 01/23/2012 06:15 PM, Thomas Higdon wrote:
> > This prevents the emulated SCSI device from trying to DMA more bytes to the
> > initiator than are expected. Without this, the SCRIPTS code in the emulated LSI
> > device eventually raises a DMA interrupt for a data overrun when an INQUIRY
> > command whose buflen exceeds req->cmd.xfer is processed. It's the
> > responsibility of the client to provide a request buffer and allocation
> > length that are large enough for the result of the command.
> >
> > I'm no expert on SCSI (or qemu), but this appears to be more correct behavior
> > than before, and makes my SCSI INQUIRY commands more successful.
> 
> Yes, this is correct.  SCSI says "The device server shall terminate 
> transfers to the Data-In Buffer when the number of bytes or blocks 
> specified by the ALLOCATION LENGTH field have been transferred or when 
> all available data have been transferred, whichever is less".
> 
> The same is already done for example for MODE SENSE commands.
> 
> Can you please also do the same REPORT LUNS and INQUIRY in hw/scsi-bus.c?

You're talking about the scsi_target_emulate_report_luns() and
scsi_target_emulate_inquiry() functions in hw/scsi-bus.c? By my read of
the code, these appear safe. In both functions, I see len getting set
via calls to MIN with r->req->cmd.xfer as one of the arguments. If
you're referring to something else, can you be more specific?

