Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SKtc6-0006wh-8Z
	for mharc-qemu-trivial@gnu.org; Thu, 19 Apr 2012 11:49:42 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50749)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1SKtbw-0006rn-8q
	for qemu-trivial@nongnu.org; Thu, 19 Apr 2012 11:49:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1SKtbo-0008JZ-E2
	for qemu-trivial@nongnu.org; Thu, 19 Apr 2012 11:49:31 -0400
Received: from mail-ob0-f173.google.com ([209.85.214.173]:65157)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>)
	id 1SKtbo-0008Iv-6D; Thu, 19 Apr 2012 11:49:24 -0400
Received: by obbwd18 with SMTP id wd18so6171843obb.4
	for <multiple recipients>; Thu, 19 Apr 2012 08:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=O41/3ON+6CWZPivBhymITS+OJhcZ/T2dsjBFdy8xcIY=;
	b=f/Bwk64Wz4k2JYGKbqa03lgDiMoSRlAZwQ58cf6Vf3KTVnf6Qic3tvnrG5L1Qq2QQG
	HkFialftrDeYHQEfmO3zYoSDfxqH95XkX49QXT0qMlva9SPjo8NWqRMnhtdKHai+RDwc
	66XnFrVVvgFp340ELexuPeOF22ZcFkzDvQWzwVOjrqaL1/uOZTzZYRmo/uBTQT3setgW
	oVbhNrYfykJ1UM2PsnSVh2AenDlls8yRyn+ytyQD6oXTynjfljkFoSFZpn7s3vxsKjbX
	XeZQht1RqePHAJ89pefVCXrhamUTdhm409c+a/IjkKYmL7V48My6Vbv8x+z3/tvkYrH4
	DBxw==
Received: by 10.182.113.42 with SMTP id iv10mr3788034obb.18.1334850561481;
	Thu, 19 Apr 2012 08:49:21 -0700 (PDT)
Received: from illuin.morrigu.org ([32.97.110.59])
	by mx.google.com with ESMTPS id aj16sm2517341oec.4.2012.04.19.08.49.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Apr 2012 08:49:20 -0700 (PDT)
Sender: fluxion <flukshun@gmail.com>
Received: by illuin.morrigu.org (sSMTP sendmail emulation);
	Thu, 19 Apr 2012 10:49:16 -0500
Date: Thu, 19 Apr 2012 10:49:16 -0500
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: stefanha@linux.vnet.ibm.com
Message-ID: <20120419154916.GD10190@illuin>
References: <1334682459-27835-1-git-send-email-mdroth@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1334682459-27835-1-git-send-email-mdroth@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.214.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, afaerber@suse.de,
	lcapitulino@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 1/2] qemu-ga: generate missing stubs for
	fsfreeze
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
X-List-Received-Date: Thu, 19 Apr 2012 15:49:40 -0000

On Tue, Apr 17, 2012 at 12:07:38PM -0500, Michael Roth wrote:
> When linux-specific commands (including guest-fsfreeze-*) were consolidated
> under defined(__linux__), we forgot to account for the case where
> defined(__linux__) && !defined(FIFREEZE). As a result stubs are no longer
> being generated on linux hosts that don't have FIFREEZE support. Fix
> this.
> 
> Tested-by: Andreas Färber <afaerber@suse.de>
> Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>

Hi Stefan,

Please ignore these for trivial, gonna submit a qemu-ga pull for these since
a build fix is involved.

> ---
>  qga/commands-posix.c |   36 ++++++++++++++++++++----------------
>  1 files changed, 20 insertions(+), 16 deletions(-)
> 
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index faf970d..087c3af 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -881,46 +881,50 @@ error:
>  
>  #else /* defined(__linux__) */
>  
> -GuestFsfreezeStatus qmp_guest_fsfreeze_status(Error **err)
> +void qmp_guest_suspend_disk(Error **err)
>  {
>      error_set(err, QERR_UNSUPPORTED);
> -
> -    return 0;
>  }
>  
> -int64_t qmp_guest_fsfreeze_freeze(Error **err)
> +void qmp_guest_suspend_ram(Error **err)
>  {
>      error_set(err, QERR_UNSUPPORTED);
> -
> -    return 0;
>  }
>  
> -int64_t qmp_guest_fsfreeze_thaw(Error **err)
> +void qmp_guest_suspend_hybrid(Error **err)
>  {
>      error_set(err, QERR_UNSUPPORTED);
> -
> -    return 0;
>  }
>  
> -void qmp_guest_suspend_disk(Error **err)
> +GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
>  {
> -    error_set(err, QERR_UNSUPPORTED);
> +    error_set(errp, QERR_UNSUPPORTED);
> +    return NULL;
>  }
>  
> -void qmp_guest_suspend_ram(Error **err)
> +#endif
> +
> +#if !defined(CONFIG_FSFREEZE)
> +
> +GuestFsfreezeStatus qmp_guest_fsfreeze_status(Error **err)
>  {
>      error_set(err, QERR_UNSUPPORTED);
> +
> +    return 0;
>  }
>  
> -void qmp_guest_suspend_hybrid(Error **err)
> +int64_t qmp_guest_fsfreeze_freeze(Error **err)
>  {
>      error_set(err, QERR_UNSUPPORTED);
> +
> +    return 0;
>  }
>  
> -GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp)
> +int64_t qmp_guest_fsfreeze_thaw(Error **err)
>  {
> -    error_set(errp, QERR_UNSUPPORTED);
> -    return NULL;
> +    error_set(err, QERR_UNSUPPORTED);
> +
> +    return 0;
>  }
>  
>  #endif
> -- 
> 1.7.4.1
> 

