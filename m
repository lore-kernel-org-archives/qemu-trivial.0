Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1alGld-0002Lt-Iv
	for mharc-qemu-trivial@gnu.org; Wed, 30 Mar 2016 10:06:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38286)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1alGlW-0002Kh-Sd
	for qemu-trivial@nongnu.org; Wed, 30 Mar 2016 10:06:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1alGlV-0006zg-TH
	for qemu-trivial@nongnu.org; Wed, 30 Mar 2016 10:06:34 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:36629)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>)
	id 1alGlV-0006zW-O0; Wed, 30 Mar 2016 10:06:33 -0400
Received: by mail-vk0-x22b.google.com with SMTP id z68so62209862vkg.3;
	Wed, 30 Mar 2016 07:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=61cAMooNJ/vGPBlfyPD7stM8ojV9MMrKfIonCCmJx2I=;
	b=coMtwUvlEOPYXAbzG7S8aDFdiVcKoRABjIAX56dWZfcGVdOrNCKkxTkFIUYcIp4j8N
	H6/iL2DkodR5eHlR/QvYYF4urhKv1eg5hcUVS4qqA5+/HbHrBNWmYwDTTktJTok41vNJ
	xpgXatYijYBkLAFOz85e390MSbkvf5LIsvnneMowrGBn1YSFcCidhPCNdudOd9OKklg1
	yKUtQuN6L9MA23CjSFjsw5YtgBXCRqEgEZ7CrOWDypVT/ujMnLeTdu1NKBz1HtMX1C4Y
	uLxMkjYBWRU04nqxJx/jiYbpKwPUBUyD8FJ3QJzm+y0Iojq4cArUgQc7+lHBgKIBvmFe
	B8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=61cAMooNJ/vGPBlfyPD7stM8ojV9MMrKfIonCCmJx2I=;
	b=cbPLnRyJHa1TVp7kC7gfRhD3MQgIZMsdpu0BkPBwwAgLVXQkVu4PG8rzNy3DnMc1ne
	WlBuR5samBsk9adGXVOETX1tgzzWsI/zBhwnCOw2TTXGxTujY/X/Kh3tjq/pt9rHgmtN
	sD+BUERTtEpDgZigX2unO+eGpNSuJijRcKa4Qba82Le5tKYuKxUNg1yYT174W8I16OwQ
	SFRi0sK8yQgL1Ra29SeGkJZJ+Qno6IByRfwwM1JWQao8u5bOMLIR6RKyevGb9TDrzwhZ
	zTgg8KwFA/Yv/HfP1EJJqJTyXZmg4S8gOi0RXO7EzHUiqfjJTkZIQRkYAndP6njSy8B9
	zxJA==
X-Gm-Message-State: AD7BkJJkHUGcGqOfLfmQ6UXXMD6o+4+sqmoVRV+/GcySbpToaT9XtXGb5Z8/46LZUxDPzZ5wgViTAEUvbF+Ipg==
X-Received: by 10.31.1.7 with SMTP id 7mr4639589vkb.114.1459346793294; Wed, 30
	Mar 2016 07:06:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.15.9 with HTTP; Wed, 30 Mar 2016 07:06:13 -0700 (PDT)
In-Reply-To: <CAE_WKMz=hYrtZpVrh-RjHmEXu5iCzTczXnh6ANVm4Uw9Xfn6kg@mail.gmail.com>
References: <1458757923-11362-1-git-send-email-haris.phnx@gmail.com>
	<CAE_WKMz=hYrtZpVrh-RjHmEXu5iCzTczXnh6ANVm4Uw9Xfn6kg@mail.gmail.com>
From: haris iqbal <haris.phnx@gmail.com>
Date: Wed, 30 Mar 2016 19:36:13 +0530
Message-ID: <CAE_WKMypvdMDZgi=7eo9fOTOJJfK9=j5u4JH-RTCqFGgFApUnw@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-Devel] [PATCH] Changed malloc to g_malloc,
 free to g_free in linux-user/qemu.h
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
X-List-Received-Date: Wed, 30 Mar 2016 14:06:40 -0000

Hi,

Patch is attached in the previous mail. Looking forward to your review.

On Tue, Mar 29, 2016 at 9:23 PM, haris iqbal <haris.phnx@gmail.com> wrote:
> Hi,
>
> Can I get a respond for this patch. Is it complete, or did I miss something?
>
>
> On Thu, Mar 24, 2016 at 12:02 AM, Md Haris Iqbal <haris.phnx@gmail.com> wrote:
>> Signed-off-by: Md Haris Iqbal <haris.phnx@gmail.com>
>> ---
>>  linux-user/qemu.h | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
>> index 26b0ba2..3c3fd15 100644
>> --- a/linux-user/qemu.h
>> +++ b/linux-user/qemu.h
>> @@ -381,7 +381,7 @@ static inline void *lock_user(int type, abi_ulong guest_addr, long len, int copy
>>  #ifdef DEBUG_REMAP
>>      {
>>          void *addr;
>> -        addr = malloc(len);
>> +        addr = g_malloc(len);
>>          if (copy)
>>              memcpy(addr, g2h(guest_addr), len);
>>          else
>> @@ -407,7 +407,7 @@ static inline void unlock_user(void *host_ptr, abi_ulong guest_addr,
>>          return;
>>      if (len > 0)
>>          memcpy(g2h(guest_addr), host_ptr, len);
>> -    free(host_ptr);
>> +    g_free(host_ptr);
>>  #endif
>>  }
>>
>> --
>> 1.9.1
>>
>
>
>
> --
>
> With regards,
>
> Md Haris Iqbal,
> Placement Coordinator, MTech IT
> NITK Surathkal,
> Contact: +91 8861996962



-- 

With regards,

Md Haris Iqbal,
Placement Coordinator, MTech IT
NITK Surathkal,
Contact: +91 8861996962

