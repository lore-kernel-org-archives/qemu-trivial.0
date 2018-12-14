Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXkwy-0004Fb-PC
	for mharc-qemu-trivial@gnu.org; Fri, 14 Dec 2018 05:44:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35755)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gXkww-0004CG-DM
	for qemu-trivial@nongnu.org; Fri, 14 Dec 2018 05:44:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gXkwr-0001gQ-F5
	for qemu-trivial@nongnu.org; Fri, 14 Dec 2018 05:44:06 -0500
Received: from mail-wr1-f44.google.com ([209.85.221.44]:42569)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gXkwr-0001fd-42
	for qemu-trivial@nongnu.org; Fri, 14 Dec 2018 05:44:01 -0500
Received: by mail-wr1-f44.google.com with SMTP id q18so4938437wrx.9
	for <qemu-trivial@nongnu.org>; Fri, 14 Dec 2018 02:43:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+SVZXbXERD9NEeB+PwTFdB/dROQiq10NSCZErYI/nf0=;
	b=RXhw7XEhwv4XF+Q6u2bT3PRRaMSu6s4GKm80YEOvRz3/r7WB4r2Miulsr17lfOzhSf
	b6OdDnGYsnXyykRJG1bdhqv9Q5O5UWWdrJy8jB5sHnjAwq3v0jqYudseHrLDYhqUHRXP
	h1Hdmu7DurMefuZZ2TJuJKG2wqTub0JqE/XBdJWZjr4fFMpPMQhhW1cWIB4gkq8n0veF
	elc1Yelx+qMva3kYWC6u3fPQDaVz/1E+aiR82TsVUJJ9jG16BXufaia5q4l9tOX/QaG4
	GfylkbYLFvJmN1Cb3cmgKesExt4MaxOgwyn37cFZxwtWubxH+NE7o9QgDlFoncMwQgs/
	53PA==
X-Gm-Message-State: AA+aEWb7AshBplb5SDLiRV3MgNvlEfuoysiB2cqDEN6N6zm0XkysI4Yf
	JkNMPAXg1YAW71IvS6V6ZpYtY9uauzE=
X-Google-Smtp-Source: AFSGD/Vf7yXpYqT4TslqzTJ139UvK34Ru2a4GnCW4oXbYUrO3Mi8mzT3FQWJNFUk4kNibY97hMIK7w==
X-Received: by 2002:a5d:50c5:: with SMTP id f5mr2047789wrt.37.1544784238288;
	Fri, 14 Dec 2018 02:43:58 -0800 (PST)
Received: from [192.168.1.34] (172.red-88-21-202.staticip.rima-tde.net.
	[88.21.202.172])
	by smtp.gmail.com with ESMTPSA id n6sm3343339wmk.9.2018.12.14.02.43.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Dec 2018 02:43:57 -0800 (PST)
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20181213175807.12039-1-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <db306820-d31e-b277-182e-09f37c6d0e2e@redhat.com>
Date: Fri, 14 Dec 2018 11:43:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181213175807.12039-1-armbru@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.44
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] vl: Use error_fatal to
 simplify obvious fatal errors (again)
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
X-List-Received-Date: Fri, 14 Dec 2018 10:44:07 -0000

On 12/13/18 6:58 PM, Markus Armbruster wrote:
> Patch created mechanically by rerunning:
> 
>     $ spatch --in-place --sp-file scripts/coccinelle/use-error_fatal.cocci \
>              --macro-file scripts/cocci-macro-file.h vl.c
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  vl.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/vl.c b/vl.c
> index a5ae5f23d2..702a828ca2 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -3138,11 +3138,8 @@ int main(int argc, char **argv, char **envp)
>                      Visitor *v;
>                      BlockdevOptions_queue *bdo;
>  
> -                    v = qobject_input_visitor_new_str(optarg, "driver", &err);
> -                    if (!v) {
> -                        error_report_err(err);
> -                        exit(1);
> -                    }
> +                    v = qobject_input_visitor_new_str(optarg, "driver",
> +                                                      &error_fatal);
>  
>                      bdo = g_new(BlockdevOptions_queue, 1);
>                      visit_type_BlockdevOptions(v, NULL, &bdo->bdo,
> 

