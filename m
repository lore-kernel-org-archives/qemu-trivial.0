Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gFg8C-0006Zy-DB
	for mharc-qemu-trivial@gnu.org; Thu, 25 Oct 2018 09:57:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gFg8B-0006Yj-9Z
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 09:56:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gFg86-0007kV-6O
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 09:56:59 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:44801)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gFg7u-0007aL-Vk; Thu, 25 Oct 2018 09:56:43 -0400
Received: from [10.101.215.124] ([185.7.230.216]) by mrelayeu.kundenserver.de
	(mreue009 [212.227.15.168]) with ESMTPSA (Nemesis) id
	1MTiHd-1g9rb0059h-00U63h; Thu, 25 Oct 2018 15:55:59 +0200
Received: from [10.101.215.124] ([185.7.230.216]) by mrelayeu.kundenserver.de
	(mreue009 [212.227.15.168]) with ESMTPSA (Nemesis) id
	1MTiHd-1g9rb0059h-00U63h; Thu, 25 Oct 2018 15:55:59 +0200
To: Cleber Rosa <crosa@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>, Michael Tokarev <mjt@tls.msk.ru>,
	Max Reitz <mreitz@redhat.com>
References: <20181004161852.11673-1-crosa@redhat.com>
	<20181004161852.11673-3-crosa@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <23e88c3c-7df0-7fc5-03dc-c8c021c77774@vivier.eu>
Date: Thu, 25 Oct 2018 14:55:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20181004161852.11673-3-crosa@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:lm6ONeHLF6ZPZBN0KTU6hg4LOxlOrtxJ4M2XtzENt4KzWdYDEJ3
	P+wJUKQFzPYpYfkIwu1eyVjz2QScLG9Qi0cmmec0FBPpneHhLN+9Zk6bkEnq/h8Bkuxid+u
	Yd0ZfhxncWD9TTsQBCpSyEKGHq2C4eYXLEdQk01s4u7LDM2q8SiVtVJr82NB6hlyyN1bhGy
	g5WfLfJWFEtwB5/ORkjNQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:n3XC/fMfwCM=:DbFZjN4JckWqWA1Wv2i0CR
	LnIoaHddd0iMyOylBDg4iqPXSFzMZpQQ4LlbBYanDKvX+zxcK/VbPTTmfuDrHPEIEXnxR/orN
	/77dsrauyIXhpL+o/LteH/HCgZr72hMG0N0ZOhX4dQwoh6vWSKDMf22EYVUtPOKhFZPQaEKQX
	//JzzI6N5dlY1hRHJYpBzYEUfBHq0U02ICI42cpCREXaEYie3kl6CcGn2wDGSyaQOdLOXsYfJ
	FP6dxlUr5HSNz+4RMxV/u27OMfvW6iOh505nIIhgmW0RTs0KPRPuRO+0DkwpHJ/8MNDWpNR+8
	8pDE+WtGDFQAIYv+cENzngC4OJnIWOk4ihexcPfpgQY/Yc1E7LCppzo83sD3AU/bemjN4LBVK
	ScdhSMmBw/GfMbLC1GoSVlK60eZGTqv0kCs0fubCnT/V6qyj8E+29zjzzaaT+1ZoKZzH1KZ/H
	pi8PSm2vJhgcavRDCbuVEd+CchZdvfKjWMvi9T0ZWAanoXXqMEsaNfVWM9l3o27loWkG7tNbD
	mDZL5FqtT3y1zOBqShNTPyywk+Ru06q7r5LYD/AkzKN4HAsWIzsto38Jpzrnq6ct02hiDYA6D
	+bRBaOJGUtaE5wqQvqX1XffBvxHU9zrh5itFf0P+9Pqq9i7M29OhTbzJWFdFZJEqq6bnhX8OA
	ZEYxFdApSzZNpSVvmes6moHXuyuz1j5G6thtYHPERTdHv7qzi6FnFPRXFSOGg99ufDcXtoBaL
	45n5xBrykdMGBy8V
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.133
Subject: Re: [Qemu-trivial] [PATCH 02/10] tests/tcg/README: fix location for
 lm32 tests
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
X-List-Received-Date: Thu, 25 Oct 2018 13:57:00 -0000

On 04/10/2018 17:18, Cleber Rosa wrote:
> Point to the right and obvious location for lm32 tests.
> 
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/tcg/README | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/tcg/README b/tests/tcg/README
> index a5643d33e7..2a58f9a058 100644
> --- a/tests/tcg/README
> +++ b/tests/tcg/README
> @@ -10,6 +10,6 @@ with "make test-cris".
>  
>  LM32
>  ====
> -The testsuite for LM32 is in tests/tcg/cris.  You can run it
> +The testsuite for LM32 is in tests/tcg/lm32.  You can run it
>  with "make test-lm32".
>  
> 

Applied

Thanks,
Laurent

