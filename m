Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RlL5V-0003Xw-KZ
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2012 08:53:05 -0500
Received: from eggs.gnu.org ([140.186.70.92]:36226)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RlL5P-0003C2-Tr
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2012 08:53:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RlL5K-0004bt-GG
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2012 08:52:59 -0500
Received: from mail-ey0-f173.google.com ([209.85.215.173]:63434)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RlL59-0004b8-BP; Thu, 12 Jan 2012 08:52:43 -0500
Received: by eaak11 with SMTP id k11so709416eaa.4
	for <multiple recipients>; Thu, 12 Jan 2012 05:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QG0E59MKFKBYDrndqvsrxYH79ylT9oJIbfcqD4wFyEA=;
	b=PssxJUaZmQxiAA9al/c8bnpv3TcmwPQzHxS2yQxHl2oiW+8fKJT+L8nYNSrM0+KwlQ
	xf9DOAkGgwPt9OVt1WsbrpWkc7nc8Qn9BQ2EOUwj47PkXimwivomh4T9TSj7LD5f8vLI
	OMYYY0AqN1zR+FcL80qtRQHKQzly0nlV5hkd0=
Received: by 10.213.8.15 with SMTP id f15mr823294ebf.64.1326376362417;
	Thu, 12 Jan 2012 05:52:42 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id
	x43sm19719861eef.8.2012.01.12.05.52.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jan 2012 05:52:41 -0800 (PST)
Date: Thu, 12 Jan 2012 13:52:36 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120112135236.GC23222@stefanha-thinkpad.localdomain>
References: <1326307657-2132-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1326307657-2132-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.215.173
Cc: qemu-trivial@nongnu.org, "M. Mohan Kumar" <mohan@in.ibm.com>,
	qemu-devel@nongnu.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] virtfs-proxy-helper: Add
 missing printf format attribute
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
X-List-Received-Date: Thu, 12 Jan 2012 13:53:03 -0000

On Wed, Jan 11, 2012 at 07:47:37PM +0100, Stefan Weil wrote:
> Every function with printf like arguments must have it
> (see file HACKING), so add it.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  fsdev/virtfs-proxy-helper.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

