Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dmaKv-0005qG-W4
	for mharc-qemu-trivial@gnu.org; Tue, 29 Aug 2017 02:49:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50994)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <longpeng2@huawei.com>) id 1dmUHx-0006i6-7h
	for qemu-trivial@nongnu.org; Mon, 28 Aug 2017 20:21:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <longpeng2@huawei.com>) id 1dmUHw-0000bN-60
	for qemu-trivial@nongnu.org; Mon, 28 Aug 2017 20:21:53 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:2305)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <longpeng2@huawei.com>)
	id 1dmUHr-0000Wa-1Z; Mon, 28 Aug 2017 20:21:47 -0400
Received: from 172.30.72.60 (EHLO DGGEMS409-HUB.china.huawei.com)
	([172.30.72.60])
	by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id DGC01483; Tue, 29 Aug 2017 08:21:39 +0800 (CST)
Received: from [127.0.0.1] (10.177.246.209) by DGGEMS409-HUB.china.huawei.com
	(10.3.19.209) with Microsoft SMTP Server id 14.3.301.0;
	Tue, 29 Aug 2017 08:21:34 +0800
Message-ID: <59A4B375.7040307@huawei.com>
Date: Tue, 29 Aug 2017 08:21:09 +0800
From: "Longpeng (Mike)" <longpeng2@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: =?UTF-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>
CC: "Daniel P . Berrange" <berrange@redhat.com>, <qemu-devel@nongnu.org>,
	<qemu-trivial@nongnu.org>
References: <20170828113737.12199-1-f4bug@amsat.org>
In-Reply-To: <20170828113737.12199-1-f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.246.209]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090206.59A4B394.0160, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: 9acc1e3706ae8fb592af440e1e44101c
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.190
X-Mailman-Approved-At: Tue, 29 Aug 2017 02:49:21 -0400
Subject: Re: [Qemu-trivial] [PATCH] tests: fix incorrect size_t format in
 benchmark-crypto
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
X-List-Received-Date: Tue, 29 Aug 2017 00:21:54 -0000



On 2017/8/28 19:37, Philippe Mathieu-Daudé wrote:

>   $ make check-speed
>   tests/benchmark-crypto-hash.c: In function 'test_hash_speed':
>   tests/benchmark-crypto-hash.c:44:5: error: format '%ld' expects argument of type 'long int', but argument 2 has type 'size_t' [-Werror=format=]
>        g_print("Testing chunk_size %ld bytes ", chunk_size);
>        ^
>   tests/benchmark-crypto-hash.c: In function 'main':
>   tests/benchmark-crypto-hash.c:62:9: error: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' [-Werror=format=]
>            snprintf(name, sizeof(name), "/crypto/hash/speed-%lu", i);
>            ^
>   cc1: all warnings being treated as errors
>   rules.mak:66: recipe for target 'tests/benchmark-crypto-hash.o' failed
>   make: *** [tests/benchmark-crypto-hash.o] Error 1
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


Reviewed-by: Longpeng(Mike) <longpeng@@huawei.com>

> ---
> testing v2.10.0-rc4
> 
>  tests/benchmark-crypto-cipher.c | 4 ++--
>  tests/benchmark-crypto-hash.c   | 4 ++--
>  tests/benchmark-crypto-hmac.c   | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/benchmark-crypto-cipher.c b/tests/benchmark-crypto-cipher.c
> index c6a40929e4..cf98443468 100644
> --- a/tests/benchmark-crypto-cipher.c
> +++ b/tests/benchmark-crypto-cipher.c
> @@ -59,7 +59,7 @@ static void test_cipher_speed(const void *opaque)
>      total /= 1024 * 1024; /* to MB */
>  
>      g_print("cbc(aes128): ");
> -    g_print("Testing chunk_size %ld bytes ", chunk_size);
> +    g_print("Testing chunk_size %zu bytes ", chunk_size);
>      g_print("done: %.2f MB in %.2f secs: ", total, g_test_timer_last());
>      g_print("%.2f MB/sec\n", total / g_test_timer_last());
>  
> @@ -80,7 +80,7 @@ int main(int argc, char **argv)
>  
>      for (i = 512; i <= (64 * 1204); i *= 2) {
>          memset(name, 0 , sizeof(name));
> -        snprintf(name, sizeof(name), "/crypto/cipher/speed-%lu", i);
> +        snprintf(name, sizeof(name), "/crypto/cipher/speed-%zu", i);
>          g_test_add_data_func(name, (void *)i, test_cipher_speed);
>      }
>  
> diff --git a/tests/benchmark-crypto-hash.c b/tests/benchmark-crypto-hash.c
> index 6769d2a11b..122bfb6b85 100644
> --- a/tests/benchmark-crypto-hash.c
> +++ b/tests/benchmark-crypto-hash.c
> @@ -41,7 +41,7 @@ static void test_hash_speed(const void *opaque)
>  
>      total /= 1024 * 1024; /* to MB */
>      g_print("sha256: ");
> -    g_print("Testing chunk_size %ld bytes ", chunk_size);
> +    g_print("Testing chunk_size %zu bytes ", chunk_size);
>      g_print("done: %.2f MB in %.2f secs: ", total, g_test_timer_last());
>      g_print("%.2f MB/sec\n", total / g_test_timer_last());
>  
> @@ -59,7 +59,7 @@ int main(int argc, char **argv)
>  
>      for (i = 512; i <= (64 * 1204); i *= 2) {
>          memset(name, 0 , sizeof(name));
> -        snprintf(name, sizeof(name), "/crypto/hash/speed-%lu", i);
> +        snprintf(name, sizeof(name), "/crypto/hash/speed-%zu", i);
>          g_test_add_data_func(name, (void *)i, test_hash_speed);
>      }
>  
> diff --git a/tests/benchmark-crypto-hmac.c b/tests/benchmark-crypto-hmac.c
> index 72408be987..c30250df3e 100644
> --- a/tests/benchmark-crypto-hmac.c
> +++ b/tests/benchmark-crypto-hmac.c
> @@ -56,7 +56,7 @@ static void test_hmac_speed(const void *opaque)
>      total /= 1024 * 1024; /* to MB */
>  
>      g_print("hmac(sha256): ");
> -    g_print("Testing chunk_size %ld bytes ", chunk_size);
> +    g_print("Testing chunk_size %zu bytes ", chunk_size);
>      g_print("done: %.2f MB in %.2f secs: ", total, g_test_timer_last());
>      g_print("%.2f MB/sec\n", total / g_test_timer_last());
>  
> @@ -74,7 +74,7 @@ int main(int argc, char **argv)
>  
>      for (i = 512; i <= (64 * 1204); i *= 2) {
>          memset(name, 0 , sizeof(name));
> -        snprintf(name, sizeof(name), "/crypto/hmac/speed-%lu", i);
> +        snprintf(name, sizeof(name), "/crypto/hmac/speed-%zu", i);
>          g_test_add_data_func(name, (void *)i, test_hmac_speed);
>      }
>  


-- 
Regards,
Longpeng(Mike)


