Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwYPb-0006JF-3Y
	for mharc-qemu-trivial@gnu.org; Wed, 01 Aug 2012 08:52:27 -0400
Received: from eggs.gnu.org ([208.118.235.92]:45979)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SwYPT-00063p-3C
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 08:52:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SwYPN-000796-N7
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 08:52:19 -0400
Received: from mail-yw0-f45.google.com ([209.85.213.45]:62985)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1SwYPN-00078q-Ik
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 08:52:13 -0400
Received: by yhpp34 with SMTP id p34so6992757yhp.4
	for <qemu-trivial@nongnu.org>; Wed, 01 Aug 2012 05:52:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=78rcPMkJzwEydWe4owRQvAoR019zcDygqGNTbH6zbP0=;
	b=gmyrI+S65IsgEd+JnHQkG4LU8nDpZ3X7xwagOKTxj8a7GHNkxi4sWMkydnndqVquy1
	ooTYwpOU2FcZeD61JMaAVNvGX0Nruxq4cHILKxzuOWP9/8+IzAGs6eRlAgwiJPXFZWyx
	2NFDeo2HPZkv9k9GgKh2go2Gl+DoOQOPjnJsnLOtYsD6k+WFeATidP8hjV1ffxyw0C/S
	Ii8+VD5L4xxa3hKI8xoRlgKogUQ9Q+DZuRVvZQB4YRKcnfd+IsYx517yrO8Nk4xUcRQl
	oawRy1gPVaEsuh9L4xLBUipdZBW+OEwWVdgvho217P7wtY0B5gIiilhJ1bzmGvzSTAxd
	EjaA==
MIME-Version: 1.0
Received: by 10.50.17.193 with SMTP id q1mr3922189igd.33.1343825532601; Wed,
	01 Aug 2012 05:52:12 -0700 (PDT)
Received: by 10.50.237.41 with HTTP; Wed, 1 Aug 2012 05:52:12 -0700 (PDT)
In-Reply-To: <20120801104212.GB17816@stefanha-thinkpad.localdomain>
References: <1343256304-32029-1-git-send-email-tylerwhall@gmail.com>
	<20120801104212.GB17816@stefanha-thinkpad.localdomain>
Date: Wed, 1 Aug 2012 13:52:12 +0100
Message-ID: <CAFEAcA-BD2eX0t0nt-iZbCvW5XMb0YjTNp8NtQhwGvcBHgAn+Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQmFCgF9nZkwOIy7jDnNsRkuSa0Zm8fTsoiP48NpmKXpJXMVeSZoVrhcPMkaNpM0Gw6iyqM5
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.213.45
Cc: qemu-trivial@nongnu.org, Avi Kivity <avi@redhat.com>, qemu-devel@nongnu.org,
	Tyler Hall <tylerwhall@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] exec.c: Fix off-by-one
 error in register_subpage
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
X-List-Received-Date: Wed, 01 Aug 2012 12:52:25 -0000

On 1 August 2012 11:42, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Wed, Jul 25, 2012 at 06:45:03PM -0400, Tyler Hall wrote:
>> subpage_register() expects "end" to be the last byte in the mapping.
>> Registering a non-page-aligned memory region that extends up to or
>> beyond a page boundary causes subpage_register() to silently fail
>> through the (end >= PAGE_SIZE) check.
>>
>> This bug does not cause noticeable problems for mappings that do not
>> extend to a page boundary, though they do register an extra byte.
>>
>> Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
>> ---
>>  exec.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/exec.c b/exec.c
>> index feb4795..27b100c 100644
>> --- a/exec.c
>> +++ b/exec.c
>> @@ -2271,7 +2271,7 @@ static void register_subpage(MemoryRegionSection *section)
>>          subpage = container_of(existing->mr, subpage_t, iomem);
>>      }
>>      start = section->offset_within_address_space & ~TARGET_PAGE_MASK;
>> -    end = start + section->size;
>> +    end = start + section->size - 1;
>>      subpage_register(subpage, start, end, phys_section_add(section));
>>  }
>
> I would really like to see an Acked-by: or Signed-off-by: from Avi or
> someone else who is familiar with the memory regions code.  Especially
> for Patch 2/2.

I think this patch is OK (compare the subpage_register() call in
subpage_init(), the guards in subpage_register(), etc), so

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

though I dunno that I'd claim to be familiar with the memory region
code ;-)

2/2 is definitely not a trivial patch, though -- it's trying to fix
a long standing deficiency in qemu's mmio region handling. I gave 2/2
a quick test and it seems to pass the right offset through to the
read/write handlers, but Avi should definitely review it...

On a related note, the comment above register_subpage which includes
remarks about how this special case doesn't work seems to now be
rather out of date since it's still talking about function parameter
names which no longer exist.

-- PMM

