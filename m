Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dPWIs-0005qg-LJ
	for mharc-qemu-trivial@gnu.org; Mon, 26 Jun 2017 11:51:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39195)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dPWIq-0005p7-52
	for qemu-trivial@nongnu.org; Mon, 26 Jun 2017 11:51:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dPWIl-0003iG-AD
	for qemu-trivial@nongnu.org; Mon, 26 Jun 2017 11:51:52 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:36459)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dPWIl-0003i6-5e; Mon, 26 Jun 2017 11:51:47 -0400
Received: by mail-qk0-x244.google.com with SMTP id r62so667347qkf.3;
	Mon, 26 Jun 2017 08:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ieC+Iz9QT3dnei4knaCzkVp4FsICAZmyot15otW2Ybw=;
	b=r/97Teuezf2h6tZBQlnPzaMdUmYNm1jlqPFMw5pdDM4jlx9pfxk6lXUgYKpDs+Un1P
	9UDLMwhCvrwNUQCOtt38VLfN9sbyqxtTESi86CMym7HN/Ou8l8ppOwIvG+Yq28rTVBEu
	/4pnEPU2k72WgRfD71YYwvOa4SFLT80d4nMCyXkSxsw5+l888tweuw+qopEQ3uZBwM4P
	dZkXC5tbQbVv8jtg2E5wUtkC0LtPQPr2oIIGhdL1miVx5fl2+zhFbNk47em1jEwhEmBY
	ZmrHS9wKvq/FygaSvo9a9mbM8TeWmz6Cej+jHqZSCl7LLnOtmotgo9lSUi0NO7at7NiC
	+jhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ieC+Iz9QT3dnei4knaCzkVp4FsICAZmyot15otW2Ybw=;
	b=CbSWZyLWjZ6SPqVBb0Lx1i+FvozzYOEuSesPzbSbp6C/kVmg++U8IjxcFIkPkEfHV9
	LDJsqzJJ8fzboPAPUFtZQeMjc52NW19o8tGRWG/jwJx2TAhQwN8lNWdPH7aonUtendur
	O45HOS2fuonhtW/pgzFToFNTWypcchwUAH4P1zoeO3k/8NIW36EztZTCOvJeROQ0VFrw
	K89qGY6JZE7kdMduyHel2izg2+XdYzBoQQlsbjuKkuMWenft0KT7zyjj/1PDvA2ncsBQ
	vTwmtmXuGE1o0dhl9BqcRjjopwPrT8ABoNGHMzp+etnmJrxG2gTo/7T0aJMeI48Lbgwq
	ZVGA==
X-Gm-Message-State: AKS2vOxcPNmZrSxYCOyQvjC0i/J97hSDJ9G19mC1Sa5aib3za8KR0vgM
	9dZp5R2BLGApnw==
X-Received: by 10.55.73.144 with SMTP id w138mr1127838qka.249.1498492306499;
	Mon, 26 Jun 2017 08:51:46 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id w8sm357877qtb.53.2017.06.26.08.51.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jun 2017 08:51:45 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org
References: <1498490724-20674-1-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6ba872d7-5dcc-f160-beed-a691a02c1d09@amsat.org>
Date: Mon, 26 Jun 2017 12:51:43 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1498490724-20674-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Handle having no
 c++ compiler in FORTIFY_SOURCE check
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
X-List-Received-Date: Mon, 26 Jun 2017 15:51:53 -0000

On 06/26/2017 12:25 PM, Peter Maydell wrote:
> Our FORTIFY_SOURCE check assumes that $cxx refers to a working C++
> compiler, with the result that if you don't happen to have one
> then configure will spuriously print
>    configure: line 4685: c++: command not found
> 
> Fix this by adding a 'has $cxx' check.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   configure | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index c571ad1..a435908 100755
> --- a/configure
> +++ b/configure
> @@ -4681,7 +4681,7 @@ fi
>   if test "$fortify_source" != "no"; then
>     if echo | $cc -dM -E - | grep __clang__ > /dev/null 2>&1 ; then
>       fortify_source="no";
> -  elif test -n "$cxx" &&
> +  elif test -n "$cxx" && has $cxx &&
>          echo | $cxx -dM -E - | grep __clang__ >/dev/null 2>&1 ; then
>       fortify_source="no";
>     else
> 

