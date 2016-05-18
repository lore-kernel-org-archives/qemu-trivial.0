Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b35NX-000505-4Z
	for mharc-qemu-trivial@gnu.org; Wed, 18 May 2016 13:35:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tcminyard@gmail.com>) id 1b335l-0000bc-Sn
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 11:08:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tcminyard@gmail.com>) id 1b335h-00052V-Ht
	for qemu-trivial@nongnu.org; Wed, 18 May 2016 11:08:56 -0400
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:35053)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tcminyard@gmail.com>)
	id 1b335h-00052Q-BH; Wed, 18 May 2016 11:08:53 -0400
Received: by mail-pf0-x243.google.com with SMTP id b66so5329832pfb.2;
	Wed, 18 May 2016 08:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=reply-to:subject:references:to:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=pFa9dbuXZU6KiFIPnwQuHhpe5s9C+TSwMauCF5DH8TU=;
	b=gyUUao2MP1tPq8Nm7YR+HjcbhXdY73VU6rm5HpUx72FUlfD7zZnc3dQWnRfdP8d24F
	bzbUh9OtY8pHBvpG0gOfXcYok+V8btOpDR7+YMcs5rJys1y7PlceafOMY6QaCyif3enz
	ipi1Y9RItDN7EgZ3T6KGGeqm3HLmkd/No2DDaNkhQwdGDLBUyrZhbkx2dgGqKNY79gTe
	aMCKxWddi04tEamJWvFsyc4Mg3W0/CV/3h+L473XHJztXDxFpx/+EOOSLKGEJZG3WHKT
	RjGL6HEFNETmN4aYT4Zmp0k751RZ4vfnT0kawC/Q7y2Nlgt6pyuz15SmCOutasnvfGOM
	Oiug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:reply-to:subject:references:to:cc:from
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding;
	bh=pFa9dbuXZU6KiFIPnwQuHhpe5s9C+TSwMauCF5DH8TU=;
	b=l9jh0Qcfbmymw0Zh8YsVQVTg2ZVVlQiFE2ZIVtL+AG8F7iU2wmTnMfL2VFBP+mS+1c
	PqiEC7ZLYzu6mKOe3uMetcERlx+ZGSsbXuwU93cc93WEZzY6Hs3wSrGkli/1JMqBm+rR
	pAeYuqAvtAx+MeqxYWkKDv7QdNlWZiYTzenvOtnz2Eh8wITMk317f/BHx+w4znmH7zeF
	0bhhqU8CC02PuviwxgYs0vAAQtGeIO948aZODC6PLM5EXHCqQCjdtNvQ5Zx3HecFCeaZ
	Gn1wDuSLZdL3b2Ri5QSYpFZ2CSAsy3RgtS3lMEIXuiKlEEFLV7seNwX0+GGxlgm1UFFI
	CKJg==
X-Gm-Message-State: AOPr4FXwPObyO6SmqRUYNSm895JBK7jUwt3mRofhUu6NNlFgpRLiL7V9TWw87AEYd3Hwlw==
X-Received: by 10.98.26.205 with SMTP id a196mr11757871pfa.46.1463584132778;
	Wed, 18 May 2016 08:08:52 -0700 (PDT)
Received: from [192.168.27.3] ([108.19.215.157])
	by smtp.gmail.com with ESMTPSA id
	o2sm13033846pfi.85.2016.05.18.08.08.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 May 2016 08:08:51 -0700 (PDT)
Reply-To: minyard@acm.org
References: <1463575557-20797-1-git-send-email-mjt@msgid.tls.msk.ru>
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
From: Corey Minyard <tcminyard@gmail.com>
Message-ID: <573C8582.8020008@gmail.com>
Date: Wed, 18 May 2016 10:08:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <1463575557-20797-1-git-send-email-mjt@msgid.tls.msk.ru>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::243
X-Mailman-Approved-At: Wed, 18 May 2016 13:35:26 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] hw/ipmi: fix
 spelling
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
X-List-Received-Date: Wed, 18 May 2016 15:08:59 -0000

On 05/18/2016 07:45 AM, Michael Tokarev wrote:
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
>   hw/ipmi/ipmi_bmc_extern.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/ipmi/ipmi_bmc_extern.c b/hw/ipmi/ipmi_bmc_extern.c
> index fe12112..157879e 100644
> --- a/hw/ipmi/ipmi_bmc_extern.c
> +++ b/hw/ipmi/ipmi_bmc_extern.c
> @@ -190,7 +190,7 @@ static void ipmi_bmc_extern_handle_command(IPMIBmc *b,
>       if (ibe->outlen) {
>           /* We already have a command queued.  Shouldn't ever happen. */
>           fprintf(stderr, "IPMI KCS: Got command when not finished with the"
> -                " previous commmand\n");
> +                " previous command\n");
>           abort();
>       }
>   
Thanks.

Acked-by: Corey Minyard <cminyard@mvista.com>

