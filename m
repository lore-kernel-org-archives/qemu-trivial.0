Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dFReC-0001Yb-Hp
	for mharc-qemu-trivial@gnu.org; Mon, 29 May 2017 16:52:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dFReA-0001Ug-9S
	for qemu-trivial@nongnu.org; Mon, 29 May 2017 16:52:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dFRe5-0005dN-2K
	for qemu-trivial@nongnu.org; Mon, 29 May 2017 16:52:14 -0400
Received: from mail-oi0-x235.google.com ([2607:f8b0:4003:c06::235]:33095)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dFRe4-0005cQ-Tl; Mon, 29 May 2017 16:52:08 -0400
Received: by mail-oi0-x235.google.com with SMTP id w10so89878509oif.0;
	Mon, 29 May 2017 13:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=CWZHe+pwDQ3e0N7gWAKRLL+8oyMuWe7JvceqJ5A90i8=;
	b=nkiloRRTOggBFdCdVhdd0x6jM4DkuRd0o+WvqUv1c2R0LLcEBhAERjL92Uce82tdZt
	WYmg0MBLVH1XCikDZQ3Nnowl3vKFqZVgMFLk7qgYQFMnop/ELuAGLQ2jBnJldnT1G3/P
	Un/lx5nB8eWDgizkGyrOwNTCq+ji54Of2E1I9LGUYYT5v4X249PGhHxuHiTnFhXldb+8
	0QkEj/u0eWkA0O+uv9GOxfgEZQ3RYZorzfN8XK3wM0UQSbVJ8krH9+I1/r9v07rs/DZn
	bauWD21PaDUsbeIYEZS8row5l5B/w7wyKq5YH9DZdmyFdlc/+Vci7JIYFdv84XSA67ml
	ZVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=CWZHe+pwDQ3e0N7gWAKRLL+8oyMuWe7JvceqJ5A90i8=;
	b=PGQsdf8czJlsTCg3NpSIA7MT39fQNZklsVYnsuIUB8HFFU9Escg603n6nFKZtnvp6m
	qEfLMHnZYDtxaH2chN7txIZUJgPa+EF3japGFjsfBk0EUAzZt82TFF1B/urzg5LdGSRt
	Xe187mro1iIDLBpb5y3gdvuU9tDOj9MUM84xD3tWF2HOuP5RABdS58b6zvE3DQkoqscg
	8iIeaHR8MMEkbWmE/0jPHBZeKV/vMK9P6eFmRq1zEmtjtYDuiDHk6KroP7WuPVo7x/dT
	3ePDkARNQSUAe3+Ty0P4JnkQ9ADo7Gc8GyBarIe7HlOqtvbkBaPP+F1ozcFnnuKgmHbd
	tCUw==
X-Gm-Message-State: AODbwcDjga/VokfZrpFfEwYMIQGXsKI1pHdC4HbEp7tpF5a/GWPGr0uX
	6Bx+MUk2l7dBKK9ESSo=
X-Received: by 10.157.23.133 with SMTP id j5mr7175963otj.37.1496091127942;
	Mon, 29 May 2017 13:52:07 -0700 (PDT)
Received: from [192.168.1.107]
	(162-231-236-127.lightspeed.miamfl.sbcglobal.net. [162.231.236.127])
	by smtp.gmail.com with ESMTPSA id 42sm4852179otj.30.2017.05.29.13.52.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 May 2017 13:52:07 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Jose Ricardo Ziviani <joserz@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <1496075404-8845-1-git-send-email-joserz@linux.vnet.ibm.com>
Cc: qemu-trivial@nongnu.org
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bc558af7-c381-d74c-9806-569a6cd5ad33@amsat.org>
Date: Mon, 29 May 2017 17:52:06 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1496075404-8845-1-git-send-email-joserz@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::235
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] simpletrace: Improve the
 error message if event is not declared
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
X-List-Received-Date: Mon, 29 May 2017 20:52:15 -0000

On 05/29/2017 01:30 PM, Jose Ricardo Ziviani wrote:
> Today, if we use a trace-event file which does not declare an event
> existing in the log file we'll get the following error:
>
> $ scripts/simpletrace.py trace-events trace-68508
> Traceback (most recent call last):
>   File "scripts/simpletrace.py", line 242, in <module>
>     run(Formatter())
>   File "scripts/simpletrace.py", line 217, in run
>     process(events, sys.argv[2], analyzer, read_header=read_header)
>   File "scripts/simpletrace.py", line 192, in process
>     for rec in read_trace_records(edict, log):
>   File "scripts/simpletrace.py", line 107, in read_trace_records
>     rec = read_record(edict, idtoname, fobj)
>   File "scripts/simpletrace.py", line 71, in read_record
>     return get_record(edict, idtoname, rechdr, fobj)
>   File "scripts/simpletrace.py", line 45, in get_record
>     event = edict[name]
> KeyError: 'qemu_mutex_locked'
>
> This patch improves this error by adding a hint instead of just that
> KeyError log:
>
> $ scripts/simpletrace.py trace-events trace-68508
> 'qemu_mutex_locked' event is logged but is not declared in the trace
> events file, try using trace-events-all instead.
>
> Signed-off-by: Jose Ricardo Ziviani <joserz@linux.vnet.ibm.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  scripts/simpletrace.py | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/simpletrace.py b/scripts/simpletrace.py
> index d60b3a0..f1be6e4 100755
> --- a/scripts/simpletrace.py
> +++ b/scripts/simpletrace.py
> @@ -42,7 +42,15 @@ def get_record(edict, idtoname, rechdr, fobj):
>          event_id = rechdr[0]
>          name = idtoname[event_id]
>          rec = (name, rechdr[1], rechdr[3])
> -        event = edict[name]
> +        try:
> +            event = edict[name]
> +        except KeyError, e:
> +            import sys
> +            sys.stderr.write('%s event is logged but is not declared ' \
> +                             'in the trace events file, try using ' \
> +                             'trace-events-all instead.\n' % str(e))
> +            sys.exit(1)
> +
>          for type, name in event.args:
>              if is_string(type):
>                  l = fobj.read(4)
>

