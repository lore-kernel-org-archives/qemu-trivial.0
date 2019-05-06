Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hNYMJ-0005KF-2p
	for mharc-qemu-trivial@gnu.org; Mon, 06 May 2019 03:48:23 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43017)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hNYMG-0005IG-63
	for qemu-trivial@nongnu.org; Mon, 06 May 2019 03:48:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1hNYMD-0006te-Od
	for qemu-trivial@nongnu.org; Mon, 06 May 2019 03:48:20 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45329)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1hNYMB-0006s1-Uh
	for qemu-trivial@nongnu.org; Mon, 06 May 2019 03:48:16 -0400
Received: by mail-wr1-f68.google.com with SMTP id s15so15897372wra.12
	for <qemu-trivial@nongnu.org>; Mon, 06 May 2019 00:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=HN87jlVhtMwHVGXfqotp5rW3Ay9RJMDpyehyqTtwDT4=;
	b=n0KFJD2fe3aqstThik5WW+55HILq507Yp8vf+/tOxM/m7ZkDmUlfWv64OMmv8jCfNg
	HSNewoyWaT3pV14Mx9S2SHDGDAOo3houf84ZSTVpX22bsivJ00+aia9x0LcrnOTeikRJ
	+Prspt/FQkeDPthEclSLx04DJEbC4n3QIiBU0kOx/CXNSwJA1pP8vA0g4Wuc9Fpe7h3W
	TbVx+zgakof7iMmPUuPNpoQXzwc0JyJ6dvEeodZ5ZOBt7Ez8427nvF8HYs26n6udBK6o
	0vzj6LERv6olo/reb664ESfllkjqTYzGQmZC9bXSbXmyt6Xo2l6+z78LSWksPOADV3R5
	FYew==
X-Gm-Message-State: APjAAAXsMp2usViRV26Dps4CeR+2CuoLOFxlkUgzxE9JFdHFCDCy6Iho
	ZTGRTCDFFv90qoKN+qkCLW9+zA==
X-Google-Smtp-Source: APXvYqw9wNer+gc6DebyQ63ntetecepYfMVAkYJYtX7WL7MtFCHhJD/ELRatPTCYfoBQoKs6zNqngA==
X-Received: by 2002:a5d:51cf:: with SMTP id n15mr16130323wrv.104.1557128892388;
	Mon, 06 May 2019 00:48:12 -0700 (PDT)
Received: from steredhat (host103-125-dynamic.46-79-r.retail.telecomitalia.it.
	[79.46.125.103]) by smtp.gmail.com with ESMTPSA id
	k206sm19580202wmk.16.2019.05.06.00.48.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 May 2019 00:48:11 -0700 (PDT)
Date: Mon, 6 May 2019 09:48:09 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, kwolf@redhat.com,
	qemu-trivial@nongnu.org
Message-ID: <20190506074809.skltdcczbbu3isll@steredhat>
References: <20190506061854.22207-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190506061854.22207-1-thuth@redhat.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-trivial] [Qemu-block] [QEMU PATCH] MAINTAINERS: Downgrade
 status of block sections without "M:" to "Odd Fixes"
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 06 May 2019 07:48:21 -0000

Hi Thomas,

On Mon, May 06, 2019 at 08:18:54AM +0200, Thomas Huth wrote:
> Fixes might still get picked up via the qemu-block mailing list,
> so the status is not "Orphan" yet.
> Also add the gluster mailing list as suggested by Niels here:
> 
>  https://patchwork.kernel.org/patch/10613297/#22409943
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 66ddbda9c9..899a4cd572 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2404,12 +2404,13 @@ F: block/ssh.c
>  
>  CURL
>  L: qemu-block@nongnu.org
> -S: Supported
> +S: Odd Fixes
>  F: block/curl.c
>  
>  GLUSTER
>  L: qemu-block@nongnu.org
> -S: Supported
> +L: integration@gluster.org
> +S: Odd Fixes
>  F: block/gluster.c

I'm currently trying to get more experience on Gluster (and also on RBD).
I'd add myself as a reviewer since I'm trying to review all patches in these
areas and I'm working on some fixes.
I could also become a maintainer, but I'm not sure I have the right experience
you want.

Should I send a new patch to add myself as reviewer (or maintainer)?

Thanks,
Stefano

