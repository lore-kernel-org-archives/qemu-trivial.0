Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bi5G9-00042s-B9
	for mharc-qemu-trivial@gnu.org; Thu, 08 Sep 2016 15:45:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cminyard@mvista.com>) id 1bi5G7-00040c-I6
	for qemu-trivial@nongnu.org; Thu, 08 Sep 2016 15:45:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cminyard@mvista.com>) id 1bi5G4-0004O8-IM
	for qemu-trivial@nongnu.org; Thu, 08 Sep 2016 15:45:14 -0400
Received: from mail-pf0-x22c.google.com ([2607:f8b0:400e:c00::22c]:36094)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cminyard@mvista.com>) id 1bi5G4-0004NB-CA
	for qemu-trivial@nongnu.org; Thu, 08 Sep 2016 15:45:12 -0400
Received: by mail-pf0-x22c.google.com with SMTP id 128so21154073pfb.3
	for <qemu-trivial@nongnu.org>; Thu, 08 Sep 2016 12:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=GrhIXZJiQpnOenKs0fBVh8yD3bLTvH5yiHbqfM3gJv4=;
	b=ldmW8pJkYMXUN31z12VbAamU04Itmm9vSoPQJhemnc3l/5AIjGYgvnxlonsgc5BgEh
	dBooV5/t+6MYPP83idRLxt/NZoBsnIQc13II3WpuIwxf6FENZTkztgneH1QopUMLejJw
	LKec1TsqcQXTWH1+AjCPyYKbUpYEqFwF49sFidOqYVQ/vNmlhHqdiK/crbPD61WpBdJQ
	i25BEqWqFZJSg3+ZMBUUqoXEIWbCbEL+tkjkgchP1mC8Iwj27r8siswp+ZP9+e592Cn5
	6jpa94X+wUFYhldyLcVLLNbvE6B7E5iflM3bLuViUKe2brTs46wKQ0YI7Alb6AgWG7Hp
	I0Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=GrhIXZJiQpnOenKs0fBVh8yD3bLTvH5yiHbqfM3gJv4=;
	b=au3nwLlYKYctMXQtNU9zhvSImMPY47Phl8TV4zJqyCXF7Zsm+yX2c8UptflaELwI4e
	wUDQBsnRQPZvCqK7XQw0mbwGZIw6BlbT61KJYn1Wmh7jFhUozY1rdT/AlA0U0Xp3c0WU
	jqKouPCgK8l2PsnvtJxVwBMfrIzIW35s8nAil6vcsQ5+F0HSak6YJkreXhnVAqgabH7X
	EIHZkIfZLHSxNJWIwyvX27zqW2q5SdI0M2ZTh3YZJQmzASxsztagdoBvvBwAhtZ3htY6
	cgkK+xYI0jjvx/z9dVhWFaL47JX8ZApPzk94O5xD1HO4SE37Q29Ru/jg9UKZDyfnwJoD
	fTJw==
X-Gm-Message-State: AE9vXwNIRGdylaubxDfwiusr84f3IS+vzyd4+DzGO7lb3ao8dRHldjZz9U+FkrVTyTn0LYj+
X-Received: by 10.98.32.200 with SMTP id m69mr2416771pfj.15.1473363910146;
	Thu, 08 Sep 2016 12:45:10 -0700 (PDT)
Received: from [10.22.7.35] (50-233-148-156-static.hfc.comcastbusiness.net.
	[50.233.148.156]) by smtp.gmail.com with ESMTPSA id
	v26sm58122816pfi.41.2016.09.08.12.45.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Sep 2016 12:45:09 -0700 (PDT)
To: "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
References: <1473096079-1310-1-git-send-email-berrange@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Corey Minyard <cminyard@mvista.com>
Message-ID: <b6c55975-e5c1-6f21-d97e-349b8deeedda@mvista.com>
Date: Thu, 8 Sep 2016 14:45:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1473096079-1310-1-git-send-email-berrange@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::22c
Subject: Re: [Qemu-trivial] [PATCH] ipmi: fix build config variable name for
 ipmi_bmc_extern.o
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
X-List-Received-Date: Thu, 08 Sep 2016 19:45:16 -0000

On 09/05/2016 12:21 PM, Daniel P. Berrange wrote:
> The original commit:
>
>    commit 67aa56fc03bea44ccf384ea400515a8a58844a50
>    Author: Corey Minyard <cminyard@mvista.com>
>    Date:   Thu Dec 17 12:50:06 2015 -0600
>
>      ipmi: Add an external connection simulation interface
>
> defined a new variable CONFIG_IPMI_EXTERN, but then went
> on to mistakely use the pre-existing CONFIG_IPMI_LOCAL
> variable.

Thanks, this is queued and I'll submit

-corey

>
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> ---
>   hw/ipmi/Makefile.objs | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/ipmi/Makefile.objs b/hw/ipmi/Makefile.objs
> index a90318d..1b422bb 100644
> --- a/hw/ipmi/Makefile.objs
> +++ b/hw/ipmi/Makefile.objs
> @@ -1,5 +1,5 @@
>   common-obj-$(CONFIG_IPMI) += ipmi.o
>   common-obj-$(CONFIG_IPMI_LOCAL) += ipmi_bmc_sim.o
> -common-obj-$(CONFIG_IPMI_LOCAL) += ipmi_bmc_extern.o
> +common-obj-$(CONFIG_IPMI_EXTERN) += ipmi_bmc_extern.o
>   common-obj-$(CONFIG_ISA_IPMI_KCS) += isa_ipmi_kcs.o
>   common-obj-$(CONFIG_ISA_IPMI_BT) += isa_ipmi_bt.o



