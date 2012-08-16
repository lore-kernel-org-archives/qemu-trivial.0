Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T20Br-0002Xh-4X
	for mharc-qemu-trivial@gnu.org; Thu, 16 Aug 2012 09:32:47 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T20Bk-0002XF-83
	for qemu-trivial@nongnu.org; Thu, 16 Aug 2012 09:32:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T20Bf-0008NH-6r
	for qemu-trivial@nongnu.org; Thu, 16 Aug 2012 09:32:40 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:59338)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T20Bf-0008Mx-0Z; Thu, 16 Aug 2012 09:32:35 -0400
Received: by wgbfm10 with SMTP id fm10so1941727wgb.10
	for <multiple recipients>; Thu, 16 Aug 2012 06:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Hgfwn5Whp1IT4O68P96KXGtYmYNUAzOMwg34eEpUlBw=;
	b=YMcVHdiRzkjOhha6hS0kQydkEvRL2LWCNNgj5DS0qTrvmbLTKFMkpXmqH7F0f3Uc/9
	gZ2yKek0huglwPPpG8qm4f/RxwbzGiRCGOnobhM3h6+XkomrE5bX4pCjgcP1upXFNVCH
	G75OmVze34cRadMRNtK8YY8SR4Kvd0B4QKTWP+I9eBPBeWXdpW3LUbOJcHN7ASkT5xXY
	PX3VZy5nXkVc6T1sYgtnpJk+ks+LNato+nkFmKLYFnS7vPtngOZ9oMgXg8enLldoZU4a
	zlYSKc5vPFWjzURY5Y/woJX4tjiVUiTHWGG+gdHvNbDNfpfyXfY2ClQbTNVoraM9HRaY
	X4BA==
Received: by 10.180.82.230 with SMTP id l6mr6075554wiy.21.1345123954092;
	Thu, 16 Aug 2012 06:32:34 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id dc3sm3847216wib.7.2012.08.16.06.32.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 06:32:33 -0700 (PDT)
Date: Thu, 16 Aug 2012 14:32:26 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120816133226.GA22676@stefanha-thinkpad.localdomain>
References: <1345122741-32492-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1345122741-32492-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Spelling fixes in comments
 and macro names (ressource -> resource)
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
X-List-Received-Date: Thu, 16 Aug 2012 13:32:45 -0000

On Thu, Aug 16, 2012 at 03:12:21PM +0200, Stefan Weil wrote:
> Macro XEN_HOST_PCI_RESOURCE_BUFFER_SIZE is only used locally,
> so the change should be safe.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/xen-host-pci-device.c |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

