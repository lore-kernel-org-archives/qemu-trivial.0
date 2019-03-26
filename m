Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h8iwZ-00049k-GQ
	for mharc-qemu-trivial@gnu.org; Tue, 26 Mar 2019 06:04:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1h8iwX-00048v-AC
	for qemu-trivial@nongnu.org; Tue, 26 Mar 2019 06:04:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sgarzare@redhat.com>) id 1h8ivW-0002Ea-Qg
	for qemu-trivial@nongnu.org; Tue, 26 Mar 2019 06:03:27 -0400
Received: from mail-wr1-f43.google.com ([209.85.221.43]:35675)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1h8ivW-0002Dp-Hb
	for qemu-trivial@nongnu.org; Tue, 26 Mar 2019 06:03:26 -0400
Received: by mail-wr1-f43.google.com with SMTP id w1so13598436wrp.2
	for <qemu-trivial@nongnu.org>; Tue, 26 Mar 2019 03:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=nDBWb02tjkLNaDw9Q9YmfxAJHcpR4bnXduKc8tV9BcU=;
	b=STtN8VNa/OOZZ5xc03jJvtg6IA7QZ+FeuAyxVMP391HYQHxU2LSRmXU3vb5xmUhKoC
	1ner6ApfDYJ/g8/XqdXQ5iGw3IzYejn42RcP44FMd0YY04bkLlp83WoclHfNGHH5u51a
	6S9+0viDwc/c2nhJB0tMt5GwPG1gNyt1w7USSb5yyseRLwdm7s3UeY2Hej9+4PsGczmB
	t9neq1xg+vRZu69pLOI2QzGXzJGidPY1LVxgbORuReLLP7QW6fCfAEvMsTH3In6fJ5mV
	d6wl0Cugdv0PUtDBe8ibGsSafmCbK7s0mW4eZ5AX2E6J3JvwXf4sNMzNeRtIsIMgeH5z
	2fKQ==
X-Gm-Message-State: APjAAAXFnIoC2i4ZQl/q4wea5RyIES6mrzgQ7+Tn6dL22KPwZY9+KIPE
	W7HNnYRb/gGAKlHCwtxhwolAFA==
X-Google-Smtp-Source: APXvYqwinW1o52j7HK/b87JXiLEFc4lTWtiNTGLde6OVl3ngp698EVoZqhje+YRZO5Ue+DGH7/oV0g==
X-Received: by 2002:adf:e610:: with SMTP id p16mr18681114wrm.64.1553594603738; 
	Tue, 26 Mar 2019 03:03:23 -0700 (PDT)
Received: from steredhat (host40-210-static.34-79-b.business.telecomitalia.it.
	[79.34.210.40]) by smtp.gmail.com with ESMTPSA id
	a14sm18435811wrx.96.2019.03.26.03.03.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Mar 2019 03:03:23 -0700 (PDT)
Date: Tue, 26 Mar 2019 11:03:20 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: John Snow <jsnow@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-trivial@nongnu.org, qemu-block@nongnu.org,
	Max Reitz <mreitz@redhat.com>
Message-ID: <20190326100320.khiy62ytdu5jlhvk@steredhat>
References: <20190321094012.36541-1-sgarzare@redhat.com>
	<7c89c032-7160-32d6-90ad-f5dafbdb211d@redhat.com>
	<CAAdtpL75dz-2ZSBJWwN_HA28-p8GxuV_HqRC7_QYaQp-yzRSpw@mail.gmail.com>
	<20190326075524.qvlakskoee3phywp@steredhat>
	<20190326091354.GC7075@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190326091354.GC7075@localhost.localdomain>
User-Agent: NeoMutt/20180716
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.43
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
X-List-Received-Date: Tue, 26 Mar 2019 10:04:30 -0000

On Tue, Mar 26, 2019 at 10:13:54AM +0100, Kevin Wolf wrote:
> Am 26.03.2019 um 08:55 hat Stefano Garzarella geschrieben:
> > On Mon, Mar 25, 2019 at 10:56:57PM +0100, Philippe Mathieu-Daudé wrote:
> > > Le lun. 25 mars 2019 21:53, John Snow <jsnow@redhat.com> a écrit :
> > > > On 3/21/19 5:40 AM, Stefano Garzarella wrote:
> > > > >  #define DEFAULT_LOG_SIZE 1048576 /* 1MiB */
> > > >
> > > 
> > > Can we also update this definition?
> > > 
> > 
> > Sure, I'll update it in v2.
> 
> This is used in vhdx_create_opts:
> 
>     .def_value_str = stringify(DEFAULT_LOG_SIZE),
> 
> You want the default size to be a number, not an expression, so you'd
> have to change the default string to retain the number. Probably better
> to just leave the #define alone.
> 
> We could, however, put a comment next to the define lik vdi.c has:
> 
>     /* Note: can't use 1 * MiB, because it's passed to stringify() */

Many thanks for this suggestion!
I'll put the comment next to the define.

Thanks,
Stefano

