Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VFMVH-0001EC-Lq
	for mharc-qemu-trivial@gnu.org; Fri, 30 Aug 2013 07:04:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43661)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1VFMVA-00014o-L9
	for qemu-trivial@nongnu.org; Fri, 30 Aug 2013 07:04:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1VFMV5-0002HG-Cp
	for qemu-trivial@nongnu.org; Fri, 30 Aug 2013 07:04:28 -0400
Received: from david.siemens.de ([192.35.17.14]:17645)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1VFMUu-0002Dn-D6; Fri, 30 Aug 2013 07:04:12 -0400
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by david.siemens.de (8.13.6/8.13.6) with ESMTP id r7UB45hL011698;
	Fri, 30 Aug 2013 13:04:05 +0200
Received: from mchn199C.mchp.siemens.de ([139.25.40.156])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id r7UB45GH016439;
	Fri, 30 Aug 2013 13:04:05 +0200
Message-ID: <52207C25.9070302@siemens.com>
Date: Fri, 30 Aug 2013 13:04:05 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: Taimoor <taimoor.mrza@gmail.com>, Stefan Weil <weil@mail.berlios.de>
References: <1376594735-7433-1-git-send-email-tmirza@codesourcery.com>
In-Reply-To: <1376594735-7433-1-git-send-email-tmirza@codesourcery.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 192.35.17.14
Cc: qemu-trivial@nongnu.org, Taimoor Mirza <tmirza@codesourcery.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH v3] slirp: Port redirection option behave
 differently on Linux and Windows
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
X-List-Received-Date: Fri, 30 Aug 2013 11:04:34 -0000

On 2013-08-15 21:25, Taimoor wrote:
> From: Taimoor Mirza <tmirza@codesourcery.com>
> 
> port redirection code uses SO_REUSEADDR socket option before binding to
> host port. Behavior of SO_REUSEADDR is different on Windows and Linux.
> Relaunching QEMU with same host and guest port redirection values on Linux
> throws error but on Windows it does not throw any error.
> Problem is discussed in http://lists.gnu.org/archive/html/qemu-devel/2013-04/msg03089.html
> 
> Signed-off-by: Taimoor Mirza <tmirza@codesourcery.com>
> ---
> Changes in v3:
> - Removed extra commit
> 
> Changes in v2:
> - Changed #ifdef to #ifndef as SO_REUSEADDR should not be set in case of Windows.
> 
>  slirp/socket.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/slirp/socket.c b/slirp/socket.c
> index 8e8819c..25d60e7 100644
> --- a/slirp/socket.c
> +++ b/slirp/socket.c
> @@ -627,7 +627,9 @@ tcp_listen(Slirp *slirp, uint32_t haddr, u_int hport, uint32_t laddr,
>  	addr.sin_port = hport;
>  
>  	if (((s = qemu_socket(AF_INET,SOCK_STREAM,0)) < 0) ||
> +#ifndef _WIN32
>  	    (qemu_setsockopt(s, SOL_SOCKET, SO_REUSEADDR, &opt, sizeof(int)) < 0) ||
> +#endif
>  	    (bind(s,(struct sockaddr *)&addr, sizeof(addr)) < 0) ||
>  	    (listen(s,1) < 0)) {
>  		int tmperrno = errno; /* Don't clobber the real reason we failed */
> 

Stefan, can you ack this? Then I would pick it up for the slirp queue.

Thanks,
Jan

-- 
Siemens AG, Corporate Technology, CT RTC ITP SES-DE
Corporate Competence Center Embedded Linux

