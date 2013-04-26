Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UVmDV-0004RX-DG
	for mharc-qemu-trivial@gnu.org; Fri, 26 Apr 2013 13:13:49 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prlw1@cam.ac.uk>) id 1UVmDR-0004Iw-9a
	for qemu-trivial@nongnu.org; Fri, 26 Apr 2013 13:13:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prlw1@cam.ac.uk>) id 1UVmDP-0005ox-Qg
	for qemu-trivial@nongnu.org; Fri, 26 Apr 2013 13:13:45 -0400
Received: from ppsw-52.csi.cam.ac.uk ([131.111.8.152]:53198)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prlw1@cam.ac.uk>) id 1UVmDP-0005os-Lo
	for qemu-trivial@nongnu.org; Fri, 26 Apr 2013 13:13:43 -0400
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: http://www.cam.ac.uk/cs/email/scanner/
Received: from host-92-20-232-247.as13285.net ([92.20.232.247]:61703
	helo=quark.inf.phy.private.cam.ac.uk)
	by ppsw-52.csi.cam.ac.uk (smtp.hermes.cam.ac.uk [131.111.8.158]:587)
	with esmtpsa (LOGIN:prlw1) (TLSv1:DHE-RSA-AES256-SHA:256)
	id 1UVmDN-00069E-Fy (Exim 4.80_167-5a66dd3)
	(return-path <prlw1@cam.ac.uk>); Fri, 26 Apr 2013 18:13:42 +0100
Date: Fri, 26 Apr 2013 18:13:40 +0100
From: Patrick Welche <prlw1@cam.ac.uk>
To: Ed Maste <emaste@freebsd.org>
Message-ID: <20130426171340.GE1652@quark.inf.phy.private.cam.ac.uk>
References: <1366912781-11766-1-git-send-email-emaste@freebsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1366912781-11766-1-git-send-email-emaste@freebsd.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 131.111.8.152
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Track change in FreeBSD SYSCTL(9) types
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
X-List-Received-Date: Fri, 26 Apr 2013 17:13:47 -0000

On Thu, Apr 25, 2013 at 01:59:41PM -0400, Ed Maste wrote:
> Originally from Garrett Cooper in FreeBSD PR ports/155558
> http://www.freebsd.org/cgi/query-pr.cgi?pr=155558
> 
> Signed-off-by: Ed Maste <emaste@freebsd.org>
> ---
>  bsd-user/syscall.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
> index 18b43f1..69e3466 100644
> --- a/bsd-user/syscall.c
> +++ b/bsd-user/syscall.c
> @@ -211,7 +211,11 @@ static int sysctl_oldcvt(void *holdp, size_t holdlen, uint32_t kind)
>          *(uint64_t *)holdp = tswap64(*(unsigned long *)holdp);
>          break;
>  #endif
> +#if !defined(__FreeBSD_version) || __FreeBSD_version < 900031
>      case CTLTYPE_QUAD:
> +#else
> +    case CTLTYPE_U64:
> +#endif
>          *(uint64_t *)holdp = tswap64(*(uint64_t *)holdp);
>          break;
>      case CTLTYPE_STRING:

Would something OS agnostic such as

#ifdef CTLTYPE_U64
    case CTLTYPE_U64:
#else
    case CTLTYPE_QUAD:
#endif

have done?

Cheers,

Patrick

