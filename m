Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cwbTl-0000Tg-FJ
	for mharc-qemu-trivial@gnu.org; Fri, 07 Apr 2017 17:31:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59002)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cwbTj-0000SA-2i
	for qemu-trivial@nongnu.org; Fri, 07 Apr 2017 17:31:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cwbTi-0006BB-7I
	for qemu-trivial@nongnu.org; Fri, 07 Apr 2017 17:31:35 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:35416)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cwbTd-00068D-HL; Fri, 07 Apr 2017 17:31:29 -0400
Received: by mail-qt0-x241.google.com with SMTP id r5so11449485qtb.2;
	Fri, 07 Apr 2017 14:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=Hx/9vHR1BM2oB/j0gS9ZcC60bowo+7jyb96wm0f3/nE=;
	b=brBp72vDkC2zN8BRB0yTjCNEo/+zAZE/J7C3QTpRT1MR5ymQdyBHBxmjztaA2crzcc
	pc8w1NFY3+kSHrBEDkAYEkb+8GV4gwcFrVVFt7mh55ZCwRrB6yP7W35VrHwexEIeUxEz
	6blvWCpCqOeDuMQchEPYeb2iFAUlkT0ffGzgzMCRQbdRrQvFu2hvAGX5oPJxtgNnkxmX
	y+AVVW0XJa8U630t0//kE1QFEMNGcikEz9+6X0BL4iQwHwKOeVW4w1hyGmtuGQ+ryJo/
	pXIphgif5nB/mUPLMmUkflY6yUFlUyT3yce/BJ6N4M6eT7IPpRIfCbIk3708ll6eYLYQ
	Y3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Hx/9vHR1BM2oB/j0gS9ZcC60bowo+7jyb96wm0f3/nE=;
	b=nvIAU3megRo4xAVF0zWHC4bfrJ1XPcqoBwmq/tsCqgYVGGYoFFZ+GRvh4aMjaRgQDG
	K+i8yckT1Ecb/2Qd+ZEf7k+IAL0cuhaIGTOlRJVnl61+H7hiJ0dsrFI11azHVZq9nTUt
	8IFWRqZP8dUK+qROu+KccZakJIxT8GL6jVJO/1oLAHY+pCR6lvYZcwAtP7hjhrvBr3Ty
	B5pJbSRYUw7PkowP2VF2fUdOhyD8GPyoDo3+ZjxRj8L3bDW5ow6D+1RaE+O+/xUSc1E4
	zReM55ijDBZ2WD0FM784DJCvWQ0KYRso7Y2W89UdaPMy+xuNjgx+GBAZuCOhp1fNqJkM
	NXdQ==
X-Gm-Message-State: AFeK/H3DOZ19Zl9TCMwZMFTerSoHF6Xlwe8Taiakn4/DceXGy4Lr40/eu94LnhQjAppR5g==
X-Received: by 10.200.53.99 with SMTP id z32mr47865242qtb.106.1491600688743;
	Fri, 07 Apr 2017 14:31:28 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	x19sm3847969qtc.23.2017.04.07.14.31.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Apr 2017 14:31:28 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Michael Roth <mdroth@linux.vnet.ibm.com>
References: <20170322204844.446-1-f4bug@amsat.org>
	<20170322204844.446-4-f4bug@amsat.org>
	<149021773050.3910.449421368071627004@loki>
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Alexander Graf <agraf@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d3bdae1a-2a7d-57d2-bf3c-80b05130e530@amsat.org>
Date: Fri, 7 Apr 2017 18:31:24 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <149021773050.3910.449421368071627004@loki>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH RESEND 3/3] qga: fix
 compiler warnings (clang 5)
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
X-List-Received-Date: Fri, 07 Apr 2017 21:31:36 -0000

Hi Michael,

On 03/22/2017 06:22 PM, Michael Roth wrote:
> Quoting Philippe Mathieu-Daudé (2017-03-22 15:48:44)
>> static code analyzer complain:
>>
>> qga/commands-posix.c:2127:9: warning: Null pointer passed as an argument to a 'nonnull' parameter
>>         closedir(dp);
>>         ^~~~~~~~~~~~
>>
>> Reported-by: Clang Static Analyzer
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>> ---
>>  qga/commands-posix.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
>> index 73d93eb5ce..8028141534 100644
>> --- a/qga/commands-posix.c
>> +++ b/qga/commands-posix.c
>> @@ -2122,9 +2122,11 @@ static void transfer_memory_block(GuestMemoryBlock *mem_blk, bool sys2memblk,
>>           * we think this VM does not support online/offline memory block,
>>           * any other solution?
>>           */
>> -        if (!dp && errno == ENOENT) {
>> -            result->response =
>> -                GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_NOT_SUPPORTED;
>> +        if (!dp) {
>> +            if (errno == ENOENT) {
>> +                result->response =
>> +                    GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_NOT_SUPPORTED;
>> +            }
>>              goto out1;
>>          }
>
> I think this should be:
>
>     if (!dp) {
>         if (errno == ENOENT) {
>             result->response =
>                 GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_NOT_SUPPORTED;
>         } else {
>             result->response =
>                 GUEST_MEMORY_BLOCK_RESPONSE_TYPE_OPERATION_FAILED;
>         }
>         goto out1;
>     }
>
> otherwise we might set result->error_code while still indicating
> success for the operation. That wasn't handled properly before your
> patch either, it's just more apparent now.

Indeed, I'll resend it in 2 patches It seems easier to me to understand.

>
>>          closedir(dp);
>> --
>> 2.11.0
>>
>
>

