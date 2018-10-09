Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g9mrY-0004Sz-Dm
	for mharc-qemu-trivial@gnu.org; Tue, 09 Oct 2018 03:55:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55301)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g9mrW-0004Sl-Ek
	for qemu-trivial@nongnu.org; Tue, 09 Oct 2018 03:55:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g9mrS-0004tO-Gg
	for qemu-trivial@nongnu.org; Tue, 09 Oct 2018 03:55:26 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39652)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g9mrS-0004tA-8j
	for qemu-trivial@nongnu.org; Tue, 09 Oct 2018 03:55:22 -0400
Received: by mail-wr1-f66.google.com with SMTP id 61-v6so688698wrb.6
	for <qemu-trivial@nongnu.org>; Tue, 09 Oct 2018 00:55:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=3AsKWrK0rgQCO+vu/lWKOU2+WudmxFFkPmmfQYciByo=;
	b=oLXKoQFJY0yGfyRTlzYvc21iamJ3FHx9hoYBmpU0t59LYAPCvduJloE1SKpO5w44X0
	tI/eOKhWE62fxGQyVQIMFplQsYY6vWt2B0+tJPm5i580YwLhoNH9Bo1Z1PMUYLdLzITB
	qxlVP28epR1CCZ8Uf+evcMhBbWlCRHFqo+Gfdd5nRjVDKfq2up2/52gI/BinOBCTCWp2
	C12m0vZVYzPSCZ9mspLaxdhte6soB0aSezx1KHzO/0o6lF1YIeNAv3sRZpNlZedzXZRH
	SsxPmifbMBWzlceAal+tHrFXfWDyqjynTrj7bxEMSOnp4iUomMcTqHCxD2lzDEutYS41
	HxlQ==
X-Gm-Message-State: ABuFfohIl6BqjSKXX4+zNzVvcLJ/X3KbAnLIlNqFwZteBfV6+ukO1Gz8
	P+Ncxdj+Xqa4762+EGyr8TlxP79fOsc=
X-Google-Smtp-Source: ACcGV61p2uScs+Yopn1LBE//FIRL2i5zv3gewWmWWAVYkrQ1FFojB1fNqgV+PbNMCBidqn/fkufRzA==
X-Received: by 2002:adf:ec83:: with SMTP id z3-v6mr534980wrn.125.1539071721055;
	Tue, 09 Oct 2018 00:55:21 -0700 (PDT)
Received: from [192.168.2.33] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	o4-v6sm4333608wrj.45.2018.10.09.00.55.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Oct 2018 00:55:19 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: qemu-trivial@nongnu.org
References: <1539071180-2028-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f8c0f859-2d70-b53e-a39a-48c2bf253be6@redhat.com>
Date: Tue, 9 Oct 2018 09:55:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1539071180-2028-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target/cris/translate: Get
 rid of qemu_log_separate()
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
X-List-Received-Date: Tue, 09 Oct 2018 07:55:27 -0000

Hi Thomas,

On 09/10/2018 09:46, Thomas Huth wrote:
> The gen_BUG() function calls already cpu_abort(), which prints the
> information to stderr and the log already. So instead of additionally
> printing the dc->pc via fprintf() and qemu_log here, too, we can
> simply pass this information to cpu_abort() instead.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  target/cris/translate.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/target/cris/translate.c b/target/cris/translate.c
> index 4ae1c04..0ee2c5d 100644
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
> +    cpu_abort(CPU(dc->cpu), "%s:%d dc->pc=%x\n", file, line, dc->pc);

I'd use a simpler format (why display internal "dc->"?):

       cpu_abort(CPU(dc->cpu), "%s:%d BUG: pc=%x\n", ...


>  }
>  
>  static const char *regnames_v32[] =
> 

