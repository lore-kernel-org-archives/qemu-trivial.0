Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ecVV6-0005Ss-0S
	for mharc-qemu-trivial@gnu.org; Fri, 19 Jan 2018 07:10:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48021)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ecVV3-0005R1-B2
	for qemu-trivial@nongnu.org; Fri, 19 Jan 2018 07:10:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ecVV2-00045L-Dd
	for qemu-trivial@nongnu.org; Fri, 19 Jan 2018 07:10:25 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:37341)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ecVUx-0003zq-Tr; Fri, 19 Jan 2018 07:10:19 -0500
Received: by mail-qt0-x241.google.com with SMTP id d54so3223997qtd.4;
	Fri, 19 Jan 2018 04:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=320Fv4QWmeUnmBO5mmgc7xJUjZdJKdxEEoE/r0+o2Zk=;
	b=Kkf9RliAV0/QuUvEUNHbsYV5urJHOUjnzkJ1MMFutb0p8Ld8HXV/ghGwQ9CajIqwgx
	qKBiWzTUPdA+Fv7PQdnuii45Q3Lf31tKPJ59rd020lQWoTqX9LyOXndcNoPXvPm4qVKH
	x5QK13vKJeZGlOUtAurwJ6kboKuHMh5nip2D5hsieanvE2J0hgEbM5EFFnA2EHGnbC+F
	MQMrfDBAPIVWa5bg0TugCuNW1NbfhjZA3T6g6s19Rq62tA+Skb4sKmtd7YC5KFuq5AJ2
	N/UFEWV6vDAgMOgqlyyzkZNp8I7u+zOA/pBL+OTurqlONt3yQ2M3YWperAivweRo1ljP
	xLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=320Fv4QWmeUnmBO5mmgc7xJUjZdJKdxEEoE/r0+o2Zk=;
	b=DwilBGQZM1XJ75XmpE5PJvp/+gT5d+5gbyLDyOnIG8UyciKxIiEnt95mu45YZqOkMX
	yWU0TQPpa9T+6g7lSXj5jKmQpv2KpS2ot0sFcZZUdhROi7NZbKVZIlWecru3HkZSaMbG
	GCoVlynmngxmE0Js7ZAfQPZmHocUbF76adgXJ4WSIp7FqfaTicK80oZc3PsaU76qV33g
	kvzR6PcrJ55/Nm8zu6hDvCf1AeolKuFifPiYLGpEy5YGGMmkTVtunfAMDFC+oTpAdu65
	I2EtDgUgLwRaAQhLu3cwVpLWgg7ihZckOzwifsNg/dEYEzPAb6bu7Zr+lWAuSq/qzNhf
	ibiQ==
X-Gm-Message-State: AKwxyteMaZ6sM5oIE6iSOOdS55Fm6y2lEWYLY8KkvW/2eQbsyat7CCj7
	8zeC+WfiG2V9rECxxaq4S4PP5fMn
X-Google-Smtp-Source: ACJfBotbcq1Ubvf0KhN+3sSXloWklySRSFChCoququmWdJh3x4slETH5dAykgnuDo5jqAt3tBHLRHQ==
X-Received: by 10.200.54.138 with SMTP id a10mr7481630qtc.123.1516363819166;
	Fri, 19 Jan 2018 04:10:19 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	p40sm6291716qtp.25.2018.01.19.04.10.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 Jan 2018 04:10:18 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Laurent Vivier <lvivier@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
References: <20180119103233.26075-1-lvivier@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <216e835b-dcae-5ec3-20d6-a4da125a44d4@amsat.org>
Date: Fri, 19 Jan 2018 09:10:15 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180119103233.26075-1-lvivier@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-trivial] [PATCH] build: fix typo in error message
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
X-List-Received-Date: Fri, 19 Jan 2018 12:10:26 -0000

On 01/19/2018 07:32 AM, Laurent Vivier wrote:
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  scripts/git-submodule.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/git-submodule.sh b/scripts/git-submodule.sh
> index bc7224a27f..807ca0b4f8 100755
> --- a/scripts/git-submodule.sh
> +++ b/scripts/git-submodule.sh
> @@ -28,7 +28,7 @@ error() {
>      echo
>      echo "and then manually update submodules prior to running make, with:"
>      echo
> -    echo " $ scripts/git-sbumodule.sh update $modules"
> +    echo " $ scripts/git-submodule.sh update $modules"
>      echo
>      exit 1
>  }
> 

