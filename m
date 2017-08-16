Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dhxtO-0007q5-Us
	for mharc-qemu-trivial@gnu.org; Wed, 16 Aug 2017 08:57:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43517)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1dhxtL-0007nu-TQ
	for qemu-trivial@nongnu.org; Wed, 16 Aug 2017 08:57:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1dhxtL-0005Pa-8s
	for qemu-trivial@nongnu.org; Wed, 16 Aug 2017 08:57:48 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:42958
	helo=v2201612906741603.powersrv.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sw@weilnetz.de>)
	id 1dhxtD-0005MF-VC; Wed, 16 Aug 2017 08:57:40 -0400
Received: from localhost (localhost [127.0.0.1])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id 57364DA5986;
	Wed, 16 Aug 2017 14:57:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
	by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 4xcPy9O1wh3g; Wed, 16 Aug 2017 14:57:37 +0200 (CEST)
Received: from edv32.bib.uni-mannheim.de (x590feeed.dyn.telefonica.de
	[89.15.238.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 38970DA53E8; 
	Wed, 16 Aug 2017 14:57:37 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Cc: qemu-devel@nongnu.org
References: <20170328184959.5550-1-sw@weilnetz.de>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <6a5b9248-312c-cb66-c189-9a3e1651013a@weilnetz.de>
Date: Wed, 16 Aug 2017 14:57:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170328184959.5550-1-sw@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.120.169.71
Subject: Re: [Qemu-trivial] [PATCH for-2.9?] configure: Remove unused code
 (found by shellcheck)
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
X-List-Received-Date: Wed, 16 Aug 2017 12:57:49 -0000

It looks like this patch got lost somehow.

Stefan

See also https://patchwork.codeaurora.org/patch/210129/


Am 28.03.2017 um 20:49 schrieb Stefan Weil:
> smartcard_cflags is no longer needed since commit
> 0b22ef0f57a8910d849602bef0940edcd0553d2c.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> This is a very old patch which I just found in my patch queue.
> It's not mandatory for 2.9, but I also think that there is
> no risk to apply it.
> 
> Sorry for sending it so late.
> 
> Regards
> Stefan
> 
>  configure | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/configure b/configure
> index d1ce33bc79..b65ea2931c 100755
> --- a/configure
> +++ b/configure
> @@ -4096,7 +4096,6 @@ EOF
>  fi
>  
>  # check for smartcard support
> -smartcard_cflags=""
>  if test "$smartcard" != "no"; then
>      if $pkg_config libcacard; then
>          libcacard_cflags=$($pkg_config --cflags libcacard)
> 


