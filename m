Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UZOUi-00031s-SF
	for mharc-qemu-trivial@gnu.org; Mon, 06 May 2013 12:42:32 -0400
Received: from eggs.gnu.org ([208.118.235.92]:58675)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UZOUf-00030U-Dt
	for qemu-trivial@nongnu.org; Mon, 06 May 2013 12:42:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UZOUe-0003ov-Eo
	for qemu-trivial@nongnu.org; Mon, 06 May 2013 12:42:29 -0400
Received: from mail-la0-x231.google.com ([2a00:1450:4010:c03::231]:63500)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UZOUe-0003nk-6r
	for qemu-trivial@nongnu.org; Mon, 06 May 2013 12:42:28 -0400
Received: by mail-la0-f49.google.com with SMTP id eh20so3446990lab.22
	for <qemu-trivial@nongnu.org>; Mon, 06 May 2013 09:42:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=jB1VkCRNeVC5NSgCrgskUnBcmedXgcel+FiRTWwR9yc=;
	b=YAarBFTcp2IpV2z01m1arkU+ZkQs672b0FCIM+tdpZRgiE9XHaqlBLNat/QmqAb0eK
	KjJXP8ndcsJheo8F8TamZ7DsQrzETOBv/xeQsUPSfPnDz4cWP06+R2NWAusAQjfY1bqq
	EutLZ/RJFdXiedjAcrBPIGKMJjqZtuqdlf9XXW2vroeJun+6IZe/qAR2m+ndYmRC58ab
	/Mhp/rOdD2cDya0A2uVu1oHKjhPiVrRhKBxSN80yuMOi4QrJSfXYAoKlR8pkRT0Mvimu
	jH4Yw/AvxrCSaG498DQU5yATtvUBubeGJ0JKWuw5rjKEW113fXGyOBf009AAZjEwzTji
	wx7g==
X-Received: by 10.112.167.168 with SMTP id zp8mr8210410lbb.58.1367858546957;
	Mon, 06 May 2013 09:42:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.156.193 with HTTP; Mon, 6 May 2013 09:42:06 -0700 (PDT)
In-Reply-To: <5187D9A6.6050807@redhat.com>
References: <5187D529.7010502@siemens.com> <5187D9A6.6050807@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 May 2013 17:42:06 +0100
Message-ID: <CAFEAcA_SNzor4A0bOzi3qgB2AcVcYMAK7SfkvxAO+SZTq4hDew@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQnyyjiqVBhWYi5Dg5qdb7nCN1e9dt7wf51rG6jdvDypWkwzV8Wx7bgEb513rpQXiMr6TsOk
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c03::231
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Jan Kiszka <jan.kiszka@siemens.com>,
	qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] memory: Replace open-coded
	memory_region_is_romd
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
X-List-Received-Date: Mon, 06 May 2013 16:42:31 -0000

On 6 May 2013 17:26, Paolo Bonzini <pbonzini@redhat.com> wrote:
> Il 06/05/2013 18:07, Jan Kiszka ha scritto:
>> Improves readability.
>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>> ---
>>  translate-all.c |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/translate-all.c b/translate-all.c
>> index da93608..0d84b0d 100644
>> --- a/translate-all.c
>> +++ b/translate-all.c
>> @@ -1359,7 +1359,7 @@ void tb_invalidate_phys_addr(hwaddr addr)
>>      section = phys_page_find(address_space_memory.dispatch,
>>                               addr >> TARGET_PAGE_BITS);
>>      if (!(memory_region_is_ram(section->mr)
>> -          || (section->mr->rom_device && section->mr->readable))) {
>> +          || memory_region_is_romd(section->mr))) {
>>          return;
>>      }
>>      ram_addr = (memory_region_get_ram_addr(section->mr) & TARGET_PAGE_MASK)
>>
>
> Not trivial enough for qemu-trivial, let's open a memory branch for 1.6.

Well, I wouldn't necessarily put it in 1.5 this close to
hardfreeze, but it looks fine for qemu-trivial to me.
In particular you can comprehend the patch and confirm its
correctness without having to have any larger understanding
of the memory system.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

