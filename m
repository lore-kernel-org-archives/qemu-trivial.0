Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rqer3-0004ZB-Fx
	for mharc-qemu-trivial@gnu.org; Fri, 27 Jan 2012 01:00:09 -0500
Received: from eggs.gnu.org ([140.186.70.92]:35369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Rqeqx-0004Wm-G7
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 01:00:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Rqeqt-0007Aq-9j
	for qemu-trivial@nongnu.org; Fri, 27 Jan 2012 01:00:02 -0500
Received: from mail-pw0-f45.google.com ([209.85.160.45]:34971)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Rqeqt-0007Ac-0v; Fri, 27 Jan 2012 00:59:59 -0500
Received: by pbdd2 with SMTP id d2so1664729pbd.4
	for <multiple recipients>; Thu, 26 Jan 2012 21:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Mqaf+hJ9caMetC6Qovz9bdgk1U3FA1gCYRbfNK397dg=;
	b=dKmnBYf2l8RDEx8jpRAo2hX95Le/HIRymdXdQ8d65ZgxCsA1KPa4pXnzg0CBoX073c
	/3Sifrm8MuFBsqbgvTO0RZxo8GfsCuk1I83OjIVPRBWbJ8fIrMlZImRXpZsbtNUD2AhW
	/xdGEA0rchThoVGQ5lf8eru2qHAwD1Qb7I5cY=
Received: by 10.68.73.234 with SMTP id o10mr11916738pbv.90.1327643997350;
	Thu, 26 Jan 2012 21:59:57 -0800 (PST)
Received: from localhost (42-98-55-070.static.netvigator.com. [42.98.55.70])
	by mx.google.com with ESMTPS id t5sm17349643pbn.3.2012.01.26.21.59.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jan 2012 21:59:56 -0800 (PST)
Date: Fri, 27 Jan 2012 05:59:52 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Kevin Wolf <kwolf@redhat.com>
Message-ID: <20120127055952.GF17836@stefanha-thinkpad.localdomain>
References: <20120123171525.GM32632@akamai.com> <4F1EB7BF.8070104@redhat.com>
	<20120124171944.GD14494@akamai.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20120124171944.GD14494@akamai.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Thomas Higdon <thigdon@akamai.com>,
	"paul@codesourcery.com" <paul@codesourcery.com>
Subject: Re: [Qemu-trivial] [PATCH] scsi: Guard against buflen exceeding
 req->cmd.xfer in scsi_disk_emulate_command
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
X-List-Received-Date: Fri, 27 Jan 2012 06:00:06 -0000

On Tue, Jan 24, 2012 at 12:19:44PM -0500, Thomas Higdon wrote:
> On Tue, Jan 24, 2012 at 08:53:03AM -0500, Kevin Wolf wrote:
> > Am 23.01.2012 18:15, schrieb Thomas Higdon:
> > > This prevents the emulated SCSI device from trying to DMA more bytes to the
> > > initiator than are expected. Without this, the SCRIPTS code in the emulated LSI
> > > device eventually raises a DMA interrupt for a data overrun when an INQUIRY
> > > command whose buflen exceeds req->cmd.xfer is processed. It's the
> > > responsibility of the client to provide a request buffer and allocation
> > > length that are large enough for the result of the command.
> > > 
> > > Signed-off-by: Thomas Higdon <thigdon@akamai.com>
> > > ---
> > >  hw/scsi-disk.c |    3 +++
> > >   1 files changed, 3 insertions(+), 0 deletions(-)
> > > 
> > > diff --git a/hw/scsi-disk.c b/hw/scsi-disk.c
> > > index 5d8bf53..71fe2a3 100644
> > > --- a/hw/scsi-disk.c
> > > +++ b/hw/scsi-disk.c
> > > @@ -477,6 +477,9 @@ static int scsi_disk_emulate_inquiry(SCSIRequest *req, uint8_t *outbuf)
> > >                   "buffer size %zd\n", page_code, req->cmd.xfer);
> > >              return -1;
> > >          }
> > > +        if (buflen > req->cmd.xfer) {
> > > +            buflen = req->cmd.xfer;
> > > +        }
> > >          /* done with EVPD */
> > >          return buflen;
> > >      }
> > 
> > I wonder if it would make sense to make this check in a more central
> > place like scsi_send_command(). This way we would avoid similar bugs in
> > other commands.
> 
> Limit the return value (corresponding to the length of the buffer to be
> DMAed back to the intiator) to the value in req->cmd.xfer, which is the
> amount of data that the initiator expects. Eliminate now-duplicate code
> that does this guarding in the functions for individual commands.
> 
> Without this, the SCRIPTS code in the emulated LSI device eventually
> raises a DMA interrupt for a data overrun when an INQUIRY command whose
> buflen exceeds req->cmd.xfer is processed. It's the responsibility of
> the client to provide a request buffer and allocation length that are
> large enough for the result of the command.
> 
> Signed-off-by: Thomas Higdon <thigdon@akamai.com>
> ---

Kevin: Will you take this through your block/scsi tree?

Stefan

