Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gkBfl-0006to-AW
	for mharc-qemu-trivial@gnu.org; Thu, 17 Jan 2019 12:41:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44679)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gkBfj-0006ro-27
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2019 12:41:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gkBfi-00065x-Ag
	for qemu-trivial@nongnu.org; Thu, 17 Jan 2019 12:41:42 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:39811)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gkBfg-0005d0-B9; Thu, 17 Jan 2019 12:41:40 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1MFbeI-1h1AaI030o-00HAoG; Thu, 17 Jan 2019 18:41:24 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20190117161355.18204-1-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <e2f9de70-247c-79fb-20f8-3e3453536ae3@vivier.eu>
Date: Thu, 17 Jan 2019 18:41:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190117161355.18204-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:0huWODdYqenoB8+scYD1iSRIKZOwT0C/y2kWssZwMfFe/dvfx+B
	54tKLIT4K7mpi40vpEnQmICHUpkokQxD9UQ9fBrtGTq4eitP5H5hoNy93aXNwyL95V3pInF
	4pPYiIF2ZyXc7fN/YoPf37pEp9Eyl2cr6IJEsGl8vPMxiRO7IWKHN4qKfIFvedpxxvCrbX3
	TW+2AbQvZP5j70ixLEK9w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:6ixAapT+9xQ=:4yYpVfCRmXf7SyJmO5vZ7P
	yqE8UiiElW0Y1G82VkSnWRsmt6zmaz0TBcBvMr/8LR+TxKj803qi3EHysNsU64sfvgiZA2Pdo
	PNLMp4+MDNZlwLx9M0a55RUJRdmqplUnko2yUy8e3gad3NhHcvx/s978IL10GO1KI3qkxeV2Z
	bCAny43o+cz1oHuDRjtnYp8I9hXXXHE0QUuX+A/LRmY4RG6m8gumrg6vl51VXjtlu1GnWAWik
	+PSXayBcxiAxYYpzH4Wf4sIkGNTrN6PVWNvqJ0CCFcaNrsjMov1oVBUhsWFFHcaT14fEilQLQ
	7TO6Hhpyiwj9WTxSvOLe2f4cSZDL2g6xNkrG3Lpzci5fo0cJbpYmFCq+gjSQ1pvAGVt3P0LS8
	tId/Y6E6si7DLymy8IPiEkkeMGQJzjQZ0vtdfiRvQS8bMw1KjZ7PVt44fPt6Kiio3ImV+BMVH
	Sx9Zx3PxIj7R0WHWr9LjPh3Ns+fhYQiF5CBCg60JjHNjRKlNJ4DOxgGz3Zfw76dj2C2pghmgN
	hV56lJ5ftapV9hmZywViWx4GdpP17aHlsU/0U1HJAUZAGtUL6+sXNb+bY8v3qmMxR8/PA9c8T
	ZXOiQEtq01rdOXsIUV1pfMkONqZnowZCV1N+9MPs1l+XBVwFr2SfJcjU4oo6vWeJN5zzFUot0
	IzlTf278EG5LhCD74VyVFGRpJnEhB8BlkQyPI9d0OF4B9kplLBu0r/7lRt1nE1Bk6kOQEAcUF
	oHOl3HTjI2Kyu5MDiAgYknomlgqm0WCNMqUeoUUqYf8IM3TWdtZ1Iq9r6bE=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: Fix utf-8 mangling
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
X-List-Received-Date: Thu, 17 Jan 2019 17:41:44 -0000

On 17/01/2019 17:13, Philippe Mathieu-Daudé wrote:
> Patch incorrectly applied as 15ffb43cbf4.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Paolo can this be a patchew bug?
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index af339b86db..fd3d4de3fa 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1639,7 +1639,7 @@ F: include/hw/display/edid.h
>   F: qemu-edid.c
>   
>   Firmware configuration (fw_cfg)
> -M: Philippe Mathieu-DaudÃ© <philmd@redhat.com>
> +M: Philippe Mathieu-Daudé <philmd@redhat.com>
>   R: Laszlo Ersek <lersek@redhat.com>
>   R: Gerd Hoffmann <kraxel@redhat.com>
>   S: Supported
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

