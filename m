Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1U8Sa8-0007LA-Ln
	for mharc-qemu-trivial@gnu.org; Thu, 21 Feb 2013 04:36:48 -0500
Received: from eggs.gnu.org ([208.118.235.92]:57334)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U8Sa4-0007CH-Sp
	for qemu-trivial@nongnu.org; Thu, 21 Feb 2013 04:36:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1U8SZu-0001U3-JK
	for qemu-trivial@nongnu.org; Thu, 21 Feb 2013 04:36:44 -0500
Received: from mail-we0-x233.google.com ([2a00:1450:400c:c03::233]:48412)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1U8SZl-0001QN-Qm; Thu, 21 Feb 2013 04:36:26 -0500
Received: by mail-we0-f179.google.com with SMTP id p43so5750826wea.10
	for <multiple recipients>; Thu, 21 Feb 2013 01:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=g+c7MpNuX8LKpwEftKFSKlcTPlQXy2ngR6KOfPMluq4=;
	b=NpgRBX8j8tk8DgIzhOurMQVCkjvWNLPfZ1CTZKO2Af55lCeoickCao2bsLZAYsuuz5
	HUt/iEmF2QjhqYD0NDiT4iFRbk8Ho/vZTvrfQdlOWe9W06d3P0gE2cdstwvn/hlmRL0U
	KUvJ9PzWWgul27Q+KmzSHQMldJy5u9KmvrfQQmsDCOMtZ5dZjoTCTSj8UHzvhnqvDMLA
	xrHcSSbJarS3TvXHiSoPxPiLPYhYU0/ozeBANHHfXjr1dtsWj17YvTVlS0V1jc0aYWM1
	FIVFaMx5rMUf1lDudIiuDfOk55XZMFvpJ24iOzU7/M0pdX7rMOoH0e907u41WCjwhtFk
	c0mQ==
X-Received: by 10.180.74.228 with SMTP id x4mr28859618wiv.0.1361439384825;
	Thu, 21 Feb 2013 01:36:24 -0800 (PST)
Received: from localhost ([2a02:810d:ec0:dd:4041:25e8:2e7:b222])
	by mx.google.com with ESMTPS id n2sm35786165wiy.6.2013.02.21.01.36.23
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 21 Feb 2013 01:36:23 -0800 (PST)
Date: Thu, 21 Feb 2013 10:36:21 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Alin Tomescu <tomescu.alin@gmail.com>
Message-ID: <20130221093621.GB19828@stefanha-thinkpad.redhat.com>
References: <1361414169-2887-1-git-send-email-tomescu.alin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1361414169-2887-1-git-send-email-tomescu.alin@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::233
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] ppc: fixed RAM initialization bug in
 hw/ppc4xx_devs.c,
 can now use memory larger than 256MB in bamboo PPC machines
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
X-List-Received-Date: Thu, 21 Feb 2013 09:36:47 -0000

On Wed, Feb 20, 2013 at 09:36:09PM -0500, Alin Tomescu wrote:
> I hope this is the right way of submitting QEMU patches.
> 
> I was trying to launch a PowerPC "bamboo" machine with more than 256MB of RAM
> with qemu-system-ppc -M bamboo -kernel $kernel -initrd $ramdisk -m 512, but QEMU
> would just hang. However, when I used -m 256, the machine would boot.
> 
> I looked through the code in hw/ and it seems there is an error when the
> RAM memory is setup (if my understanding is correct).
> 
> After patching it, the machine launched and booted successfully with 512MB of
> RAM.
> 
> Signed-off-by: Alin Tomescu <tomescu.alin@gmail.com>
> ---
>  hw/ppc4xx_devs.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

I shortened the commit message and dropped the first line of commit
description ("I hope this is the right way of submitting QEMU
patches.").

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

