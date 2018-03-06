Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1etHk3-0000G4-Ds
	for mharc-qemu-trivial@gnu.org; Tue, 06 Mar 2018 13:55:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1etHk1-0000DA-RG
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 13:55:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1etHjx-0004Gg-5J
	for qemu-trivial@nongnu.org; Tue, 06 Mar 2018 13:55:13 -0500
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:38971)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1etHjw-0004GD-Ux; Tue, 06 Mar 2018 13:55:09 -0500
Received: by mail-wr0-x242.google.com with SMTP id w77so22045121wrc.6;
	Tue, 06 Mar 2018 10:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=aLrK75OYBW7f+ytQHXQo27s1sOaT4sE8CWJbJN/Bxas=;
	b=PpFwLPF3rS0lEz7bHHWbFA4JYezZPbV688PBfDU1ZClZZZA/u7Hk68OE8JC6q5teID
	ivdYyE/ss+fGZGVszl5wU+ax2m1v4qY+5+wcH38nMo7leQE9/42s56eBQdB4r9qv7HN9
	bjce3kADWSwEYAHD/pfX7utuWSMStT7z0uYfDIBdjXAwxdJcmiAf4bcnM9Ac96usJr9a
	F2du3hCENGPu/qJpJnArW11D3j+i9AWiYlJJfKSQnKn2uGfc2UZTJr/mEW5Am7DQGQAs
	9sQ6ZxKZVRtJg1/lQcChrkOGnI2fGhdABDmoRjLTaP5zsKh+wzPUKkU1aSKHG9Sgng0w
	7iwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=aLrK75OYBW7f+ytQHXQo27s1sOaT4sE8CWJbJN/Bxas=;
	b=iHoKYeY2VLBHMm7kbG7WGz7/vxGQGhsQ7eSSq0NU7vmA2vEIlsfbd74aqDOCy92qLU
	dWWmLJgaJeA8S0orDpUiiV43My8r971JMBgMWbxddid4z/C9K6GrERwxDSA4tRzNmCwv
	VzqEWH9OE6/B3M3oLs3ZxqYKUxlukdlwQ4aYm8bbaIbTnflFAv57PDHu+xKR4EsCc3ji
	sQJfi8tCT+rQi7avEkycAtNTnAPN3aqgPVu04UmfZmmu+1d80oM+ZNDKe8xb9tDLLlb1
	cjMeI6oCB8PBPi08NeFXobRuhAJVMmIVJ94/h1RHxAnqlCMd2pCR+HK+hfIXWwWdbFiD
	qsFw==
X-Gm-Message-State: APf1xPAWmxNzPXMfLXIg5zyMm7FtDQCRN64A+gT2d47ePtz2F2xgPTaB
	0b/a6nTZ6eEwYjWGW7oB8p/vG9ntNlk=
X-Google-Smtp-Source: AG47ELuBmM3kEGeFdqyES+ZV60oNlzjgaIiCvUOPrCtLaRURY1wdm5oMrkHN5ze4fVT8W7MMZ/okLw==
X-Received: by 10.223.208.132 with SMTP id y4mr15676261wrh.185.1520362507815; 
	Tue, 06 Mar 2018 10:55:07 -0800 (PST)
Received: from [192.168.182.119]
	(ABordeaux-653-1-285-17.w90-38.abo.wanadoo.fr. [90.38.129.17])
	by smtp.gmail.com with ESMTPSA id x82sm7900764wmg.7.2018.03.06.10.55.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Mar 2018 10:55:07 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
References: <20180306134317.836-1-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <0a375694-3228-11fb-0f80-7e31f3df53f1@amsat.org>
Date: Tue, 6 Mar 2018 15:55:06 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180306134317.836-1-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: Re: [Qemu-trivial] [PATCH v2] misc: don't use hwaddr as a type in
 trace events
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
X-List-Received-Date: Tue, 06 Mar 2018 18:55:14 -0000

On 03/06/2018 10:43 AM, Daniel P. Berrangé wrote:
> Use types that are defined by QEMU in trace events caused build failures
> for the UST trace backend:
> 
>   In file included from trace-ust-all.c:13:0:
>   trace-ust-all.h:11844:206: error: unknown type name ‘hwaddr’
> 
> It only knows about C built-in types, and any types that are pulled in
> from includs of qemu-common.h and lttng/tracepoint.h. This does not
> include the 'hwaddr' type, so replace it with a uint64_t which is what
> exec/hwaddr.h defines 'hwaddr' as. This fixes the build failure
> introduced by
> 
>   commit 9eb8040c2d2b38e1a40bb6129b1b668fa178fcab
>   Author: Peter Maydell <peter.maydell@linaro.org>
>   Date:   Fri Mar 2 10:45:39 2018 +0000
> 
>     hw/misc/tz-ppc: Model TrustZone peripheral protection controller
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/misc/trace-events | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/misc/trace-events b/hw/misc/trace-events
> index eb5ffcc0a8..562d9ed005 100644
> --- a/hw/misc/trace-events
> +++ b/hw/misc/trace-events
> @@ -92,8 +92,8 @@ tz_ppc_cfg_sec_resp(int level) "TZ PPC: cfg_sec_resp = %d"
>  tz_ppc_irq_enable(int level) "TZ PPC: int_enable = %d"
>  tz_ppc_irq_clear(int level) "TZ PPC: int_clear = %d"
>  tz_ppc_update_irq(int level) "TZ PPC: setting irq line to %d"
> -tz_ppc_read_blocked(int n, hwaddr offset, bool secure, bool user) "TZ PPC: port %d offset 0x%" HWADDR_PRIx " read (secure %d user %d) blocked"
> -tz_ppc_write_blocked(int n, hwaddr offset, bool secure, bool user) "TZ PPC: port %d offset 0x%" HWADDR_PRIx " write (secure %d user %d) blocked"
> +tz_ppc_read_blocked(int n, uint64_t offset, bool secure, bool user) "TZ PPC: port %d offset 0x%" PRIx64 " read (secure %d user %d) blocked"
> +tz_ppc_write_blocked(int n, uint64_t offset, bool secure, bool user) "TZ PPC: port %d offset 0x%" PRIx64 " write (secure %d user %d) blocked"
>  
>  # hw/misc/iotkit-secctl.c
>  iotkit_secctl_s_read(uint32_t offset, uint64_t data, unsigned size) "IoTKit SecCtl S regs read: offset 0x%x data 0x%" PRIx64 " size %u"
> 

