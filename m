Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VDxAN-0002Kn-Ee
	for mharc-qemu-trivial@gnu.org; Mon, 26 Aug 2013 09:49:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45201)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1VDxAD-00027g-Em
	for qemu-trivial@nongnu.org; Mon, 26 Aug 2013 09:49:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1VDxA4-0001LJ-SB
	for qemu-trivial@nongnu.org; Mon, 26 Aug 2013 09:49:01 -0400
Received: from mail-qe0-x22c.google.com ([2607:f8b0:400d:c02::22c]:44996)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1VDx9n-0001GC-EJ; Mon, 26 Aug 2013 09:48:35 -0400
Received: by mail-qe0-f44.google.com with SMTP id 5so1763460qeb.17
	for <multiple recipients>; Mon, 26 Aug 2013 06:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=rwx6esyJCE1a7IVyjbTossZZ+ewRq+ZQVBhHV++zTiY=;
	b=pHSDirgN1pBL5lKY4osIG37h0CKgqz1va3yCh/kCkjyZJR+YNT9hUeYcMs2u7m9i1I
	ifolQ72GIfdaPs8JOuC4eJcI+4x0mRx5kTkjHWoeUSU1rlgAVS3DRA9ViNfpIM89mNU2
	QuGsWLS863fMDuJfvCUOd+x/GelcSHmJFGuiSP2/bX1kMY9JnQrYg5pAM9ltNWDo/maB
	w62KyD93U5d7nz84BMZtLYVPC5vp+tY32nAVCGVILOkMMZmXFz0cBDs0qWV2CMPKkJ50
	oR30REX7xbYeVAZiXwNubNLB0BNjSVIitWZ+cFfhJikcUz0KWCJ78LiDfHOJtVq9z7Wa
	zEwQ==
X-Received: by 10.229.189.199 with SMTP id df7mr433838qcb.94.1377524915011;
	Mon, 26 Aug 2013 06:48:35 -0700 (PDT)
Received: from yakj.usersys.redhat.com
	(net-37-117-144-28.cust.dsl.vodafone.it. [37.117.144.28])
	by mx.google.com with ESMTPSA id a2sm20627903qek.7.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 26 Aug 2013 06:48:33 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <521B5CAC.8090201@redhat.com>
Date: Mon, 26 Aug 2013 15:48:28 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <1377517130-12343-1-git-send-email-stefanha@redhat.com>
In-Reply-To: <1377517130-12343-1-git-send-email-stefanha@redhat.com>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c02::22c
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] curl: qemu_bh_new() can never return NULL
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
X-List-Received-Date: Mon, 26 Aug 2013 13:49:10 -0000

Il 26/08/2013 13:38, Stefan Hajnoczi ha scritto:
> Drop error code path which cannot be taken since qemu_bh_new() does not
> return NULL.
> 
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  block/curl.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/block/curl.c b/block/curl.c
> index e566855..ca2cedc 100644
> --- a/block/curl.c
> +++ b/block/curl.c
> @@ -572,12 +572,6 @@ static BlockDriverAIOCB *curl_aio_readv(BlockDriverState *bs,
>      acb->nb_sectors = nb_sectors;
>  
>      acb->bh = qemu_bh_new(curl_readv_bh_cb, acb);
> -
> -    if (!acb->bh) {
> -        DPRINTF("CURL: qemu_bh_new failed\n");
> -        return NULL;
> -    }
> -
>      qemu_bh_schedule(acb->bh);
>      return &acb->common;
>  }
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

