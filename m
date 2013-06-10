Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmAWG-0003oH-Cf
	for mharc-qemu-trivial@gnu.org; Mon, 10 Jun 2013 18:24:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UmAW9-0003mB-Js
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 18:24:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UmAW2-00038o-KF
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 18:24:49 -0400
Received: from mail-bk0-x22c.google.com ([2a00:1450:4008:c01::22c]:60756)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1UmAW2-00038Y-E9
	for qemu-trivial@nongnu.org; Mon, 10 Jun 2013 18:24:42 -0400
Received: by mail-bk0-f44.google.com with SMTP id r7so3614780bkg.3
	for <qemu-trivial@nongnu.org>; Mon, 10 Jun 2013 15:24:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=EkT9wFWUkmfedcIthjZAhP4xKQNEKbM4SNJfAR53W4g=;
	b=YPMf5OQ1ytSlIMsKmZkpgOlHRrwslRvnIbhuOjUHlFMe8jV9rlBe0o2RR/5V/ApKCq
	Cp96H6fj3FI4ngpyV9oOMS8d62PhIqJtfcKeMr7Xjgo1oqaOR4+VQ4wN4fQzewPsI1jD
	ZhG6D6KJw4e51gskzaDhGB3EVnX01IN3yL80LrdS96D/nikF8CENuyOKKPXMgCEzBank
	SZ6r/JCYVjskSJqPxG+PE9Ip4rP/ZHqZKeqSxu8zNXemZ7n/fi0Ec4ogzrg/5/97l4/L
	Kc4svrTJKrAlSStKMk8J58D9kxFI+YkcQ7+ujgElg7z043brAJvnslmOMA/56GXg8Q9G
	1m1g==
MIME-Version: 1.0
X-Received: by 10.204.190.7 with SMTP id dg7mr1861945bkb.52.1370903081410;
	Mon, 10 Jun 2013 15:24:41 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.204.35.136 with HTTP; Mon, 10 Jun 2013 15:24:41 -0700 (PDT)
In-Reply-To: <51B5F0D3.2030504@msgid.tls.msk.ru>
References: <cover.1370236013.git.peter.crosthwaite@xilinx.com>
	<b61bfd22e26fd08d9cca73e875c6074a9664c49c.1370236013.git.peter.crosthwaite@xilinx.com>
	<51B5EE24.5010400@msgid.tls.msk.ru>
	<51B5F0D3.2030504@msgid.tls.msk.ru>
Date: Tue, 11 Jun 2013 08:24:41 +1000
X-Google-Sender-Auth: EVl9hKr5g1V30sQuOy0ZK4Zxg6U
Message-ID: <CAEgOgz6w=VAtksHf5M_rLfSA8dj86UzfdzDfq2t3crNfaCETZg@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Gm-Message-State: ALoCoQmSJWesbjuh/6lr+1AqKhJ2GtMgHW+KMV/G3Wo0vnjUV2V/C/CvmTcRW7dlgF5eu8UOpNcI
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4008:c01::22c
Cc: qemu-trivial@nongnu.org, edgar.iglesias@gmail.com, aliguori@us.ibm.com,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v1 1/3] char/serial:
	cosmetic fixes.
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
X-List-Received-Date: Mon, 10 Jun 2013 22:24:54 -0000

Hi Michael,

On Tue, Jun 11, 2013 at 1:29 AM, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 10.06.2013 19:17, Michael Tokarev =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> 03.06.2013 09:12, peter.crosthwaite@xilinx.com wrote:
>>> From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
>>>
>>> Some cosmetic fixes to char/serial fixing some checkpatch errors.
>>
>> These are all cosmetic fixes indeed.  I weren't sure we're
>> applying stylistic changes by its own.  But apparently
>> people don't object so I don't see why not, either, except
>> that I don't really want to open a can of worms with other
>> stylistic patches to come ;)
>>
>> Applied all 3 to the trivial patches queue.
>
> Actually I didn't apply these.  Since patch 2/3 weren't sent to
> -trivial, and 3/3 does not apply without it, I'm not sure I want
> to apply either of these.  Maybe all 3 should be sent to the same
> tree?  Should I pick the 2/3 too, which wasn't submitted to
> -trivial?
>

Im happy for you to take all three as they have had a week of list
time and 2/3 is cleanup only with no functional change. It's
borderline as to whether its trivial.

Regards,
Peter

> Thank you!
>
> /mjt
>
>

