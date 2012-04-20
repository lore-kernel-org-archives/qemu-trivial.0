Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SLCrO-0001DX-Lf
	for mharc-qemu-trivial@gnu.org; Fri, 20 Apr 2012 08:22:46 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53946)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SLCrI-0000u0-GW
	for qemu-trivial@nongnu.org; Fri, 20 Apr 2012 08:22:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SLCrG-0001ak-NK
	for qemu-trivial@nongnu.org; Fri, 20 Apr 2012 08:22:40 -0400
Received: from mail-ee0-f45.google.com ([74.125.83.45]:48167)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SLCr5-0001UX-GY; Fri, 20 Apr 2012 08:22:27 -0400
Received: by eeit10 with SMTP id t10so2813318eei.4
	for <multiple recipients>; Fri, 20 Apr 2012 05:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PaMAMOegarDqhRSjmJV0HXik34KdlL+M7xUQREqyZmM=;
	b=pMlA609t28tdg4/ph0PNPTyQ8yg9hNplzYfWjShVs7pOEe6HUZgYf9eXGBS9FborU3
	WHTUhFFRJ8F2d4Cqa0EZpi1inlVA36ypcYeSjRMPEsqhhtx30E1Q2O9+v0PpEprKvUeS
	U56WhM+Sx5rf5dMXdU4qMuvtW6ntkMIMfmS+8XTt1+nrQVeXc61cs+NFaF9PP21l1XWx
	JThPtOsKhiXODLuUdz+L4lUqbxtR2UpQMoA9K+sueKQbi/pwaCT/xuFvlp4pIy1pNdMq
	WwlvAsclGPWsXIyFfra0le9DpoGLmREQRuuWrjnt/WK+xxpqVf0kYgMoabSoR/jNIst3
	iq6A==
Received: by 10.213.8.134 with SMTP id h6mr496331ebh.62.1334924544900;
	Fri, 20 Apr 2012 05:22:24 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	m55sm25594641eei.1.2012.04.20.05.22.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Apr 2012 05:22:24 -0700 (PDT)
Date: Fri, 20 Apr 2012 13:22:22 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120420122222.GA13447@stefanha-thinkpad.localdomain>
References: <1334726914-27870-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1334726914-27870-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.83.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] e1000: Fix spelling (segmentaion ->
 segmentation) in debug output
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
X-List-Received-Date: Fri, 20 Apr 2012 12:22:45 -0000

On Wed, Apr 18, 2012 at 07:28:34AM +0200, Stefan Weil wrote:
> This was reported by https://bugs.launchpad.net/qemu/+bug/984476.
> 
> I also changed the case for 'error'.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/e1000.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

