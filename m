Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Tqgig-0006dO-7c
	for mharc-qemu-trivial@gnu.org; Thu, 03 Jan 2013 04:04:10 -0500
Received: from eggs.gnu.org ([208.118.235.92]:47767)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tqgid-0006dB-6T
	for qemu-trivial@nongnu.org; Thu, 03 Jan 2013 04:04:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Tqgic-0007sJ-2u
	for qemu-trivial@nongnu.org; Thu, 03 Jan 2013 04:04:07 -0500
Received: from mail-qc0-f181.google.com ([209.85.216.181]:38588)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Tqgib-0007sF-Us; Thu, 03 Jan 2013 04:04:05 -0500
Received: by mail-qc0-f181.google.com with SMTP id x40so7762501qcp.40
	for <multiple recipients>; Thu, 03 Jan 2013 01:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ev8N1VeHYf/S9j513qjDy7vlrOc9bLhM2BYF3ZbmAbo=;
	b=CwpaxQPhrDWZdIPmE0Ct6BMgjae2aVZb66vA0wZnyPEzaIUyP11p+98b8HjMVdTXjj
	Nj8jHKiHFNwgvZDJxB/665ynPwt8+e7f6PdhXJLjK816NI82Scdz3iGPSL67n9PcfrWW
	b6R3Oa1npgLQVR+y9K4BFntdVSKE1kd8su5ql4M4/wl/On6LoQPLH7VUKI4G2lcQ6Yc9
	yX1uZY6D5KF5Bv38VGY3KlMCieDqVnllL+IpIa3mNJFyw1DttP6aa+4gAaCkG0i7VwNs
	kqXrsmJkcp0WkQ91yl3aC3NgpDG/QqwMC5kvxvgwfD4UfZ/CxU0+/dVq+0U7ODgsX5d6
	b4HQ==
X-Received: by 10.224.191.131 with SMTP id dm3mr27892498qab.27.1357203845483; 
	Thu, 03 Jan 2013 01:04:05 -0800 (PST)
Received: from localhost (nat-pool-muc-t.redhat.com. [209.132.186.12])
	by mx.google.com with ESMTPS id ek6sm5532516qab.20.2013.01.03.01.04.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 01:04:04 -0800 (PST)
Date: Thu, 3 Jan 2013 10:03:56 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20130103090356.GC11586@stefanha-thinkpad.muc.redhat.com>
References: <1356181162-20825-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1356181162-20825-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.216.181
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/mcf5206: Reduce size of
	lookup table
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
X-List-Received-Date: Thu, 03 Jan 2013 09:04:09 -0000

On Sat, Dec 22, 2012 at 01:59:22PM +0100, Stefan Weil wrote:
> This typically reduces the size from 512 bytes to 128 bytes.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/mcf5206.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

