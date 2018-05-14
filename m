Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fIIex-0005ND-Q3
	for mharc-qemu-trivial@gnu.org; Mon, 14 May 2018 14:57:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fIIev-0005Lb-I2
	for qemu-trivial@nongnu.org; Mon, 14 May 2018 14:57:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fIIeq-0000j0-VP
	for qemu-trivial@nongnu.org; Mon, 14 May 2018 14:57:21 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:40468)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fIIeq-0000iM-Pt; Mon, 14 May 2018 14:57:16 -0400
Received: by mail-qk0-x243.google.com with SMTP id s83-v6so5774536qke.7;
	Mon, 14 May 2018 11:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3LBh9z0XsppxgJmXWiZKJEdYnBLfzwrxeto0Uu8nTT4=;
	b=kPeZYskLLGMoYbJSdOf3QiF/19PWsMioM3NYAl5HLQB9MB/MaXRQCuZMyM6wTKFdS1
	RLUtOZ9CSBpAE8ZQK+jou14BCuDxSVl/nd6yZLwLPBuFirld7Tjf3GdceIzfFA8Sii4b
	UUVOlawGWKqn663X5NOfufGxqAHGkbZXS0bUglr2uEel6mF/1IqUrwlgZrqJQI6rXLme
	kuDcSTf1SsMF4GDbNjiH6QWGcjGuZfJksB5ijqz697NHDw8ckZvBhzQVYCiuSvwj1MSC
	5OwUO2m0d5qBCfbJM06Mrie4ibWuy88G3P41XLvsDihV40OmsOSBWPbHWsqTW7+CejX8
	deGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=3LBh9z0XsppxgJmXWiZKJEdYnBLfzwrxeto0Uu8nTT4=;
	b=sZ6qxb+LliYycduhxCc2QuqwLDC0y4huRpaLzgUl67kv1TavPpvciDZ2FCjkaW28Pr
	e586/xKDxOBUAYlokDRSxBJjPhgox+PYmZvdzNOBNCHxJIKxa6Iauy5rHp9COB9NuIfV
	k30YpxfDU8Fbwa5uOWDnkdOvgHe5FAmfLElGp2+jFKVI9H/3+jDqiEGQKSV3fj8+D5mK
	yocyPcos96yMrpepqjKiQersxwLFm32SQtf+Y92dKeQnwCEcj9ATJp7WprM61lP+Ekz+
	62zJ4fOb/OYs73BkZ23xrACQxxF3Nc1gZRqJ6ss7gBfekjpsKrYys3ZAieqJOk9EGi8r
	wAsg==
X-Gm-Message-State: ALKqPwcfB2UeVUecLA1yw+AxcdOjKPhY2pfdsqluZ6nRBmsyWD/vAMDg
	NV/H+ENT3wu1AaMhdCXEDE0=
X-Google-Smtp-Source: AB8JxZpIFq9zR0JL3HNv5K/XM82vBGQJ+C8xCAcNGqtqVtwS/zm8ha4g2NIhjTxdii2XUwBwF+nuWA==
X-Received: by 2002:a37:cf82:: with SMTP id v2-v6mr9606726qkl.67.1526324236190;
	Mon, 14 May 2018 11:57:16 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	k73-v6sm8234734qkl.89.2018.05.14.11.57.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 May 2018 11:57:14 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, patches@linaro.org
References: <20180514173044.5025-1-peter.maydell@linaro.org>
	<20180514173044.5025-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <77995743-27bb-9cb9-5455-a2383d3be7b5@amsat.org>
Date: Mon, 14 May 2018 15:57:09 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180514173044.5025-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-trivial] [PATCH 1/2] gdbstub: Use qemu_set_cloexec()
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
X-List-Received-Date: Mon, 14 May 2018 18:57:22 -0000

On 05/14/2018 02:30 PM, Peter Maydell wrote:
> Use the utility routine qemu_set_cloexec() rather than
> manually calling fcntl(). This lets us drop the #ifndef _WIN32
> guards and also means Coverity doesn't complain that we're
> ignoring the fcntl error return (CID 1005665, CID 1005667).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  gdbstub.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index 3c3807358c..cc7626c790 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1818,9 +1818,7 @@ static void gdb_accept(void)
>              perror("accept");
>              return;
>          } else if (fd >= 0) {
> -#ifndef _WIN32
> -            fcntl(fd, F_SETFD, FD_CLOEXEC);
> -#endif
> +            qemu_set_cloexec(fd);
>              break;
>          }
>      }
> @@ -1847,9 +1845,7 @@ static int gdbserver_open(int port)
>          perror("socket");
>          return -1;
>      }
> -#ifndef _WIN32
> -    fcntl(fd, F_SETFD, FD_CLOEXEC);
> -#endif
> +    qemu_set_cloexec(fd);
>  
>      socket_set_fast_reuse(fd);
>  
> 

