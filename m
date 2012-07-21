Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SsWC7-00069K-Gt
	for mharc-qemu-trivial@gnu.org; Sat, 21 Jul 2012 05:41:51 -0400
Received: from eggs.gnu.org ([208.118.235.92]:38327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SsWC5-00069D-Bi
	for qemu-trivial@nongnu.org; Sat, 21 Jul 2012 05:41:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SsWC4-0005ng-2N
	for qemu-trivial@nongnu.org; Sat, 21 Jul 2012 05:41:49 -0400
Received: from mail-we0-f173.google.com ([74.125.82.173]:60783)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SsWC3-0005nc-SE; Sat, 21 Jul 2012 05:41:47 -0400
Received: by weyz53 with SMTP id z53so3217936wey.4
	for <multiple recipients>; Sat, 21 Jul 2012 02:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=eXZiDwgXYXRYL4sTMANqxER4oC1ehDRlLBcLPl8cc5g=;
	b=s4V+yQ6ax/cjU/jEB4hRhfNXL5OnrobPxGA7uspviLM6OGlsSVZ/2dez1/I+CcyhhZ
	/ujrD9+HiQuHhNd8lgJnPUPjj9W5YZeOIhoqr046gpXySLScTvnzKogLCMWCfVRseuHm
	2hfp6Qf2rPbXESFswSvBbGE/6eJbNWkHiiYNz7Z/CTo678Qu8a0Ok766MFU64xWv0van
	4raknK6W466D/EiOVh7UErkqHJVi6TYK9AYi9rVM97pUwSotegsbf2ATFBbNxSfzU31S
	NeyDfj4vd+9MQeQiHZs7Y6DxitohL9L6RlsieLqo/36yDwrogL4laJIpTqsvRzfntcmk
	LRXw==
Received: by 10.180.92.7 with SMTP id ci7mr12595077wib.1.1342863706528;
	Sat, 21 Jul 2012 02:41:46 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id t7sm4788213wix.6.2012.07.21.02.41.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 21 Jul 2012 02:41:46 -0700 (PDT)
Date: Sat, 21 Jul 2012 10:41:45 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alexander Graf <agraf@suse.de>
Message-ID: <20120721094145.GA13913@stefanha-thinkpad.localdomain>
References: <1342599771-13844-1-git-send-email-aik@ozlabs.ru>
	<5006D8F8.5050306@weilnetz.de> <5006D930.8080205@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5006D930.8080205@suse.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.173
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, qemu-trivial <qemu-trivial@nongnu.org>,
	qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] powerpc pci: fixed packing
	of ranges[]
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
X-List-Received-Date: Sat, 21 Jul 2012 09:41:50 -0000

On Wed, Jul 18, 2012 at 05:41:36PM +0200, Alexander Graf wrote:
> On 07/18/2012 05:40 PM, Stefan Weil wrote:
> >Am 18.07.2012 10:22, schrieb Alexey Kardashevskiy:
> >>By default mingw-gcc is trying to pack structures the way to
> >>preserve binary compatibility with MS Visual C what leads to
> >>incorrect and unexpected padding in the PCI bus ranges property of
> >>the sPAPR PHB.
> >>
> >>The patch replaces __attribute__((packed)) with more strict QEMU_PACKED
> >>which actually is __attribute__((gcc_struct, packed)) on Windows.
> >>
> >>Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> >>---
> >>  hw/spapr_pci.c |    2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >>diff --git a/hw/spapr_pci.c b/hw/spapr_pci.c
> >>index b3032d2..0261d2e 100644
> >>--- a/hw/spapr_pci.c
> >>+++ b/hw/spapr_pci.c
> >>@@ -418,7 +418,7 @@ int spapr_populate_pci_dt(sPAPRPHBState *phb,
> >>          uint64_t child;
> >>          uint64_t parent;
> >>          uint64_t size;
> >>-    } __attribute__((packed)) ranges[] = {
> >>+    } QEMU_PACKED ranges[] = {
> >>          {
> >>              cpu_to_be32(b_ss(1)), cpu_to_be64(0),
> >>              cpu_to_be64(phb->io_win_addr),
> >
> >
> >The patch changes sizeof(ranges[0]) from 32 to 28 bytes
> >and can be applied as a trivial patch.
> >
> >Tested-by: Stefan Weil <sw@weilnetz.de>
> >Reviewed-by: Stefan Weil <sw@weilnetz.de>
> >
> 
> So do you want to take it through the trivial queue? I'm fine either way.
> 
> Acked-by: Alexander Graf <agraf@suse.de>

Merged into the trivial patches tree with your Acked-by:.

Stefan

