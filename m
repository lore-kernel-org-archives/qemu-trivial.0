Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ez3sJ-0006bl-9q
	for mharc-qemu-trivial@gnu.org; Thu, 22 Mar 2018 13:19:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37736)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1ez3sF-0006ao-U3
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 13:19:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1ez3sF-00015W-0p
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 13:19:35 -0400
Received: from mail-yb0-x244.google.com ([2607:f8b0:4002:c09::244]:43016)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jcmvbkbc@gmail.com>)
	id 1ez3sB-00014a-1r; Thu, 22 Mar 2018 13:19:31 -0400
Received: by mail-yb0-x244.google.com with SMTP id z5-v6so3188793ybo.10;
	Thu, 22 Mar 2018 10:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tYFNc2IdbpPczobcXpxuEROiVrlVgFUt/OuHCwUxt7Y=;
	b=V7e7civxvLzW0ns9+15DyaOotH/WHqWFI9YTVvIrvFDrNn5UvINT3+Wn2cF+g/UPEh
	xYGjnZzQUzmJVrxpmBMIrbDjY2sODVNI0Xl8bCH5Tnd+3ZugH0Of7xXhpe1Gr6eyV4jD
	CDa3RzMWG8TcjFr9866YSkY1m/s3hXZnQunPzvGhoyxDJjX2xip3GXCOt1iQjrx5V49a
	cw3vkeSgAn+gczWIAkcACrb8/QdpMomrXRR2glkSQDTSeQR+7tBLf8HUZQHJlNXrJLoq
	jzntIRDw9pnChjk6ntNE65H7d0fAav3zFNXk4d0skv7/VA9FvuG29NYqPN0dSV2JNoHt
	zkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tYFNc2IdbpPczobcXpxuEROiVrlVgFUt/OuHCwUxt7Y=;
	b=egBMuIT22gAGV49E+AX9WKGhAco3W8OGaT+a5VUR2k9ktGL27Ti5x2IZwEQNnunuZw
	bvVG6AL0p+Wr4VWS695mJB+yC48QdbfwlMDSoxP2jtcLtyQQAfNgV5Hlyf+hRHFo9/4P
	z2p4/CWrL1a1jb1fGxnBXaiOZ7rBRRAe8eQWCL6J82Ue/D2AKby5Y5+uaU9EgWqHwxE1
	pkXC69zyjT3o/FdGaGBQiNjAErngqdgYSDM/pDGI7eKbdZ8aPR+h6Oqzyb41fpsS5LOR
	Ud/m9kQM0Vjb4B3OxuVlgm1uedH3cxpYfIh7oAh0P5Ps5ToIuKOfWxYpxp8SmvDmne9X
	qKiQ==
X-Gm-Message-State: AElRT7FtRRTebq4nPFkXdH6mLeBFUpwXOeKsm5S7uvr7nZ0o8yEUgdJo
	VlUl5V3TbWPU8jx+LZlNnU/0b+YToyreJ7FdGy8=
X-Google-Smtp-Source: AG47ELtxyPvqRmmqMwxbVHDf4X92zoTTOxIJlswvw5meGa4+FKWe7SM9pJ2t2iDU16Bz8e+NFa9Bw7BeLR9rZL/lN0s=
X-Received: by 2002:a25:9988:: with SMTP id
	p8-v6mr15106630ybo.239.1521739170316; 
	Thu, 22 Mar 2018 10:19:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:b047:0:0:0:0:0 with HTTP; Thu, 22 Mar 2018 10:19:29
	-0700 (PDT)
In-Reply-To: <6fd26097-aa7e-38cf-0d9e-09d0d36bd88b@redhat.com>
References: <20180322161226.29796-1-lvivier@redhat.com>
	<20180322161226.29796-5-lvivier@redhat.com>
	<CAMo8BfKkwM0wzX1yCBvwJ-Av4SZbgSrxmOGzD+Z_+bY0DTcgYg@mail.gmail.com>
	<6fd26097-aa7e-38cf-0d9e-09d0d36bd88b@redhat.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 22 Mar 2018 10:19:29 -0700
Message-ID: <CAMo8Bf+K_XCsZ2tLVT15v5v0ssEbGSmYj+HuT-x5UMYZTKBZ4Q@mail.gmail.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, 
	David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>, 
	Richard Henderson <rth@twiddle.net>, qemu-arm@nongnu.org,
	Eric Blake <eblake@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, Alexander Graf <agraf@suse.de>,
	qemu-ppc <qemu-ppc@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org, 
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>, 
	Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c09::244
Subject: Re: [Qemu-trivial] [PATCH 4/4] Remove unnecessary variables for
 function return value
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
X-List-Received-Date: Thu, 22 Mar 2018 17:19:38 -0000

On Thu, Mar 22, 2018 at 9:58 AM, Laurent Vivier <lvivier@redhat.com> wrote:
> On 22/03/2018 17:51, Max Filippov wrote:
>> On Thu, Mar 22, 2018 at 9:12 AM, Laurent Vivier <lvivier@redhat.com> wrote:
>>> Re-run Coccinelle script scripts/coccinelle/return_directly.cocci
>>>
>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>> ---
>>>  target/xtensa/core-dc232b/xtensa-modules.c         | 56 ++++++----------------
>>>  target/xtensa/core-dc233c/xtensa-modules.c         | 56 ++++++----------------
>>>  target/xtensa/core-de212/xtensa-modules.c          | 48 +++++--------------
>>>  target/xtensa/core-fsf/xtensa-modules.c            | 32 ++++---------
>>>  .../xtensa/core-sample_controller/xtensa-modules.c | 24 +++-------
>>
>> These files were autogenerated, fixing them doesn't make much sense.
>
> Good to know. They have been already updated by a couple of patches:
>
> 8f0a3716e4 Clean up includes
> d8e39b7062 Use #include "..." for our own headers, <...> for others
>
> Perhaps import_core.sh can be updated?

Ok, I can add a fixup that changes #include <xtensa-isa.h> to #include
"xtensa-isa.h".
Adding #include "qemu/osdep.h" there seems pointless to me.

-- 
Thanks.
-- Max

