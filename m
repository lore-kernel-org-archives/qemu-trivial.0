Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S4YIo-0002z4-4K
	for mharc-qemu-trivial@gnu.org; Mon, 05 Mar 2012 08:50:14 -0500
Received: from eggs.gnu.org ([208.118.235.92]:51934)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1S4YIh-0002co-Al
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2012 08:50:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1S4YIH-0005hj-Dk
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2012 08:50:06 -0500
Received: from mail-qy0-f173.google.com ([209.85.216.173]:49568)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1S4YIH-0005hK-9g
	for qemu-trivial@nongnu.org; Mon, 05 Mar 2012 08:49:41 -0500
Received: by qcsc20 with SMTP id c20so1657809qcs.4
	for <qemu-trivial@nongnu.org>; Mon, 05 Mar 2012 05:49:38 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates
	10.224.73.12 as permitted sender) client-ip=10.224.73.12; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	peter.maydell@linaro.org designates 10.224.73.12 as permitted
	sender) smtp.mail=peter.maydell@linaro.org
Received: from mr.google.com ([10.224.73.12])
	by 10.224.73.12 with SMTP id o12mr9850378qaj.98.1330955378479 (num_hops
	= 1); Mon, 05 Mar 2012 05:49:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.224.73.12 with SMTP id o12mr8340559qaj.98.1330955378359; Mon,
	05 Mar 2012 05:49:38 -0800 (PST)
Received: by 10.229.50.66 with HTTP; Mon, 5 Mar 2012 05:49:38 -0800 (PST)
In-Reply-To: <4F54BE41.7040409@suse.de>
References: <1330928551-6452-1-git-send-email-sw@weilnetz.de>
	<4F54BE41.7040409@suse.de>
Date: Mon, 5 Mar 2012 13:49:38 +0000
Message-ID: <CAFEAcA-F276yFMOfo8KxPHqNtf+UnWSN_h9WDaMwoNB4ZqbPhQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQmRgvnB5oXZ/OBcQlDi/7mKmAA3y8lh+gYrCpqdNPFRmTRvSN6GcGUDnkj9tNXYMogdHnlw
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.216.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] osdep: Remove local
	definition of macro offsetof
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
X-List-Received-Date: Mon, 05 Mar 2012 13:50:13 -0000

On 5 March 2012 13:23, Andreas F=C3=A4rber <afaerber@suse.de> wrote:
> Am 05.03.2012 07:22, schrieb Stefan Weil:
>> The macro offsetof is defined in stddef.h. It is conforming to
>> the standards C89, C99 and POSIX.1-2001 (see man page), so it
>> is a sufficiently old standard.
>>
>> Therefore chances are very high that QEMU never needs a local
>> definition of this macro.

> Did you check when this was introduced and whether the commit message
> gave any explanation why?

It's been copied and moved around and rerationalised down to one
definition since then, but the first offsetof() definition was
added by Fabrice in fd6ce8f66 in May 2003, with no particular
comment about it. That is about as close as qemu gets to "it has
always been this way" :-)

Nearly a decade on, I think dropping it is probably reasonably
safe.

-- PMM

