Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g86nf-0003VV-0n
	for mharc-qemu-trivial@gnu.org; Thu, 04 Oct 2018 12:48:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1g86nc-0003TP-MK
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2018 12:48:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1g86nY-0000JJ-9B
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2018 12:48:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57306)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1g86nO-0000BB-Ew; Thu, 04 Oct 2018 12:48:14 -0400
Received: from smtp.corp.redhat.com (int-mx11.intmail.prod.int.phx2.redhat.com
	[10.5.11.26])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7BD7530833AF;
	Thu,  4 Oct 2018 16:48:12 +0000 (UTC)
Received: from [10.10.126.73] (ovpn-126-73.rdu2.redhat.com [10.10.126.73])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD2373091344;
	Thu,  4 Oct 2018 16:48:07 +0000 (UTC)
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>
References: <20181004161852.11673-1-crosa@redhat.com>
	<20181004161852.11673-2-crosa@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <5616e4d4-938c-4e5f-6fe0-64e52d2fe6a7@redhat.com>
Date: Thu, 4 Oct 2018 11:48:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181004161852.11673-2-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Thu, 04 Oct 2018 16:48:12 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 01/10] qemu-img.c: comment
 typo fix
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
X-List-Received-Date: Thu, 04 Oct 2018 16:48:29 -0000

On 10/4/18 11:18 AM, Cleber Rosa wrote:
> A trivial comment typo fix.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>   qemu-img.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/qemu-img.c b/qemu-img.c
> index b12f4cd19b..a96b76c187 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -1085,7 +1085,7 @@ static int64_t find_nonzero(const uint8_t *buf, int64_t n)
>   }
>   
>   /*
> - * Returns true iff the first sector pointed to by 'buf' contains at least
> + * Returns true if the first sector pointed to by 'buf' contains at least

NACK.  You're not the first person to propose this change.  However, 
"iff" is an English word (albeit archaic) which is shorthand for "if and 
only if", which has a distinct logical meaning separate from the weaker 
"if".  Spelling it out in longhand instead of calling it a typo is 
probably acceptable, though.

>    * a non-NUL byte.
>    *
>    * 'pnum' is set to the number of sectors (including and immediately following
> 

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

