Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WSEwp-0006GZ-Tk
	for mharc-qemu-trivial@gnu.org; Mon, 24 Mar 2014 20:10:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54281)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <l@dorileo.org>) id 1WS6VU-0003od-GI
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 11:09:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <l@dorileo.org>) id 1WS6VN-0002VG-R7
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 11:09:44 -0400
Received: from mail-oa0-f41.google.com ([209.85.219.41]:52083)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <l@dorileo.org>) id 1WS6VN-0002V5-Ma
	for qemu-trivial@nongnu.org; Mon, 24 Mar 2014 11:09:37 -0400
Received: by mail-oa0-f41.google.com with SMTP id j17so6026752oag.0
	for <qemu-trivial@nongnu.org>; Mon, 24 Mar 2014 08:09:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=ND2lvoILpXLZmwKtHKfRQ8Q6L2n2nuJnJDI2gOjRkJw=;
	b=HdQcUHQVcTyWX6l0H6RuShfglV7Ebk47GBRN+rRy8aiCjvGrSm2f27MG4+zEfB4wvc
	BMHxEqpP1RaYgtQcb0PAngIOe6TdTyx0vVpmadfKZXj4UooT4XhvZyKOXV4hpYxvoIUr
	TAPcUBNEgQYFWqFUDeLfPF0jat847czCetLjuy7hwBIf1RpccgeElGtuJjVOCF3qQVU1
	1sqBqqLHVCmmukkaOjsGhfY8zGrpBdMiFWnrVWqw6jIwXPgJ79zxp/97qq8rXW3qsuN9
	WZv/nRdYkFYJotQKOagc/D5/TxwIx9DtuM38NN1KY2IkIobgk0wEh0165kBZH11CTORk
	fQBw==
X-Gm-Message-State: ALoCoQnf0rgSgwc/8+g1n2gs9/YXPip78CE50/4Ea+QeZAKwcw7yA5S1GHGsT0cNq6HseX4UFMbb
X-Received: by 10.60.94.209 with SMTP id de17mr3218652oeb.53.1395673777119;
	Mon, 24 Mar 2014 08:09:37 -0700 (PDT)
Received: from dorilex ([2001:4800:7815:102:1861:4901:ff05:6940])
	by mx.google.com with ESMTPSA id c9sm23546869obq.20.2014.03.24.08.09.36
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Mar 2014 08:09:36 -0700 (PDT)
Date: Mon, 24 Mar 2014 15:08:15 +0000
From: Leandro Dorileo <l@dorileo.org>
To: Deepak Kathayat <deepak.mk17@gmail.com>
Message-ID: <20140324150815.GB22155@dorilex>
References: <1395641175-30878-1-git-send-email-deepak.mk17@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1395641175-30878-1-git-send-email-deepak.mk17@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.219.41
X-Mailman-Approved-At: Mon, 24 Mar 2014 20:10:30 -0400
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qcow2: Remove FIXME comment,
	already fixed
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
X-List-Received-Date: Mon, 24 Mar 2014 15:09:49 -0000

On Mon, Mar 24, 2014 at 02:06:15PM +0800, Deepak Kathayat wrote:
> 
> Signed-off-by: Deepak Kathayat <deepak.mk17@gmail.com>

Reviewed-by: Leandro Dorileo <l@dorileo.org>

> ---
>  block/qcow2.h |    1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/block/qcow2.h b/block/qcow2.h
> index 0b0eac8..25663d4 100644
> --- a/block/qcow2.h
> +++ b/block/qcow2.h
> @@ -413,7 +413,6 @@ static inline uint64_t l2meta_cow_end(QCowL2Meta *m)
>          + (m->cow_end.nb_sectors << BDRV_SECTOR_BITS);
>  }
>  
> -// FIXME Need qcow2_ prefix to global functions
>  
>  /* qcow2.c functions */
>  int qcow2_backing_read1(BlockDriverState *bs, QEMUIOVector *qiov,
> -- 
> 1.7.9.5
> 
> 

-- 
Leandro Dorileo

