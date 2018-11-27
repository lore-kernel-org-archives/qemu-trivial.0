Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRbw1-0007Ez-8O
	for mharc-qemu-trivial@gnu.org; Tue, 27 Nov 2018 06:53:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37528)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gRbvz-0007Cj-4U
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 06:53:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gRbvy-0001Q3-GV
	for qemu-trivial@nongnu.org; Tue, 27 Nov 2018 06:53:43 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:39247)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gRbvt-0001NS-8x; Tue, 27 Nov 2018 06:53:37 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue109 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1M72wT-1gKBXa35jz-008a3w; Tue, 27 Nov 2018 12:53:21 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
	<alex.bennee@linaro.org>, Fam Zheng <famz@redhat.com>
Cc: qemu-trivial@nongnu.org, Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org
References: <20181125205000.10324-1-philmd@redhat.com>
	<20181125205000.10324-25-philmd@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <d1103900-b60b-b1ce-629b-c2ac68a29c3d@vivier.eu>
Date: Tue, 27 Nov 2018 12:53:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20181125205000.10324-25-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:a7Ieln9TApFntGmsmEJi23O4xAUHFzKeL6sl2gTcV9kEzgRvO0h
	d9p+vo351zaJfj9cmiGnxy1T7iGsUdCbMbLf/c56ZqqGpToMBBy1fMaNjyELVBb0riHW6MQ
	ZQEvefaU5u3DTEDYQy4SVbn6/LROsXWqAJalQJcRdRgPTmVHaCPp8NPs4aIp93iEG7T7nz5
	Hg37Ya+EL96KtZu6qrIzA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OT3RocCVAfY=:KHrIYiVupMCPZN/83ruNLC
	6enx6le6zmRQJZnL7adySGudVg3Z3yXcRfVmBae0otyDO0PYXX9wMskPGhfHpL8NWNdaCJQSF
	Y+eTgEHAvq+I6rBkLcHvr7m9ixBWyA1Ds1lUkqYELMRlQurmlOBJFq0bVREbid6PgOEz4ehp0
	UVZwk1beGJL6ZFtlrQgApWA9KmUDeC2wgHfeAJKpdTaw58uGGSGuBtA6Ug4x3VTHBORPU/Hf+
	PFZewb/x29dPA/Ndz5BfUSOnyosZ0x3uipllmn/Q0UBk/dGPrVPOBJdHLDAaUEGmr05znKDmf
	vlykqgIvGAtZRuYiRuL+OJkaCxY1XbdRsj20r3U5qmV8Lyu6av+yYOK9MeZsoYYFgGhkq4EC7
	AGU02Q6Rr2MjPsO00kNyy1x4MyT7KlRtgaejQyYEf8QnireuiwgtZkiynzdFxYxc0iBk9u7pg
	TjcP4TkzyAaSdEtneeWABKsDxtGs8apL3cpplPyHB0ageI9fsWcByG/O5ZG8dlRczBQNUXHGj
	GfsB3aRKIx3ALiusUk56p7ZaHstnEM8Qikzz9J0fFyGtv6tZ/jIOc/T271HZh1awh3xnHINZA
	2996Vk1Sd9TqV6q3Z0IuXWdexXeO5kbOD0vFyJx8VO2TP+o9hKbXdmQZRHtQwzaZFdLfFJnjb
	l6HfgtsnW4KWSCuyCRPHYbCpY/ildF2Am2YhaPeQNhl80pcwIoSDPxmvPjm2ylTAuZerXNZnc
	O7ybpW3IUoqwi7sDmGYoA7yHigozhGfV12zPV+ed52VXfmfsKqDbH9Z60zLQLKtPGVnhkyWTI
	RpZIwujKp0G5qtU/CT2d2dCIrmXr4JQQ7oGBS8pWu62GEcVdUNdylzHyBu3K2LvlkYLnnvtrr
	rXOwbkiX7TMndwPnf2VBcS6fG1s0xLTreKBnc66ndZbZAa11Rg09fQlFyinJ+pNncntSngfCy
	ykLpeK+m9C2KY55RRqCbzV2wFOooGtLqxTT5Eq5Sd05l7uriU+C42zBX7SOMsfm4P2haET9kZ
	IQ==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: Re: [Qemu-trivial] [PATCH for-3.1 24/25] MAINTAINERS: Use my work
 email to review Build and test automation patches
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
X-List-Received-Date: Tue, 27 Nov 2018 11:53:44 -0000

On 25/11/2018 21:49, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ad82c0377c..c616861ca3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2388,7 +2388,7 @@ Build and test automation
>  Build and test automation
>  M: Alex Bennée <alex.bennee@linaro.org>
>  M: Fam Zheng <famz@redhat.com>
> -R: Philippe Mathieu-Daudé <f4bug@amsat.org>
> +R: Philippe Mathieu-Daudé <philmd@redhat.com>
>  L: qemu-devel@nongnu.org
>  S: Maintained
>  F: .travis.yml
> 

Applied to my trivial-patches branch.

Thanks,
Laurent

