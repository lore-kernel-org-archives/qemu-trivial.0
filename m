Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cmFMO-00068k-W0
	for mharc-qemu-trivial@gnu.org; Fri, 10 Mar 2017 02:53:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41392)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1cmFMM-00067I-J2
	for qemu-trivial@nongnu.org; Fri, 10 Mar 2017 02:53:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1cmFML-0001Y9-I2
	for qemu-trivial@nongnu.org; Fri, 10 Mar 2017 02:53:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58282)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1cmFMG-0001XP-2t; Fri, 10 Mar 2017 02:53:04 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BF25181239;
	Fri, 10 Mar 2017 07:53:03 +0000 (UTC)
Received: from [10.36.116.244] (ovpn-116-244.ams2.redhat.com [10.36.116.244])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id v2A7r10h028177; Fri, 10 Mar 2017 02:53:02 -0500
To: Herbie Robinson <Herbie.Robinson@stratus.com>
References: <20170309190313.DFE5240827A6@vostest4.mno.stratus.com>
Cc: qemu-devel qemu-devel <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <4b953df8-8d34-f243-ca90-9f16723a87a3@redhat.com>
Date: Fri, 10 Mar 2017 08:53:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170309190313.DFE5240827A6@vostest4.mno.stratus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 10 Mar 2017 07:53:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2] SGABIOS: fix wrong video attrs for
 int 10h, ah==13h
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
X-List-Received-Date: Fri, 10 Mar 2017 07:53:11 -0000

On 09/03/2017 19:48, Herbie Robinson wrote:
> Fix Bug #1670509: wrong video attrs for int 10h, ah==13h
> The subroutine set_cursor_position is trashing %bx.
> Unfortunately, %bl contains the video attribute for write_string.
> 
> The fix saves %bx in the function prolog and restores it in
> the epilog.  Also, remove save and restore in set_current_cursor,
> because set_cursor_position does it.
> 
> Signed-off-by: Herbie Robinson <Herbie.Robinson@stratus.com>
> ---
> Removed incorrect code deletions from set_current_cursor.

You should update the commit message too.

Laurent
> 
>  sgabios.S | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/sgabios.S b/sgabios.S
> index 275d063..96c4e23 100644
> --- a/sgabios.S
> +++ b/sgabios.S
> @@ -1728,6 +1728,7 @@ write_string_tail:
>  
>  set_cursor_position:
>    pushw %ax
> +  pushw %bx
>    pushw %ds
>    pushw $BDA_SEG
>    popw %ds                             /* ds = 0x40 */
> @@ -1738,6 +1739,7 @@ set_cursor_position:
>    movw %ax, %bx                        /* bx = cursor save offset */
>    movw %dx, (%bx)                      /* save new cursor value */
>    popw %ds
> +  popw %bx
>    popw %ax
>    ret
>  
> 


