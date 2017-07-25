Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZuEQ-0005l5-II
	for mharc-qemu-trivial@gnu.org; Tue, 25 Jul 2017 03:26:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40012)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1dZuEO-0005kw-8K
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 03:26:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1dZuEK-00065o-71
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 03:26:12 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:56820)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1dZuEJ-00065K-SK; Tue, 25 Jul 2017 03:26:08 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue104 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0LvAna-1dhueH3WpW-010MiG; Tue, 25 Jul 2017 09:25:48 +0200
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>, QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-28-f4bug@amsat.org>
	<CAFEAcA86cuTukJ4HXVKDjewpxy2myPU1Gdbn671zqxJq6d09Wg@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <069e3f18-317e-49d7-263f-206d5c21a755@vivier.eu>
Date: Tue, 25 Jul 2017 09:25:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA86cuTukJ4HXVKDjewpxy2myPU1Gdbn671zqxJq6d09Wg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:L3xZLhbocsLVLV891HWWeFOb8G/Xw0/LvgWHDE33pBCVfInZdjj
	0BCS7gUs1Xw6RR7K/40yjIlHwSOr9dEC+V0NsQbgToyyX/lsK0oOngYod7O7T6FyzNieCZ0
	2HtzH90tHYzYM0WGgkT+aph4RUhPB7eihLoiSQYS8JvaX7r96KBTMFiHBpzeYf3I67BWRQw
	wQTLkgnvWROZucWKue/1A==
X-UI-Out-Filterresults: notjunk:1;V01:K0:SaEEiHF1rLA=:YnCELDcYH4ajozVB9aXMrB
	My/EI3qsa5TlnuTUuDdeE9FIqWXuRgnBPCgUEGaeemdiUdTFIseWDHSJB47q4phC/H8BRSZoy
	1aNxuMPgMbDcDZWQO8DrDvn5W2XTe40DxHcAWtDNAYoUfTESKtxb4f91BP1yhMe4xN7r5vCcM
	IHl+WvjNXuKsXC6NkzEu936EN3d/x8vfYCnGLQRzRXedXtZXIvJxzdwQIUOu0Q++A2+qdqDam
	EmjVGO1jWxKD62FfTHj4WxPR42smrYjl4hUgTS6+sGS5VVxtXRyEVOmaT96uL4QkDrHPDNLNi
	UhcXLpX3UKZEns62/Jld8PsQuZQJhTj6T0pvNnaqc5LUXGlUKCNVu62PEVsbSh88bA2mUGWGZ
	G9XgtzV2Pb82hZAdl9mS5hiarrLw4oXVtmQuFSe8pVcNZMHhynL0BT4l9gRLg6ZLwx22oq32E
	Bdf9a0B/Kqj4iL/fIIbXKjMhWixaP3b01tmvRCTbaGaL6gV7cS6ee2uKJJ+Syf0u7P6YVwxVS
	4OEZ9Ug/0teVIjIa/QiTVCMQlTFaHQd2618fcBmOseWUYe+9l+AKAjoG8cnK7e3PSGEsAo2zJ
	MbWJNF1AFgj+sKQ+p378dxokiHlZLWAvJbV8S5OZ0HSS9ijbmJo2CnXTzzAwUPnYJ6SGy8gdb
	1MGM1YoenVdTQhR10M7z0WVHBUHIJO08vZzlFrLVB/CGSXjkevWYsmcI0DpjIFHPN39B6WNbh
	YAIz7vL1nWFhwSSh39BWrztHZq7DRc8Tzw7QLpqwcmHS/zhnOqeZ4pf/Jgw=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.72.192.74
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for 2.10 27/35] syscall: fix
 dereference of undefined pointer
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
X-List-Received-Date: Tue, 25 Jul 2017 07:26:13 -0000

Le 24/07/2017 à 23:26, Peter Maydell a écrit :
> On 24 July 2017 at 19:27, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Clang's scan-build-5.0 reports:
>>
>> linux-user/syscall.c:5581:9: warning: Dereference of undefined pointer value
>>     if (*host_rt_dev_ptr != 0) {
>>         ^~~~~~~~~~~~~~~~
>>
>> Reported-by: Clang Static Analyzer
>> Suggested-by: Laurent Vivier <lvivier@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  linux-user/syscall.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index fcd20fa276..e79b5baec4 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -5524,7 +5524,7 @@ static abi_long do_ioctl_rt(const IOCTLEntry *ie, uint8_t *buf_temp,
>>      int target_size;
>>      void *argptr;
>>      abi_ulong *target_rt_dev_ptr;
>> -    unsigned long *host_rt_dev_ptr;
>> +    unsigned long *host_rt_dev_ptr = NULL;
>>      abi_long ret;
>>      int i;
>>
>> @@ -5570,6 +5570,7 @@ static abi_long do_ioctl_rt(const IOCTLEntry *ie, uint8_t *buf_temp,
>>      unlock_user(argptr, arg, 0);
>>
>>      ret = get_errno(safe_ioctl(fd, ie->host_cmd, buf_temp));
>> +    assert(host_rt_dev_ptr);
> 
> There's not much point in this assert because it doesn't
> tell us anything we're not about to find out immediately
> by dereferencing the pointer...

It's just to shut off the warning.

What I said in the comment of the previous version of this patch:

I think we should "assert(host_rt_dev_ptr)" here. It's a bug if
host_rt_dev_ptr is not set.

The "for" loop scans the structure to find the rt_dev field, and we
should always enter in the first "if", so "host_rt_dev_ptr" is always set.

Thanks,
Laurent

