Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dEL1t-0005vS-8A
	for mharc-qemu-trivial@gnu.org; Fri, 26 May 2017 15:36:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49676)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dEL1r-0005vD-4Z
	for qemu-trivial@nongnu.org; Fri, 26 May 2017 15:36:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dEL1m-0003B8-7m
	for qemu-trivial@nongnu.org; Fri, 26 May 2017 15:36:07 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:33418)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dEL1l-0003Az-Vo; Fri, 26 May 2017 15:36:02 -0400
Received: by mail-oi0-x242.google.com with SMTP id h4so3207534oib.0;
	Fri, 26 May 2017 12:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=16W9KLkQYBvqZ4uASujLcPTAQk+oQcMc7mDqrhGnwzU=;
	b=DgXcazZa15qpmw8SgppsY4g8LcwuKlbHnzXAIyobynOBUxgolJYoM7rj905zwVoD84
	s1bM1BCS3XhWqCHFOZXm2gZzAFuSzLMjGn8+UYc00doulMz3ia2efMnf88bJJEip4Ts5
	Ot9ejiWrOYeUAPCOpCcQilMfGJvfyU5mFem4ByVhcGRe82EZcrSYSvHzEF/baxB91iH9
	Fu5kwOoBNI2RN1e0Xnm5P6nBJ5+mQx4gGFHQRewoAxbwLuXj1p+Jj3DT5V76n5kxll23
	wIVKVYSX3LB2GIXJ/GErAkvvS4IeoVys0WlPVAz5kOUdwxcaN5uGEyWZSsUZwEpY8Rkh
	hRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=16W9KLkQYBvqZ4uASujLcPTAQk+oQcMc7mDqrhGnwzU=;
	b=qq5uZ0bEYem9KMKCAHWrMSj0fAHxmTj2eymoUaUs9hHOaKTYQUdepvdQn3KMg1VVKe
	kRQPbM7GYahMXEyV+jTE/T4u3irlOezDbW/GouBRdWIF3xHJigaGcX0dn9m8csMSdwTN
	jQQAVOJyQdWOfMVpPfpN4VEx9n6maP3P3xeD8SVP2okjAUrwJPk1uUG98bWZAEGsi1Uk
	c0Yx8fDv00RCDIFY2uKxo2ZOL2YC3LLDHkiFQXxW6AKNMEY0RMLPzww/mHD4+svpBYJP
	bI+a6it9/T1GlgE78VvZ4Lm51CU4WFYnCGJ5e3SqpjfGAVBpjVAMtfCXb6l4dJbrFhJ1
	ncuw==
X-Gm-Message-State: AODbwcAC1hFKR9KpsLHGQ1sKtNLcdZSHwneR2F+E8iJ+saINbFgTJWMs
	LHzKnQirzsNT+XpTkOY=
X-Received: by 10.202.73.23 with SMTP id w23mr1571860oia.103.1495827360922;
	Fri, 26 May 2017 12:36:00 -0700 (PDT)
Received: from [192.168.1.107]
	(162-231-236-127.lightspeed.miamfl.sbcglobal.net. [162.231.236.127])
	by smtp.gmail.com with ESMTPSA id
	m188sm748014oig.22.2017.05.26.12.35.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 26 May 2017 12:36:00 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
References: <20170526101337.4096-1-marcandre.lureau@redhat.com>
Cc: qemu-trivial@nongnu.org
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f4e0f032-0af1-0e0e-7b6a-5f5dde63babd@amsat.org>
Date: Fri, 26 May 2017 16:35:59 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170526101337.4096-1-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-trivial] [PATCH] qemu-ga: remove useless allocation
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
X-List-Received-Date: Fri, 26 May 2017 19:36:08 -0000

On 05/26/2017 07:13 AM, Marc-André Lureau wrote:
> There is no need to duplicate a fixed string.
>
> CC: qemu-trivial@nongnu.org
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  qga/commands-posix.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 284ecc6d7e..d8e412275e 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -2197,12 +2197,10 @@ static void transfer_memory_block(GuestMemoryBlock *mem_blk, bool sys2memblk,
>          }
>      } else {
>          if (mem_blk->online != (strncmp(status, "online", 6) == 0)) {
> -            char *new_state = mem_blk->online ? g_strdup("online") :
> -                                                g_strdup("offline");
> +            const char *new_state = mem_blk->online ? "online" : "offline";
>
>              ga_write_sysfs_file(dirfd, "state", new_state, strlen(new_state),
>                                  &local_err);
> -            g_free(new_state);
>              if (local_err) {
>                  error_free(local_err);
>                  result->response =
>

