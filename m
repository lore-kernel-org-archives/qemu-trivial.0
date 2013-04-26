Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UVgLB-0000wN-Fq
	for mharc-qemu-trivial@gnu.org; Fri, 26 Apr 2013 06:57:21 -0400
Received: from eggs.gnu.org ([208.118.235.92]:36978)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UVgL9-0000w8-2J
	for qemu-trivial@nongnu.org; Fri, 26 Apr 2013 06:57:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1UVgL7-0001jv-Pq
	for qemu-trivial@nongnu.org; Fri, 26 Apr 2013 06:57:18 -0400
Received: from mail-bk0-x235.google.com ([2a00:1450:4008:c01::235]:35787)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1UVgL7-0001jg-JK; Fri, 26 Apr 2013 06:57:17 -0400
Received: by mail-bk0-f53.google.com with SMTP id jg9so1720095bkc.12
	for <multiple recipients>; Fri, 26 Apr 2013 03:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=KrG5LjSF2BfwqLz1ah47wbfrSF8ssqAigBGqVaeBrXk=;
	b=JVyyIgenbHJaBfkr3Td3eAz8xXgGwh5zrHsURrHseZPq91MwK790RBUDbB7jAF4ifW
	rzNaHcJ2UZVSBuymLwacvlIA9sWJLC1eDxRCBdZzEmVVkrg7Ra+WsPIFNNomn1zNOkzK
	xrXYd69WkarhpnejnwJxB+IcndTAZEwXexSjOSzxn8q4TMwkYGsO9KDyOTzUkKSc7Fvv
	uB7kwyFdhYncZdmtVPsVOh5JIYDT+kdxYEyNZPytgpECK9t4NFng2r0jdWHrJ+WBEmvh
	SSQg6y7TfRV3mYEvo7H308QPqYr0LE4eT3bjF7sxDCuPNuxbr6ST5F5XoxcGf9EhfSYo
	fqQg==
X-Received: by 10.204.71.12 with SMTP id f12mr604641bkj.32.1366973836502;
	Fri, 26 Apr 2013 03:57:16 -0700 (PDT)
Received: from localhost ([2a02:810d:ec0:195:933:b278:833c:e7be])
	by mx.google.com with ESMTPSA id
	ss14sm2977977bkb.21.2013.04.26.03.57.15 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 26 Apr 2013 03:57:15 -0700 (PDT)
Date: Fri, 26 Apr 2013 12:57:14 +0200
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Ed Maste <emaste@freebsd.org>
Message-ID: <20130426105714.GG22315@stefanha-thinkpad.hitronhub.home>
References: <1366912781-11766-1-git-send-email-emaste@freebsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1366912781-11766-1-git-send-email-emaste@freebsd.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4008:c01::235
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
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
X-List-Received-Date: Fri, 26 Apr 2013 10:57:20 -0000

On Thu, Apr 25, 2013 at 01:59:41PM -0400, Ed Maste wrote:

CCing qemu-devel@nongnu.org.

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
> -- 
> 1.7.11.5
> 
> 

