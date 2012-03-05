Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S4Xhp-0001wy-VT
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2012 08:12:01 -0500
Received: from eggs.gnu.org ([208.118.235.92]:49699)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S4Xhi-0001wS-Ox
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2012 08:12:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1S4Xha-0006ww-LF
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2012 08:11:54 -0500
Received: from mail-ww0-f53.google.com ([74.125.82.53]:35085)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1S4Xha-0006we-CK; Mon, 05 Mar 2012 08:11:46 -0500
Received: by wgbfm10 with SMTP id fm10so2291450wgb.10
	for <multiple recipients>; Mon, 05 Mar 2012 05:11:43 -0800 (PST)
Received-SPF: pass (google.com: domain of stefanha@gmail.com designates
	10.180.95.1 as permitted sender) client-ip=10.180.95.1; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of stefanha@gmail.com
	designates 10.180.95.1 as permitted sender)
	smtp.mail=stefanha@gmail.com;
	dkim=pass header.i=stefanha@gmail.com
Received: from mr.google.com ([10.180.95.1])
	by 10.180.95.1 with SMTP id dg1mr15096309wib.21.1330953103870 (num_hops
	= 1); Mon, 05 Mar 2012 05:11:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=eAVNtevGu7I6BcO+7JuQNOrq7TrKH34YnGADhda+weo=;
	b=jCupTpsYSdIaCSELRSwg1v4SHkRLnxeZk/jGJB8EWXBmpu6lWtbhcmh51YV3al1T5a
	Cr7WWJhnWTKbwxTqILGOOvv6CKMVj01XuZhMYFv/tvKcM4MLKQuBN4sH/Jy1/HuOrAID
	LK85TPac8R/xzEtt0lURi2X2tg8OCNsfXwsz7IVaPR9ETcL79plkESwP3/s2iT5NeXYt
	VZudCflU8TObPJ+sCealbBH1Zz6UGPwnNSG0+LyX8T/wB1T8ZRAEEukxiPeqc5zd+XTL
	Xqk016kmHLQLHnQi/GHBQYn3PG8c/0CGiGn7jaGssjvTA2t2cGZoDEu4VlpZPl3vEXng
	BmNQ==
Received: by 10.180.95.1 with SMTP id dg1mr11985155wib.21.1330953103774;
	Mon, 05 Mar 2012 05:11:43 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	bg3sm20807061wib.10.2012.03.05.05.11.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Mar 2012 05:11:43 -0800 (PST)
Date: Mon, 5 Mar 2012 13:11:41 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120305131141.GC28506@stefanha-thinkpad.localdomain>
References: <1330174902-12364-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1330174902-12364-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] block/vmdk: Fix warning
 from splint (comparision of unsigned value)
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
X-List-Received-Date: Mon, 05 Mar 2012 13:12:00 -0000

On Sat, Feb 25, 2012 at 02:01:42PM +0100, Stefan Weil wrote:
> l1_entry_sectors will never be less than 0.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  block/vmdk.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

