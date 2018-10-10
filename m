Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gAAQ6-0006CI-Uh
	for mharc-qemu-trivial@gnu.org; Wed, 10 Oct 2018 05:04:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52624)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gAAQ5-0006Bt-6f
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2018 05:04:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gAAQ2-0003S7-1P
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2018 05:04:41 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40415)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gAAQ1-0003RJ-QN
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2018 05:04:37 -0400
Received: by mail-wr1-f67.google.com with SMTP id d2-v6so4801756wro.7
	for <qemu-trivial@nongnu.org>; Wed, 10 Oct 2018 02:04:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=L2YL3QLvfH/Yk/nKAQb1iuxaXB5siBymOhxRVCJfUyQ=;
	b=K9l+oQxME5NgYgs9Mrlz6d+r8gh3mzjOUbawOPnZpZIkjP9utb95hkzd3J/sMi+raF
	CW+wACDAtkkusMxSA/xoHiCRCTxoucD7idbK81FVIs1rtdbopq/RVAa0Quyp/QBLEopx
	rF/XIXpJdZIrfFZf/eekOE4gBEd89YnJmv+kj4OpGrw8txRTbZMMMZMabu/PACU04B1S
	/2+HcptzBA7zsP3ZKzZLgsWbBqYEmf0Vpqge+mKjy23rR1mkKvxLVieNCwOJ9u7944kG
	9Vk77lLVorr3aYVwnHqS2StbYvI9XnKrvZ3dPZY2Pa5LNBGKcfTAHKua9bzB4ZtZ0tFN
	jSdA==
X-Gm-Message-State: ABuFfoihqXdYwpVwXjC9cuk68QDpw9lpkQQyOX/VYGECq5pKbxYCpJ56
	7v/zBdQUUc2/1oNsy+9CDg7ZuUNXi58=
X-Google-Smtp-Source: ACcGV61KuXbo8fJHKNXdY/Q05R6UZdixLw1TmtLJpaVyO+NhcDkyUf1ax75cgzfQqdxeXRJ1SS23xg==
X-Received: by 2002:a5d:4589:: with SMTP id
	p9-v6mr23358985wrq.122.1539162276320; 
	Wed, 10 Oct 2018 02:04:36 -0700 (PDT)
Received: from [192.168.2.33] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	a6-v6sm11504770wmf.22.2018.10.10.02.04.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 10 Oct 2018 02:04:35 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-trivial@nongnu.org
References: <f8c0f859-2d70-b53e-a39a-48c2bf253be6@redhat.com>
	<1539155198-5873-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4d67eb57-0530-5ecf-5d86-65a16f9d0d9c@redhat.com>
Date: Wed, 10 Oct 2018 11:04:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1539155198-5873-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-trivial] [PATCH v2] target/cris/translate: Get rid of
 qemu_log_separate()
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
X-List-Received-Date: Wed, 10 Oct 2018 09:04:42 -0000

On 10/10/2018 09:06, Thomas Huth wrote:
> The gen_BUG() function calls already cpu_abort(), which prints the
> information to stderr and the log already. So instead of additionally
> printing the dc->pc via fprintf() and qemu_log here, too, we can
> simply pass this information to cpu_abort() instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Use "pc=" instead of "dc->pc=" in the string as suggested by Phil

Thanks.

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> 
>  target/cris/translate.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/target/cris/translate.c b/target/cris/translate.c
> index 4ae1c04..11b2c11 100644
> --- a/target/cris/translate.c
> +++ b/target/cris/translate.c
> @@ -137,11 +137,7 @@ typedef struct DisasContext {
>  
>  static void gen_BUG(DisasContext *dc, const char *file, int line)
>  {
> -    fprintf(stderr, "BUG: pc=%x %s %d\n", dc->pc, file, line);
> -    if (qemu_log_separate()) {
> -        qemu_log("BUG: pc=%x %s %d\n", dc->pc, file, line);
> -    }
> -    cpu_abort(CPU(dc->cpu), "%s:%d\n", file, line);
> +    cpu_abort(CPU(dc->cpu), "%s:%d pc=%x\n", file, line, dc->pc);
>  }
>  
>  static const char *regnames_v32[] =
> 

