Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rpk2d-0006Pe-2q
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2012 12:20:19 -0500
Received: from eggs.gnu.org ([140.186.70.92]:40863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thigdon@akamai.com>) id 1Rpk2R-0005sL-6l
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2012 12:20:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thigdon@akamai.com>) id 1Rpk2I-0001SG-Ea
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2012 12:20:04 -0500
Received: from prod-mail-xrelay02.akamai.com ([72.246.2.14]:55533)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thigdon@akamai.com>)
	id 1Rpk27-0001Qi-6A; Tue, 24 Jan 2012 12:19:47 -0500
Received: from prod-mail-xrelay02.akamai.com (localhost [127.0.0.1])
	by postfix.imss70 (Postfix) with ESMTP id 2874327D03;
	Tue, 24 Jan 2012 17:19:45 +0000 (GMT)
Received: from prod-mail-relay02.akamai.com (prod-mail-relay02.akamai.com
	[172.17.50.21])
	by prod-mail-xrelay02.akamai.com (Postfix) with ESMTP id 0D0E327CF2;
	Tue, 24 Jan 2012 17:19:45 +0000 (GMT)
Received: from texas.kendall.corp.akamai.com (texas.kendall.corp.akamai.com
	[172.28.11.142])
	by prod-mail-relay02.akamai.com (Postfix) with ESMTP id 018C3FE065;
	Tue, 24 Jan 2012 17:19:45 +0000 (GMT)
Received: from thigdon by texas.kendall.corp.akamai.com with local (Exim 4.71)
	(envelope-from <thigdon@akamai.com>)
	id 1Rpk24-0001ux-Vd; Tue, 24 Jan 2012 12:19:44 -0500
Date: Tue, 24 Jan 2012 12:19:44 -0500
From: Thomas Higdon <thigdon@akamai.com>
To: Kevin Wolf <kwolf@redhat.com>
Message-ID: <20120124171944.GD14494@akamai.com>
References: <20120123171525.GM32632@akamai.com> <4F1EB7BF.8070104@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4F1EB7BF.8070104@redhat.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 72.246.2.14
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"paul@codesourcery.com" <paul@codesourcery.com>
Subject: [Qemu-trivial] [PATCH] scsi: Guard against buflen exceeding
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
X-List-Received-Date: Tue, 24 Jan 2012 17:20:16 -0000

On Tue, Jan 24, 2012 at 08:53:03AM -0500, Kevin Wolf wrote:
> Am 23.01.2012 18:15, schrieb Thomas Higdon:
> > This prevents the emulated SCSI device from trying to DMA more bytes to the
> > initiator than are expected. Without this, the SCRIPTS code in the emulated LSI
> > device eventually raises a DMA interrupt for a data overrun when an INQUIRY
> > command whose buflen exceeds req->cmd.xfer is processed. It's the
> > responsibility of the client to provide a request buffer and allocation
> > length that are large enough for the result of the command.
> > 
> > Signed-off-by: Thomas Higdon <thigdon@akamai.com>
> > ---
> >  hw/scsi-disk.c |    3 +++
> >   1 files changed, 3 insertions(+), 0 deletions(-)
> > 
> > diff --git a/hw/scsi-disk.c b/hw/scsi-disk.c
> > index 5d8bf53..71fe2a3 100644
> > --- a/hw/scsi-disk.c
> > +++ b/hw/scsi-disk.c
> > @@ -477,6 +477,9 @@ static int scsi_disk_emulate_inquiry(SCSIRequest *req, uint8_t *outbuf)
> >                   "buffer size %zd\n", page_code, req->cmd.xfer);
> >              return -1;
> >          }
> > +        if (buflen > req->cmd.xfer) {
> > +            buflen = req->cmd.xfer;
> > +        }
> >          /* done with EVPD */
> >          return buflen;
> >      }
> 
> I wonder if it would make sense to make this check in a more central
> place like scsi_send_command(). This way we would avoid similar bugs in
> other commands.

Limit the return value (corresponding to the length of the buffer to be
DMAed back to the intiator) to the value in req->cmd.xfer, which is the
amount of data that the initiator expects. Eliminate now-duplicate code
that does this guarding in the functions for individual commands.

Without this, the SCRIPTS code in the emulated LSI device eventually
raises a DMA interrupt for a data overrun when an INQUIRY command whose
buflen exceeds req->cmd.xfer is processed. It's the responsibility of
the client to provide a request buffer and allocation length that are
large enough for the result of the command.

Signed-off-by: Thomas Higdon <thigdon@akamai.com>
---

I agree that it's better to get this into a more general place. However,
I wasn't willing to pull the MIN statement up into scsi_send_command
because I don't understand the interplay between 'len' in that function
and r->iov.iov_len. I couldn't see that there was a general relationship
between these two variables that applied to both read/write commands and
other commands.

 hw/scsi-disk.c |   10 +---------
 1 files changed, 1 insertions(+), 9 deletions(-)

diff --git a/hw/scsi-disk.c b/hw/scsi-disk.c
index 5d8bf53..11cfe73 100644
--- a/hw/scsi-disk.c
+++ b/hw/scsi-disk.c
@@ -391,9 +391,6 @@ static int scsi_disk_emulate_inquiry(SCSIRequest *req, uint8_t *outbuf)
             }
 
             l = strlen(s->serial);
-            if (l > req->cmd.xfer) {
-                l = req->cmd.xfer;
-            }
             if (l > 20) {
                 l = 20;
             }
@@ -1002,9 +999,6 @@ static int scsi_disk_emulate_mode_sense(SCSIDiskReq *r, uint8_t *outbuf)
         outbuf[0] = ((buflen - 2) >> 8) & 0xff;
         outbuf[1] = (buflen - 2) & 0xff;
     }
-    if (buflen > r->req.cmd.xfer) {
-        buflen = r->req.cmd.xfer;
-    }
     return buflen;
 }
 
@@ -1038,9 +1032,6 @@ static int scsi_disk_emulate_read_toc(SCSIRequest *req, uint8_t *outbuf)
     default:
         return -1;
     }
-    if (toclen > req->cmd.xfer) {
-        toclen = req->cmd.xfer;
-    }
     return toclen;
 }
 
@@ -1251,6 +1242,7 @@ static int scsi_disk_emulate_command(SCSIDiskReq *r)
         scsi_check_condition(r, SENSE_CODE(INVALID_OPCODE));
         return -1;
     }
+    buflen = MIN(buflen, req->cmd.xfer);
     return buflen;
 
 not_ready:
-- 
1.7.0.4


