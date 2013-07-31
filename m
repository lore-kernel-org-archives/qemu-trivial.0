Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V4YW7-0003vm-4B
	for mharc-qemu-trivial@gnu.org; Wed, 31 Jul 2013 11:40:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35717)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.a@redhat.com>) id 1V4QQm-0006Sv-8I
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 03:02:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel.a@redhat.com>) id 1V4QQh-0001aB-DY
	for qemu-trivial@nongnu.org; Wed, 31 Jul 2013 03:02:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50686)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel.a@redhat.com>)
	id 1V4QQh-0001Zo-6L; Wed, 31 Jul 2013 03:02:39 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r6V72cmF011181
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 31 Jul 2013 03:02:38 -0400
Received: from [10.35.201.190] (vpn-201-190.tlv.redhat.com [10.35.201.190])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r6V72ZlD000973; Wed, 31 Jul 2013 03:02:36 -0400
Message-ID: <1375254138.2561.5.camel@localhost.localdomain>
From: Marcel Apfelbaum <marcel.a@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Date: Wed, 31 Jul 2013 10:02:18 +0300
In-Reply-To: <1375216883-23969-1-git-send-email-sw@weilnetz.de>
References: <1375216883-23969-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Wed, 31 Jul 2013 11:40:46 -0400
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Anthony Liguori <aliguori@us.ibm.com>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH for 1.6] tci: Fix broken build (compiler
 warning caused by redefined macro BIT)
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
X-List-Received-Date: Wed, 31 Jul 2013 07:02:49 -0000

On Tue, 2013-07-30 at 22:41 +0200, Stefan Weil wrote:
> The definition of macro BIT in tci/tcg-target.c now conflicts with the
> definition of the same macro in includes qemu/bitops.h.
> 
> This conflict was triggered by a recent change in the include chain of
> tcg.c (probably commit 949fc82314cc84162e64a5323764527a542421ce).

I would add explicit "#include qemu/bitops.h"
For some reason the compilation was ok when the path was submitted,
thanks!
Marcel

> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  tcg/tci/tcg-target.c |    3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/tcg/tci/tcg-target.c b/tcg/tci/tcg-target.c
> index d1241b5..e118bc7 100644
> --- a/tcg/tci/tcg-target.c
> +++ b/tcg/tci/tcg-target.c
> @@ -34,9 +34,6 @@
>          tcg_abort(); \
>      } while (0)
>  
> -/* Single bit n. */
> -#define BIT(n) (1 << (n))
> -
>  /* Bitfield n...m (in 32 bit value). */
>  #define BITS(n, m) (((0xffffffffU << (31 - n)) >> (31 - n + m)) << m)
>  



