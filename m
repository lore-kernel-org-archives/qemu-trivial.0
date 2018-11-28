Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gRvna-0005e8-Gz
	for mharc-qemu-trivial@gnu.org; Wed, 28 Nov 2018 04:06:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52719)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gRvnT-0005ZU-Pv
	for qemu-trivial@nongnu.org; Wed, 28 Nov 2018 04:06:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gRvnP-0004Ko-0q
	for qemu-trivial@nongnu.org; Wed, 28 Nov 2018 04:06:15 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:47077)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gRvnF-0004Az-7g; Wed, 28 Nov 2018 04:06:01 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1M72Xn-1gJvyP3HjD-008XvW; Wed, 28 Nov 2018 10:05:54 +0100
To: Thomas Huth <thuth@redhat.com>, P J P <ppandit@redhat.com>,
	Qemu Developers <qemu-devel@nongnu.org>
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	Arash TC <tohidi.arash@gmail.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, qemu-stable@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20181119110757.2692-1-ppandit@redhat.com>
	<76e37406-4268-5f3e-2666-82eb5ef4dd45@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <5f55f7a6-1ec6-dfec-145d-b1cdeab2049f@vivier.eu>
Date: Wed, 28 Nov 2018 10:05:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <76e37406-4268-5f3e-2666-82eb5ef4dd45@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:qtRJYmNL544Xa2I/tryy3cscOnUgWOMZe7LSBFbL86TpuZJr64S
	Tm1y+uW4JvFuo1J/1fAZ6uPfi+MBWBO3FQ94wvSNWXuPFMIDh7ToCC8xRJIAvJuBWxzyhQh
	+LFX6enQp2tGZN5sSms16NUMZ6fr8faUTsM+pgySXMMqwvRgH/TP+bOhp/xBoi3UGLbG7bS
	ITuknUZGP4NaWvog/CMYw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QSZio/xbrEc=:VSdZQhp3hTHJAKyqKoszu2
	UDxwMJViYzMK7wAmLq0ChGWRzjHDfMtMZtKm+5q5sUPA5TeF7sv7T30qxREXSh26sFmv2JczI
	aByJw1oyM3QKug3DnNVf9MD3eukABWIsYsJQlm1fKmIU5iI7BM1p4fjVHnZbE2Ab8P5qAwDYL
	anqQtPUUD+LLD+NjYWA1tbttb31DtitHhwMVht9knJEuIPzFhvWUTVklZMqZPrx7E1Gwn1HHV
	YQo7uPBkIErQ6Qpf1ulWOeVDl8lyW1xQGmzlprpGAF0+r853UzYc7bd/7NLhhUSnvvDgxuAfh
	Bn8u0Ulvrf9/4zxHjY30YXdJLyoARsZyRVwKaHjRiTLqBRqvIUc6h3vLvC6Ik2BdlZkp5DIao
	5dej5jfv4SI87jCgY8NiJBPWm0BSyw+ufeQwOqpehxasaxaZYQrVAb+rT4vJvQBYZ+pvGgP6e
	Wxct6gCLSD3GsdgQPBqJJ0ezVxpNQezdedywrjSOpRS7d2px1+TNYdUFiaidxZ1a6gsCabuGv
	gu1lhjM1Ev308ifiVrN6Pm7DRAPwDKIoMPPOEfbHLLbTCBaPtRD+Qm16vlkQgD5ffJWq1QhKv
	TvXD5+gvs0v9+yJzDTCUj/SkyUw/1d7g3+PTS76Nvu2ct33BMHipC5sAyqYQ4AZq7JVGfYx1a
	OIq8Tl4sUCM7RwOwO5AD24HCzIX4IBxnA0a9ExYCmvscmgyUliPQibCHyjgt+sbs2dm95I4pI
	YuslG6cKGBcO51bdiGff4xuMqBjAffUGVY8voL5alDFrDSj5JzYzrFHVp5r0connQSJoymk26
	FNvb4ufgZxv21guHWcln2KljtlITg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
Subject: Re: [Qemu-trivial] [PATCH v2] bt: use size_t type for length
 parameters instead of int
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
X-List-Received-Date: Wed, 28 Nov 2018 09:06:21 -0000

On 28/11/2018 09:53, Thomas Huth wrote:
> On 2018-11-19 12:07, P J P wrote:
>> From: Prasad J Pandit <pjp@fedoraproject.org>
>>
>> The length parameter values are not negative, thus use an unsigned
>> type 'size_t' for them. Many routines pass 'len' values to memcpy(3)
>> calls. If it was negative, it could lead to memory corruption issues.
>> Add check to avoid it.
>>
>> Reported-by: Arash TC <tohidi.arash@gmail.com>
>> Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
>> ---
>>  bt-host.c              |  8 +++---
>>  bt-vhci.c              |  7 +++---
>>  hw/bt/core.c           |  2 +-
>>  hw/bt/hci-csr.c        | 32 ++++++++++++------------
>>  hw/bt/hci.c            | 38 ++++++++++++++--------------
>>  hw/bt/hid.c            | 10 ++++----
>>  hw/bt/l2cap.c          | 56 ++++++++++++++++++++++--------------------
>>  hw/bt/sdp.c            |  6 ++---
>>  hw/usb/dev-bluetooth.c | 12 ++++-----
>>  include/hw/bt.h        |  8 +++---
>>  include/sysemu/bt.h    | 10 ++++----
>>  11 files changed, 96 insertions(+), 93 deletions(-)
>>
>> Update v2: modify assert calls
>>   -> https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg01036.html
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> Even though it's a rather big patch, I think the changes are trivial
> enough so that it could go via qemu-trivial (now on CC:). If not, maybe
> Paolo could take it through his "misc" tree?

I'll take this patch via qemu-trivial only if I get clearance from
Paolo. BTW, I don't plan any qemu-trivial pull request before the final rc.

Thanks,
Laurent

