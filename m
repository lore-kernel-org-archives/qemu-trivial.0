Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gkBib-0000yN-0O
	for mharc-qemu-trivial@gnu.org; Thu, 17 Jan 2019 12:44:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45549)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gkBiZ-0000wu-1s
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2019 12:44:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gkBiR-0000Wk-FO
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2019 12:44:37 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:32915)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gkBiG-0000Gt-3Y; Thu, 17 Jan 2019 12:44:20 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1MVv4X-1gcnIQ0uQv-00RoGy; Thu, 17 Jan 2019 18:44:15 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190111155555.8270-1-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <03f668ac-821b-7179-78e7-ce8c921d3dc0@vivier.eu>
Date: Thu, 17 Jan 2019 18:44:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190111155555.8270-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Mvn9OcU4iBb5ocAH/YSAyP4XMqfvYt9BNnUZR1fVGItpHYOVkcy
	To3k8rCieaHx6tRw/NADnWV9VEpH9c7UcbL+UA3qqVgBC0td0rYnZuxHyIy3rzzyb3ZfLwa
	qYBxnK/Xrnuucz7a/rQEftfuq53Kaz8iP+zHy5gMrkicXbhPt8TaSVc8g7XtlgyJa4RZO+0
	HNx0uY2Ns2lGnnE+5an1g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SiWyrPQQ9ik=:x597EOh//dynExQlBufA10
	uOyAcpsJw7T6jxxwlsaNYAxIJ3V3ReOXtthle6hvhOGymvpLQni7p+SjktRyEfFUKmdo9VH//
	EQhEOx9kQmzQo0Pbk44yX59JvGFwwSBEBdqGPmVVmcGd0jjskeSOzt5A0PPNJlUoKe0lpKmtb
	vGD5JzZv0ga+o8GMX7DtWCgkO5PIUJTldHOJUd4COiqOPRaobVFiuwyijL8Whg0ALgcWp12jn
	2MpA0zHsZ8/LEbMuN+hL/BsskV9smWbV32unlZ499Bv6M4M3/0+2yUOEmVl5/0D/RbIO2CkC5
	HJxQgNWlQMsWetHTeUiaW2Ieu3F06pdnO8Vk3vU4w7GOOFd6+hEqSgHVDMyzQMdXlSMYyvivv
	unE614wFXDc20oP57vvc36x3egN7zkiAsD2yL6ufZYxvJN2fuBDiEGGBs9aaXbfaPY4DNWfTW
	B0Z7raMQUK2emnOZVVB9XnKqCh6AFJeRkHiXnCbNzPjiz1nLL5Hg6SDPvBbAN5Tnc0X/bSftz
	xAVAb1SfQvBlKEth75atFyfqft8yyAgspZAcfQALIEWklsdL1WEY4TgaUe6LfZEnRA7Pclovl
	Lv7M6MnWocT1S0ngidyq4yPEnO3P0OOtW99g+zGHk8HzMgkGsm89Ss+kqbtd+VK9vshe6WSBC
	AG01n860B4kNZpaU2PWG7I8eBL3u0sA6GWHz7132OopcEjqdKBefFutFa3NvMajigmiIYZBrh
	nUzSqhWy35PCFJRca9c67usOjLN2UqnPvXLL7xmvvwyGCSaWXKM4BcU3uEs=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: Re: [Qemu-trivial] [PATCH] contrib/gitdm: Fix a typo
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
X-List-Received-Date: Thu, 17 Jan 2019 17:44:40 -0000

On 11/01/2019 16:55, Philippe Mathieu-Daudé wrote:
> Typo comes from upstream git://git.lwn.net/gitdm.git.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   contrib/gitdm/filetypes.txt | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/contrib/gitdm/filetypes.txt b/contrib/gitdm/filetypes.txt
> index 15d6f803b9..165b71b3f9 100644
> --- a/contrib/gitdm/filetypes.txt
> +++ b/contrib/gitdm/filetypes.txt
> @@ -4,7 +4,7 @@
>   # This program is free software; you can redistribute it and/or modify
>   # it under the terms of the GNU General Public License as published by
>   # the Free Software Foundation; either version 2 of the License, or
> -# (at your option  any later version.
> +# (at your option) any later version.
>   #
>   # This program is distributed in the hope that it will be useful,
>   # but WITHOUT ANY WARRANTY; without even the implied warranty of
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

