Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZMcYu-00083I-5W
	for mharc-qemu-trivial@gnu.org; Tue, 04 Aug 2015 09:47:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1ZMcYo-0007wh-5a
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 09:47:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rjones@redhat.com>) id 1ZMcYn-00061b-60
	for qemu-trivial@nongnu.org; Tue, 04 Aug 2015 09:47:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46404)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rjones@redhat.com>)
	id 1ZMcYf-0005wr-Tc; Tue, 04 Aug 2015 09:47:10 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 3AFE78F23A;
	Tue,  4 Aug 2015 13:47:09 +0000 (UTC)
Received: from localhost (vpn1-5-210.ams2.redhat.com [10.36.5.210])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t74Dl7Rq024165; Tue, 4 Aug 2015 09:47:08 -0400
Date: Tue, 4 Aug 2015 14:47:07 +0100
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Message-ID: <20150804134707.GT29283@redhat.com>
References: <1438609948-3744-1-git-send-email-lvivier@redhat.com>
	<1438676851-10684-1-git-send-email-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1438676851-10684-1-git-send-email-lvivier@redhat.com>
User-Agent: Mutt/1.5.20 (2009-12-10)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [Qemu-trivial] [PATCH][TRIVIAL] i6300esb: fix timer overflow
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
X-List-Received-Date: Tue, 04 Aug 2015 13:47:22 -0000

On Tue, Aug 04, 2015 at 10:27:31AM +0200, Laurent Vivier wrote:
> --- a/hw/watchdog/wdt_i6300esb.c
> +++ b/hw/watchdog/wdt_i6300esb.c
> @@ -136,7 +136,7 @@ static void i6300esb_restart_timer(I6300State *d, int stage)
>       * multiply here can exceed 64-bits, before we divide by 33MHz, so
>       * we use a higher-precision intermediate result.
>       */
> -    timeout = muldiv64(get_ticks_per_sec(), timeout, 33000000);
> +    timeout = muldiv64(timeout, get_ticks_per_sec(), 33000000);
>  
>      i6300esb_debug("stage %d, timeout %" PRIi64 "\n", d->stage, timeout);

Here are the test results for this (v2) patch:

  Requested timeout     Observed timeout
       60                    58
      120                   120
      250                   253
      270                   274
      500                   507
      520                   529
     1010                  1026
     1030                  1045
     2046                  2078
     2500    ioctl: WDIOC_SETTIMEOUT: error setting timeout: Invalid argument

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-p2v converts physical machines to virtual machines.  Boot with a
live CD or over the network (PXE) and turn machines into KVM guests.
http://libguestfs.org/virt-v2v

