Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dCDuq-0007C3-Ip
	for mharc-qemu-trivial@gnu.org; Sat, 20 May 2017 19:36:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54120)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dCDun-0007Bk-QE
	for qemu-trivial@nongnu.org; Sat, 20 May 2017 19:36:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dCDuk-0002vY-Ag
	for qemu-trivial@nongnu.org; Sat, 20 May 2017 19:36:05 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:33938)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dCDuk-0002vE-56; Sat, 20 May 2017 19:36:02 -0400
Received: by mail-oi0-x244.google.com with SMTP id w10so17704154oif.1;
	Sat, 20 May 2017 16:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=ATFky8DOVoU9bzTHLfba7saU1xfKvkO63lmlslbYYAo=;
	b=dS4SUVwz9NX2L14KJw9impRnRqac/hDh/GSaWWe8e9yA/Pldevxs1VgfwfMYt3/4Be
	Q3hVONKRaofiVo516qYjiRYN/vwW2kcsezhxeXYKepII6grL+FB9TP2Qsl9mPDUjQMfd
	mbodvqm6o/JFogziMaFYscUiAmmMwgMFFOI5pliusqUpk2sjh8OOC+4KvnuD1XqOGgpC
	SQgqqnEy/rAnu5wqHzDyh3eUjpZqmVw/3XU7AvbSVjGhYP55dEXvwPpvQEA1Gy7jPSJM
	Wc1sVLqUlV8yUu0ZySlls0eXbXxGTwS02PSxva4NufS1G0Oo9KnNnszC240DtaohLPDe
	jl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=ATFky8DOVoU9bzTHLfba7saU1xfKvkO63lmlslbYYAo=;
	b=DjwZSVL/WUSHZLj+NpI4LlWqTrRmrQs8f/TId8NEcMMCTWa7IlH+WBBMzy7O6wqNg6
	niqW+LuKIYAjmg5CtWAVuJaJUDJI3HBwakMlU9h+l4iMSvkHTowfYjU3L/S9b9YttImM
	6xgkGC1s8dFEX0vCPkTx9NVJxSynHCEBewzFZckcUuiI0uCwgyJdSk2ro8Q83OIgVQZZ
	3RG1D4Tj9oCtUOwimlPwzZtaelYtTx5B+oC3Jf0rFs1Zfpc2/3zsqoJiNyQKDMPzjQ6/
	ZtANsg9rZrMxd2hyU0WbJualogKJxx/tUHiYohsy5wJrNW4QueCJArMEM0+XJBf6F3eG
	y9ZA==
X-Gm-Message-State: AODbwcBTViuvHIcbVihyAnXyImlbgogGIhzp1Ce/+seQ7+lBRRXzQMnQ
	pP+v77ZjjiVRQQ==
X-Received: by 10.202.239.9 with SMTP id n9mr7517339oih.70.1495323361095;
	Sat, 20 May 2017 16:36:01 -0700 (PDT)
Received: from [192.168.1.107]
	(162-231-236-127.lightspeed.miamfl.sbcglobal.net. [162.231.236.127])
	by smtp.gmail.com with ESMTPSA id
	p27sm6465123otp.57.2017.05.20.16.35.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 20 May 2017 16:36:00 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Kamil Rytarowski <n54@gmx.com>, qemu-devel@nongnu.org,
	QEMU Trivial <qemu-trivial@nongnu.org>
References: <20170426105027.10666-1-n54@gmx.com>
Cc: peter.maydell@linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
	<alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b8a1e411-c87e-525f-667a-710b7bcadff9@amsat.org>
Date: Sat, 20 May 2017 20:35:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170426105027.10666-1-n54@gmx.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] configure: Detect native
 NetBSD curses(3)
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
X-List-Received-Date: Sat, 20 May 2017 23:36:06 -0000

Hi Kamil,

On 04/26/2017 07:50 AM, Kamil Rytarowski wrote:
> NetBSD ships with traditional BSD curses with compatibility with ncurses.
> qemu works nicely with the basesystem version of curses(3) from NetBSD.
>
> The only mismatch between curses(3) and ncurses is the lack of
> curses_version() in the NetBSD version. This function is used solely in
> the configure script, therefore eliminate it from the curses(3) detection.
>
> With this change applied, configure detects correctly curses frontend.
>
> Signed-off-by: Kamil Rytarowski <n54@gmx.com>
> ---
>  configure | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/configure b/configure
> index c35acf1192..17dc7224f7 100755
> --- a/configure
> +++ b/configure
> @@ -3034,14 +3034,13 @@ if test "$curses" != "no" ; then
>  #include <curses.h>

This checks if the <curses.h> include in present,

>  #include <wchar.h>
>  int main(void) {
> -  const char *s = curses_version();

This however checks if the library is present, trying to link it.

>    wchar_t wch = L'w';
>    setlocale(LC_ALL, "");
>    resize_term(0, 0);
>    addwstr(L"wide chars\n");
>    addnwstr(&wch, 1);
>    add_wch(WACS_DEGREE);

Those 3 functions also belong to the libcurse, so the link is still 
checked, and this patch looks good to me.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> -  return s != 0;
> +  return 0;
>  }
>  EOF
>    IFS=:
>

