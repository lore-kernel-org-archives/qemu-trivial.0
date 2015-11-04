Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ztyr9-00033h-4n
	for mharc-qemu-trivial@gnu.org; Wed, 04 Nov 2015 09:16:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33443)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1Ztyr3-0002xO-1y
	for qemu-trivial@nongnu.org; Wed, 04 Nov 2015 09:16:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1Ztyqy-0001gm-I9
	for qemu-trivial@nongnu.org; Wed, 04 Nov 2015 09:16:00 -0500
Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c]:34396)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1Ztyqu-0001fy-3P; Wed, 04 Nov 2015 09:15:52 -0500
Received: by padhx2 with SMTP id hx2so46423722pad.1;
	Wed, 04 Nov 2015 06:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lCobdT3b7suZaW0wFoxPstBgVaZuOJ4S1a8P1doetgc=;
	b=ScyG3MKkh6m//gt0uX8oQZvPGjxi2nA33pCIXqCwsQIVvMx5IkHriM7uTj5SGiHBh0
	zn9PpJRb4NLP+iqkQ/ZO1gr4jx3irV6sCzck9GSg9MyNdtDO8pWat/yvCF9IHaj2Vqc4
	iLWrZRJJZ30gwwdP+MivzCN5CL1Jp2p5DMYrkvcLYOHu1FzH3Pc5dpuPyIoAuVEXciEE
	kiDWQ4Mngdegt7UA0N2j0cjCGTe319lDrg0Ig6qPgV2d+cMGavC0awaS3X5GLCVOMgoz
	BZIowcu1He76YBB9+JJhdRrI4Zkfy8/O8RFPdtIALXq7MC5PjSkmP66bJ9qFJWmTjkR8
	Ip/A==
X-Received: by 10.66.219.39 with SMTP id pl7mr2163128pac.88.1446646551034;
	Wed, 04 Nov 2015 06:15:51 -0800 (PST)
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com.
	[52.8.89.49]) by smtp.gmail.com with ESMTPSA id
	k10sm2356817pbq.78.2015.11.04.06.15.49
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 04 Nov 2015 06:15:49 -0800 (PST)
Date: Wed, 4 Nov 2015 15:15:46 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20151104141546.GC20036@toto>
References: <1446644927-8764-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1446644927-8764-1-git-send-email-pbonzini@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22c
Cc: qemu-trivial@nongnu.org, crobinso@redhat.com, qemu-devel@nongnu.org,
	armbru@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] qemu-sockets: do not
 test path with access() before unlinking
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
X-List-Received-Date: Wed, 04 Nov 2015 14:16:05 -0000

On Wed, Nov 04, 2015 at 02:48:47PM +0100, Paolo Bonzini wrote:
> Using access() is a time-of-check/time-of-use race condition.  It is
> okay to use them to provide better error messages, but that is pretty
> much it.
> 
> This is not one such case; on the other hand, access() *will* skip
> unlink() for a non-existent path, so ignore ENOENT return values from
> the unlink() system call.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  util/qemu-sockets.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 9142917..de9145a 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -751,8 +751,7 @@ int unix_listen_opts(QemuOpts *opts, Error **errp)
>          qemu_opt_set(opts, "path", un.sun_path, &error_abort);
>      }
>  
> -    if ((access(un.sun_path, F_OK) == 0) &&
> -        unlink(un.sun_path) < 0) {
> +    if (unlink(un.sun_path) < 0 && errno != ENOENT) {
>          error_setg_errno(errp, errno,
>                           "Failed to unlink socket %s", un.sun_path);
>          goto err;
> -- 
> 2.5.0
> 
> 

