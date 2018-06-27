Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fYBeS-0000ym-G9
	for mharc-qemu-trivial@gnu.org; Wed, 27 Jun 2018 10:42:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50332)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fYBeP-0000vk-Ah
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 10:42:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fYBeL-0005fY-9V
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 10:42:29 -0400
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:39392)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fYBeL-0005dp-2z
	for qemu-trivial@nongnu.org; Wed, 27 Jun 2018 10:42:25 -0400
Received: by mail-pl0-x241.google.com with SMTP id s24-v6so1141546plq.6
	for <qemu-trivial@nongnu.org>; Wed, 27 Jun 2018 07:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=mxlO/Mp3/1S1DApDFKJY5b+BU92iINHHOSLwW5RaraE=;
	b=Ly+VwrMhqe0kH+eypHzxdzlJEvQX+xNl0T7K7nlxJ1EvRMBVyJ0KCL1Esh3rcp86Gl
	pcI7dmnR8eSuDg1HQPr59PHZSTmu78clvo8gZOjHpzZvWs9iBmME+QwNSmjRv1DWrRaK
	WH5mD7CmClvsV5AtZPDWkWlGOWOJp2V4kcvuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mxlO/Mp3/1S1DApDFKJY5b+BU92iINHHOSLwW5RaraE=;
	b=DTGf8eAJteKhchXqM+BVryC9A/tNwq4363hKXx82w0ABOWqjF7GQaMmYHI9doOMoXc
	e/qLP1WEI6dOCodurp+SltbvDamn+h1zjWivlkCGrdoiZy3BifSoUrVJkO2JTWn7G/Ts
	Tl3thvhfgKZ/Bgu9CTU62bUFY3bYCMLGwoMkBROSzWXVLBLqTjMiJP1raSt+lYs7KQb7
	Eh0spNMNo+2/NbUIimCMvBYRTJRYtzJw0eudb2IEiilhKtRmLtSwJOwrXEPftpamS90X
	FanENeBJJ9pF+S0fyyCZDYEX5uBWVUcPqqqK+e4uH7ZCpS9WyX305fADnIuFys94vTJc
	p6OQ==
X-Gm-Message-State: APt69E3Ajpx12QIqelU0I55Dk4OP+CDRhB8CqRLsQU0KaNim+XujrJFl
	jWwTnlxq/l2hKTUPGYfEsVV7HQ==
X-Google-Smtp-Source: ADUXVKL5hjFI9s5dvP3KYLv85/Qi+R2ayQq4tgswIcT/cgbbcGiID2FJ5P4XmsWVwMX3llZBjGRB6g==
X-Received: by 2002:a17:902:8d96:: with SMTP id
	v22-v6mr6383552plo.176.1530110544144; 
	Wed, 27 Jun 2018 07:42:24 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	u14-v6sm17363425pfd.103.2018.06.27.07.42.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 27 Jun 2018 07:42:23 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	Eric Blake <eblake@redhat.com>
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
	Riku Voipio <riku.voipio@iki.fi>, qemu-devel@nongnu.org
References: <20180625124238.25339-1-f4bug@amsat.org>
	<20180625124238.25339-46-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <4378adfe-32fa-3bcf-ede0-dbc339ada8a8@linaro.org>
Date: Wed, 27 Jun 2018 07:42:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180625124238.25339-46-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v5 45/46] linux-user: Use
 the IEC binary prefix definitions
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
X-List-Received-Date: Wed, 27 Jun 2018 14:42:30 -0000

On 06/25/2018 05:42 AM, Philippe Mathieu-Daudé wrote:
> It eases code review, unit is explicit.
> 
> Patch generated using:
> 
>   $ git grep -n '[<>][<>]= ?[1-5]0'
> 
> and modified manually.
> 
> Suggested-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  linux-user/main.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


