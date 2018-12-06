Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gUwjS-0000yG-Vj
	for mharc-qemu-trivial@gnu.org; Thu, 06 Dec 2018 11:42:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46230)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gUwjQ-0000wV-Mz
	for qemu-trivial@nongnu.org; Thu, 06 Dec 2018 11:42:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gUwjP-0001Cm-L0
	for qemu-trivial@nongnu.org; Thu, 06 Dec 2018 11:42:32 -0500
Received: from mout.kundenserver.de ([212.227.126.130]:33793)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gUwjI-00016Q-WC; Thu, 06 Dec 2018 11:42:25 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1MI5Dj-1gjXiO1xcV-00FAO2; Thu, 06 Dec 2018 17:42:19 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, vsementsov@virtuozzo.com, armbru@redhat.com
References: <20181206151856.77503-1-eblake@redhat.com>
	<b98ea971-0d16-6586-9595-f9e3922f05c6@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	xsFNBFYFJhkBEAC2me7w2+RizYOKZM+vZCx69GTewOwqzHrrHSG07MUAxJ6AY29/+HYf6EY2
	WoeuLWDmXE7A3oJoIsRecD6BXHTb0OYS20lS608anr3B0xn5g0BX7es9Mw+hV/pL+63EOCVm
	SUVTEQwbGQN62guOKnJJJfphbbv82glIC/Ei4Ky8BwZkUuXd7d5NFJKC9/GDrbWdj75cDNQx
	UZ9XXbXEKY9MHX83Uy7JFoiFDMOVHn55HnncflUncO0zDzY7CxFeQFwYRbsCXOUL9yBtqLer
	Ky8/yjBskIlNrp0uQSt9LMoMsdSjYLYhvk1StsNPg74+s4u0Q6z45+l8RAsgLw5OLtTa+ePM
	JyS7OIGNYxAX6eZk1+91a6tnqfyPcMbduxyBaYXn94HUG162BeuyBkbNoIDkB7pCByed1A7q
	q9/FbuTDwgVGVLYthYSfTtN0Y60OgNkWCMtFwKxRaXt1WFA5ceqinN/XkgA+vf2Ch72zBkJL
	RBIhfOPFv5f2Hkkj0MvsUXpOWaOjatiu0fpPo6Hw14UEpywke1zN4NKubApQOlNKZZC4hu6/
	8pv2t4HRi7s0K88jQYBRPObjrN5+owtI51xMaYzvPitHQ2053LmgsOdN9EKOqZeHAYG2SmRW
	LOxYWKX14YkZI5j/TXfKlTpwSMvXho+efN4kgFvFmP6WT+tPnwARAQABzSNMYXVyZW50IFZp
	dmllciA8bHZpdmllckByZWRoYXQuY29tPsLBeAQTAQIAIgUCVgVQgAIbAwYLCQgHAwIGFQgC
	CQoLBBYCAwECHgECF4AACgkQ8ww4vT8vvjwpgg//fSGy0Rs/t8cPFuzoY1cex4limJQfReLr
	SJXCANg9NOWy/bFK5wunj+h/RCFxIFhZcyXveurkBwYikDPUrBoBRoOJY/BHK0iZo7/WQkur
	6H5losVZtrotmKOGnP/lJYZ3H6OWvXzdz8LL5hb3TvGOP68K8Bn8UsIaZJoeiKhaNR0sOJyI
	YYbgFQPWMHfVwHD/U+/gqRhD7apVysxv5by/pKDln1I5v0cRRH6hd8M8oXgKhF2+rAOL7gvh
	jEHSSWKUlMjC7YwwjSZmUkL+TQyE18e2XBk85X8Da3FznrLiHZFHQ/NzETYxRjnOzD7/kOVy
	gKD/o7asyWQVU65mh/ECrtjfhtCBSYmIIVkopoLaVJ/kEbVJQegT2P6NgERC/31kmTF69vn8
	uQyW11Hk8tyubicByL3/XVBrq4jZdJW3cePNJbTNaT0d/bjMg5zCWHbMErUib2Nellnbg6bc
	2HLDe0NLVPuRZhHUHM9hO/JNnHfvgiRQDh6loNOUnm9Iw2YiVgZNnT4soUehMZ7au8PwSl4I
	KYE4ulJ8RRiydN7fES3IZWmOPlyskp1QMQBD/w16o+lEtY6HSFEzsK3o0vuBRBVp2WKnssVH
	qeeV01ZHw0bvWKjxVNOksP98eJfWLfV9l9e7s6TaAeySKRRubtJ+21PRuYAxKsaueBfUE7ZT
	7zfOwU0EVgUmGQEQALxSQRbl/QOnmssVDxWhHM5TGxl7oLNJms2zmBpcmlrIsn8nNz0rRyxT
	460k2niaTwowSRK8KWVDeAW6ZAaWiYjLlTunoKwvF8vP3JyWpBz0diTxL5o+xpvy/Q6YU3BN
	efdq8Vy3rFsxgW7mMSrI/CxJ667y8ot5DVugeS2NyHfmZlPGE0Nsy7hlebS4liisXOrN3jFz
	asKyUws3VXek4V65lHwB23BVzsnFMn/bw/rPliqXGcwl8CoJu8dSyrCcd1Ibs0/Inq9S9+t0
	VmWiQWfQkz4rvEeTQkp/VfgZ6z98JRW7S6l6eophoWs0/ZyRfOm+QVSqRfFZdxdP2PlGeIFM
	C3fXJgygXJkFPyWkVElr76JTbtSHsGWbt6xUlYHKXWo+xf9WgtLeby3cfSkEchACrxDrQpj+
	Jt/JFP+q997dybkyZ5IoHWuPkn7uZGBrKIHmBunTco1+cKSuRiSCYpBIXZMHCzPgVDjk4viP
	brV9NwRkmaOxVvye0vctJeWvJ6KA7NoAURplIGCqkCRwg0MmLrfoZnK/gRqVJ/f6adhU1oo6
	z4p2/z3PemA0C0ANatgHgBb90cd16AUxpdEQmOCmdNnNJF/3Zt3inzF+NFzHoM5Vwq6rc1JP
	jfC3oqRLJzqAEHBDjQFlqNR3IFCIAo4SYQRBdAHBCzkM4rWyRhuVABEBAAHCwV8EGAECAAkF
	AlYFJhkCGwwACgkQ8ww4vT8vvjwg9w//VQrcnVg3TsjEybxDEUBm8dBmnKqcnTBFmxN5FFtI
	WlEuY8+YMiWRykd8Ln9RJ/98/ghABHz9TN8TRo2b6WimV64FmlVn17Ri6FgFU3xNt9TTEChq
	AcNg88eYryKsYpFwegGpwUlaUaaGh1m9OrTzcQy+klVfZWaVJ9Nw0keoGRGb8j4XjVpL8+2x
	OhXKrM1fzzb8JtAuSbuzZSQPDwQEI5CKKxp7zf76J21YeRrEW4WDznPyVcDTa+tz++q2S/Bp
	P4W98bXCBIuQgs2m+OflERv5c3Ojldp04/S4NEjXEYRWdiCxN7ca5iPml5gLtuvhJMSy36gl
	U6IW9kn30IWuSoBpTkgV7rLUEhh9Ms82VWW/h2TxL8enfx40PrfbDtWwqRID3WY8jLrjKfTd
	R3LW8BnUDNkG+c4FzvvGUs8AvuqxxyHbXAfDx9o/jXfPHVRmJVhSmd+hC3mcQ+4iX5bBPBPM
	oDqSoLt5w9GoQQ6gDVP2ZjTWqwSRMLzNr37rJjZ1pt0DCMMTbiYIUcrhX8eveCJtY7NGWNyx
	FCRkhxRuGcpwPmRVDwOl39MB3iTsRighiMnijkbLXiKoJ5CDVvX5yicNqYJPKh5MFXN1bvsB
	kmYiStMRbrD0HoY1kx5/VozBtc70OU0EB8Wrv9hZD+Ofp0T3KOr1RUHvCZoLURfFhSQ=
Message-ID: <9d93b6c0-43bf-a3fb-ae28-dd4541f5319f@vivier.eu>
Date: Thu, 6 Dec 2018 17:42:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <b98ea971-0d16-6586-9595-f9e3922f05c6@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:6ASc86Xz9exOVvApLvQtnDOrPAV/LesQrixug+aaF68OicdPvzh
	D0e12/9xXLsclaFI0uEKPoYX1trRlGslD649QFFvs7CtArdhV11ag+bRnQbkXu66psQSwS9
	zcSE4WIGt3xwFVXOLGIeeJP78ZnOaTcllq2fvCy2glmGw2OjnT35H7MQkXYuQs1+PvxnZFj
	n/rw6yjoY9MYDv4Ji6/+Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xp5ASCXnu1Q=:QxgzHhVZCWD4LR+Q7MGMQz
	VIXGOIenT5+jKIy5Fe7KpOoRCgotTJsqJ21uHHSjf9vi4W+JrkZPRm0m9sGaT09QLq4/pApQH
	JTh6ifhypjZbk9n4Jy+MNzVmbpEB1ve20FwNIbcxXa7Vby0DjkihMzIhnKHJgmCu5MI+XrRa0
	YzudzLECdxgyQOm3HyC/Hc72dgCSMveFeFjCS9K3aAvfP9NusFEi5yr1CjFHyu36AY4FjszWJ
	bsiiCRdy7Me2Ce9uw+IkJ2Zkeq8aa2kNgfwMv1jSkrD93ETQXaznek/wAooACdJCYBXt1EUCH
	GuoUU6wdsyBKmq2z6IhprkuJhwyI8iByhGfxz33LD8oxgD8y/ud0vVA6QxNHh3aHLg277rlmS
	KA8PEHmSO1Dm81vVd4ycYtUv4h6SbAI3pPmhgshg6hD1s5DVc90VToCjkbwexabv5gWqGGw26
	ly3TnPVzhXw78nEXasucbxvEe9PEFl6NDe5HkC7++YbXHfsJC6o6jiSEYHA5p3Fv0PurHbl5i
	hFcjMH/Y+h0p6ROVcHmuhKzAKtsoWbks6nvOtBIxrWaFKQXNp1BbBWKpGCgEriHBv3qCd6bZM
	KeV/TthIi3kKrUDOTYKAlZC434skvQSpN7sNGRSK+VY8x3GVr9HX/EEsE+5N5I+/d1xvutIjM
	YtEj80kO/6pgAT/DADLAVaAP6IIcX23aSFPO5nCkvbGmD6xgSMk9lJj7qERLSAaAe2q8WwaPh
	k/Rq/I2U1i/oXlv81lB288jkFzm05RmJ58YnvdD1M/9rvvBIbPxyRs9x8sA=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.130
Subject: Re: [Qemu-trivial] [PATCH] cutils: Assert in-range base for
 string-to-integer conversions
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
X-List-Received-Date: Thu, 06 Dec 2018 16:42:33 -0000

Le 06/12/2018 à 17:40, Laurent Vivier a écrit :
> Le 06/12/2018 à 16:18, Eric Blake a écrit :
>> POSIX states that the value of endptr is unspecified if strtol()
>> fails with EINVAL due to an invalid base argument.  Since none of
>> the callers to check_strtox_error() initialized endptr, we could
>> end up propagating uninitialized data back to a caller on error.
>> However, passing an out-of-range base is already a sign of poor
>> programming, so let's just assert that base is in range, at which
>> point check_strtox_error() can be tightened to assert that it is
>> receiving an initialized ep that points somewhere within the
>> caller's original string, regardless of whether strto*() succeeded
>> or failed with ERANGE.
>>
>> Reported-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
>> Signed-off-by: Eric Blake <eblake@redhat.com>
>> ---
>>
>> Also tested that this does not negatively impact David's pending
>> additions of qemu_strtod{,_finite}().  Thus:
>> Based-on: <20181121164421.20780-1-david@redhat.com>
>>
>>  util/cutils.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/util/cutils.c b/util/cutils.c
>> index 91930d1bbeb..e098debdc0c 100644
>> --- a/util/cutils.c
>> +++ b/util/cutils.c
>> @@ -278,6 +278,7 @@ int qemu_strtosz_metric(const char *nptr, const char **end, uint64_t *result)
>>  static int check_strtox_error(const char *nptr, char *ep,
>>                                const char **endptr, int libc_errno)
>>  {
>> +    assert(ep >= nptr);
>>      if (endptr) {
>>          *endptr = ep;
>>      }
>> @@ -325,6 +326,7 @@ int qemu_strtoi(const char *nptr, const char **endptr, int base,
>>      char *ep;
>>      long long lresult;
>>
>> +    assert((unsigned) base <= 36 && base != 1);
> 
> If you want to play with type, I think you can do:
> 
>    assert((unsigned)(base - 2) <= 34)

oops, no, '0' is a valid case. Forgive this...

Laurent


