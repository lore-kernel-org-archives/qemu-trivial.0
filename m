Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T1eP9-0008CR-Cr
	for mharc-qemu-trivial@gnu.org; Wed, 15 Aug 2012 10:17:03 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1eP7-0008C9-Fd
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 10:17:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T1eP6-0006nz-99
	for qemu-trivial@nongnu.org; Wed, 15 Aug 2012 10:17:01 -0400
Received: from mail-wg0-f53.google.com ([74.125.82.53]:60415)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T1eP6-0006nr-2x; Wed, 15 Aug 2012 10:17:00 -0400
Received: by wgbfm10 with SMTP id fm10so1150102wgb.10
	for <multiple recipients>; Wed, 15 Aug 2012 07:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QoQXEMLX4FWCjxiNj5CT/LIbNi1E1QfjTM+fixgIkdo=;
	b=YJZTJYr2xGEIbB7KhzGXITDudcNzXAFuLLLLKPz3qxPn2qAJxKWgBxt3gBS8CLlgYh
	agPEPBpMKjyLPf8dHl7hOa42CY0JeOzRRY2eI99QkgQstkxpHqisiyVvKyykl4+Zock9
	6F7VHMWOeaYQX3hooRT40A18bAB0ExoZuJ45yelDw6j8HHCv/jB1/QD+8bYpsiFvUUkD
	I8QZoJ+Z9SLqunpgBatAF0b/wbOvhHfxW4AqXsP2gRsNHLu4mguEQo5bU3qSlLgdUcZK
	mi800RjJ+5rVvj6LrdK4LltUPFU7U0L5Vf3PNWKjSevKwELnzR/UdKsI2awtYSZZQbNF
	GOwg==
Received: by 10.180.93.68 with SMTP id cs4mr37406603wib.14.1345040219323;
	Wed, 15 Aug 2012 07:16:59 -0700 (PDT)
Received: from localhost ([109.224.133.37])
	by mx.google.com with ESMTPS id bc2sm4934136wib.0.2012.08.15.07.16.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Aug 2012 07:16:58 -0700 (PDT)
Date: Wed, 15 Aug 2012 15:16:55 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120815141655.GK10742@stefanha-thinkpad.localdomain>
References: <1344713522-5229-1-git-send-email-sw@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1344713522-5229-1-git-send-email-sw@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] framebuffer: Fix spelling
 in comment (leight -> height)
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
X-List-Received-Date: Wed, 15 Aug 2012 14:17:02 -0000

On Sat, Aug 11, 2012 at 09:32:02PM +0200, Stefan Weil wrote:
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  hw/framebuffer.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Let there be leight!

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

