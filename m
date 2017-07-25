Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZsUH-0005bO-TR
	for mharc-qemu-trivial@gnu.org; Tue, 25 Jul 2017 01:34:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50229)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZsUG-0005aS-5z
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 01:34:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZsUD-0001aP-2e
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 01:34:28 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:36794)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZsUC-0001Zn-Tt; Tue, 25 Jul 2017 01:34:25 -0400
Received: by mail-qt0-x243.google.com with SMTP id l55so14006199qtl.3;
	Mon, 24 Jul 2017 22:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=aufwn4qrHNowZLOI9jBbqWz0a6QXa1MEPxyasb1qKlc=;
	b=iDG+kKD+oYbEkcrrwvbdWCgoAXPkW17cWg+T6p6za2oF/7UVgeMRhwcIrlUwXjTrfT
	CwzbBrNDeP53l2ClBRNfIDiXDQg9ujq5kHwXaa9WHbceHcqGPmlevjnXDhD/RjVffgvg
	9RRGbzu1wMesb1C+k3e8lfN8Ofg/T8V4FmOayuYbsJvUzv1bqRhPhd0UJT2cw8bvIoua
	uOd/Fmn21NJw94f/YHrfV8kCL3tuq35yaLLSpf8ej99D51N4wKQL9AEKEju42IwuXasD
	H6wAiy43EGpFMBreQoWX4qUEyKLFq29SXPuKD3sSyiBG2DJu6F45K+mcIOaDvdiDsLkT
	QmMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=aufwn4qrHNowZLOI9jBbqWz0a6QXa1MEPxyasb1qKlc=;
	b=tG4ZJ7oHx+DNGvf1FjP4IkBbCZYoa4Cy2CmSkoTqd5pgVk+Ll+/WYkt40WO9dxUm6p
	uTKUtdKUAIMi4IYER/RgOIVW08DVsqejcCh6CJxwGx38znJy/aAWk0pFR49BQvuQ1cya
	SCM2eTp7rRsPqXuTbH2apkGPbAf+tE//log+glP2QsGUb6dD4St1K9xLaZ9XYbSWwaOa
	tGNFNlIp49U7PNP9nPQtjjYiHTpt9Kqjrwf4835toVE7UqlK5exd0Q7+W1QjqSkWXg9e
	PT599DZ85xspur6KHwNPyTD6Mg+cDN86o3hUR5yOKeIzyn1DSBUJW1e/8YCFSjbgMn4S
	Z9jg==
X-Gm-Message-State: AIVw111U7BShll5jko3TLzlaI5ujNTr/WOCI5RHm02yyyxh4+HfEOlSC
	MmDEn93cjKNCt9cyIVtvWQ==
X-Received: by 10.200.2.172 with SMTP id p44mr12709825qtg.46.1500960864184;
	Mon, 24 Jul 2017 22:34:24 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id a27sm2480197qta.1.2017.07.24.22.34.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 22:34:23 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-28-f4bug@amsat.org>
	<9ed15cf4-3b4b-2d67-7278-feb5503bd9f6@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f1f686ac-ae94-500c-1401-de7ab44b666c@amsat.org>
Date: Tue, 25 Jul 2017 02:34:20 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <9ed15cf4-3b4b-2d67-7278-feb5503bd9f6@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-trivial] [PATCH for 2.10 27/35] syscall: fix dereference
 of undefined pointer
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
X-List-Received-Date: Tue, 25 Jul 2017 05:34:29 -0000

On 07/24/2017 04:33 PM, Laurent Vivier wrote:
> Le 24/07/2017 à 20:27, Philippe Mathieu-Daudé a écrit :
>> Clang's scan-build-5.0 reports:
>>
>> linux-user/syscall.c:5581:9: warning: Dereference of undefined pointer value
>>      if (*host_rt_dev_ptr != 0) {
>>          ^~~~~~~~~~~~~~~~
>>
>> Reported-by: Clang Static Analyzer
>> Suggested-by: Laurent Vivier <lvivier@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   linux-user/syscall.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index fcd20fa276..e79b5baec4 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -5524,7 +5524,7 @@ static abi_long do_ioctl_rt(const IOCTLEntry *ie, uint8_t *buf_temp,
>>       int target_size;
>>       void *argptr;
>>       abi_ulong *target_rt_dev_ptr;
>> -    unsigned long *host_rt_dev_ptr;
>> +    unsigned long *host_rt_dev_ptr = NULL;
>>       abi_long ret;
>>       int i;
>>   
>> @@ -5570,6 +5570,7 @@ static abi_long do_ioctl_rt(const IOCTLEntry *ie, uint8_t *buf_temp,
>>       unlock_user(argptr, arg, 0);
>>   
>>       ret = get_errno(safe_ioctl(fd, ie->host_cmd, buf_temp));
>> +    assert(host_rt_dev_ptr);
>>       if (*host_rt_dev_ptr != 0) {
>>           unlock_user((void *)*host_rt_dev_ptr,
>>                       *target_rt_dev_ptr, 0);
>>
> 
> I think if you add the assert you should not have to add the "= NULL".
> Could you check?

Indeed!

Thanks :)

Phil.

