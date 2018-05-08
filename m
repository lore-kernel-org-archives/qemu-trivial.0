Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fG4ny-0005LB-6H
	for mharc-qemu-trivial@gnu.org; Tue, 08 May 2018 11:45:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcody@redhat.com>) id 1fG4nr-0005Eo-BL
	for qemu-trivial@nongnu.org; Tue, 08 May 2018 11:45:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcody@redhat.com>) id 1fG4nl-0008C4-CW
	for qemu-trivial@nongnu.org; Tue, 08 May 2018 11:45:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48832)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jcody@redhat.com>)
	id 1fG4nd-00088V-S8; Tue, 08 May 2018 11:45:09 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DF24C356CE;
	Tue,  8 May 2018 15:45:08 +0000 (UTC)
Received: from localhost (ovpn-117-144.phx2.redhat.com [10.3.117.144])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9CAF60C80;
	Tue,  8 May 2018 15:45:01 +0000 (UTC)
Date: Tue, 8 May 2018 11:45:01 -0400
From: Jeff Cody <jcody@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20180508154501.GC6722@localhost.localdomain>
References: <20180503225648.13153-1-jsnow@redhat.com>
	<20180503225648.13153-4-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180503225648.13153-4-jsnow@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 08 May 2018 15:45:08 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-block] [PATCH 3/5] qemu-img: remove
 references to GEN_DOCS
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 08 May 2018 15:45:29 -0000

On Thu, May 03, 2018 at 06:56:46PM -0400, John Snow wrote:
> Nothing seemingly uses this.
>

Indeed - it looks like it has been vestigial for a while now (commit
77bd1119ba even mentions that it appears unused).

Reviewed-by: Jeff Cody <jcody@redhat.com>

> Signed-off-by: John Snow <jsnow@redhat.com>
> ---
>  qemu-img.c             | 2 --
>  qemu-options-wrapper.h | 1 -
>  2 files changed, 3 deletions(-)
> 
> diff --git a/qemu-img.c b/qemu-img.c
> index 855fa52514..a01425372d 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -123,7 +123,6 @@ static void QEMU_NORETURN help(void)
>             "  " arg_string "\n"
>  #include "qemu-img-cmds.h"
>  #undef DEF
> -#undef GEN_DOCS
>             "\n"
>             "Command parameters:\n"
>             "  'filename' is a disk image filename\n"
> @@ -4685,7 +4684,6 @@ static const img_cmd_t img_cmds[] = {
>      { option, callback },
>  #include "qemu-img-cmds.h"
>  #undef DEF
> -#undef GEN_DOCS
>      { NULL, NULL, },
>  };
>  
> diff --git a/qemu-options-wrapper.h b/qemu-options-wrapper.h
> index 13bfea0294..6f548e3922 100644
> --- a/qemu-options-wrapper.h
> +++ b/qemu-options-wrapper.h
> @@ -34,7 +34,6 @@
>  #undef DEF
>  #undef DEFHEADING
>  #undef ARCHHEADING
> -#undef GEN_DOCS
>  
>  #undef QEMU_OPTIONS_GENERATE_ENUM
>  #undef QEMU_OPTIONS_GENERATE_HELP
> -- 
> 2.14.3
> 
> 

