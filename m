Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d8SlE-0006F4-1I
	for mharc-qemu-trivial@gnu.org; Wed, 10 May 2017 10:38:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d8SlB-0006DJ-Sn
	for qemu-trivial@nongnu.org; Wed, 10 May 2017 10:38:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d8SlB-0004s9-2M
	for qemu-trivial@nongnu.org; Wed, 10 May 2017 10:38:37 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:35238)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d8Sl6-0004pH-3Q; Wed, 10 May 2017 10:38:32 -0400
Received: by mail-qk0-x241.google.com with SMTP id k74so5183905qke.2;
	Wed, 10 May 2017 07:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=252hIB/cvnf9cpGD9j9K5PkbMsGYR8SWsbYdTIrzhY8=;
	b=YbQXtfDCYhiWJKQlu7+FPv8qAdlct4XsGS8NkkftT//kCmUixIPpd6DC42oKdHffOR
	YO2NRPSvVRm454ceII05LsSErtEmKGojtuBJ+I1VIgN7qUcTrjsU61ReH1V99Bv6VRGE
	7SUPzeQq0CUc0O0p3a6OMSTsr8Vj1iMIldtZCvrbupN7T9LSCJKV9sXlGGa/dsvPRnxF
	q3VBQBIpYx6sbk4FH5t4tIwPl9pA06QaLKFprfi3aCDZ3iuSWepDYA6P6FqTzhypWRoB
	gY8wH7tlCEQrYWj//eqLLkjM6nR/ObsX9Oi+wFu/SSJpjLR9k/LTRoLo4875aNMyaxkz
	ILoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=252hIB/cvnf9cpGD9j9K5PkbMsGYR8SWsbYdTIrzhY8=;
	b=pbtnj+zHP2UPEHdNeMO5KCtU8gIwixmhBc2I7Tdyo8G/JKhX8IXp4TX0cGgGPhSGEO
	3vWIfXJcRLlO6y+UDiP47s/RgI9uPArz1pqTae06Wv+QjzZ5U+GbqKv/TGcJcedPxBCv
	zfqZ+1cVnli6PbU7Wk6Mlj/+gypWQ9Q+4sDAukovgmWA6qGjs79WbpFNQUB8vktXQU9/
	4naNe+NyvQLOqSGZe9sv6Ijjr7OQC74HuPaG8vJ2MLTPTqBMquMe7trNjakVI7nZEGIE
	umByowJSMVps5rrPGF2D4YacmrMy2GIhObFg+QmCYvOQaOef1OkPUSmWG/JKgSwvaIWD
	B/aQ==
X-Gm-Message-State: AODbwcBYW+Imc85h2Rh9AUObmOpNIiYoXxmxXPYAQxmCmwMlH4Kdblnp
	0D1ZD9J/+wrXHw==
X-Received: by 10.55.75.71 with SMTP id y68mr5578256qka.53.1494427111398;
	Wed, 10 May 2017 07:38:31 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	c21sm2277340qtd.60.2017.05.10.07.38.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 May 2017 07:38:30 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Laurent Vivier <lvivier@redhat.com>, Riku Voipio <riku.voipio@iki.fi>
References: <20170506004106.3291-1-f4bug@amsat.org>
	<7f51d88d-0dea-5d64-7c6d-530365e29923@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f7193a8d-0086-d61c-b214-76c7f204d062@amsat.org>
Date: Wed, 10 May 2017 11:38:28 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <7f51d88d-0dea-5d64-7c6d-530365e29923@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] syscall: fix compiler
 warnings (clang 5)
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
X-List-Received-Date: Wed, 10 May 2017 14:38:38 -0000

On 05/10/2017 09:32 AM, Laurent Vivier wrote:
> On 06/05/2017 02:41, Philippe Mathieu-Daudé wrote:
>> static code analyzer complain:
>>
>> linux-user/syscall.c:5575:9: warning: Dereference of undefined pointer value
>>     if (*host_rt_dev_ptr != 0) {
>>         ^~~~~~~~~~~~~~~~
>>
>> Reported-by: Clang Static Analyzer
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  linux-user/syscall.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index cec8428589..c541e22693 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -5526,7 +5526,7 @@ static abi_long do_ioctl_rt(const IOCTLEntry *ie, uint8_t *buf_temp,
>>      int target_size;
>>      void *argptr;
>>      abi_ulong *target_rt_dev_ptr;
>> -    unsigned long *host_rt_dev_ptr;
>> +    unsigned long *host_rt_dev_ptr = NULL;
>>      abi_long ret;
>>      int i;
>>
>> @@ -5572,7 +5572,7 @@ static abi_long do_ioctl_rt(const IOCTLEntry *ie, uint8_t *buf_temp,
>>      unlock_user(argptr, arg, 0);
>>
>>      ret = get_errno(safe_ioctl(fd, ie->host_cmd, buf_temp));
>
> I think we should "assert(host_rt_dev_ptr)" here. It's a bug if
> host_rt_dev_ptr is not set.
>
> The "for" loop scans the structure to find the rt_dev field, and we
> should always enter in the first "if", so "host_rt_dev_ptr" is always set.

It's better indeed, I'll use g_assert_nonnull() and resend.

Thanks!

>
>> -    if (*host_rt_dev_ptr != 0) {
>> +    if (host_rt_dev_ptr != NULL && *host_rt_dev_ptr != 0) {
>>          unlock_user((void *)*host_rt_dev_ptr,
>>                      *target_rt_dev_ptr, 0);
>>      }
>>
>
> Laurent
>

