Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gROO4-0004qY-Is
	for mharc-qemu-trivial@gnu.org; Mon, 26 Nov 2018 16:25:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gROO0-0004q3-Ba
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 16:25:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gRONx-0001wC-6f
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 16:25:44 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40240)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gRONx-0001uz-0I
	for qemu-trivial@nongnu.org; Mon, 26 Nov 2018 16:25:41 -0500
Received: by mail-wr1-f65.google.com with SMTP id p4so20505584wrt.7
	for <qemu-trivial@nongnu.org>; Mon, 26 Nov 2018 13:25:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=QZCUvU2TF3dLDhomyCktU2aOnLgacNod//GPan3W7kg=;
	b=WJ7qKSr6u1omgY+GlA8BEiqLI8dgeWXDX4bxSHkoYzXc+HE8MZROtGjQiMx3aH5Jha
	VwStd74nAEElOlbrsuMzifD3n1l4eJvgHGi+H3H+34MGWcpG9a6b2BpJPZ3f6aQZ39x/
	yQ5xqotvxmPdLZdSlisbb+MU2wV10spg9W6Xyrf8EIwdc6q3VFeYcirwFdYR9BQe89fj
	GmvrvROOCB1OGaV2uVeon9hr/dvYo1v9QafTRqxiHYpafEoC4y+yyJte/rrxujcyZaID
	g/70JNW+XqjLFyEfnVEDSrmBQPdXo6bHTH8YWg0wgTB3QipgCgXJDqFzVymImFR8ylAV
	yNrg==
X-Gm-Message-State: AA+aEWZXf9PWjnJEZxeCMAwwOFi5Wtb95X0UKiPYkSpWE5V7RwmUVYpz
	7qL9QAtdNV/LG8mE8UeGIuA90w==
X-Google-Smtp-Source: AFSGD/UcgPDplRTIEuEnO4cVv0ABlb+QDr6xmCKy3YQ777WmaeSCWx6qVf18UqIMySaYs+KSwNRO4g==
X-Received: by 2002:adf:8506:: with SMTP id 6mr4222162wrh.128.1543267539357;
	Mon, 26 Nov 2018 13:25:39 -0800 (PST)
Received: from ?IPv6:2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9?
	([2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9])
	by smtp.gmail.com with ESMTPSA id
	n82sm1223844wma.42.2018.11.26.13.25.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Nov 2018 13:25:38 -0800 (PST)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org, Li Qiang <liq3ea@gmail.com>
Cc: ehabkost@redhat.com, qemu-trivial@nongnu.org, laurent@vivier.eu,
	pbonzini@redhat.com, rth@twiddle.net
References: <1543226303-5260-1-git-send-email-liq3ea@gmail.com>
	<87mupw3vm2.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <733cd094-3775-ba2f-242d-e58bc7f2daaa@redhat.com>
Date: Mon, 26 Nov 2018 22:25:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <87mupw3vm2.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target: hax: fix a typo
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
X-List-Received-Date: Mon, 26 Nov 2018 21:25:47 -0000

Hi Li, Alex.

On 26/11/18 12:51, Alex Bennée wrote:
> 
> Li Qiang <liq3ea@gmail.com> writes:
> 
>> Cc: qemu-trivial@nongnu.org
>>
>> Signed-off-by: Li Qiang <liq3ea@gmail.com>
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> 
>> ---
>>  target/i386/hax-all.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/i386/hax-all.c b/target/i386/hax-all.c
>> index 502ce6f0af..464744a406 100644
>> --- a/target/i386/hax-all.c
>> +++ b/target/i386/hax-all.c
>> @@ -205,7 +205,7 @@ int hax_vcpu_destroy(CPUState *cpu)
>>      }
>>
>>      /*
>> -     * 1. The hax_tunnel is also destroied when vcpu destroy
>> +     * 1. The hax_tunnel is also destroyed when vcpu destroy

I'm not native english speaker. Isn't it:

'The hax_tunnel is also destroyed at vcpu destroy'

or

'The hax_tunnel is also destroyed when vcpu is destroyed'?

>>       * 2. close fd will cause hax module vcpu be cleaned
>>       */
>>      hax_close_fd(vcpu->fd);
> 
> 
> --
> Alex Bennée
> 

