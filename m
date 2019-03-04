Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h0mpA-0005o4-0o
	for mharc-qemu-trivial@gnu.org; Mon, 04 Mar 2019 07:36:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55539)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h0mp8-0005n5-4s
	for qemu-trivial@nongnu.org; Mon, 04 Mar 2019 07:36:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h0mp7-0006DV-4D
	for qemu-trivial@nongnu.org; Mon, 04 Mar 2019 07:36:02 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:51459)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1h0mp6-0006Bx-Tb
	for qemu-trivial@nongnu.org; Mon, 04 Mar 2019 07:36:01 -0500
Received: by mail-wm1-f68.google.com with SMTP id n19so4431785wmi.1
	for <qemu-trivial@nongnu.org>; Mon, 04 Mar 2019 04:36:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=25Iw1Z+oscJoOoClUkF5FXHuSpLmFyoKwBTg45Cvh1g=;
	b=nziN93ZZ53gwGC6K9MORgKsAh37fErnIyprvm6cC09lt3ubgDKiVDts0+BdBehgmkm
	Ca1GlmTsanzCsF8ApyPA9+/o0QSezCzZ604mIV4mxTm4TLAok6H6VYnBDsgJtSHLlcwV
	wIBUPl69i89j7s777XuyEryUbRGnRsxNInTTO4uhSpPuzoAWZpIfDIg/Zu4KHS7s0G+H
	vv7nD3e53EOInFArtlF2i+gKhw5w5EYA5wigjlL77kXX7PQ24nbcY0Cp0xbzzvuweVcA
	9q7SDHpDNsHneX3sIv4+ywaRZq7ZsOkVQndmjEA7lgfPk3h1d9dyo3Z0tZOLhpaVxWDt
	VwGA==
X-Gm-Message-State: AHQUAubg4+09o49CHZ81UsX57WzcYk9XVuju2Qy5YgH/JcIhbMXvgj5c
	asIogwzqF1Sx4oWIEUKZbRk3Qg==
X-Google-Smtp-Source: APXvYqy63e1zX7Gw3Eqzf0CiKqKyrjUUZhHAFymdgikiYod7gIUhhcb5GxOrsFZ/LeGZLAUb3ntvww==
X-Received: by 2002:a7b:cf3a:: with SMTP id m26mr11260077wmg.144.1551702959362;
	Mon, 04 Mar 2019 04:35:59 -0800 (PST)
Received: from [192.168.1.40] (43.red-88-25-181.staticip.rima-tde.net.
	[88.25.181.43]) by smtp.gmail.com with ESMTPSA id
	m16sm5785262wro.78.2019.03.04.04.35.58
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 04:35:58 -0800 (PST)
To: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
References: <20181218113717.29130-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <68d432c9-4cd2-acc0-57d7-209aebc62e82@redhat.com>
Date: Mon, 4 Mar 2019 13:35:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20181218113717.29130-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-trivial] [PATCH] tests: Move qdict-test-data.txt to
 tests/data/qobject/
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
X-List-Received-Date: Mon, 04 Mar 2019 12:36:03 -0000

Cc'ing qemu-trivial@

On 12/18/18 12:37 PM, Philippe Mathieu-Daudé wrote:
> Move qdict-test-data.txt to the tests/data/qobject/ subdirectory,
> and remove the unnecessary symlinking.
> (See 4b2ff65a1f3 for similar test-data cleanup).
> 
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  MAINTAINERS                                         | 1 +
>  configure                                           | 2 +-
>  tests/check-qdict.c                                 | 2 +-
>  qdict-test-data.txt => tests/data/qobject/qdict.txt | 0
>  4 files changed, 3 insertions(+), 2 deletions(-)
>  rename qdict-test-data.txt => tests/data/qobject/qdict.txt (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 83c127f0d6..269427c3f3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1891,6 +1891,7 @@ F: tests/check-qnum.c
>  F: tests/check-qjson.c
>  F: tests/check-qlist.c
>  F: tests/check-qstring.c
> +F: tests/data/qobject/qdict.txt
>  T: git https://repo.or.cz/qemu/armbru.git qapi-next
>  
>  QEMU Guest Agent
> diff --git a/configure b/configure
> index 224d3071ac..8022f4b999 100755
> --- a/configure
> +++ b/configure
> @@ -7534,7 +7534,7 @@ DIRS="$DIRS tests/fp"
>  DIRS="$DIRS docs docs/interop fsdev scsi"
>  DIRS="$DIRS pc-bios/optionrom pc-bios/spapr-rtas pc-bios/s390-ccw"
>  DIRS="$DIRS roms/seabios roms/vgabios"
> -LINKS="Makefile tests/tcg/Makefile qdict-test-data.txt"
> +LINKS="Makefile tests/tcg/Makefile"
>  LINKS="$LINKS tests/tcg/cris/Makefile tests/tcg/cris/.gdbinit"
>  LINKS="$LINKS tests/tcg/lm32/Makefile tests/tcg/xtensa/Makefile po/Makefile"
>  LINKS="$LINKS tests/fp/Makefile"
> diff --git a/tests/check-qdict.c b/tests/check-qdict.c
> index a1e8305066..b5efa859b0 100644
> --- a/tests/check-qdict.c
> +++ b/tests/check-qdict.c
> @@ -291,7 +291,7 @@ static void qdict_stress_test(void)
>      FILE *test_file;
>      QDict *qdict;
>      QString *value;
> -    const char *test_file_path = "qdict-test-data.txt";
> +    const char *test_file_path = "tests/data/qobject/qdict.txt";
>  
>      test_file = fopen(test_file_path, "r");
>      g_assert(test_file != NULL);
> diff --git a/qdict-test-data.txt b/tests/data/qobject/qdict.txt
> similarity index 100%
> rename from qdict-test-data.txt
> rename to tests/data/qobject/qdict.txt
> 

