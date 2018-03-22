Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ez3zL-0000w8-46
	for mharc-qemu-trivial@gnu.org; Thu, 22 Mar 2018 13:26:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39473)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1ez3zJ-0000ur-Aa
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 13:26:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1ez3zI-0003Xy-JG
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 13:26:53 -0400
Received: from mail-yw0-x241.google.com ([2607:f8b0:4002:c05::241]:36605)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jcmvbkbc@gmail.com>)
	id 1ez3zE-0003WB-TN; Thu, 22 Mar 2018 13:26:48 -0400
Received: by mail-yw0-x241.google.com with SMTP id y64so3086097ywa.3;
	Thu, 22 Mar 2018 10:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zZ45YUQBXpXDewsgbNgQ7duZnSkv0sLfWA63ALPNlSQ=;
	b=cRP772+lCNT1yNukrT2yVSA/UJ8somw54HIXVG4t5U4iKRMvU61bZ8Q5sLN3L/saU8
	CePpQ7Z4G7s9dJSJYaxHttoOBWyCmHlKPYypcY/rNsD4edfurJTgiuZbaVBTzGSn1dcb
	U7NwwMCIbpL4F19n/2/ksWO1cwWH2AlSDM/2GIB4fpyHAamWI7LQxUw91G109HILGfK9
	/9dPQX6prnDWlTxwKqeLtavS0ca7m8EeswMKaxpi9HMfw2r0lkbtCujWxRjS+rhG1DPr
	mytguFBSHBoYU6cGHQvz3yPccYEBgqahHVNH5OUHa39brZaD6bqy4+m4tWvFs3jdA3w5
	Hi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zZ45YUQBXpXDewsgbNgQ7duZnSkv0sLfWA63ALPNlSQ=;
	b=luo+besK5cN95z3OE8d5gQkMWLYBsJzzwkBytK04wAz4dMpv/b4Gr8a8se1fa7JEaF
	8Lz1X3AOGO7a1L3x2V0vKUmnaLSf8GNvq0VpbD6ZjBOTmDSQoJNSJsvbmuWjA8BPKVEb
	xSp+gdmqLVXlDbT796wFa0ASR3JssHPNrRXVpKZhsbTyiQZsVUx8bGqQQKVacH8EFHAs
	QqN8iyK77mB50hYa3+AHsW+WziPC0EoDSJJka1D3qAyZAfqAyAfTc+W7UiasKHEUb2wT
	Z/eEJHxthMz/DqG+KuwbcdcBprpSZU+m3NmeYFumTIcjpm78UcZSkb40gYWbl6+L5lxG
	eQhA==
X-Gm-Message-State: AElRT7HGg2ZvkzuyRRmBw+xaUXRdlNctXwtWnwKF4goECXLz67/G1g1z
	8oJsDFGCALGULc0DuwAtWzLV5pM+QqFL6iz187Q=
X-Google-Smtp-Source: AG47ELtQw/MxKyCvM0ZvNsqSU39biilqOiS2w5iRIKiOwBiievHLhYIwoUsRBLff6pIoRXnPODPxebFGVtMF6spOGbU=
X-Received: by 10.129.83.215 with SMTP id h206mr15615001ywb.388.1521739608277; 
	Thu, 22 Mar 2018 10:26:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:b047:0:0:0:0:0 with HTTP; Thu, 22 Mar 2018 10:26:47
	-0700 (PDT)
In-Reply-To: <CAFEAcA8iVaYmnCgQ9-2D=3w_sf6Zs_oAvXBDPL3KVBpomA3PxQ@mail.gmail.com>
References: <20180322161226.29796-1-lvivier@redhat.com>
	<20180322161226.29796-5-lvivier@redhat.com>
	<CAMo8BfKkwM0wzX1yCBvwJ-Av4SZbgSrxmOGzD+Z_+bY0DTcgYg@mail.gmail.com>
	<6fd26097-aa7e-38cf-0d9e-09d0d36bd88b@redhat.com>
	<CAMo8Bf+K_XCsZ2tLVT15v5v0ssEbGSmYj+HuT-x5UMYZTKBZ4Q@mail.gmail.com>
	<CAFEAcA8iVaYmnCgQ9-2D=3w_sf6Zs_oAvXBDPL3KVBpomA3PxQ@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 22 Mar 2018 10:26:47 -0700
Message-ID: <CAMo8BfJc9A9bJoNHs3wT1jmVyDkRKXxm6NV3OPJ0hXC-qpbWUg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, 
	David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>, 
	Richard Henderson <rth@twiddle.net>, qemu-arm <qemu-arm@nongnu.org>,
	Eric Blake <eblake@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, Alexander Graf <agraf@suse.de>,
	qemu-ppc <qemu-ppc@nongnu.org>, 
	Alberto Garcia <berto@igalia.com>, Qemu-block <qemu-block@nongnu.org>, 
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Yongbok Kim <yongbok.kim@mips.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>, 
	Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c05::241
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
X-List-Received-Date: Thu, 22 Mar 2018 17:26:54 -0000

On Thu, Mar 22, 2018 at 10:23 AM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> On 22 March 2018 at 17:19, Max Filippov <jcmvbkbc@gmail.com> wrote:
>> Ok, I can add a fixup that changes #include <xtensa-isa.h> to #include
>> "xtensa-isa.h".
>> Adding #include "qemu/osdep.h" there seems pointless to me.
>
> Every top level .c file must start with including osdep.h.
> Other headers that it might include rely on that.
> It looks like these files aren't actually top level .c files,
> but are only compiled by being #included from some other file.
> Our convention for that kind of thing is to give the file
> a .inc.c extension. If you follow that then clean-includes
> will skip the file rather than trying to apply the requirements
> for a top level .c file to it.

Ok, thanks. Will do that too.

-- 
Thanks.
-- Max

