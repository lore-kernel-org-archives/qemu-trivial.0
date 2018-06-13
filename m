Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fTBr6-0007fF-Lv
	for mharc-qemu-trivial@gnu.org; Wed, 13 Jun 2018 15:54:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41423)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fTBr3-0007ex-Qr
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 15:54:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fTBr0-0000EY-N8
	for qemu-trivial@nongnu.org; Wed, 13 Jun 2018 15:54:53 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:33960)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fTBr0-0000D9-IH; Wed, 13 Jun 2018 15:54:50 -0400
Received: by mail-qk0-x244.google.com with SMTP id q70-v6so2290495qke.1;
	Wed, 13 Jun 2018 12:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=sELpEAollELIDB3AAubqJurIx121OK0dqZwBUXMeUIU=;
	b=S8IicEIQHq9MYD/3MfwGzvryfiwDwT7sEXRZeRIJrWQaMq5Kp3YJ+yyClRvdiH+5Wn
	YcvmqPm/V3jbPvAMZY236lcPaz86e4YVTjpy2OEbgbLaB13vxw/v7CcoTL/WpB+wkKHa
	zTuppOwIHAP5UU3Eom7pTeL3SehsjWjnaMaDX+uzax71AGvi9SAcjlu3iDdUK/8BsDev
	1REebYz+asXdkwkjCBQCa9bUATxTElWxYCutmN+jmeA5IBR5Rn/0f6cM+4xLQ9mp3FnM
	yZ+N7wIB1RhtrMs6VJbE7a6hFnBcajpzGClfcpLE8GpO9JI/Tzcxxbsa67nA8zHkQDNT
	3OHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=sELpEAollELIDB3AAubqJurIx121OK0dqZwBUXMeUIU=;
	b=PdhEXXcYAJYy7oNXnlMlov1luWh7OAGZ0fpVu/rBJDrVNtoUnsXhwelChkOgiE2EiR
	uwe3OHQmDLvoclqKsZ44S0P9mz1G0oxjCpbHaxERStHV+sEr3xj53NjA2Y8A1fWeyP4B
	3UzGjtB8gLhAkB1u2ipR6cVgNU0T3sxF3mPjJozGyqEyAM9Ohw67i9PiszAyUAYQhsJm
	xqOA+aaWJHO/D2VwmimkzV7AKthjmMH2Ae+6K4Y5aCz/L2Gvn9EYOkDcJvn/J/1VkYLT
	rJneaMrsgcRRCDV2q15LP8lMxcC6OUBoCEjz50ecne0ftU1JUocdw6Dyf3RrMOlyC2Lx
	4mbw==
X-Gm-Message-State: APt69E2N7cq1AfUU5shcqB1x7zrk+jOnM6kfYOLStoyjymzbLIz+kjx3
	XrEEwj4/fc6YTBm01dcXCkDJ1sd+
X-Google-Smtp-Source: ADUXVKI4UAN5aMOP7ZNEKLpDFqcpsi6MpE/hT89twPkimYjBtGX3GgUQrzeyOl7YnxyLg1CDHhhZ0Q==
X-Received: by 2002:a37:5886:: with SMTP id
	m128-v6mr5798697qkb.275.1528919689757; 
	Wed, 13 Jun 2018 12:54:49 -0700 (PDT)
Received: from [192.168.1.124] ([190.177.133.49])
	by smtp.gmail.com with ESMTPSA id
	l66-v6sm2473693qke.69.2018.06.13.12.54.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Jun 2018 12:54:49 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20180611011501.10235-1-f4bug@amsat.org>
	<20180611011501.10235-5-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <896e3c84-3001-23d8-30a1-072763e86297@amsat.org>
Date: Wed, 13 Jun 2018 16:54:44 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180611011501.10235-5-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-trivial] [PATCH v4 04/40] checkpatch: Recognize IEC
 binary prefix definitions
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
X-List-Received-Date: Wed, 13 Jun 2018 19:54:54 -0000

On 06/10/2018 10:14 PM, Philippe Mathieu-Daudé wrote:
> This fixes:
> 
>     ERROR: "foo * bar" should be "foo *bar"
>     #310: FILE: hw/ppc/ppc440_uc.c:564:
>     +        size = 8 * MiB * sh;
>     total: 1 errors, 0 warnings, 433 lines checked
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  scripts/checkpatch.pl | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index e3d8c2cdfc..4923674c71 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -322,6 +322,7 @@ sub build_types {
>  				(?:${all}\b)
>  			)
>  			(?:\s+$Modifier|\s+const)*
> +			(?:[KMGTPE]iB)
>  		  }x;
>  	$Type	= qr{
>  			$NonptrType
> 

Well this patch doesn't work like expected...

$ git diff --cached | \
  scripts/checkpatch.pl --no-signoff --debug values=2 -
 <E> <E> <_>WS(         )
 <E> <E> <_>IDENT(size)
 <E> <V> <_>WS( )
 <E> <V> <_>ASSIGN(=)
 <E> <N> <_>WS( )
 <E> <N> <_>IDENT(8)
 <E> <V> <_>WS( )
 <E> <V> <_>OPV(*)
 <E> <N> <_>WS( )
 <E> <N> <_>DECLARE(MiB * ) <------------
 <E> <T> <_>IDENT(sh)
 <E> <V> <_>END(;)
 <E> <E> <_>WS(
)
22 > .         size = 8 * MiB * sh;
22 > EEEEEEEEEEVVVVVNNVVNNTTTTTTVVEE
22 >  __________________B___________

Which looks OK, but then (example):

$ git diff --cached
diff --git a/include/net/net.h b/include/net/net.h
-void qemu_del_nic(NICState *nic);
+void qemu_del_nic(NICState *test);

$ git diff --cached | \
  scripts/checkpatch.pl --no-signoff --debug values=2 -

 void qemu_del_nic(NICState *test);

 <E> <E> <_>WS( )
 <E> <E> <_>IDENT(void)
 <E> <V> <_>WS( )
 <E> <V> <_>FUNC(qemu_del_nic)
 <E> <V> <V>PAREN('(')
 <EV> <N> <_>IDENT(NICState)
 <EV> <V> <_>WS( )
 <EV> <V> <_>OPV(*)
 <EV> <N> <_>IDENT(test)
 <EV> <V> <_>PAREN(')') -> V
 <E> <V> <_>END(;)
 <E> <E> <_>WS(
)
10 > . void qemu_del_nic(NICState *test);
10 > EEVVVVVVVVVVVVVVVVVNVVVVVVVVVNVVVVVEE
10 >  ____________________________B_______
ERROR: spaces required around that '*' (ctx:WxV)
#10: FILE: include/net/net.h:136:
+void qemu_del_nic(NICState *test);
                            ^

