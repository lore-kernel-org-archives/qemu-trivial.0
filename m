Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y9C7O-0000uy-Qy
	for mharc-qemu-trivial@gnu.org; Thu, 08 Jan 2015 07:23:14 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36122)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1Y9C7G-0000jB-Pk
	for qemu-trivial@nongnu.org; Thu, 08 Jan 2015 07:23:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1Y9C78-0005Gy-T3
	for qemu-trivial@nongnu.org; Thu, 08 Jan 2015 07:23:06 -0500
Received: from e06smtp17.uk.ibm.com ([195.75.94.113]:45476)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@linux.vnet.ibm.com>) id 1Y9C78-0005CX-KO
	for qemu-trivial@nongnu.org; Thu, 08 Jan 2015 07:22:58 -0500
Received: from /spool/local
	by e06smtp17.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <thuth@linux.vnet.ibm.com>;
	Thu, 8 Jan 2015 12:22:52 -0000
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp17.uk.ibm.com (192.168.101.147) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 8 Jan 2015 12:22:48 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com
	(d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id 15E761B0805F; 
	Thu,  8 Jan 2015 12:23:22 +0000 (GMT)
Received: from d06av05.portsmouth.uk.ibm.com (d06av05.portsmouth.uk.ibm.com
	[9.149.37.229])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id t08CMmJV56295674; Thu, 8 Jan 2015 12:22:48 GMT
Received: from d06av05.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av05.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id t08CMm90001931; Thu, 8 Jan 2015 05:22:48 -0700
Received: from oc7435384737.ibm.com (dyn-9-152-224-42.boeblingen.de.ibm.com
	[9.152.224.42])
	by d06av05.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id t08CMlCL001909; Thu, 8 Jan 2015 05:22:47 -0700
Date: Thu, 8 Jan 2015 13:22:46 +0100
From: Thomas Huth <thuth@linux.vnet.ibm.com>
To: Thomas Huth <thuth@linux.vnet.ibm.com>
Message-ID: <20150108132246.63fed0cb@oc7435384737.ibm.com>
In-Reply-To: <1418638786-29872-1-git-send-email-thuth@linux.vnet.ibm.com>
References: <1418638786-29872-1-git-send-email-thuth@linux.vnet.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.23; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 15010812-0029-0000-0000-0000029C52F7
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.113
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Makefile: Remove
 config.status and common.env during 'make distclean'
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
X-List-Received-Date: Thu, 08 Jan 2015 12:23:12 -0000

On Mon, 15 Dec 2014 11:19:46 +0100
Thomas Huth <thuth@linux.vnet.ibm.com> wrote:

> config.status and tests/qemu-iotests/common.env are generated files
> that should be deleted during 'make distclean'.
> 
> Signed-off-by: Thomas Huth <thuth@linux.vnet.ibm.com>
> ---
>  Makefile |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index f505202..6817c6f 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -313,8 +313,8 @@ qemu-%.tar.bz2:
> 
>  distclean: clean
>  	rm -f config-host.mak config-host.h* config-host.ld $(DOCS) qemu-options.texi qemu-img-cmds.texi qemu-monitor.texi
> -	rm -f config-all-devices.mak config-all-disas.mak
> -	rm -f po/*.mo
> +	rm -f config-all-devices.mak config-all-disas.mak config.status
> +	rm -f po/*.mo tests/qemu-iotests/common.env
>  	rm -f roms/seabios/config.mak roms/vgabios/config.mak
>  	rm -f qemu-doc.info qemu-doc.aux qemu-doc.cp qemu-doc.cps qemu-doc.dvi
>  	rm -f qemu-doc.fn qemu-doc.fns qemu-doc.info qemu-doc.ky qemu-doc.kys

ping?


