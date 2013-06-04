Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjyX4-00022N-56
	for mharc-qemu-trivial@gnu.org; Tue, 04 Jun 2013 17:12:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34971)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UjyX1-00020d-21
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 17:12:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UjyX0-000544-8l
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 17:12:38 -0400
Received: from mail-lb0-f171.google.com ([209.85.217.171]:35052)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1UjyX0-00053s-1s
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 17:12:38 -0400
Received: by mail-lb0-f171.google.com with SMTP id v5so1175857lbc.2
	for <qemu-trivial@nongnu.org>; Tue, 04 Jun 2013 14:12:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=Rlo5pDK/7FHWlmmL+yXpGChfn70FKZMbLOhr2fff1nI=;
	b=R/IzOMxeVmoZCOGiyA2dAEF2s3KefwbjPsWIZ+P0+CzZC7finRxGHR02jSK7pIEDHi
	+BU4FT557/tdDGQulyYGHrYbr3vWXK6+yLQzfeO3W1Ew7UdMoLhJPwH/CH9xaRnLvVxU
	HbrfSViIlAJjmNteQD+pxWAQLQQypKrsgRsc267bdXcT//X70ZUHPBF+yaV/lGC8ZCvb
	3uy1N52NoZtXNzD5yDXkCvhv4hDMqIJOnvDcK2twh34PMkKxShuUadXmgrhvrXRE9Wp8
	ajlTwWhs79aNPHA72x2XZA1JDnwMouuAuf/GK+wq5HhQ49xVTS3z59dLOJBno8wQa4P5
	VEAw==
X-Received: by 10.112.120.170 with SMTP id ld10mr595001lbb.31.1370380357103;
	Tue, 04 Jun 2013 14:12:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.2.39 with HTTP; Tue, 4 Jun 2013 14:12:16 -0700 (PDT)
In-Reply-To: <1370377419-31788-5-git-send-email-alevy@redhat.com>
References: <1370377419-31788-1-git-send-email-alevy@redhat.com>
	<1370377419-31788-5-git-send-email-alevy@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Jun 2013 22:12:16 +0100
Message-ID: <CAFEAcA8x34tG4SqR6J8GvPALcsGC+=U+53v=UkWsL=Dks8Z6Lg@mail.gmail.com>
To: Alon Levy <alevy@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQkcP5w+5lcyClR25vyIg/jMKXNKbI7Xgiwt0fLf8eBih5NFuS5j/JIE2Vvibv15+OF1Fad0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.171
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 5/5] libcacard/vscclient.c:
 fix use of uninitialized variable
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Jun 2013 21:12:40 -0000

On 4 June 2013 21:23, Alon Levy <alevy@redhat.com> wrote:
> Found by Coverity.
>
> Signed-off-by: Alon Levy <alevy@redhat.com>
> ---
>  libcacard/vscclient.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/libcacard/vscclient.c b/libcacard/vscclient.c
> index 5180d29..4275c23 100644
> --- a/libcacard/vscclient.c
> +++ b/libcacard/vscclient.c
> @@ -645,7 +645,7 @@ main(
>      GIOChannel *channel_stdin;
>      char *qemu_host;
>      char *qemu_port;
> -    VSCMsgHeader mhHeader;
> +    VSCMsgHeader mhHeader = {0,};

As far as I can see we only use this variable once:

    send_msg(VSC_Init, mhHeader.reader_id, &init, sizeof(init));

so wouldn't it be better just to directly pass a constant
"0" to the send_msg() call? Hiding a single uint32_t in
a struct seems a bit obscure.

thanks
-- PMM

