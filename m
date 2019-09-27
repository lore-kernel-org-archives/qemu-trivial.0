Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iDpnO-0006Ux-U6
	for mharc-qemu-trivial@gnu.org; Fri, 27 Sep 2019 08:56:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53383)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iDpnL-0006Pr-7S
 for qemu-trivial@nongnu.org; Fri, 27 Sep 2019 08:56:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iDpnJ-0002Be-Tc
 for qemu-trivial@nongnu.org; Fri, 27 Sep 2019 08:56:22 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:44717)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1iDpnJ-0002Ba-KX
 for qemu-trivial@nongnu.org; Fri, 27 Sep 2019 08:56:21 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mwfeu-1hykaN0K6M-00y5Ya; Fri, 27 Sep 2019 13:47:57 +0200
Subject: Re: [PATCH 2/3] event_notifier: avoid dandling file descriptor in
 event_notifier_cleanup
To: Frediano Ziglio <fziglio@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-trivial@nongnu.org
References: <20190927103233.20901-1-fziglio@redhat.com>
 <20190927103233.20901-2-fziglio@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c35ce958-6981-bc8d-9d56-699f884df86d@vivier.eu>
Date: Fri, 27 Sep 2019 13:47:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190927103233.20901-2-fziglio@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8SEZ23YvbxW+hwh6yOFWuEZM0si8btB9SKlVWP54wxK5ViFuPTT
 9YRL3HVFmcyZ2ydeNX60QCY6ShXsdCkVRvgGq3qEx2by8V42cFhL8sAs8RvAehX7iidNxyn
 KjVAK8cgURSr90D+JAdo1zUA7TmHPp6Fk6Zl2yy3TBKN78PSIxrfnx0FmnyajaLb2UzT04T
 /oQPQL2BkkLghjD60BEYA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:o+g2RfsWxHI=:KRCYwqu1NL7s4aJoDC/CIr
 P7r408KSG7iHNcjiVW4sL6B/2evm5jWYdLmm3gv99roJ+Suya+pqM7IMaD3Ov1jB2H66rKaST
 HvSbldra5zKuvSgb1qe86bgBJ08xUvvutAnFwN/A+/tQ2+L3OviX4TwrrAzJh51hzziTz8Wh0
 42SAEZpldTjc/GMqgKEY8rd0DKgT2DtOFd7XMFJdAh7PtREbGMc1aygHvEKNjY6IWhbvjqoc3
 W3YxH+WUCYOUhxglmhwAp0OwT6E1aCaTY2LrHHjZiK/PNyvLOia8yYi7yxU5iBKVWcloyAeyx
 ESGwmOPeiWM4OgyFEQH/p7c7Rj6GHJ/TYrixBrInJp2J0KIQqW31bxWHkfiEADOibClvTqO60
 eVqZh/lLNAu/nzOQH2zyPgSdRd3zA/hD8wXB0CK8UHAbOObJyE4n3hgLFwUdVqDac9RzgcAdH
 H6gF+LWR/iQK16eghA8shmsfLV0JgmM/SY//b3gyNWd38Be4NK7YGLQ4h4LLCZMHDbjC9UPQo
 WvCN72MD38OuFL7WELud3Om4OuISuYt0z1S3VwGyZCMkPwoDm+8k5AKYm9rYfWUg/22D+mLX1
 tLnncqSqFJ2u13y+OGQfv0dzvvPvMNZf48s//4VNr9kKIcYgDvad7Q4LIBtFQZZCy14cl/nU6
 intUTVQ1cMpe2+MllRl4z7/4Wmh+p//PBTWsCE7XA80jFyUyKELC0ykcBl+tfUxxLsbp+DF0e
 ceiS6qob8UdsWqMzn6hb6rCqJsFCo2S5lREhT8SLIM1PDC8cT9pJhWJZnmI3SdrTqjMOA6zGW
 KeNhcP6okwP4WU4lW+km2SgBOIDMddzfDne2No5RF8k69WvUTTmy0z1I7pdKx1MJIdwN6aczu
 0IhH6pC0h/mDwYightefLTnDdEtXIuzMUOpWzuBUY=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 217.72.192.73
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Sep 2019 12:56:25 -0000

Le 27/09/2019 à 12:32, Frediano Ziglio a écrit :
> If rfd is equal to wfd the file descriptor is closed but
> rfd will still have the closed value.
> The EventNotifier structure should not be used again after calling
> event_notifier_cleanup or should be initialized again but make
> sure to not have dandling file descriptors around.
> 
> Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
> ---
>  util/event_notifier-posix.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/util/event_notifier-posix.c b/util/event_notifier-posix.c
> index 73c4046b58..00d93204f9 100644
> --- a/util/event_notifier-posix.c
> +++ b/util/event_notifier-posix.c
> @@ -80,8 +80,8 @@ void event_notifier_cleanup(EventNotifier *e)
>  {
>      if (e->rfd != e->wfd) {
>          close(e->rfd);
> -        e->rfd = -1;
>      }
> +    e->rfd = -1;
>      close(e->wfd);
>      e->wfd = -1;
>  }
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

