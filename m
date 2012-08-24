Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T4rkF-0006Ax-Cv
	for mharc-qemu-trivial@gnu.org; Fri, 24 Aug 2012 07:08:07 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T4rk7-0006AX-Px
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 07:08:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T4rk2-0008Lz-26
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 07:07:59 -0400
Received: from mail-wi0-f175.google.com ([209.85.212.175]:36951)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T4rk1-0008Ls-RB; Fri, 24 Aug 2012 07:07:53 -0400
Received: by wibhm2 with SMTP id hm2so548585wib.10
	for <multiple recipients>; Fri, 24 Aug 2012 04:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=503mzdN8jtUki9qjoQ1yUKllUQRo1+OX+9ATbK/TXzA=;
	b=vGNjtI8AnVEkpG+XrdHpTOIZ3KiaQOgmlhhmDBzEvck2rp5jNqncNrH1sZzLBYBkrP
	eqNxw+3GKV7H0GYDzq/T+UroVV/XLO6vcIkFQ+WTRDRIUu1K7LkfbNi8jFwCzlPnzzzz
	c9Z9e0BZzdCWaGYgzyeUsPKtaNNVrg5EL7ywDsTN4sK2EegSCCdBBuzr5iyThereI2lB
	vxMVsaCUKQElsdo2jGVOZYZlsbtZQ5v8Vl/lpxJf6pvcb7ndyRwXM8FWTu5AUX6bBTfL
	ZyzsemViI2szOa3zns4pVhPWbyGY6L/CYIaBUiTim9/zHaydU+/4fYmenOFx3mYbhuCr
	Z+5A==
Received: by 10.180.86.106 with SMTP id o10mr4661315wiz.22.1345806472926;
	Fri, 24 Aug 2012 04:07:52 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id fr4sm5795059wib.8.2012.08.24.04.07.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Aug 2012 04:07:51 -0700 (PDT)
Date: Fri, 24 Aug 2012 12:07:49 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <20120824110749.GF10867@stefanha-thinkpad.localdomain>
References: <Pine.GSO.4.64.1208212333210.11653@mono> <5034926B.5020808@web.de>
	<Pine.GSO.4.64.1208221214550.8637@mono> <5034F985.7020202@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5034F985.7020202@web.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.175
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vmware_vga: Cleanup and
 allow simple drivers to work without the fifo
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
X-List-Received-Date: Fri, 24 Aug 2012 11:08:05 -0000

On Wed, Aug 22, 2012 at 05:23:49PM +0200, Jan Kiszka wrote:
> On 2012-08-22 12:19, BALATON Zoltan wrote:
> > On Wed, 22 Aug 2012, Jan Kiszka wrote:
> >> This is a rather big patch. I strongly suspect you can break it up into
> >> smaller pieces that address separate aspects one-by-one. Also, it is
> >> definitely to heavy for "qemu-trivial".
> > 
> > Despite its size the changes included are fairly simple but I can try to
> > break it up. I've sent it to qemu-trivial because it may meet the "Do
> > not fall under an actively maintained subsystem."
> 
> But that doesn't make it trivial, rather harder (if no one reviewed it).
> 
> > category as I've found
> > no maintainer for this part. Should I send the revisions only to
> > qemu-devel then?
> 
> Yes, that's more appropriate IMHO.

Yes, thanks.  I don't know how this device is supposed to work and the
patch isn't trivial, so I can't apply this to qemu-trivial.

Stefan

