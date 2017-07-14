Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVsC9-000271-8r
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 00:27:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53762)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dVsC7-00025T-0Y
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 00:27:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dVsC3-0003cn-Ti
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 00:27:11 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:36665)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dVsC3-0003ce-PY; Fri, 14 Jul 2017 00:27:07 -0400
Received: by mail-qt0-x243.google.com with SMTP id v31so8667689qtb.3;
	Thu, 13 Jul 2017 21:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=HNKB5sjb+Ndz1KKHRse4MJ35nbPegCY2srVG9GtTofo=;
	b=coR9gPwWGIoOIM3OGkYJ6zdewXZTeZe94cRI6mrNcJ9TUIXTh2h77S3jEx3YVw1veq
	G1oEq2KismUdBtwQ936XrX2TgF27u+rZB62YCfPBaUITld/YJoIw2bDZhSRRVLE+LDc8
	40/POq0jPw01UmUzp0AhVdT3VwCzVSZoybl9o63pzOVS1oxm1pqSBKTXoVXhFAy7jIYO
	+jYM0nQK5EmHklqEKfpZksSpPy8OJYteyaZGh333u30rhjJxr18Mhdk56yya9b1j9un8
	FqvUCawepwH9qq3biu4ckBhwLnBts1G5/tDCwGuANTsZ8UJLlG4CdU4hbKXCSAzBRvPK
	Se+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=HNKB5sjb+Ndz1KKHRse4MJ35nbPegCY2srVG9GtTofo=;
	b=CO8qjE2CXbVAcNXqyZ0qbDkJFXkWm560xpRn6H164ozZYvQNQ/T241NQfXXYlcN5Io
	k9Px04AE/gu6s8OlU3nOI2O1XczppFImrjrjiTjknLanQkiub29MkEIJUp52Vjypm1hl
	CDIPb9rWt327O1UvWo3qv2kYcnr1TdjPzmkKhapbIY+CR0t9LuATtsc4RufVP5IbMWXn
	f7DBmvd+wU1lc+bAhDMbL0aVstomNPpI+fpjCQ7ZfNjOVNs7QCYS+q4qXREZ41RtyHqV
	OXjZHVNmtcJgcc5c5uNEwTBlI6hmBHCpA35J50CQlMXWamfPVb98X11abm269xZFvKiV
	Xp2g==
X-Gm-Message-State: AIVw113vliscMTiaY31GNrscoqhtIl3SZvE5Thq8GaDe3xpT/snxFQVU
	p066B8iYnsG3dcAPsM0=
X-Received: by 10.237.48.65 with SMTP id 59mr9819080qte.10.1500006427264;
	Thu, 13 Jul 2017 21:27:07 -0700 (PDT)
Received: from [192.168.1.240] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	l15sm5898523qtb.51.2017.07.13.21.27.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 13 Jul 2017 21:27:06 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-29-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7d21bf8e-38af-e8de-9fc6-46cfc382a855@amsat.org>
Date: Fri, 14 Jul 2017 01:27:04 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-29-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 28/29] test-iov: replace
 g_malloc()+memcpy() with g_memdup()
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
X-List-Received-Date: Fri, 14 Jul 2017 04:27:12 -0000

On 07/13/2017 01:32 PM, Marc-André Lureau wrote:
> I found these pattern via grepping the source tree. I don't have a
> coccinelle script for it!
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   tests/test-iov.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tests/test-iov.c b/tests/test-iov.c
> index a22d71fd2c..fa3d75aee1 100644
> --- a/tests/test-iov.c
> +++ b/tests/test-iov.c
> @@ -167,8 +167,7 @@ static void test_io(void)
>       }
>       iov_from_buf(iov, niov, 0, buf, sz);
>   
> -    siov = g_malloc(sizeof(*iov) * niov);
> -    memcpy(siov, iov, sizeof(*iov) * niov);
> +    siov = g_memdup(iov, sizeof(*iov) * niov);
>   
>       if (socketpair(PF_UNIX, SOCK_STREAM, 0, sv) < 0) {
>          perror("socketpair");
> 

