Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bIiLY-0004AB-2E
	for mharc-qemu-trivial@gnu.org; Thu, 30 Jun 2016 16:14:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1bIiLW-00048L-Aw
	for qemu-trivial@nongnu.org; Thu, 30 Jun 2016 16:13:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1bIiLU-00073m-8k
	for qemu-trivial@nongnu.org; Thu, 30 Jun 2016 16:13:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52560)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1bIiLN-00072G-OT; Thu, 30 Jun 2016 16:13:49 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4208E7F6A6;
	Thu, 30 Jun 2016 20:13:49 +0000 (UTC)
Received: from scv.usersys.redhat.com (unused [10.10.51.239] (may be forged))
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u5UKDl6R025589; Thu, 30 Jun 2016 16:13:48 -0400
To: Peter Maydell <peter.maydell@linaro.org>
References: <1467315396-3628-1-git-send-email-jsnow@redhat.com>
	<CAFEAcA-mbSO_3OcUma98qFsnsc-tPtOot0GizFNq6+5sSPyftw@mail.gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <39d39e44-7590-857c-e487-eea148b4b5a3@redhat.com>
Date: Thu, 30 Jun 2016 16:13:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-mbSO_3OcUma98qFsnsc-tPtOot0GizFNq6+5sSPyftw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 30 Jun 2016 20:13:49 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] Remove left shifts of negative signed
 integers
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
X-List-Received-Date: Thu, 30 Jun 2016 20:13:59 -0000



On 06/30/2016 04:11 PM, Peter Maydell wrote:
> On 30 June 2016 at 20:36, John Snow <jsnow@redhat.com> wrote:
>> Another exercise in placating Clang's increasingly strict -Werror mode.
>> Technically, this is undefined behavior. In practice, -N<<M is the same
>> as -(N<<M).
>>
>> Signed-off-by: John Snow <jsnow@redhat.com>
>> ---
>>  hw/audio/fmopl.c      | 2 +-
>>  target-i386/monitor.c | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/audio/fmopl.c b/hw/audio/fmopl.c
>> index 731110f..de9338b 100644
>> --- a/hw/audio/fmopl.c
>> +++ b/hw/audio/fmopl.c
>> @@ -69,7 +69,7 @@ static int opl_dbg_maxchip,opl_dbg_chip;
>>  /* final output shift , limit minimum and maximum */
>>  #define OPL_OUTSB   (TL_BITS+3-16)             /* OPL output final shift 16bit */
>>  #define OPL_MAXOUT (0x7fff<<OPL_OUTSB)
>> -#define OPL_MINOUT (-0x8000<<OPL_OUTSB)
>> +#define OPL_MINOUT (-(0x8000<<OPL_OUTSB))
> 
> We have been down this path before:
> http://patchwork.ozlabs.org/patch/545238/
> 
> Paolo will doubtless be along with the rant shortly.
> 
> -- PMM
> 

I figured, so I CC'd him. Nobody can say I didn't try.

--js

