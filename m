Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dmNPT-00024v-4f
	for mharc-qemu-trivial@gnu.org; Mon, 28 Aug 2017 13:01:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51930)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dmNPP-000240-Rt
	for qemu-trivial@nongnu.org; Mon, 28 Aug 2017 13:01:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dmNPK-0003jg-61
	for qemu-trivial@nongnu.org; Mon, 28 Aug 2017 13:01:07 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:36872)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dmNPK-0003iD-10; Mon, 28 Aug 2017 13:01:02 -0400
Received: by mail-qt0-x244.google.com with SMTP id g13so921580qta.4;
	Mon, 28 Aug 2017 10:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=cNbCUhQYoPxF/DxZswBnTo0OlJazxYo7IFNj/1qzCMU=;
	b=C1jNhvNMew2nj6inxPCZLNWaaxjgRo5cfYu6+baHGIYmrFKFrtBZldNnJvs/G73UqC
	2NSL25yKZ4IjaLN3EP3D16XlhW7EUDqZRDvanlNZ6rARjmaFK1brMa+D6uxpaLPram/C
	QrXVK8wXpr4/MadPw6pyj2qetQza0eBtW4v88qe69fcdFN3hvrdU3r0SpziuUdPBim6Q
	/UcjBGViWY29PR7R7zJKTWrtTiFdMfC5XQJSvPXbwwPFaiz+8OrCBG/rssfIL6d/gY1N
	T/6KDug73CTXcaolK/MkPv4Pb1GoqTCrtRPnZ3X6GpxGAjz6enZm0S6uWKHjVnA7Ea/R
	ksag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=cNbCUhQYoPxF/DxZswBnTo0OlJazxYo7IFNj/1qzCMU=;
	b=JSzYpMZjhlpZ7CJk58pMCzXb53DPsNMGxgjWAqrHVRuKvRNrvIRax0gq0Bf3u5OrgQ
	y0HCabkA58PZjllNnBv6An3dWOwhgtRHusHDEoRospwM1XntfvGgig6qLUpt6lq3RyK3
	QHI5LWY76hmBNCiHRxPq6tNEOWPeGqenyMiGmfly/05I5ROTXXhLW+hYWtwhUIeG89Bb
	yRO5lFWfpnakKqRqKL6Bn5nmxm5HxWcINS3ViLhOkPajrapzaMS+dh3fqBho/fbzFZvs
	w6VbK6eJZBKuwIMZtlg73tiKkQmy32IGnXeGirr9ruOXDqAqrgv+rNcjNK8sOSzibOW6
	D5nA==
X-Gm-Message-State: AHPjjUhLs9Ev/eD8aF2HD0o3UEVaDpEYmoDYwzD5UbejpLIcOxlCRzk1
	OTOzUNevDitGJA==
X-Received: by 10.237.63.9 with SMTP id p9mr1853279qtf.109.1503939661303;
	Mon, 28 Aug 2017 10:01:01 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id 92sm546243qta.42.2017.08.28.10.00.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Aug 2017 10:00:57 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>
References: <1503916557-1292-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <89648d53-987c-c0a7-bed8-a93a63fde2a2@amsat.org>
Date: Mon, 28 Aug 2017 14:00:54 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1503916557-1292-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests/libqtest: Use a
 proper error message if QTEST_QEMU_BINARY is missing
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
X-List-Received-Date: Mon, 28 Aug 2017 17:01:09 -0000

On 08/28/2017 07:35 AM, Thomas Huth wrote:
> The user can currently still cause an abort() if running certain tests
> (like the prom-env-test) without setting the QTEST_QEMU_BINARY first.
> A similar problem has been fixed with commit 7c933ad61b8f3f51337
> already, but forgot to also take care of the qtest_get_arch() function,
> so let's introduce a proper wrapper around getenv("QTEST_QEMU_BINARY")
> that can be used in both locations now.
> 
> Buglink: https://bugs.launchpad.net/qemu/+bug/1713434
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   tests/libqtest.c | 24 +++++++++++++++---------
>   1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/libqtest.c b/tests/libqtest.c
> index b9a1f18..342a77b 100644
> --- a/tests/libqtest.c
> +++ b/tests/libqtest.c
> @@ -150,6 +150,19 @@ void qtest_add_abrt_handler(GHookFunc fn, const void *data)
>       g_hook_prepend(&abrt_hooks, hook);
>   }
>   
> +static const char *qtest_qemu_binary(void)
> +{
> +    const char *qemu_bin;
> +
> +    qemu_bin = getenv("QTEST_QEMU_BINARY");
> +    if (!qemu_bin) {
> +        fprintf(stderr, "Environment variable QTEST_QEMU_BINARY required\n");
> +        exit(1);
> +    }
> +
> +    return qemu_bin;
> +}
> +
>   QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
>   {
>       QTestState *s;
> @@ -157,13 +170,7 @@ QTestState *qtest_init_without_qmp_handshake(const char *extra_args)
>       gchar *socket_path;
>       gchar *qmp_socket_path;
>       gchar *command;
> -    const char *qemu_binary;
> -
> -    qemu_binary = getenv("QTEST_QEMU_BINARY");
> -    if (!qemu_binary) {
> -        fprintf(stderr, "Environment variable QTEST_QEMU_BINARY required\n");
> -        exit(1);
> -    }
> +    const char *qemu_binary = qtest_qemu_binary();
>   
>       s = g_malloc(sizeof(*s));
>   
> @@ -624,8 +631,7 @@ char *qtest_hmp(QTestState *s, const char *fmt, ...)
>   
>   const char *qtest_get_arch(void)
>   {
> -    const char *qemu = getenv("QTEST_QEMU_BINARY");
> -    g_assert(qemu != NULL);
> +    const char *qemu = qtest_qemu_binary();
>       const char *end = strrchr(qemu, '/');
>   
>       return end + strlen("/qemu-system-");
> 

