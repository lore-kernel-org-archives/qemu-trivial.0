Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WmV1z-0000WS-5O
	for mharc-qemu-trivial@gnu.org; Mon, 19 May 2014 17:23:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1WmV1r-0000Mh-Lv
	for qemu-trivial@nongnu.org; Mon, 19 May 2014 17:23:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1WmV1l-0002ru-MA
	for qemu-trivial@nongnu.org; Mon, 19 May 2014 17:23:27 -0400
Received: from mail-wg0-x22d.google.com ([2a00:1450:400c:c00::22d]:54262)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>)
	id 1WmV1Z-0002mz-8C; Mon, 19 May 2014 17:23:09 -0400
Received: by mail-wg0-f45.google.com with SMTP id m15so8644455wgh.16
	for <multiple recipients>; Mon, 19 May 2014 14:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NenXaJRqj7sF+/Dmo3wx2UuIRkbmeI/v2ukj1iyyKPg=;
	b=mB+bZ5/6N4Eiq6BsBE9JM9o+NyhDFtmm3pDC9dhnkUqa8MyKSQqpqsViDiEMCubw+A
	fSWxDxxpHduiyJvKS3RnjLpiRCmm9hnpSv2ImFZLe9pD2CK4DPing8Kb4W5qYxMVoCiD
	rn+NZuZZyeZTsv8cFLWc6/ob31+QEwkptiDfKbJIFwtdXirMuxBSRtzVnmhmt1wLPyLx
	1g3jeS8XZlCLmxOR/dob/dNvLV/GYYIp7kViIIx8C3bEB61Gze7uoMsVg9HirrXr/ZdF
	hsD6r/GJ0qO4+vPlBatwwzAtlWXuT/2mo4vseFtJ+AhmnFaAsSgLGn3Y4RBkzrUhCOyr
	sIQA==
X-Received: by 10.194.185.148 with SMTP id fc20mr32304139wjc.27.1400534587763; 
	Mon, 19 May 2014 14:23:07 -0700 (PDT)
Received: from Inspiron-3521 ([41.109.153.248])
	by mx.google.com with ESMTPSA id
	hs8sm17063361wib.10.2014.05.19.14.23.06 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 19 May 2014 14:23:06 -0700 (PDT)
Date: Mon, 19 May 2014 22:22:56 +0100
From: Hani Benhabiles <kroosec@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20140519212256.GA21461@Inspiron-3521>
References: <1400410205-26152-1-git-send-email-kroosec@gmail.com>
	<1400410205-26152-2-git-send-email-kroosec@gmail.com>
	<5379E568.2020005@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5379E568.2020005@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::22d
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 2/2] nbd: Don't validate from and len in
	NBD_CMD_DISC.
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
X-List-Received-Date: Mon, 19 May 2014 21:23:33 -0000

On Mon, May 19, 2014 at 01:05:12PM +0200, Paolo Bonzini wrote:
> Il 18/05/2014 12:50, Hani Benhabiles ha scritto:
> >These values aren't used in this case.
> >
> >Currently, the from field in the request sent by the nbd kernel module leading
> >to a false error message when ending the connection with the client.
> >
> >$ qemu-nbd some.img -v
> >// After nbd-client -d /dev/nbd0
> >nbd.c:nbd_trip():L1031: From: 18446744073709551104, Len: 0, Size: 20971520,
> >Offset: 0
> >nbd.c:nbd_trip():L1032: requested operation past EOF--bad client?
> >nbd.c:nbd_receive_request():L638: read failed
> >
> >Signed-off-by: Hani Benhabiles <hani@linux.com>
> >---
> > nbd.c | 7 ++++---
> > 1 file changed, 4 insertions(+), 3 deletions(-)
> >
> >diff --git a/nbd.c b/nbd.c
> >index e5084b6..dc076d7 100644
> >--- a/nbd.c
> >+++ b/nbd.c
> >@@ -1001,6 +1001,7 @@ static void nbd_trip(void *opaque)
> >     struct nbd_request request;
> >     struct nbd_reply reply;
> >     ssize_t ret;
> >+    uint32_t type;
> >
> >     TRACE("Reading request.");
> >     if (client->closing) {
> >@@ -1023,8 +1024,8 @@ static void nbd_trip(void *opaque)
> >         reply.error = -ret;
> >         goto error_reply;
> >     }
> >-
> >-    if ((request.from + request.len) > exp->size) {
> >+    type = request.type & NBD_CMD_MASK_COMMAND;
> >+    if (type != NBD_CMD_DISC && (request.from + request.len) > exp->size) {
> >             LOG("From: %" PRIu64 ", Len: %u, Size: %" PRIu64
> >             ", Offset: %" PRIu64 "\n",
> >                     request.from, request.len,
> >@@ -1033,7 +1034,7 @@ static void nbd_trip(void *opaque)
> >         goto invalid_request;
> >     }
> >
> >-    switch (request.type & NBD_CMD_MASK_COMMAND) {
> >+    switch (type) {
> >     case NBD_CMD_READ:
> >         TRACE("Request type is READ");
> >
> >
> 
> Applied after renaming the variable from type to command (for consistency
> with e.g. nbd_co_receive_request).

No issue. Thanks!

