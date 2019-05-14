Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hQTbn-0004Ix-6M
	for mharc-qemu-trivial@gnu.org; Tue, 14 May 2019 05:20:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34746)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hQTbk-0004IX-Iy
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 05:20:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hQTbi-0003X9-Lg
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 05:20:24 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37705)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hQTbh-0003Sv-RK
	for qemu-trivial@nongnu.org; Tue, 14 May 2019 05:20:22 -0400
Received: by mail-wr1-f65.google.com with SMTP id e15so5923387wrs.4
	for <qemu-trivial@nongnu.org>; Tue, 14 May 2019 02:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=sAUI9Ml8kSnqYgbTKXOJBPeu6BElRZA0RRRwW7fCELQ=;
	b=eovEEsBNo47/s+LWFwRobUIzvNptHeaSTPZyeTsJW/tWIF/62341xn6YHXIgYgNkWY
	QnA+c7pMvSWLi7CAdkr7OeVrDGZ5A/0XxsgbK1pGPaQvGVNpyK49Riov14gBMSnuaZ8s
	6fFBUjDSL2EbmIqkIzWkEPCwacjs/6EIUKAg8883FqWEdJ6ePf+Jjl8IG3ZotlEyfO8v
	egcvGO12m+S3pwJv4w3YyXz5+l4AUdi474X9bY9snIrHvnH82iRm6llls2Kv8OrNKwPX
	E1AlbIKDnHNDB9FrY1XeCFyuhWip+3QKAwtPMdmxtE2TItk/Ec70e87Pjnp5dAFRYUmV
	IsUw==
X-Gm-Message-State: APjAAAVlDp7D3o5PEsLEPOL5qvurKTcxqdl04DkebmNYLmaQsN+ZE8yf
	fTZTXw5cznsQfLFtsdAhoFQkRQ==
X-Google-Smtp-Source: APXvYqwsGnI9mDbdoiGhU5xri20O8MvTImxLKbTUu4oBJ43h9Ko4QfaLTcSX73FQYsGS81Zzd7TtDw==
X-Received: by 2002:adf:e288:: with SMTP id v8mr15635339wri.7.1557825620296;
	Tue, 14 May 2019 02:20:20 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193])
	by smtp.gmail.com with ESMTPSA id n1sm1801146wmc.19.2019.05.14.02.20.19
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 May 2019 02:20:19 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Laurent Vivier <lvivier@redhat.com>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20190513154759.24973-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <12b999e9-8ed6-ca03-47c1-4973955798ea@redhat.com>
Date: Tue, 14 May 2019 11:20:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190513154759.24973-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests/libqtest: Fix
 description of qtest_vinitf() and qtest_initf()
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
X-List-Received-Date: Tue, 14 May 2019 09:20:25 -0000

On 5/13/19 5:47 PM, Thomas Huth wrote:
> These functions are convenience wrappers of qtest_init() and not of
> qtest_start().

Maybe "The qtest_vinitf() and qtest_initf() functions are convenience
wrappers of qtest_init() and not of qtest_start()." as it is easier to
read the commit description in some git review tools (gitk i.e.).

> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  tests/libqtest.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/libqtest.h b/tests/libqtest.h
> index 3f7675fcf0..a98ea15b7d 100644
> --- a/tests/libqtest.h
> +++ b/tests/libqtest.h
> @@ -29,7 +29,7 @@ extern QTestState *global_qtest;
>   * @fmt...: Format for creating other arguments to pass to QEMU, formatted
>   * like sprintf().
>   *
> - * Convenience wrapper around qtest_start().
> + * Convenience wrapper around qtest_init().
>   *
>   * Returns: #QTestState instance.
>   */
> @@ -41,7 +41,7 @@ QTestState *qtest_initf(const char *fmt, ...) GCC_FMT_ATTR(1, 2);
>   * like vsprintf().
>   * @ap: Format arguments.
>   *
> - * Convenience wrapper around qtest_start().
> + * Convenience wrapper around qtest_init().
>   *
>   * Returns: #QTestState instance.
>   */
> 

