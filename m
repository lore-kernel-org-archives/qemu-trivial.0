Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hMVzS-00039g-6T
	for mharc-qemu-trivial@gnu.org; Fri, 03 May 2019 07:04:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56588)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMVzP-00036N-5h
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 07:04:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hMVzN-0003tj-PY
	for qemu-trivial@nongnu.org; Fri, 03 May 2019 07:04:27 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:45527)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1hMVzI-0003ou-1F; Fri, 03 May 2019 07:04:20 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
	1N0G5h-1ga4h026z9-00xLJq; Fri, 03 May 2019 13:03:41 +0200
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>, 
	Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
	Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Eduardo Habkost <ehabkost@redhat.com>, =?UTF-8?Q?Andreas_F=c3=a4rber?=
	<afaerber@suse.de>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Jason Wang <jasowang@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Laurent Vivier <lvivier@redhat.com>, 
	Michael Tokarev <mjt@tls.msk.ru>, =?UTF-8?Q?Daniel_P._Berrang=c3=a9?=
	<berrange@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
	<alex.bennee@linaro.org>, Gerd Hoffmann <kraxel@redhat.com>,
	Michael Roth <mdroth@linux.vnet.ibm.com>
References: <20190502185835.15185-1-laurent@vivier.eu>
	<CAFEAcA9-hAU5dxUmSWtbvrPEXE-nCP1uLvLbOby-_EXZ27o+8g@mail.gmail.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ed0ddde0-3c6d-0afe-be9e-b56ecc479d18@vivier.eu>
Date: Fri, 3 May 2019 13:03:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9-hAU5dxUmSWtbvrPEXE-nCP1uLvLbOby-_EXZ27o+8g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:d6VNxPl74O+FeqkNcY+APfdyceHeK32Ch0K6N/Xl2avriyS4NSd
	XL7HvX5q9rPFG1EI9fKExwrb+NPLGprZ7qiFt7Jr70uXaC5/fCv33FxkNWlkFiw3nqD8LoO
	XFVYvu8pXA5jEhhkb6tSlY/T0OKKCPy7Z8BPk9Ec5pzLINktDDjp7GRGVp8GSGLmRbQRRLr
	CDDXUhft72j5YqQD6wD3Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:77UeGtvuvDc=:n8vYbINaju24fu0az+Pwmw
	SA7Og7oUkIGrMy6cfclzTXIQe5kpj7m/bFTpRtjjyzJypjsu2/a75Z7DQCh8mpgTV3hTnSKek
	SeAMpihKm39UdcH02yinuZvPotmO1f2pzKEYvXheG/7g6YCQAUP5lR685o4Yc14hdBktzeQr8
	8iEf/HBmuNRYV4XAm4lWAn55dmmmEo3GWaiWrpPY6SjmEd4jzadom0e6+jpcMFYRkWJuoAjOl
	3MLeanOko/U3MLCIgTnkfEUg8tywX65Ci/C5h3Nol69RK+eF17kdXHN/C8eh2XSQp0wNbuXhw
	lvWGlGFVV/MgAEgQuylx6LWhVBenazSPvvT5EhQWIN5e2zeOziC2NVtFcrrLbi8YB+IlTWMmQ
	8UawmRl4pIF5B8iI1zOKKSPYtA5u0st1eLdwd/nO66LbBOijJh/1eMKfy4JyrYdz+tAyGuXw9
	xYtLxSIQaRqj7tV979pbOMztMABaBPpiiXtHKnaNpQwkjhs3zJTQ0zyBd0errmVGBoLKLRgUj
	Qp0cAHwUiUSJJcpaEabdggBpvsRqBtAo373TicKjd0Ph+BBD+AHt7/B+4qEMNrBKpVhq5+uLf
	OPszTyHulMV1pn0cWDxaKO7fkmhOJHimpTD3LCzddXnBAafgcjVjg9FhXhzeXL7aEhBqeOdaA
	cJz9CQ40WWdIBPPEX9AEmXAQmGk0qhh8SkODhdducWd5D2f4th3UWz7rWi5VngXejOseDp3TG
	Sv4N2ecfOxwH1onSkR0bbq2TM32jmpXFqQ2+azoYz4pyI3FxMGJ2LFm7jJo=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: Re: [Qemu-trivial] [PULL 00/13] Trivial branch patches
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
X-List-Received-Date: Fri, 03 May 2019 11:04:28 -0000

On 03/05/2019 12:34, Peter Maydell wrote:
> On Thu, 2 May 2019 at 19:58, Laurent Vivier <laurent@vivier.eu> wrote:
>>
>> The following changes since commit 8482ff2eb3bb95020eb2f370a9b3ea26511e41df:
>>
>>   Merge remote-tracking branch 'remotes/jnsnow/tags/bitmaps-pull-request' into staging (2019-05-02 12:04:51 +0100)
>>
>> are available in the Git repository at:
>>
>>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>>
>> for you to fetch changes up to f7c03a68b814254df414977ff299468fbf0fa1c0:
>>
>>   sockets: avoid string truncation warnings when copying UNIX path (2019-05-02 20:50:47 +0200)
>>
>> ----------------------------------------------------------------
>> Pull request trivial branch 2019-05-02
>>
>> ----------------------------------------------------------------
> 
> Markus's "Clean up includes" patch breaks 'make check' on
> big-endian hosts:
> cd /home/pm215/qemu/build/all/tests/fp && ./fp-test -s -l 1 -r all  i32_to_f16 i
> 64_to_f16 i32_to_f32 i64_to_f32 i32_to_f64 i64_to_f64 i32_to_f128 i64_to_f128 >
>  int-to-float.out 2>&1 || (cat  int-to-float.out && exit 1;)
>>> Testing i32_to_f16, rounding near_even
> ^M372 tests total.
> ^M372 tests performed.
> In 372 tests, no errors found in i32_to_f16, rounding near_even.
>>> Testing i32_to_f16, rounding minMag
> [...]
> ^MErrors found in i32_to_f128:
> 1006FFFF  => +0000.000000000000401B006FFFF00000 .....
>         expected +401B.006FFFF000000000000000000000 .....
> ^M0001DDEB  => +0000.000000000000400FDDEB00000000 .....
>         expected +400F.DDEB000000000000000000000000 .....
> ^MFFF6FFFC  => +0000.000000000000C012200080000000 .....
>         expected -4012.2000800000000000000000000000 .....
> ^MFFFFFFF8  => +0000.000000000000C002000000000000 .....
>         expected -4002.0000000000000000000000000000 .....
> [etc]
> 
> (I had to bounce Markus' own pullreq from a week or
> so back because it had this patch in too and also failed
> for this reason.)

ok, I remove it and re-send the PR.

Thanks,
Laurent


