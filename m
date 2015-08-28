Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZVKP1-0000Tw-Jh
	for mharc-qemu-trivial@gnu.org; Fri, 28 Aug 2015 10:13:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57952)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1ZVKOx-0000Nu-55
	for qemu-trivial@nongnu.org; Fri, 28 Aug 2015 10:13:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1ZVKOr-0004xa-CP
	for qemu-trivial@nongnu.org; Fri, 28 Aug 2015 10:13:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43015)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1ZVKOm-0004uF-Db; Fri, 28 Aug 2015 10:12:56 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id D1E83C1C4BA1;
	Fri, 28 Aug 2015 14:12:55 +0000 (UTC)
Received: from localhost (ovpn-112-44.ams2.redhat.com [10.36.112.44])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7SECrXH007301; Fri, 28 Aug 2015 10:12:54 -0400
Date: Fri, 28 Aug 2015 15:12:51 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20150828141251.GC30542@stefanha-thinkpad.redhat.com>
References: <1440703987-29012-1-git-send-email-lvivier@redhat.com>
	<1440703987-29012-10-git-send-email-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1440703987-29012-10-git-send-email-lvivier@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Jason Wang <jasowang@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v3 9/9] net: remove muldiv64()
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
X-List-Received-Date: Fri, 28 Aug 2015 14:13:09 -0000

On Thu, Aug 27, 2015 at 09:33:07PM +0200, Laurent Vivier wrote:
> muldiv64() is used to convert nanoseconds to microseconds.
> 
>     x = muldiv64(qemu_clock_get_ns(..), 1000000, get_ticks_per_sec());
> 
> As  get_ticks_per_sec() is 10^9, it can be replaced by:
> 
>     x = qemu_clock_get_us(..);
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
> v2: use qemu_clock_get_us() instead of qemu_clock_get_ns()/1000
>  net/dump.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

