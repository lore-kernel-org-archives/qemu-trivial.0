Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h9CHO-0005pW-JP
	for mharc-qemu-trivial@gnu.org; Wed, 27 Mar 2019 13:23:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1h9CHM-0005pC-Rp
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2019 13:23:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1h9CHL-0003N3-Qj
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2019 13:23:56 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38556)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1h9CHL-0003ML-I1
	for qemu-trivial@nongnu.org; Wed, 27 Mar 2019 13:23:55 -0400
Received: by mail-wr1-f67.google.com with SMTP id k11so12150836wro.5
	for <qemu-trivial@nongnu.org>; Wed, 27 Mar 2019 10:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=tnaWzvcnJ3CGooXatOaH69KqYDxXbKfKL7gNjJAIttY=;
	b=GMVIa9IaG3itzWpReIUvAAwUwxu/AKWj4B/qGC4T7ITrXIyvSM2JX26qiK/eXa2OZU
	Ken2s+GDBlY1jbIe5puqz6R7ZIkejUHg0fbETRqNkz5E83wjejp52v+4psXsUMq0KT8e
	FPIRzeE4DWxTqFbcimfYiyweNjLYlg07tmfeUxg9Os9zmJWzeSpbZZbJbOAEVtw3iMKx
	seEKIdg3cIDQ94MA1H7MDYHBZ6UmSxYGQ358fIOu3bk7xJVAOzt9BBYcrXIeXjJYaNMl
	pkvrNK1qKWQ6j+fku2ODpkyMgsISrZuR9ssvhZutn0cwZDT4Dv6UchAFhD8Br9yZxZb8
	QDTw==
X-Gm-Message-State: APjAAAX5+yHLb2OCENFNJHOkj6vmV3ON/7mhL9qNOixLAsJi6zefpWhX
	e+HJCPZsNqVi7ENh0IvtVXrZnQ==
X-Google-Smtp-Source: APXvYqwzgbHw1PujJveHOSlLMpiNsut1GGM/r15d53sJQsbtnAl4mWmwNdGnN6EnK5G/0bvm1/lDPg==
X-Received: by 2002:adf:cd92:: with SMTP id q18mr23279053wrj.134.1553707434527;
	Wed, 27 Mar 2019 10:23:54 -0700 (PDT)
Received: from steredhat (host40-210-static.34-79-b.business.telecomitalia.it.
	[79.34.210.40]) by smtp.gmail.com with ESMTPSA id
	t17sm6685913wrr.26.2019.03.27.10.23.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Mar 2019 10:23:53 -0700 (PDT)
Date: Wed, 27 Mar 2019 18:23:51 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
	qemu-trivial@nongnu.org, Jeff Cody <codyprime@gmail.com>,
	qemu-block@nongnu.org,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Kevin Wolf <kwolf@redhat.com>
Message-ID: <20190327172351.yvk7tgeie6wzfjrk@steredhat>
References: <20190327095634.53038-1-sgarzare@redhat.com>
	<20190327095634.53038-2-sgarzare@redhat.com>
	<517394f7-5a9e-2d3e-9f92-8dcd5c0363f6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <517394f7-5a9e-2d3e-9f92-8dcd5c0363f6@redhat.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-trivial] [PATCH v2 1/2] block/vhdx: Remove redundant IEC
 binary prefixes definition
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
X-List-Received-Date: Wed, 27 Mar 2019 17:23:57 -0000

On Wed, Mar 27, 2019 at 01:16:49PM -0400, John Snow wrote:
> 
> 
> On 3/27/19 5:56 AM, Stefano Garzarella wrote:
> > IEC binary prefixes are already defined in "qemu/units.h",
> > so we can remove redundant definitions in "block/vhdx.h".
> > 
> > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > ---
> >  block/vhdx.c | 3 ++-
> >  block/vhdx.h | 6 +-----
> >  2 files changed, 3 insertions(+), 6 deletions(-)
> > 
> > diff --git a/block/vhdx.c b/block/vhdx.c
> > index b785aef4b7..7cd1fc3731 100644
> > --- a/block/vhdx.c
> > +++ b/block/vhdx.c
> > @@ -1889,7 +1889,8 @@ static int coroutine_fn vhdx_co_create(BlockdevCreateOptions *opts,
> >          return -EINVAL;
> >      }
> >      if (block_size > VHDX_BLOCK_SIZE_MAX) {
> > -        error_setg(errp, "Block size must not exceed %d", VHDX_BLOCK_SIZE_MAX);
> > +        error_setg(errp, "Block size must not exceed %" PRId64,
> > +                   VHDX_BLOCK_SIZE_MAX);
> >          return -EINVAL;
> >      }
> >  
> > diff --git a/block/vhdx.h b/block/vhdx.h
> > index 1bfb4e4f73..bf72090c8f 100644
> > --- a/block/vhdx.h
> > +++ b/block/vhdx.h
> > @@ -17,11 +17,7 @@
> >  
> >  #ifndef BLOCK_VHDX_H
> >  #define BLOCK_VHDX_H
> > -
> > -#define KiB              (1 * 1024)
> > -#define MiB            (KiB * 1024)
> > -#define GiB            (MiB * 1024)
> > -#define TiB ((uint64_t) GiB * 1024)
> > +#include "qemu/units.h"
> >  
> >  #define DEFAULT_LOG_SIZE 1048576 /* 1MiB */
> >  /* Structures and fields present in the VHDX file */
> > 
> 
> Looks good. By the way, you may want to consider adding to your git
> config rules that put the .h file diff changes above the .c file.
> 
> Look at qemu/scripts/git.orderfile

Thank you very much! It is very useful!

> 
> (I know I'm one to talk, I still haven't set mine up...)

:)

> 
> Reviewed-by: John Snow <jsnow@redhat.com>

Thanks,
Stefano

