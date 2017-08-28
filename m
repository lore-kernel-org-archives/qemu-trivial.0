Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dmKC4-0007Kw-Li
	for mharc-qemu-trivial@gnu.org; Mon, 28 Aug 2017 09:35:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57834)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dmKC1-0007HQ-IP
	for qemu-trivial@nongnu.org; Mon, 28 Aug 2017 09:35:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dmKBz-0008V6-VS
	for qemu-trivial@nongnu.org; Mon, 28 Aug 2017 09:35:05 -0400
Received: from mail-vk0-x243.google.com ([2607:f8b0:400c:c05::243]:37724)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1dmKBz-0008Us-P8; Mon, 28 Aug 2017 09:35:03 -0400
Received: by mail-vk0-x243.google.com with SMTP id z187so196867vkd.4;
	Mon, 28 Aug 2017 06:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HNyz/cS9mEmerBg1EhbE2BvUmXqn1q3+GgKdf31dpXo=;
	b=ZTxbXTROSAMQe1lJy7Joh6EThX9AStjxJCwGqusbsKclY0eEeC+EirxR6k2ty8osoo
	CDpG5FvO1NUo9Wbxe0WI745iXyG1O31gZCSynA28KnZn4JClUP8GJkNloNpK+R0o/4We
	tOdnYBSTqTppoD6ZOCHMqnszY9s1olOGQOKFRb1OBRZ8mUf+D8tZRtgpYebFdZbbGQJV
	u3Fcn6yXswlpMSG8VZSzQ1ZqBLFXdr6XH/XxJdmqDUY2g+ZyjS2bY3uUlvdDSHnOjGhs
	63qax8xV5WjCX2Mlo+HrbytwoR/SqhEIbkIEKRGT4aqwHUcdcJQFPC/FbXf2TFRi3vyA
	b8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HNyz/cS9mEmerBg1EhbE2BvUmXqn1q3+GgKdf31dpXo=;
	b=qSu3aksSErF+FJIrP5+9+lY/XN5V6rzRx4eceF0zf6vTS1A0qmYMpNzQiGP7PmYQM0
	5CR7n6E807qE/hPesiRMFAUt6AmZgvbIutlvN755+YtTBrn57F1pB0C2mL0tjREQV1AL
	Jry15WQkymfcCZbVRuo6C1emwrdkIWobtuE2PHRZVLIB5h/rUVyl9IQ1aC3cbQdJutAQ
	jgK/IiC9eOrJWmAufEyYO4rIyOa8vAMw+aCueJuOo7pSPUo2/xQvUbKoTFYYHf5Jf3sU
	Yl/exz6oHra+JCoBrATdWPLTV260IUdT07UzXC/BiQ3f7yHjtfiKJvkc4feXD6VNVEB1
	2mFA==
X-Gm-Message-State: AHYfb5jbToOMxyJWtbHMSY+3TmbWLhTEo3kZ+mj7LS7KxhG9SmqLiucC
	eM5b1eiBtHFLsKfgU3u/cmkoH67ABA==
X-Received: by 10.31.133.131 with SMTP id h125mr278844vkd.61.1503927303125;
	Mon, 28 Aug 2017 06:35:03 -0700 (PDT)
MIME-Version: 1.0
References: <20170828113737.12199-1-f4bug@amsat.org>
In-Reply-To: <20170828113737.12199-1-f4bug@amsat.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 28 Aug 2017 13:34:52 +0000
Message-ID: <CAJ+F1CKL67s4eEYa5N0yy7xZj8NBsmzjRwADJJtDuhAAOiOE2A@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	"Daniel P . Berrange" <berrange@redhat.com>,
	Longpeng <longpeng2@huawei.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="001a1143dc66abc05a0557d05cc8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests: fix incorrect size_t
 format in benchmark-crypto
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
X-List-Received-Date: Mon, 28 Aug 2017 13:35:07 -0000

--001a1143dc66abc05a0557d05cc8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 28, 2017 at 1:38 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

>   $ make check-speed
>   tests/benchmark-crypto-hash.c: In function 'test_hash_speed':
>   tests/benchmark-crypto-hash.c:44:5: error: format '%ld' expects argumen=
t
> of type 'long int', but argument 2 has type 'size_t' [-Werror=3Dformat=3D=
]
>        g_print("Testing chunk_size %ld bytes ", chunk_size);
>        ^
>   tests/benchmark-crypto-hash.c: In function 'main':
>   tests/benchmark-crypto-hash.c:62:9: error: format '%lu' expects argumen=
t
> of type 'long unsigned int', but argument 4 has type 'size_t'
> [-Werror=3Dformat=3D]
>            snprintf(name, sizeof(name), "/crypto/hash/speed-%lu", i);
>            ^
>   cc1: all warnings being treated as errors
>   rules.mak:66: recipe for target 'tests/benchmark-crypto-hash.o' failed
>   make: *** [tests/benchmark-crypto-hash.o] Error 1
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>

 Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
> testing v2.10.0-rc4
>
>  tests/benchmark-crypto-cipher.c | 4 ++--
>  tests/benchmark-crypto-hash.c   | 4 ++--
>  tests/benchmark-crypto-hmac.c   | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/tests/benchmark-crypto-cipher.c
> b/tests/benchmark-crypto-cipher.c
> index c6a40929e4..cf98443468 100644
> --- a/tests/benchmark-crypto-cipher.c
> +++ b/tests/benchmark-crypto-cipher.c
> @@ -59,7 +59,7 @@ static void test_cipher_speed(const void *opaque)
>      total /=3D 1024 * 1024; /* to MB */
>
>      g_print("cbc(aes128): ");
> -    g_print("Testing chunk_size %ld bytes ", chunk_size);
> +    g_print("Testing chunk_size %zu bytes ", chunk_size);
>      g_print("done: %.2f MB in %.2f secs: ", total, g_test_timer_last());
>      g_print("%.2f MB/sec\n", total / g_test_timer_last());
>
> @@ -80,7 +80,7 @@ int main(int argc, char **argv)
>
>      for (i =3D 512; i <=3D (64 * 1204); i *=3D 2) {
>          memset(name, 0 , sizeof(name));
> -        snprintf(name, sizeof(name), "/crypto/cipher/speed-%lu", i);
> +        snprintf(name, sizeof(name), "/crypto/cipher/speed-%zu", i);
>          g_test_add_data_func(name, (void *)i, test_cipher_speed);
>      }
>
> diff --git a/tests/benchmark-crypto-hash.c b/tests/benchmark-crypto-hash.=
c
> index 6769d2a11b..122bfb6b85 100644
> --- a/tests/benchmark-crypto-hash.c
> +++ b/tests/benchmark-crypto-hash.c
> @@ -41,7 +41,7 @@ static void test_hash_speed(const void *opaque)
>
>      total /=3D 1024 * 1024; /* to MB */
>      g_print("sha256: ");
> -    g_print("Testing chunk_size %ld bytes ", chunk_size);
> +    g_print("Testing chunk_size %zu bytes ", chunk_size);
>      g_print("done: %.2f MB in %.2f secs: ", total, g_test_timer_last());
>      g_print("%.2f MB/sec\n", total / g_test_timer_last());
>
> @@ -59,7 +59,7 @@ int main(int argc, char **argv)
>
>      for (i =3D 512; i <=3D (64 * 1204); i *=3D 2) {
>          memset(name, 0 , sizeof(name));
> -        snprintf(name, sizeof(name), "/crypto/hash/speed-%lu", i);
> +        snprintf(name, sizeof(name), "/crypto/hash/speed-%zu", i);
>          g_test_add_data_func(name, (void *)i, test_hash_speed);
>      }
>
> diff --git a/tests/benchmark-crypto-hmac.c b/tests/benchmark-crypto-hmac.=
c
> index 72408be987..c30250df3e 100644
> --- a/tests/benchmark-crypto-hmac.c
> +++ b/tests/benchmark-crypto-hmac.c
> @@ -56,7 +56,7 @@ static void test_hmac_speed(const void *opaque)
>      total /=3D 1024 * 1024; /* to MB */
>
>      g_print("hmac(sha256): ");
> -    g_print("Testing chunk_size %ld bytes ", chunk_size);
> +    g_print("Testing chunk_size %zu bytes ", chunk_size);
>      g_print("done: %.2f MB in %.2f secs: ", total, g_test_timer_last());
>      g_print("%.2f MB/sec\n", total / g_test_timer_last());
>
> @@ -74,7 +74,7 @@ int main(int argc, char **argv)
>
>      for (i =3D 512; i <=3D (64 * 1204); i *=3D 2) {
>          memset(name, 0 , sizeof(name));
> -        snprintf(name, sizeof(name), "/crypto/hmac/speed-%lu", i);
> +        snprintf(name, sizeof(name), "/crypto/hmac/speed-%zu", i);
>          g_test_add_data_func(name, (void *)i, test_hmac_speed);
>      }
>
> --
> 2.14.1
>
>
> --
Marc-Andr=C3=A9 Lureau

--001a1143dc66abc05a0557d05cc8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon=
, Aug 28, 2017 at 1:38 PM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto=
:f4bug@amsat.org">f4bug@amsat.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">=C2=A0 $ make check-speed<br>
=C2=A0 tests/benchmark-crypto-hash.c: In function &#39;test_hash_speed&#39;=
:<br>
=C2=A0 tests/benchmark-crypto-hash.c:44:5: error: format &#39;%ld&#39; expe=
cts argument of type &#39;long int&#39;, but argument 2 has type &#39;size_=
t&#39; [-Werror=3Dformat=3D]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0g_print(&quot;Testing chunk_size %ld bytes &quot=
;, chunk_size);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
=C2=A0 tests/benchmark-crypto-hash.c: In function &#39;main&#39;:<br>
=C2=A0 tests/benchmark-crypto-hash.c:62:9: error: format &#39;%lu&#39; expe=
cts argument of type &#39;long unsigned int&#39;, but argument 4 has type &=
#39;size_t&#39; [-Werror=3Dformat=3D]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0snprintf(name, sizeof(name), &quot=
;/crypto/hash/speed-%lu&quot;, i);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^<br>
=C2=A0 cc1: all warnings being treated as errors<br>
=C2=A0 rules.mak:66: recipe for target &#39;tests/benchmark-crypto-hash.o&#=
39; failed<br>
=C2=A0 make: *** [tests/benchmark-crypto-hash.o] Error 1<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br></blockquote><div><br><=
/div><div>=C2=A0Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:m=
arcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;<div style=
=3D"color:rgb(0,0,0);font-family:-webkit-standard;font-style:normal;font-va=
riant-caps:normal;font-weight:normal;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px"><=
br class=3D"inbox-inbox-Apple-interchange-newline"></div></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex">
---<br>
testing v2.10.0-rc4<br>
<br>
=C2=A0tests/benchmark-crypto-cipher.c | 4 ++--<br>
=C2=A0tests/benchmark-crypto-hash.c=C2=A0 =C2=A0| 4 ++--<br>
=C2=A0tests/benchmark-crypto-hmac.c=C2=A0 =C2=A0| 4 ++--<br>
=C2=A03 files changed, 6 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/tests/benchmark-crypto-cipher.c b/tests/benchmark-crypto-ciphe=
r.c<br>
index c6a40929e4..cf98443468 100644<br>
--- a/tests/benchmark-crypto-cipher.c<br>
+++ b/tests/benchmark-crypto-cipher.c<br>
@@ -59,7 +59,7 @@ static void test_cipher_speed(const void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0total /=3D 1024 * 1024; /* to MB */<br>
<br>
=C2=A0 =C2=A0 =C2=A0g_print(&quot;cbc(aes128): &quot;);<br>
-=C2=A0 =C2=A0 g_print(&quot;Testing chunk_size %ld bytes &quot;, chunk_siz=
e);<br>
+=C2=A0 =C2=A0 g_print(&quot;Testing chunk_size %zu bytes &quot;, chunk_siz=
e);<br>
=C2=A0 =C2=A0 =C2=A0g_print(&quot;done: %.2f MB in %.2f secs: &quot;, total=
, g_test_timer_last());<br>
=C2=A0 =C2=A0 =C2=A0g_print(&quot;%.2f MB/sec\n&quot;, total / g_test_timer=
_last());<br>
<br>
@@ -80,7 +80,7 @@ int main(int argc, char **argv)<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 512; i &lt;=3D (64 * 1204); i *=3D 2) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(name, 0 , sizeof(name));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(name, sizeof(name), &quot;/crypto/cip=
her/speed-%lu&quot;, i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(name, sizeof(name), &quot;/crypto/cip=
her/speed-%zu&quot;, i);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_test_add_data_func(name, (void *)i, tes=
t_cipher_speed);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
diff --git a/tests/benchmark-crypto-hash.c b/tests/benchmark-crypto-hash.c<=
br>
index 6769d2a11b..122bfb6b85 100644<br>
--- a/tests/benchmark-crypto-hash.c<br>
+++ b/tests/benchmark-crypto-hash.c<br>
@@ -41,7 +41,7 @@ static void test_hash_speed(const void *opaque)<br>
<br>
=C2=A0 =C2=A0 =C2=A0total /=3D 1024 * 1024; /* to MB */<br>
=C2=A0 =C2=A0 =C2=A0g_print(&quot;sha256: &quot;);<br>
-=C2=A0 =C2=A0 g_print(&quot;Testing chunk_size %ld bytes &quot;, chunk_siz=
e);<br>
+=C2=A0 =C2=A0 g_print(&quot;Testing chunk_size %zu bytes &quot;, chunk_siz=
e);<br>
=C2=A0 =C2=A0 =C2=A0g_print(&quot;done: %.2f MB in %.2f secs: &quot;, total=
, g_test_timer_last());<br>
=C2=A0 =C2=A0 =C2=A0g_print(&quot;%.2f MB/sec\n&quot;, total / g_test_timer=
_last());<br>
<br>
@@ -59,7 +59,7 @@ int main(int argc, char **argv)<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 512; i &lt;=3D (64 * 1204); i *=3D 2) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(name, 0 , sizeof(name));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(name, sizeof(name), &quot;/crypto/has=
h/speed-%lu&quot;, i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(name, sizeof(name), &quot;/crypto/has=
h/speed-%zu&quot;, i);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_test_add_data_func(name, (void *)i, tes=
t_hash_speed);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
diff --git a/tests/benchmark-crypto-hmac.c b/tests/benchmark-crypto-hmac.c<=
br>
index 72408be987..c30250df3e 100644<br>
--- a/tests/benchmark-crypto-hmac.c<br>
+++ b/tests/benchmark-crypto-hmac.c<br>
@@ -56,7 +56,7 @@ static void test_hmac_speed(const void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0total /=3D 1024 * 1024; /* to MB */<br>
<br>
=C2=A0 =C2=A0 =C2=A0g_print(&quot;hmac(sha256): &quot;);<br>
-=C2=A0 =C2=A0 g_print(&quot;Testing chunk_size %ld bytes &quot;, chunk_siz=
e);<br>
+=C2=A0 =C2=A0 g_print(&quot;Testing chunk_size %zu bytes &quot;, chunk_siz=
e);<br>
=C2=A0 =C2=A0 =C2=A0g_print(&quot;done: %.2f MB in %.2f secs: &quot;, total=
, g_test_timer_last());<br>
=C2=A0 =C2=A0 =C2=A0g_print(&quot;%.2f MB/sec\n&quot;, total / g_test_timer=
_last());<br>
<br>
@@ -74,7 +74,7 @@ int main(int argc, char **argv)<br>
<br>
=C2=A0 =C2=A0 =C2=A0for (i =3D 512; i &lt;=3D (64 * 1204); i *=3D 2) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memset(name, 0 , sizeof(name));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(name, sizeof(name), &quot;/crypto/hma=
c/speed-%lu&quot;, i);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 snprintf(name, sizeof(name), &quot;/crypto/hma=
c/speed-%zu&quot;, i);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_test_add_data_func(name, (void *)i, tes=
t_hmac_speed);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
--<br>
2.14.1<br>
<br>
<br>
</blockquote></div></div><div dir=3D"ltr">-- <br></div><div class=3D"gmail_=
signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Marc-Andr=C3=
=A9 Lureau<br></div></div>

--001a1143dc66abc05a0557d05cc8--

