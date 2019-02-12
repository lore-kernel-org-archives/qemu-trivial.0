Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtYn2-0006Vp-GA
	for mharc-qemu-trivial@gnu.org; Tue, 12 Feb 2019 09:12:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtYmv-0006QK-6L
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 09:11:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gtYme-0003Ws-3O
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 09:11:43 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:33860)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gtYmc-0003JY-RZ
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 09:11:35 -0500
Received: by mail-wm1-f66.google.com with SMTP id y185so1465338wmd.1
	for <qemu-trivial@nongnu.org>; Tue, 12 Feb 2019 06:11:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=If08xoxw62yBhUYzNPMEg3aqSLM+IBT5klL43QF3Uts=;
	b=W4004ghhnAEyaYDQAMqRRP65SKbPFO7EZXtDAEHVJksOy3GdCddc1kDUxi0XgBhk/k
	+fkC0uzBeAEL8j4huY+RVyt3hoQJHdwwwKxtSgfmOulQO0tbJKsnYB2oB1lo/1tLiscP
	pXMTWoV1VtAJRAqgxX7GhMi8XXD2n9Mffnyd6K2o2ro6lSxLQmhQQ/yQxD9rpyDAsb+Q
	J+SV2lynf64d5lFm53Fb2vmJLqznbmGlJ+Ge70K/13SceR3cbXJdZt+5T98vBMFPVQaT
	f8GeRF/qu/1wzHNa0MLwO+RacjY4ZIDRprMq7ivWcRsQLdhEuLpLy35KddiviVdIyAdS
	9vzw==
X-Gm-Message-State: AHQUAuZJgXL36xXLGV44I22mjAr6fIyjS+JGHHqnTGREaTHtV3pM2llw
	v1NrlgOIZSSuTaEUWgkL1+9l03cRR8w=
X-Google-Smtp-Source: AHgI3IZodyQ0UvhyC4tjTlLwiSaN5zycYA5Hw3KsDxUGD8XXil9umntImTRR23vpMYXGFOwUcuzrag==
X-Received: by 2002:a1c:2944:: with SMTP id p65mr3015923wmp.20.1549980685186; 
	Tue, 12 Feb 2019 06:11:25 -0800 (PST)
Received: from [192.168.1.103] (10.red-83-35-153.dynamicip.rima-tde.net.
	[83.35.153.10])
	by smtp.gmail.com with ESMTPSA id v4sm3687762wme.6.2019.02.12.06.11.24
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Feb 2019 06:11:24 -0800 (PST)
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
	qemu-devel@nongnu.org, pbonzini@redhat.com, kraxel@redhat.com,
	mst@redhat.com
Cc: qemu-trivial@nongnu.org
References: <20190212134758.10514-1-dgilbert@redhat.com>
	<20190212134758.10514-3-dgilbert@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <fa71e7e8-b5b4-2d30-2914-a79b15ba1bf3@redhat.com>
Date: Tue, 12 Feb 2019 15:11:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190212134758.10514-3-dgilbert@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/4] HMP: Prepend errors
 with 'Error:'
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
X-List-Received-Date: Tue, 12 Feb 2019 14:11:59 -0000

On 2/12/19 2:47 PM, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Always make error messages start with 'Error:' as a fallback
> to make sure that anything parsing them can tell it failed.
> 
> Note: Some places don't use hmp_handle_error
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hmp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hmp.c b/hmp.c
> index b2a2b1f84e..4d14718fea 100644
> --- a/hmp.c
> +++ b/hmp.c
> @@ -62,7 +62,7 @@ static void hmp_handle_error(Monitor *mon, Error **errp)
>  {
>      assert(errp);
>      if (*errp) {
> -        error_report_err(*errp);
> +        error_reportf_err(*errp, "Error: ");
>      }
>  }
>  
> 

