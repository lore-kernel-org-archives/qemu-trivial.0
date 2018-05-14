Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fIIg2-00060M-3u
	for mharc-qemu-trivial@gnu.org; Mon, 14 May 2018 14:58:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46367)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fIIfz-0005yt-Jy
	for qemu-trivial@nongnu.org; Mon, 14 May 2018 14:58:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fIIfu-0002cI-W7
	for qemu-trivial@nongnu.org; Mon, 14 May 2018 14:58:27 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:41473)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fIIfu-0002bo-ST; Mon, 14 May 2018 14:58:22 -0400
Received: by mail-qt0-x244.google.com with SMTP id g13-v6so17554787qth.8;
	Mon, 14 May 2018 11:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=e7cggeld2LYW1V7BP+AnJLgR51eA4Xx7WeYv1UjtdUI=;
	b=T5enCG3UyavfMl7gxuPsFcec+qo7OebVCrhCIjAdV45ZwWT/1KwqvuD2Fdhc46ViPZ
	OeqF19SdR9JIL5GgqghSzHEL1V+IPfVtO/evs8TZVwsl2XZEi1eXM5X0V5K52bxc6TEh
	J1P+NO/i3PbEZRJcVfAJgo1bFr9Z1fyph/hQrASbHZGHrQ2xchb7gDiRiL4GkdN2elA4
	Tf1cFqksKeki5PMD4CwDQisPKdv0waUWU8IKk+Kia0OM5hYdDtvWiHi+M74NtSh9dCM6
	y/uLo2srUnlTeF2WNCVsAQJk6LvX7kfBYelG8z90ch8PQoL+vrSHzRoNjPuN+tCWHERe
	+IEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=e7cggeld2LYW1V7BP+AnJLgR51eA4Xx7WeYv1UjtdUI=;
	b=X5oWB5jRxz2MWQQK0xQ8egjIyInTdD2V6+DyITdv6xB3nrsP4Hi76uj9fyxQe/Zvba
	1aQDslLS/qk2teIEYjhIIEP4xVXkSjnxiIfOVUeSPQfkmQRoigiKd6v1X7sm/HFyDmbB
	vt4NyjO2sIhcLfsztROq8xYqzXiEKvLO1ciw/E29mVt0e4FsMO+qeRegTTcdySEq3lgM
	oGWW48APonuf7AfJA/MjDMwR1HRxaaeJ7uZ9VNuU/7iHFCw5oIW5BX3/I6yvrIQBNVje
	9H/56Tbm8Ke9KlsQPnqRwqoZj4CMLHnjQtloh1kJZZy97gBNA9WI3/ENCerdkATqvg5O
	3VgA==
X-Gm-Message-State: ALKqPwckx2HPjg+DXs/hQqino6hmsdhTA0og0eDhm2ahm9F9CdnlWMFn
	YVWhYCfexaZy9e1ozujh7Ng=
X-Google-Smtp-Source: AB8JxZrgpbD6Zuoffp//Q7cG2WOZ9ggYTGJ5MujTzl9GusB7UJqKXwWyEDChoV+3CoevO25JnFkVcQ==
X-Received: by 2002:a0c:d8c1:: with SMTP id
	w1-v6mr10210672qvj.40.1526324302178; 
	Mon, 14 May 2018 11:58:22 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	w15-v6sm7906082qkw.28.2018.05.14.11.58.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 May 2018 11:58:21 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org
References: <20180514173044.5025-1-peter.maydell@linaro.org>
	<20180514173044.5025-3-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <5745a274-b05f-97c8-340f-0289c5077368@amsat.org>
Date: Mon, 14 May 2018 15:58:18 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180514173044.5025-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] gdbstub: Handle errors
 in gdb_accept()
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
X-List-Received-Date: Mon, 14 May 2018 18:58:28 -0000

On 05/14/2018 02:30 PM, Peter Maydell wrote:
> In gdb_accept(), we both fail to check all errors (notably
> that from socket_set_nodelay(), as Coverity notes in CID 1005666),
> and fail to return an error status back to our caller. Correct
> both of these things, so that errors in accept() result in our
> stopping with a useful error message rather than ignoring it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  gdbstub.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index cc7626c790..7c2bceb040 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1804,7 +1804,7 @@ void gdb_signalled(CPUArchState *env, int sig)
>      put_packet(s, buf);
>  }
>  
> -static void gdb_accept(void)
> +static bool gdb_accept(void)
>  {
>      GDBState *s;
>      struct sockaddr_in sockaddr;
> @@ -1816,7 +1816,7 @@ static void gdb_accept(void)
>          fd = accept(gdbserver_fd, (struct sockaddr *)&sockaddr, &len);
>          if (fd < 0 && errno != EINTR) {
>              perror("accept");
> -            return;
> +            return false;
>          } else if (fd >= 0) {
>              qemu_set_cloexec(fd);
>              break;
> @@ -1824,7 +1824,10 @@ static void gdb_accept(void)
>      }
>  
>      /* set short latency */
> -    socket_set_nodelay(fd);
> +    if (socket_set_nodelay(fd)) {
> +        perror("setsockopt");
> +        return false;
> +    }
>  
>      s = g_malloc0(sizeof(GDBState));
>      s->c_cpu = first_cpu;
> @@ -1833,6 +1836,7 @@ static void gdb_accept(void)
>      gdb_has_xml = false;
>  
>      gdbserver_state = s;
> +    return true;
>  }
>  
>  static int gdbserver_open(int port)
> @@ -1873,7 +1877,11 @@ int gdbserver_start(int port)
>      if (gdbserver_fd < 0)
>          return -1;
>      /* accept connections */
> -    gdb_accept();
> +    if (!gdb_accept()) {
> +        close(gdbserver_fd);
> +        gdbserver_fd = -1;
> +        return -1;
> +    }
>      return 0;
>  }
>  
> 

