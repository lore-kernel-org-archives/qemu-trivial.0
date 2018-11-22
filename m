Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPo5n-0004lo-Vl
	for mharc-qemu-trivial@gnu.org; Thu, 22 Nov 2018 07:28:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52747)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gPo5l-0004kI-RQ
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2018 07:28:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gPo5i-0005cy-Iv
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2018 07:28:21 -0500
Received: from mout.kundenserver.de ([212.227.17.24]:53943)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gPo5g-0005E1-5a; Thu, 22 Nov 2018 07:28:16 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1M4JeB-1gQ5Cb1NmD-000JrU; Thu, 22 Nov 2018 13:28:00 +0100
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20181120203628.2367003-1-eblake@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <9a664c5c-d15d-5320-c60a-eeef56638e0f@vivier.eu>
Date: Thu, 22 Nov 2018 13:27:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20181120203628.2367003-1-eblake@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:9mo3PASzFDNOVYAzcqHBe6Lp69tspD5SFCEYAZ100h+ehLGsgnZ
	XUSJT7l9qgn5C3TzTV1zzONDMAe4xZLaZ12pMGjrz1KpuH702rqaf1k8GFw2Tajk/i9C5Ku
	i13j3VdlKbHdtFMP977pweNhbheg4+Qgn2fIlGVLm1Z17B9DCoTC7IapMze5j6ZgW39i5Vo
	e5mNHdy9jxt7bgv0XC/cQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:m0E0SdQym5M=:g71R9y1pIH+Q6T/chimi16
	skMhhD/raIFzXlx5ErKo/f+KAQxOeWgKGGAkp1Etosdpz2j7szIjm0HvTs0G5uoj65oLymyuk
	uUILTIoO33fzFPJK4zERzu3BCysHB0aR89idpOqanHbLF0zslQ4tfJqJVm1yTzEkanhKb6xf6
	VqhzqXigm5h50bdv5Od0cpKkvHakS3ZJ30n3GIK0bWNAsUtbfAe8QsilJ3LZAzdYp2O4of8pW
	L31UsrcJ82TLO5m/4JqaQDG/07icwmLOOBcspAu75v61kJCzrRuw87kNUT7c4kWq23NUurWOo
	zZSA/5s7H8CITkD6A+K4NpMXQf9CcXNEc0tbO1xmhD+MOYR7r4BpMAk2+NL3yP6Ts0m2B3+Ga
	LsUDQO1GoxfjWi8Qf+GiwlDnIJFx4DfS8YZm+vNBp8n+R3+uB0PSbRKw3OMLgr84dPVUxvQsu
	4mvlx/ro29QZLbaZq4fKAwVwviNqFcITM+ayrVJIvJWQclVLUKrojtk+rCsEaGk/I46wdgyzr
	2BEWu9f8Z6w2rXt5g6Xz48YF+OkRD8cImAiedmOMakv9MCzoZvLSWH09lozq7SWNBFr2c/Iab
	6sDpIz8y43t8VU0ToXnws8V1B8fnIDFuZSBBeOhoP3pflzN8Lb17wauBeQrI7Ft83CjzKz41p
	0mD7RL7y6udIVw1OAc9B137lC8S1p695nR6GOclyPbK4DTyHqW/SspHVigx+brtHWFNiito4w
	G9Ixylw1FiM8FIZnD9kiyYMABZ3HMX2d0FpVMYfgbkx7swchy6DpXrgHg75xD/x1GlpyxKgY+
	6Q6ZJnu6HElRTIRqFp/Bwn7e3s8yg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: Re: [Qemu-trivial] [PATCH] misc: Avoid UTF-8 in error messages
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
X-List-Received-Date: Thu, 22 Nov 2018 12:28:23 -0000

On 20/11/2018 21:36, Eric Blake wrote:
> While most developers are now using UTF-8 environments, it's
> harder to guarantee that error messages will be output to
> a multibyte locale. Rather than risking error messages that
> get corrupted into mojibake when the user runs qemu in a
> non-multibyte locale, let's stick to straight ASCII error
> messages, rather than assuming that our use of UTF-8 in source
> code string constants will work unchanged in other locales.
> 
> Reported-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
>  hw/misc/tmp105.c | 2 +-
>  hw/misc/tmp421.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/misc/tmp105.c b/hw/misc/tmp105.c
> index 0918f3a6ea2..f6d7163273a 100644
> --- a/hw/misc/tmp105.c
> +++ b/hw/misc/tmp105.c
> @@ -79,7 +79,7 @@ static void tmp105_set_temperature(Object *obj, Visitor *v, const char *name,
>          return;
>      }
>      if (temp >= 128000 || temp < -128000) {
> -        error_setg(errp, "value %" PRId64 ".%03" PRIu64 " °C is out of range",
> +        error_setg(errp, "value %" PRId64 ".%03" PRIu64 " C is out of range",
>                     temp / 1000, temp % 1000);
>          return;
>      }
> diff --git a/hw/misc/tmp421.c b/hw/misc/tmp421.c
> index c234044305d..eeb11000f0f 100644
> --- a/hw/misc/tmp421.c
> +++ b/hw/misc/tmp421.c
> @@ -153,7 +153,7 @@ static void tmp421_set_temperature(Object *obj, Visitor *v, const char *name,
>      }
> 
>      if (temp >= maxs[ext_range] || temp < mins[ext_range]) {
> -        error_setg(errp, "value %" PRId64 ".%03" PRIu64 " °C is out of range",
> +        error_setg(errp, "value %" PRId64 ".%03" PRIu64 " C is out of range",
>                     temp / 1000, temp % 1000);
>          return;
>      }
> 

Applied to qemu-trivial with updated message log (command to find the
non-ASCII characters).

Thanks,
Laurent

