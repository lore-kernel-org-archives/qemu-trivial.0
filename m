Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aRLpD-0000Qu-BY
	for mharc-qemu-trivial@gnu.org; Thu, 04 Feb 2016 10:28:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47692)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1aRLpA-0000Np-Dp
	for qemu-trivial@nongnu.org; Thu, 04 Feb 2016 10:28:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1aRLp9-0000tx-I3
	for qemu-trivial@nongnu.org; Thu, 04 Feb 2016 10:28:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60027)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>)
	id 1aRLp4-0000tI-Bh; Thu, 04 Feb 2016 10:27:54 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id C6F9319EE02;
	Thu,  4 Feb 2016 15:27:53 +0000 (UTC)
Received: from work-vm (ovpn-116-89.ams2.redhat.com [10.36.116.89])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u14FRoGq016025
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Thu, 4 Feb 2016 10:27:52 -0500
Date: Thu, 4 Feb 2016 15:27:50 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20160204152749.GE2427@work-vm>
References: <1454583838-22272-1-git-send-email-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1454583838-22272-1-git-send-email-pbonzini@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] migration: move
	page_cache.c to migration/
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
X-List-Received-Date: Thu, 04 Feb 2016 15:28:01 -0000

* Paolo Bonzini (pbonzini@redhat.com) wrote:
> page_cache.c is part of the XBZRLE implementation, move it to the right
> directory.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

Does that need tests/Makefile updating - I see:

tests/test-xbzrle$(EXESUF): tests/test-xbzrle.o migration/xbzrle.o page_cache.o $(test-util-obj-y)

I'm OK with moving this, although I didn't when I moved everything
else because there's nothing stopping anyone using it outside of migration.

Dave

> ---
>  Makefile.objs                          | 1 -
>  migration/Makefile.objs                | 2 +-
>  page_cache.c => migration/page_cache.c | 0
>  3 files changed, 1 insertion(+), 2 deletions(-)
>  rename page_cache.c => migration/page_cache.c (100%)
> 
> diff --git a/Makefile.objs b/Makefile.objs
> index 06b95c7..f950b0f 100644
> --- a/Makefile.objs
> +++ b/Makefile.objs
> @@ -51,7 +51,6 @@ common-obj-$(CONFIG_LINUX) += fsdev/
>  
>  common-obj-y += migration/
>  common-obj-y += qemu-char.o #aio.o
> -common-obj-y += page_cache.o
>  common-obj-y += qjson.o
>  
>  common-obj-$(CONFIG_SPICE) += spice-qemu-char.o
> diff --git a/migration/Makefile.objs b/migration/Makefile.objs
> index 0cac6d7..e5778de 100644
> --- a/migration/Makefile.objs
> +++ b/migration/Makefile.objs
> @@ -1,7 +1,7 @@
>  common-obj-y += migration.o tcp.o
>  common-obj-y += vmstate.o
>  common-obj-y += qemu-file.o qemu-file-buf.o qemu-file-unix.o qemu-file-stdio.o
> -common-obj-y += xbzrle.o postcopy-ram.o
> +common-obj-y += xbzrle.o page_cache.o postcopy-ram.o
>  
>  common-obj-$(CONFIG_RDMA) += rdma.o
>  common-obj-$(CONFIG_POSIX) += exec.o unix.o fd.o
> diff --git a/page_cache.c b/migration/page_cache.c
> similarity index 100%
> rename from page_cache.c
> rename to migration/page_cache.c
> -- 
> 2.5.0
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

