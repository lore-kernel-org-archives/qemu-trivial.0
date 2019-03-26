Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h8gvn-0006v2-Fw
	for mharc-qemu-trivial@gnu.org; Tue, 26 Mar 2019 03:55:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1h8gvl-0006uQ-1u
	for qemu-trivial@nongnu.org; Tue, 26 Mar 2019 03:55:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1h8gvj-0000B0-OM
	for qemu-trivial@nongnu.org; Tue, 26 Mar 2019 03:55:32 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:46020)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1h8gvh-00009Q-MC
	for qemu-trivial@nongnu.org; Tue, 26 Mar 2019 03:55:31 -0400
Received: by mail-wr1-f65.google.com with SMTP id s15so13069015wra.12
	for <qemu-trivial@nongnu.org>; Tue, 26 Mar 2019 00:55:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=aGai54mwNx1RZRM4cwAQ4szJqGpGf/FOD5Vls6Emo4w=;
	b=Hby77cIyIlZIEQnPY2dDuqtv5zESO370WjixQu0SbHDObnuFkpe2zbWH7Z33B6+bOY
	8QBqOIn6kQUCLOlAy99bZPsLM2Yk1/k+qopbqoEdvTn5AhNN5eqUxe8/c7bSuemw6JXl
	GcQyFvX3vja4LdplWvksD6+fBaa0lwxWQ9/kmGw5LFOFVf8x5QIqD0v4HGlrUagGAuJw
	8Aew1K+uEHONQCK74xlKal3Ar53qAMKiSMmDrWTmE9zauS8RVdO18QE/8wKwNjYD1qnm
	7TaubDqdPk31ZuSGlt6yiRW94kOTBqcxG8LIwcpmn/7/aB8tGXvj8L0WUt3OfLeWy+/e
	GNLA==
X-Gm-Message-State: APjAAAV0sJes9+lRjU/Sd0Ryi+EFJqaxTRvhr+5U+GRgcLFa5k1jMZ18
	TCn0DuQgn2+f+TkB/Ic9uYClkQ==
X-Google-Smtp-Source: APXvYqxuRk/iiUiQRaqTXhXImWYeq6wcP+AkIwgbZQG6g2a6sYRRS+eHyyjwcacldgaR+DYWTyXNmA==
X-Received: by 2002:adf:dd8c:: with SMTP id x12mr19329947wrl.262.1553586927581;
	Tue, 26 Mar 2019 00:55:27 -0700 (PDT)
Received: from steredhat (host40-210-static.34-79-b.business.telecomitalia.it.
	[79.34.210.40])
	by smtp.gmail.com with ESMTPSA id z74sm3713518wmc.2.2019.03.26.00.55.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Mar 2019 00:55:26 -0700 (PDT)
Date: Tue, 26 Mar 2019 08:55:24 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: John Snow <jsnow@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
	qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Message-ID: <20190326075524.qvlakskoee3phywp@steredhat>
References: <20190321094012.36541-1-sgarzare@redhat.com>
	<7c89c032-7160-32d6-90ad-f5dafbdb211d@redhat.com>
	<CAAdtpL75dz-2ZSBJWwN_HA28-p8GxuV_HqRC7_QYaQp-yzRSpw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAdtpL75dz-2ZSBJWwN_HA28-p8GxuV_HqRC7_QYaQp-yzRSpw@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-trivial] [Qemu-devel] [Qemu-block] [PATCH] block/vhdx:
 Use IEC binary prefixes from "qemu/units.h"
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
X-List-Received-Date: Tue, 26 Mar 2019 07:55:34 -0000

On Mon, Mar 25, 2019 at 10:56:57PM +0100, Philippe Mathieu-Daudé wrote:
> Le lun. 25 mars 2019 21:53, John Snow <jsnow@redhat.com> a écrit :
> > On 3/21/19 5:40 AM, Stefano Garzarella wrote:
> > > IEC binary prefixes are defined in "qemu/units.h", so we
> > > can remove redundant definitions in "block/vhdx.h".
> > >
> > > Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
> > > ---
> > >  block/vhdx-log.c | 1 +
> > >  block/vhdx.c     | 4 +++-
> > >  block/vhdx.h     | 5 -----
> > >  3 files changed, 4 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/block/vhdx-log.c b/block/vhdx-log.c
> > > index 3149ff08d8..ad9905eb6d 100644
> > > --- a/block/vhdx-log.c
> > > +++ b/block/vhdx-log.c
> > > @@ -18,6 +18,7 @@
> > >   *
> > >   */
> > >  #include "qemu/osdep.h"
> > > +#include "qemu/units.h"
> > >  #include "qapi/error.h"
> > >  #include "qemu-common.h"
> > >  #include "block/block_int.h"
> > > diff --git a/block/vhdx.c b/block/vhdx.c
> > > index b785aef4b7..e9b16c5ef6 100644
> > > --- a/block/vhdx.c
> > > +++ b/block/vhdx.c
> > > @@ -16,6 +16,7 @@
> > >   */
> > >
> > >  #include "qemu/osdep.h"
> > > +#include "qemu/units.h"
> > >  #include "qapi/error.h"
> > >  #include "block/block_int.h"
> > >  #include "block/qdict.h"
> > > @@ -1889,7 +1890,8 @@ static int coroutine_fn
> > vhdx_co_create(BlockdevCreateOptions *opts,
> > >          return -EINVAL;
> > >      }
> > >      if (block_size > VHDX_BLOCK_SIZE_MAX) {
> > > -        error_setg(errp, "Block size must not exceed %d",
> > VHDX_BLOCK_SIZE_MAX);
> > > +        error_setg(errp, "Block size must not exceed %" PRId64,
> > > +                   VHDX_BLOCK_SIZE_MAX);
> >
> > Oh, changing the constants changes the inferred type of this constant,
> > correct?
> >
> 

Yes, in "units.h" all the constants are int64_t.

> Yes.
> 
> 
> > >          return -EINVAL;
> > >      }
> > >
> > > diff --git a/block/vhdx.h b/block/vhdx.h
> > > index 1bfb4e4f73..deb6e362ad 100644
> > > --- a/block/vhdx.h
> > > +++ b/block/vhdx.h
> > > @@ -18,11 +18,6 @@
> > >  #ifndef BLOCK_VHDX_H
> > >  #define BLOCK_VHDX_H
> > >
> > > -#define KiB              (1 * 1024)
> > > -#define MiB            (KiB * 1024)
> > > -#define GiB            (MiB * 1024)
> > > -#define TiB ((uint64_t) GiB * 1024)
> > > -
> >
> > I'd include units.h here because there are other references to
> > KiB/MiB/GiB and so on throughout the rest of this header file.
> >
> > I think it's bad form to have a header that cannot be included unless
> > you include other headers manually alongside it.
> >
> 
> Agreed.

Okay, I'll include units.h here.

> 
> 
> > >  #define DEFAULT_LOG_SIZE 1048576 /* 1MiB */
> >
> 
> Can we also update this definition?
> 

Sure, I'll update it in v2.


Thanks for the review,
Stefano

