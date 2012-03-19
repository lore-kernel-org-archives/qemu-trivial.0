Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S9aq4-0003NE-N4
	for mharc-qemu-trivial@gnu.org; Mon, 19 Mar 2012 07:33:24 -0400
Received: from eggs.gnu.org ([208.118.235.92]:36841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S9apx-0003Lz-Vb
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 07:33:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S9apv-0007f9-Pw
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 07:33:17 -0400
Received: from mail-wg0-f41.google.com ([74.125.82.41]:37306)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1S9apv-0007f1-GS; Mon, 19 Mar 2012 07:33:15 -0400
Received: by wgbds1 with SMTP id ds1so617995wgb.4
	for <multiple recipients>; Mon, 19 Mar 2012 04:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=tglFQgjVQL8n0/QrzoJ0rlr/5asJWy2ag37/kZyO+TY=;
	b=FXuL6kPR3JmJN8Vahe6T3WxnhqfKEuhh9TTpRDBF/nHG++VmIXloFpqJ4Za1HgjkRH
	1XNy7f2wwpCDDRZgVTmXtM+PayZfLdoDQn/tI4XkO8m4EAsPnRv6cwiDZUv+2i2PAhnO
	SGBQvUyjcyTEdn+12vl9agaZXJH1vZvOUB+occ3IOYrtSabABX1t9ekLzB4evGAn4zkN
	0aRJFyW7iX8FfCEIDEnF+oM1QnqVURUtN8YUs1cEaIosv/F7vDeIRwzUIXw7DnwgQgmc
	Ig0PGHxgPAMHCDwryDlnEmIqovnyjQL9XZmu9Bvf9tfl2PnoctrLRFUWwJjwaw4hrSgP
	T+bg==
Received: by 10.180.101.231 with SMTP id fj7mr19063244wib.15.1332156792856;
	Mon, 19 Mar 2012 04:33:12 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id
	ff9sm24945291wib.2.2012.03.19.04.33.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 19 Mar 2012 04:33:12 -0700 (PDT)
Date: Mon, 19 Mar 2012 11:33:10 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
Message-ID: <20120319113310.GD30033@stefanha-thinkpad.localdomain>
References: <1332133163-7890-1-git-send-email-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1332133163-7890-1-git-send-email-david@gibson.dropbear.id.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.41
Cc: qemu-trivial@nongnu.org, Rusty Russell <rusty@rustcorp.com.au>,
	qemu-devel@nongnu.org, anthony@codemonkey.ws,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Remove PCI class code from
 virtio balloon device
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
X-List-Received-Date: Mon, 19 Mar 2012 11:33:24 -0000

On Mon, Mar 19, 2012 at 03:59:23PM +1100, David Gibson wrote:
> Currently the virtio balloon device, when using the virtio-pci interface
> advertises itself with PCI class code MEMORY_RAM.  This is wrong; the
> balloon is vaguely related to memory, but is nothing like a PCI memory
> device in the meaning of the class code, and this code is not required or
> suggested by the virtio PCI specification.
> 
> Worse, this patch causes problems on the pseries machine, because the
> firmware, seeing this class code, advertises the device as memory in the
> device tree, and then a guest kernel bug causes it to see this "memory"
> before the real system memory, leading to a crash in early boot.
> 
> This patch fixes the problem by removing the bogus PCI class code on the
> balloon device.
> 
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Rusty Russell <rusty@rustcorp.com.au>
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  hw/virtio-pci.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Since this is a guest-visible change we might need to be careful about
how it's introduced.

Do we need to keep the old class code for existing machine types?  The
new class code could be introduced only for 1.1 and later machine types
if we want to be extra careful about introducing guest-visible changes.

Michael: Do you want to take it through your tree?

Reviewed-by: Stefan Hajnoczi <stefanha@linux.vnet.ibm.com>

