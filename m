Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cmPvx-0004NU-AP
	for mharc-qemu-trivial@gnu.org; Fri, 10 Mar 2017 14:10:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34514)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1cmPvv-0004M5-0I
	for qemu-trivial@nongnu.org; Fri, 10 Mar 2017 14:10:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1cmPvu-0004FN-2Z
	for qemu-trivial@nongnu.org; Fri, 10 Mar 2017 14:10:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:57526)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1cmPvp-0004EE-Ih; Fri, 10 Mar 2017 14:10:29 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C84B085540;
	Fri, 10 Mar 2017 19:10:28 +0000 (UTC)
Received: from [10.36.116.244] (ovpn-116-244.ams2.redhat.com [10.36.116.244])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id v2AJAPqG005928; Fri, 10 Mar 2017 14:10:27 -0500
To: Herbie Robinson <Herbie.Robinson@stratus.com>, qemu-devel@nongnu.org
References: <1489161295-23864-1-git-send-email-Herbie.Robinson@stratus.com>
Cc: qemu-trivial@nongnu.org
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <d43aec18-8b5c-0929-c4ea-3b643baf784d@redhat.com>
Date: Fri, 10 Mar 2017 20:10:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1489161295-23864-1-git-send-email-Herbie.Robinson@stratus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 10 Mar 2017 19:10:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v3] SGABIOS: fix wrong video attrs for
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
X-List-Received-Date: Fri, 10 Mar 2017 19:10:36 -0000

On 10/03/2017 16:54, Herbie Robinson wrote:
> Fix Bug #1670509: wrong video attrs for int 10h, ah==13h
> The subroutine set_cursor_position is trashing %bx.
> Unfortunately, %bl contains the video attribute for write_string.
> 
> The fix saves %bx in the function prolog and restores it in
> the epilog. 
> 
> Signed-off-by: Herbie Robinson <Herbie.Robinson@stratus.com>

Reviewed-by: Laurent Vivier <lvivier@redhat.com>


> ---
> Removed incorrect code deletions from set_current_cursor.
> Removed explanation of same from the commit message.
> 
> BTW, I didn't see any test cases for this code, but if they exist
> and somebody points me at them, I should be able to generate a 
> very small qcow2 file that demonstrates the problem.
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


