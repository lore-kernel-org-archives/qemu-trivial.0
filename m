Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Qm2EX-00064k-TV
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jul 2011 07:25:01 -0400
Received: from eggs.gnu.org ([140.186.70.92]:60280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1Qm2EU-0005r6-E1
	for qemu-trivial@nongnu.org; Wed, 27 Jul 2011 07:24:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1Qm2ET-0000iK-D6
	for qemu-trivial@nongnu.org; Wed, 27 Jul 2011 07:24:58 -0400
Received: from david.siemens.de ([192.35.17.14]:18423)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1Qm2ER-0000ht-Ey; Wed, 27 Jul 2011 07:24:55 -0400
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by david.siemens.de (8.13.6/8.13.6) with ESMTP id p6RBOop9004613;
	Wed, 27 Jul 2011 13:24:50 +0200
Received: from mchn199C.mchp.siemens.de ([139.25.109.49])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id p6RBOo4M016372;
	Wed, 27 Jul 2011 13:24:50 +0200
Message-ID: <4E2FF582.20602@siemens.com>
Date: Wed, 27 Jul 2011 13:24:50 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: Brad <brad@comstyle.com>
References: <20110727031126.GA22433@rox.home.comstyle.com>
In-Reply-To: <20110727031126.GA22433@rox.home.comstyle.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 192.35.17.14
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Fix configure display for non-Linux OS's
 and the KVM / vhost-net features to show "no"
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
X-List-Received-Date: Wed, 27 Jul 2011 11:24:59 -0000

On 2011-07-27 05:11, Brad wrote:
> diff --git a/configure b/configure
> index dc9a1fe..ef8a4c8 100755
> --- a/configure
> +++ b/configure
> @@ -113,7 +113,6 @@ curl=""
>  curses=""
>  docs=""
>  fdt=""
> -kvm=""
>  nptl=""
>  sdl=""
>  vnc="yes"
> @@ -129,9 +128,10 @@ xen=""
>  xen_ctrl_version=""
>  linux_aio=""
>  attr=""
> -vhost_net=""
>  xfs=""
>  
> +vhost_net="no"
> +kvm="no"
>  gprof="no"
>  debug_tcg="no"
>  debug_mon="no"
> -- 1.7.6

Acked-by: Jan Kiszka <jan.kiszka@siemens.com>

Should probably be fine for the trivial tree.

Jan

-- 
Siemens AG, Corporate Technology, CT T DE IT 1
Corporate Competence Center Embedded Linux

