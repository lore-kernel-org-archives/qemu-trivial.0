Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y8LGi-0003o6-5k
	for mharc-qemu-trivial@gnu.org; Mon, 05 Jan 2015 22:57:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1Y8LGf-0003kG-Av
	for qemu-trivial@nongnu.org; Mon, 05 Jan 2015 22:57:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1Y8LGe-0000FA-GY
	for qemu-trivial@nongnu.org; Mon, 05 Jan 2015 22:57:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43543)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>)
	id 1Y8LGY-0000Dv-RX; Mon, 05 Jan 2015 22:57:10 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t063v529032736
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 5 Jan 2015 22:57:05 -0500
Received: from localhost (vpn1-114-168.nay.redhat.com [10.66.114.168])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t063v2L1026529; Mon, 5 Jan 2015 22:57:04 -0500
Date: Tue, 6 Jan 2015 11:57:54 +0800
From: Fam Zheng <famz@redhat.com>
To: David Morrison <dmorrison@invlim.com>
Message-ID: <20150106035754.GC2381@fam-t430.nay.redhat.com>
References: <1420490526-6997-1-git-send-email-dmorrison@invlim.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1420490526-6997-1-git-send-email-dmorrison@invlim.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
	proljc@gmail.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-openrisc: bugfix for
 dec_sys to decode instructions correctly
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
X-List-Received-Date: Tue, 06 Jan 2015 03:57:18 -0000

On Mon, 01/05 12:42, David Morrison wrote:
> Fixed the decoding of "system" instructions (starting with 0x2)
> in dec_sys() in translate.c.  In particular, the l.trap instruction
> is now correctly decoded, which enables for singlestepping and
> breakpoints to be set in GDB.

Missing a Signed-off-by: line here.

Fam

> ---
>  target-openrisc/translate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target-openrisc/translate.c b/target-openrisc/translate.c
> index 407bd97..d36278f 100644
> --- a/target-openrisc/translate.c
> +++ b/target-openrisc/translate.c
> @@ -1320,7 +1320,7 @@ static void dec_sys(DisasContext *dc, uint32_t insn)
>  #ifdef OPENRISC_DISAS
>      uint32_t K16;
>  #endif
> -    op0 = extract32(insn, 16, 8);
> +    op0 = extract32(insn, 16, 10);
>  #ifdef OPENRISC_DISAS
>      K16 = extract32(insn, 0, 16);
>  #endif
> -- 
> 2.2.1
> 
> 

