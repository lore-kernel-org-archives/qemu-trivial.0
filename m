Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fLxtB-00086Q-7Z
	for mharc-qemu-trivial@gnu.org; Thu, 24 May 2018 17:35:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46492)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fLxt8-00081s-BZ
	for qemu-trivial@nongnu.org; Thu, 24 May 2018 17:35:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fLxt3-0002MX-HS
	for qemu-trivial@nongnu.org; Thu, 24 May 2018 17:35:10 -0400
Received: from mail-pg0-f42.google.com ([74.125.83.42]:39803)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1fLxt3-0002LO-Ar
	for qemu-trivial@nongnu.org; Thu, 24 May 2018 17:35:05 -0400
Received: by mail-pg0-f42.google.com with SMTP id w12-v6so132813pgc.6
	for <qemu-trivial@nongnu.org>; Thu, 24 May 2018 14:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=e6Ef4glBISsYHd3+bx5nddievm9xOSliYLWApP3MN3Y=;
	b=Y9n0k2V8I9P2ww5ndEtcxXmYSCu8hddmpiYXftd8ujvkQCEjhRFkri2ecR5hXlVQrb
	xXN1zl0CfAPU2HhHpycKAfJNtVWdssq0ja9BymTQiLx07feCie/iSYeMVv8x7tHCgdSp
	De83OhPlQ6TTt707Dt80CLxKhD23bJfiP0+4eYx5XfjhYiXQUpuyYunnzRLq4WVMvymo
	UAa4dw9/wU3mlPRtHAs5c6aCVhgD8Hdmzbv7A/JQXKa8bnNmZMNJ0EDQwaLJeFmb6/iy
	Evax3vy7ernqJHzeDdBR09dnXZ0Bv85zAw03VurstAJwTO5yPY/ELU1bAuy2Vm/SCHYK
	j8Ng==
X-Gm-Message-State: ALKqPwexas5YJaw0/4//vNFYHz4fMpPIs18XNWqKbNrWAvz3IUis7yPF
	y9SKNJkF1dqz2n0zBz39xxe0Xw==
X-Google-Smtp-Source: AB8JxZqUOwCVG9V4uQdmxtsgJ5o6WVPhTs3yrZW8agJ/fEEmhKmTdHhn/p1YCfAskK5mQbhGFJA76A==
X-Received: by 2002:a65:5789:: with SMTP id
	b9-v6mr7316619pgr.417.1527197704357; 
	Thu, 24 May 2018 14:35:04 -0700 (PDT)
Received: from [172.16.10.49] ([72.28.93.239])
	by smtp.gmail.com with ESMTPSA id
	e126-v6sm39004901pfh.5.2018.05.24.14.35.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 May 2018 14:35:03 -0700 (PDT)
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <cover.1526796813.git.mjt@msgid.tls.msk.ru>
	<2f652224f76c115f6c991766b7acac1e22580954.1526796813.git.mjt@msgid.tls.msk.ru>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d3acfa93-ee93-fce8-36bb-f481637b0140@redhat.com>
Date: Thu, 24 May 2018 23:35:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <2f652224f76c115f6c991766b7acac1e22580954.1526796813.git.mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.83.42
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 20/22] gdbstub: Handle errors
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
X-List-Received-Date: Thu, 24 May 2018 21:35:11 -0000

On 20/05/2018 08:15, Michael Tokarev wrote:
> From: Peter Maydell <peter.maydell@linaro.org>
> 
> In gdb_accept(), we both fail to check all errors (notably
> that from socket_set_nodelay(), as Coverity notes in CID 1005666),
> and fail to return an error status back to our caller. Correct
> both of these things, so that errors in accept() result in our
> stopping with a useful error message rather than ignoring it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>  gdbstub.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index b99980d2e2..e4ece2f5bc 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1814,7 +1814,7 @@ void gdb_signalled(CPUArchState *env, int sig)
>      put_packet(s, buf);
>  }
>  
> -static void gdb_accept(void)
> +static bool gdb_accept(void)
>  {
>      GDBState *s;
>      struct sockaddr_in sockaddr;
> @@ -1826,7 +1826,7 @@ static void gdb_accept(void)
>          fd = accept(gdbserver_fd, (struct sockaddr *)&sockaddr, &len);
>          if (fd < 0 && errno != EINTR) {
>              perror("accept");
> -            return;
> +            return false;
>          } else if (fd >= 0) {
>              qemu_set_cloexec(fd);
>              break;
> @@ -1834,7 +1834,10 @@ static void gdb_accept(void)
>      }
>  
>      /* set short latency */
> -    socket_set_nodelay(fd);
> +    if (socket_set_nodelay(fd)) {
> +        perror("setsockopt");
> +        return false;

Coverity notes that this leaks fd.

Paolo

> +    }
>  
>      s = g_malloc0(sizeof(GDBState));
>      s->c_cpu = first_cpu;
> @@ -1843,6 +1846,7 @@ static void gdb_accept(void)
>      gdb_has_xml = false;
>  
>      gdbserver_state = s;
> +    return true;
>  }
>  
>  static int gdbserver_open(int port)
> @@ -1883,7 +1887,11 @@ int gdbserver_start(int port)
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


