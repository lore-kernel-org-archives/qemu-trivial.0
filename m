Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S8Fan-0006aL-Cb
	for mharc-qemu-trivial@gnu.org; Thu, 15 Mar 2012 14:40:05 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49030)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1S8Fag-0006En-Rp
	for qemu-trivial@nongnu.org; Thu, 15 Mar 2012 14:40:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <flukshun@gmail.com>) id 1S8Faf-00089D-8j
	for qemu-trivial@nongnu.org; Thu, 15 Mar 2012 14:39:58 -0400
Received: from mail-pb0-f45.google.com ([209.85.160.45]:42451)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <flukshun@gmail.com>)
	id 1S8FZw-0007ye-Ui; Thu, 15 Mar 2012 14:39:13 -0400
Received: by pbcuo5 with SMTP id uo5so81106pbc.4
	for <multiple recipients>; Thu, 15 Mar 2012 11:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=02G+nE7/ARRIXQw4OE5l8DqYZpUQZ+05Su6i5SNytFY=;
	b=i+CMxDUREmbX4mtaiKB3ZmtTz8RxkPrxSpcbZu4TZDWc4D71sS5pQzN5OlLKOhJ3Kz
	EK/vDe+jpKZN3yAFX8f85e6xEWgPI7mnZ9bD8/S47y6gwed10PYhPx3e5xeWXm3AGyHu
	PH2ezpwHaYshS6MIdLnOO1DqynkDitSWC1FxZw4HI6ujt+zK++enXYZ6BqoeTYEvKSHV
	820N0DXYMgtJs5fRNEwhspPnpjbckEH5pazwAzBGVimNHTRLjXVJsrdxdmzQRMfnBC9i
	lZa7XuHVg4gdcZ1b4NBrVd1h+vVH1p9/HedrwQ6c+L7Fg5OP0C6brYQDvrscSj0EVXvn
	nYvA==
Received: by 10.68.228.69 with SMTP id sg5mr6982218pbc.91.1331836750030;
	Thu, 15 Mar 2012 11:39:10 -0700 (PDT)
Received: from illuin.morrigu.org ([32.97.110.59])
	by mx.google.com with ESMTPS id f5sm2424176pbe.26.2012.03.15.11.39.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Mar 2012 11:39:09 -0700 (PDT)
Sender: fluxion <flukshun@gmail.com>
Received: by illuin.morrigu.org (sSMTP sendmail emulation);
	Thu, 15 Mar 2012 13:39:04 -0500
Date: Thu, 15 Mar 2012 13:39:04 -0500
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: Jeff Cody <jcody@redhat.com>
Message-ID: <20120315183904.GL2894@illuin>
References: <dc308d51a38be11f3de7dbc3f66e4716f8b559b3.1331835902.git.jcody@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc308d51a38be11f3de7dbc3f66e4716f8b559b3.1331835902.git.jcody@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] qemu-ga: for w32,
 fix leaked handle ov.hEvent in ga_channel_write()
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
X-List-Received-Date: Thu, 15 Mar 2012 18:40:03 -0000

On Thu, Mar 15, 2012 at 02:26:18PM -0400, Jeff Cody wrote:
> In the function ga_channel_write(), the handle ov.hEvent is created
> by the call to CreateEvent(). However, the handle is not closed
> prior to the function return.
> 
> This patch closes the handle before the return of the function.
> 
> Kudos to Paolo Bonzini for spotting this bug.
> 
> Signed-off-by: Jeff Cody <jcody@redhat.com>

Acked-by: Michael Roth <mdroth@linux.vnet.ibm.com>

> ---
>  qga/channel-win32.c |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/qga/channel-win32.c b/qga/channel-win32.c
> index 190251b..16bf44a 100644
> --- a/qga/channel-win32.c
> +++ b/qga/channel-win32.c
> @@ -259,6 +259,10 @@ static GIOStatus ga_channel_write(GAChannel *c, const char *buf, size_t size,
>          *count = written;
>      }
> 
> +    if (ov.hEvent) {
> +        CloseHandle(ov.hEvent);
> +        ov.hEvent = NULL;
> +    }
>      return status;
>  }
> 
> -- 
> 1.7.9.rc2.1.g69204
> 

