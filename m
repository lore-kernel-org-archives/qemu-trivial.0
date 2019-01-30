Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gomW7-000752-Ot
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 04:50:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45866)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gomW5-00072S-4Z
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 04:50:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gomW3-0008Mn-KN
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 04:50:44 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:57183)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gomVm-00089E-BF; Wed, 30 Jan 2019 04:50:32 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1N79q8-1hE6tW2eMO-017UAe; Wed, 30 Jan 2019 10:50:14 +0100
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>
References: <1548255083-8190-1-git-send-email-thuth@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <224f9e1f-34c8-7b21-5cba-f21d92ad9415@vivier.eu>
Date: Wed, 30 Jan 2019 10:50:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <1548255083-8190-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:dmAeQiQXJpbnAisuE6vYAZgXSwfs6oGggU5WIPh0+aEKWKdFZxn
	Ab+u01yjgsHuA0cD3K0CPvJhNSr5UXLdBEAcds4mBUnj1W/wMiFRrjf1Y8hhJT0zmAsJz9c
	Rs3wwiTjJxvcGTfdmMgeKliB+NAufbRtRVJDgASFgzP21AqlXUzL7yyReajQ3PICNF2rKgS
	81VZoKojlsC/9pmn1WOQA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:K7HKLgtjAL8=:SGD52YOfjKNlES/7/qIb2p
	ORPhIAlZrbm8yE2q7MEwXfjIR+mXVkCOIZ4jMFsRZIqxbh5kxcpYlCGAb9lEQFSfPxpzlb7sY
	y0MKgxIx12jDbD1/D5/YMi2dWbHc0i7EaoGOy/9yXRuK92Z1Ozs3gWjY5IkBBdONm8/ybtwfQ
	u9oelklPvaZAxCLmZx1k+0qJHkFBvEV5FYoYTB2ZqcsRc/vuUV1WhH2NI5fDhFIzYbclk/ZW3
	XCez+K0xZOEB2WGJFquoBij9ZXSV6MIIzKm4ini3eHdFecLO2t0HIhK1vkrIlSTXlIMDjZVy8
	jenlmWtV5bUN/kPRpMzPasYV4xh5WGrR6Fr6E0nwrwxeEF+W3RRGl96eZ5OXx12qJCNVMXQF0
	zwDVHuFYkzigU6uVlWYm1CNrvZadB2dtO34zY4VZo9SrzQiyNvwqPQ0Og9onsV6fs2DDqWfAJ
	w5vreoGSySiRub2eYjksCG/cpHC5IZrPjpTlbdYKkkFzqHoFOOVDptVSmS8l4pEVxYDeddR9O
	Yoiom4tXRQMvryAjY0ZMV7Q/IQQ1mKynZaUpQCPeo2yaLitksZdnAWRMNYGd1BbOxivDc474m
	mkapzww7HcwrNilHt0RmaFvGPKXjHmamS5wuJHFRE6fg9786yKEKSnG/EcJ22pPfKce8Brgdb
	kiApiLqdqNTaL/CtQz55x0XhYvFRNqJCMraCNEvDAz8XkIgW+cYtGVrp51f7mrMRsMLTyZo6c
	4xw9yJTqpK5zHZ3HELshK9ObgqzODJC6k1lyHe42gn8/buaUeKlEwVQDHFA=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: Re: [Qemu-trivial] [PATCH] Don't talk about the LGPL if the file is
 licensed under the GPL
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
X-List-Received-Date: Wed, 30 Jan 2019 09:50:46 -0000

On 23/01/2019 15:51, Thomas Huth wrote:
> Some files claim that the code is licensed under the GPL, but then
> suddenly suggest that the user should have a look at the LGPL.
> That's of course non-sense, replace it with the correct GPL wording
> instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  crypto/afsplit.c           | 11 +++++------
>  include/crypto/afsplit.h   | 11 +++++------
>  include/hw/pci-host/gpex.h |  4 ++--
>  include/hw/pci-host/q35.h  |  4 ++--
>  include/qemu/range.h       | 11 +++++------
>  target/i386/hvf/hvf.c      |  6 +++---
>  util/range.c               | 11 +++++------
>  7 files changed, 27 insertions(+), 31 deletions(-)

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


