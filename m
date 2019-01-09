Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ghB9p-0004OQ-5T
	for mharc-qemu-trivial@gnu.org; Wed, 09 Jan 2019 05:32:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37221)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghB9m-0004Mv-DQ
	for qemu-trivial@nongnu.org; Wed, 09 Jan 2019 05:32:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ghB9k-0003Dd-9f
	for qemu-trivial@nongnu.org; Wed, 09 Jan 2019 05:32:17 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:55683)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1ghB9i-0003C4-Gr; Wed, 09 Jan 2019 05:32:14 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
	1MnItm-1h6Mxn48m4-00jLN4; Wed, 09 Jan 2019 11:31:52 +0100
To: Li Qiang <liq3ea@163.com>, mst@redhat.com, marcel.apfelbaum@gmail.com,
	pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com
Cc: qemu-trivial@nongnu.org, lvivier@redhat.com, qemu-devel@nongnu.org
References: <20190105023831.66910-1-liq3ea@163.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <733a962f-badf-6586-8fa6-b9e44b2dd7a2@vivier.eu>
Date: Wed, 9 Jan 2019 11:31:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20190105023831.66910-1-liq3ea@163.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:hvVnUcgOEtug4WQouItFJV0SQ3vSv2pe3NQUEtM4BediZi4Imiv
	mjQHhRoyQsfC9p54etEA3t7K5V02s1XRXQDyFurqAFSXoy5aTsu0s8dgOgZ7HyqtGYT1H3w
	CquvfM7mGdqF5rhnSL+Izld59WAnWQB+jDtb5pH7mNhV92GD4rQtU5yUVYmQnTZNlTOLvYN
	MuQCZJt9XihyOe3YDCq0g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9wrMj2tXTfE=:cfDvfdXktSBwSCWTb/ZPuL
	K2DCbg9+LNgClA1OPfOnEGZFuuN4bka2kUBxY9CheyELBow1FPZYbsMqU+mHE5N2eoEV92o9t
	jLfSgd6i3PpNBCnKTzcNmbLRNhPuBRmJp0EezUryPi0GNBlkf/9lOPSWV/j9AgWIPHhmwIXbi
	VH1D67VwrWtsUQKXwPVnqSS8kLQJMQ3FGWtBfywY6Ob+DddADuqMZwu8/fJZStZw9uPSP1ZQ8
	+jmT0zFQk3vZDWzdf4iCsPE+l/q1KwMzgbCXvlDOgHSUhlHtktz6hN1ePbSd4ZZyNJakhoesp
	AtImMLoMd8g/OArIWNUrmx4vdKCNmKl+mWLNcoymUgvaixaYIgx8EMp+KoFVyPrdqRv/iNWND
	1P90S5kPzkWPP74YB9qNxafRZgwOLYHtjUA5CJxCzznZHG/wgHlNupXFWbUzu90BYny/0BOsH
	wPqiayIpWOluH2H8dBTsahBQf0vbIS6B9f6HN0HwYOp81twMdsBlykpZc7dit5rIigzyXtpt/
	EQFQB+VIeSuC1bCmap7qxPwORZAvrXslurou2Xp/MuB1dUHEFy8tgoeXIF/Jtw4xzs2WF1k0j
	BMwhJTgRKj2y6EedpSsNJ7cqFddvnkBz1G0n/DCnWiedZSFkXr3+f7nJUSLqzldod385XAZ41
	dS9y1p3+KMf03G4MTFlhsySi8KpxDn3iAhGTHSY1Z4So8Vh30E9BxHUf8RJmv1t0SQl4ZWOly
	kVInUlZRQ0IhzsfyhabzB91NZDGeKBRcGwevUvMm2PY6xCwhsyP+lv7NjL0=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
Subject: Re: [Qemu-trivial] [PATCH] ioapic: use TYPE_FOO MACRO than constant
 string
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
X-List-Received-Date: Wed, 09 Jan 2019 10:32:19 -0000

On 05/01/2019 03:38, Li Qiang wrote:
> Make them more QOMConventional.
> Cc:qemu-trivial@nongnu.org
> 
> Signed-off-by: Li Qiang <liq3ea@163.com>
> ---
>  hw/i386/kvm/ioapic.c     | 2 +-
>  hw/i386/pc.c             | 4 ++--
>  hw/intc/ioapic.c         | 2 +-
>  include/hw/i386/ioapic.h | 3 +++
>  4 files changed, 7 insertions(+), 4 deletions(-)

Reviewed-by: Laurent Vivier <laurent@vivier.eu>



