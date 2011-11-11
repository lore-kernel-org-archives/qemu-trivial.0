Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ROsE0-0003kE-Hq
	for mharc-qemu-trivial@gnu.org; Fri, 11 Nov 2011 09:37:00 -0500
Received: from eggs.gnu.org ([140.186.70.92]:49961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1ROsDw-0003jj-Pl
	for qemu-trivial@nongnu.org; Fri, 11 Nov 2011 09:36:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1ROs1s-0006WI-4W
	for qemu-trivial@nongnu.org; Fri, 11 Nov 2011 09:24:36 -0500
Received: from mail-iy0-f173.google.com ([209.85.210.173]:46161)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1ROs1X-0006HS-Gn; Fri, 11 Nov 2011 09:24:07 -0500
Received: by iakk32 with SMTP id k32so4857927iak.4
	for <multiple recipients>; Fri, 11 Nov 2011 06:24:07 -0800 (PST)
Received: by 10.42.161.132 with SMTP id t4mr12542366icx.16.1321021446916;
	Fri, 11 Nov 2011 06:24:06 -0800 (PST)
Received: from [192.168.0.103] (cpe-70-123-132-139.austin.res.rr.com.
	[70.123.132.139])
	by mx.google.com with ESMTPS id z10sm16280713ibv.9.2011.11.11.06.24.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Nov 2011 06:24:05 -0800 (PST)
Message-ID: <4EBD3004.3080301@codemonkey.ws>
Date: Fri, 11 Nov 2011 08:24:04 -0600
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.21) Gecko/20110831 Lightning/1.0b2 Thunderbird/3.1.13
MIME-Version: 1.0
To: Gertjan Halkes <qemu@ghalkes.nl>
References: <20111111125818.444e400b@revolver>
In-Reply-To: <20111111125818.444e400b@revolver>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] make user networking
	hostfwd work with restrict=y
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
X-List-Received-Date: Fri, 11 Nov 2011 14:36:58 -0000

On 11/11/2011 05:58 AM, Gertjan Halkes wrote:
> This patch allows the hostfwd option to override the restrict=y setting in
> the user network stack, as explicitly stated in the documentation on the
> restrict option:
>
>       restrict=on|off
>           If this option is enabled, the guest will be isolated, i.e. it
>           will not be able to contact the host and no guest IP packets
>           will be routed over the host to the outside. This option does
>           not affect any explicitly set forwarding rules.
>
> Qemu bug tracker:
> https://bugs.launchpad.net/qemu/+bug/829455

Please submit against qemu.git master with a Signed-off-by.

Regards,

Anthony Liguori

>
> diff -aur qemu-kvm-0.15.0+noroms/slirp/tcp_input.c qemu-kvm-0.15.0+noromsnew/slirp/tcp_input.c
> --- qemu-kvm-0.15.0+noroms/slirp/tcp_input.c	2011-08-09 14:40:29.000000000 +0200
> +++ qemu-kvm-0.15.0+noromsnew/slirp/tcp_input.c	2011-11-11 12:42:31.000000000 +0100
> @@ -316,16 +316,6 @@
>   	m->m_data += sizeof(struct tcpiphdr)+off-sizeof(struct tcphdr);
>   	m->m_len  -= sizeof(struct tcpiphdr)+off-sizeof(struct tcphdr);
>
> -    if (slirp->restricted) {
> -        for (ex_ptr = slirp->exec_list; ex_ptr; ex_ptr = ex_ptr->ex_next) {
> -            if (ex_ptr->ex_fport == ti->ti_dport&&
> -                ti->ti_dst.s_addr == ex_ptr->ex_addr.s_addr) {
> -                break;
> -            }
> -        }
> -        if (!ex_ptr)
> -            goto drop;
> -    }
>   	/*
>   	 * Locate pcb for segment.
>   	 */
> @@ -354,7 +344,23 @@
>   	 * the only flag set, then create a session, mark it
>   	 * as if it was LISTENING, and continue...
>   	 */
> -        if (so == NULL) {
> +    if (so == NULL) {
> +        if (slirp->restricted) {
> +            /* Any hostfwds will have an existing socket, so we only get here
> +             * for non-hostfwd connections. These should be dropped, unless it
> +             * happens to be a guestfwd.
> +             */
> +            for (ex_ptr = slirp->exec_list; ex_ptr; ex_ptr = ex_ptr->ex_next) {
> +                if (ex_ptr->ex_fport == ti->ti_dport&&
> +                    ti->ti_dst.s_addr == ex_ptr->ex_addr.s_addr) {
> +                    break;
> +                }
> +            }
> +            if (!ex_ptr) {
> +                goto dropwithreset;
> +            }
> +        }
> +
>   	  if ((tiflags&  (TH_SYN|TH_FIN|TH_RST|TH_URG|TH_ACK)) != TH_SYN)
>   	    goto dropwithreset;
>
> Signed-off-by: Gertjan Halkes<qemu@ghalkes.nl>
>
>


