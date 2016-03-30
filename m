Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1alIzU-0004tH-Aj
	for mharc-qemu-trivial@gnu.org; Wed, 30 Mar 2016 12:29:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1alIzO-0004qo-Fo
	for qemu-trivial@nongnu.org; Wed, 30 Mar 2016 12:29:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1alIzN-00008d-N6
	for qemu-trivial@nongnu.org; Wed, 30 Mar 2016 12:29:02 -0400
Received: from mail-vk0-x243.google.com ([2607:f8b0:400c:c05::243]:33253)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>)
	id 1alIzN-00008M-IK; Wed, 30 Mar 2016 12:29:01 -0400
Received: by mail-vk0-x243.google.com with SMTP id a62so7523216vkh.0;
	Wed, 30 Mar 2016 09:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HCIqypHUloH6RfULV766ybcfFIsAgtHX4+SKrcsuiMc=;
	b=IQnago+22zHCoyUPqJzjL31zlRE6WErigphPC8umg4shVvf/39tW4Hgcm9PEpRxvTh
	XAAsPzUwMf7S6kaVbO8q686YgDQA5XtGplet8HwiRgKorEANatYPwS/G9kK+VU4SoQ9i
	Gf/NVkTv9xH3Zbo7lF9i/rllBb8IaibcCqvQh1mPkiPiMU+sqX/Lla1/zBeCd4V3mynF
	UjQ3t838stlEZplGCdUZDswmabneEZLSYftAA4uDvwQXGpdFSvotyyxftrOVpT25n8e2
	qZFoXURRUez8yPTMqBtoSqui1htRVgrERMgnnE21kwP32jW14VcqrP71muQD7g9CqIIO
	RESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HCIqypHUloH6RfULV766ybcfFIsAgtHX4+SKrcsuiMc=;
	b=VBYLXgqb25kAL1dOvZdMfWNthJD+682tEwr3CIWNp6fANkXbyxb20i4bPDGPyssz26
	Xlv5202wth2zcGuqFRjFNU5qTtcwmKKUGfhLLfrq/q6EBtX6AKSqE6yf+4ruG8ZyF+sG
	WhhoQbgRHbgln0rE2wxMG7tA/B0spqfoX+AJZvmNI8LVae4bN6s04YHIwmoO5LevgeWQ
	1hs8nuLC5Olho/ZBg6vO6UbsvYqsO5xoF/C8hGG7QP4DmMn7zeBqOk7tWQEq7LQHnRlz
	QwvLlxTt2H6K+1kEELgVkKZfGm/2dqmrgmcwdXVaS9BP4oqXjzzd8E9WyhoC3bHqQO0s
	BZVA==
X-Gm-Message-State: AD7BkJK8PfzHMQxzICZI5JTHuZfrYdkd2m/rXt+YKGButRioK4gP+mgXmdprNNLXaWlVa25yskkQ1hSjsqNmKg==
X-Received: by 10.176.2.86 with SMTP id 80mr5720956uas.35.1459355340875; Wed,
	30 Mar 2016 09:29:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.15.9 with HTTP; Wed, 30 Mar 2016 09:28:41 -0700 (PDT)
In-Reply-To: <20160330140955.GA2557@stefanha-x1.localdomain>
References: <1458757923-11362-1-git-send-email-haris.phnx@gmail.com>
	<20160330140955.GA2557@stefanha-x1.localdomain>
From: haris iqbal <haris.phnx@gmail.com>
Date: Wed, 30 Mar 2016 21:58:41 +0530
Message-ID: <CAE_WKMz4K1hSqwrLzgAPP2BMjokY_E6-R61R2RyRS06Pteb80w@mail.gmail.com>
To: Stefan Hajnoczi <stefanha@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::243
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [Qemu-Devel] [PATCH] Changed malloc
 to g_malloc, free to g_free in linux-user/qemu.h
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
X-List-Received-Date: Wed, 30 Mar 2016 16:29:06 -0000

On Wed, Mar 30, 2016 at 7:39 PM, Stefan Hajnoczi <stefanha@gmail.com> wrote:
> On Thu, Mar 24, 2016 at 12:02:03AM +0530, Md Haris Iqbal wrote:
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
>
> If I understand correctly either lock_user() or lock_user_string() may
> be followed by unlock_user().  If you change unlock_user() to g_free()
> then you also need to change lock_user_string() to g_malloc() to avoid a
> malloc()/g_free() mismatch.

lock_user_string() does not use malloc itself, but calls lock_user()
from itself.



-- 

With regards,

Md Haris Iqbal,
Placement Coordinator, MTech IT
NITK Surathkal,
Contact: +91 8861996962

