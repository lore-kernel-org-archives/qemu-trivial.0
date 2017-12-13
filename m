Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ePAnD-0006l0-GC
	for mharc-qemu-trivial@gnu.org; Wed, 13 Dec 2017 12:26:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40136)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ePAnB-0006kr-Cc
	for qemu-trivial@nongnu.org; Wed, 13 Dec 2017 12:26:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ePAnA-0005QP-Cd
	for qemu-trivial@nongnu.org; Wed, 13 Dec 2017 12:26:01 -0500
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:40876)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ePAnA-0005PU-5y; Wed, 13 Dec 2017 12:26:00 -0500
Received: by mail-wm0-x22d.google.com with SMTP id f206so6578754wmf.5;
	Wed, 13 Dec 2017 09:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-transfer-encoding;
	bh=NkN99wwoNeWybJ2sm+mNOJwEDHYj1xalhCWQ8aVmzQ4=;
	b=tmCblKhOPT8DIsqD77SXgHgi2ExPCiKUIWqTTQkMhUqF8LAB1rHtX97PaRFV+58LtP
	NsGc7fzqxjXNCjwow6jw6b5qLJDHYTjNm2F+Ey5WgArEze95eEaGpcQrb2kNM7NQWqAZ
	9oP63ssNl7Cj4EuMbRlnqxHUX5KVaWqeeOl6zZtjMK32Nt3dke3cOvfvxCTcNJ6VQZMM
	WOJ+HwI+DI6ITzIWQdES49osedxb3Z0XMTyE/3kHM3+8IhoTBNvnxpG1A1vg1qMh93KW
	zJPqCMl58abDgSgiqjiJby2llnL8pUGlHHtynn5kyxjSxTn8Sv19Ijb9y19Lvc2otIpA
	FvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:content-transfer-encoding;
	bh=NkN99wwoNeWybJ2sm+mNOJwEDHYj1xalhCWQ8aVmzQ4=;
	b=EStZiRxKTEaG8yFyivCidJWHH1XngYtSxXbubVGzcASTMTnP9ZFOwmktgIMdOsqY2p
	lkn2RrA2IY6mwR8s/C6uYAm6TBWZYX9bBK/aKUyfgWqGqh9UmYe3i+fyFl2E/fMu6DEe
	Xa4eCQdQdMLWWFIYmIL1BxC6Zi62im1JVWkoT1J3qzIR5gsizciBoZxg9LN9ljvox7or
	fk+b3cnXd3tJcQlusnLa4UAAFfVHAq/prgrcEe5oQSO7A0IFd7FZy7EaMpgcUc10Ak9n
	LgGG+UBFJPSfRrdUVrM4bat6WzMocMvXymg8QFPnL/fg5o26Fnq6abr2g4h6fjhqlpe/
	q7gA==
X-Gm-Message-State: AKGB3mJHB/2D7lpikDoPwimRFxrTGaD0wEQ5U+fHJ0wa8TLj1g6W+cUT
	wTmIHk3zhqvVtoDneyb+SwWwwJEZ54b1GEQw2ik=
X-Google-Smtp-Source: ACJfBosjnpg6usZzn0FqECoNbtZvYI9TuhLUBZ8BhH4VRnfj3ApG3rT1nGeG6PxHJ8mGcdQLy8YDUmcDfOSIYvubkdY=
X-Received: by 10.28.227.136 with SMTP id a130mr2739079wmh.104.1513185959097; 
	Wed, 13 Dec 2017 09:25:59 -0800 (PST)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.28.164.69 with HTTP; Wed, 13 Dec 2017 09:25:28 -0800 (PST)
In-Reply-To: <20171213090630.fht4xlnvqhnxb7wj@starbug-vm.ie.oracle.com>
References: <20171213051736.17755-1-f4bug@amsat.org>
	<20171213090630.fht4xlnvqhnxb7wj@starbug-vm.ie.oracle.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 13 Dec 2017 09:25:28 -0800
X-Google-Sender-Auth: 050hOYTfW6KB4a3EpEXNoLdpf7k
Message-ID: <CAKmqyKPxuk5ifyCWvWVTyJvGzjsZ4reT-SFLNuG3_0nvn3CQ+A@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Alistair Francis <alistair.francis@xilinx.com>, 
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Eric Blake <eblake@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22d
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/4] Trivial changes in
 "registerfields.h"
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
X-List-Received-Date: Wed, 13 Dec 2017 17:26:02 -0000

On Wed, Dec 13, 2017 at 1:06 AM, Darren Kenny <darren.kenny@oracle.com> wro=
te:
> Looks good to me, for all patches:
>
> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

Same, for all four patches.

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

>
> Thanks,
>
> Darren.
>
>
> On Wed, Dec 13, 2017 at 02:17:32AM -0300, Philippe Mathieu-Daud=C3=A9 wro=
te:
>>
>> Philippe Mathieu-Daud=C3=A9 (4):
>>  MAINTAINERS: add "hw/registerfields.h" in Register API entry
>>  hw/registerfields: fix a typo in the FIELD() documentation
>>  hw/registerfields: add 64-bit extract/deposit macros
>>  hw/registerfields: add missing include
>>
>> include/hw/registerfields.h | 15 ++++++++++++++-
>> MAINTAINERS                 |  1 +
>> 2 files changed, 15 insertions(+), 1 deletion(-)
>>
>> --
>> 2.15.1
>>
>>
>

