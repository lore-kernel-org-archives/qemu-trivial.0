Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gw9IP-000888-TH
	for mharc-qemu-trivial@gnu.org; Tue, 19 Feb 2019 12:35:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41252)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gw9IM-000859-IE
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 12:35:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gw9IL-00037s-FR
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 12:35:02 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51336)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gw9IL-00035G-4h
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 12:35:01 -0500
Received: by mail-wm1-f67.google.com with SMTP id n19so3705061wmi.1
	for <qemu-trivial@nongnu.org>; Tue, 19 Feb 2019 09:35:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5dZbDcoQLNC8uu3Lwi4qTguhttHiPbyvSNx7FTjQj5g=;
	b=dMiKodpkLVpNaovgULzsLUqgRPddSXIrzMzbijSo03+FEp4F7DhOcge7E+9HlaM42G
	Pr3y/qUKXFE5bIITrBklu80iflpR7//vJ1m/P1GeMbnlQhxN12hO1gMkObddtpWuFS6k
	p3i7p/cddDemLYmi/IxMu2ZkNRkscg1poG4PujY94inTRU/Qryzp6vhduBAXL74reF9R
	apjaZcoA1qIii/0krc8GysbU7GAYGcd/a8o5kAXIgZRhZS0AJFoL+O6cAHKfbOXYUbK6
	/ITeXeKnVQuk6xxwDx+gGTV+uU9dXZL0w9UwsdpvNMfq2PqkFnSxL2+0F9mxbwo9u1zN
	MiEA==
X-Gm-Message-State: AHQUAubqg/rMrvJnyL1rFwQF1e67ocjHtZXnEmxhAnBvAeHMtgOZCvv8
	A0cFHdxH+Lf3GnuaD+O/sVaZqg==
X-Google-Smtp-Source: AHgI3IZANszGy1sBf7ALs6PrWwWHvdIS/xHkhhiy70kaeTdfPM/oO/tYLHhxnRNJmiRHmDBdyEzFQw==
X-Received: by 2002:a1c:f50a:: with SMTP id t10mr3727062wmh.126.1550597699959; 
	Tue, 19 Feb 2019 09:34:59 -0800 (PST)
Received: from [192.168.1.37] (109.red-83-53-160.dynamicip.rima-tde.net.
	[83.53.160.109]) by smtp.gmail.com with ESMTPSA id
	d24sm53670168wrb.47.2019.02.19.09.34.58
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 09:34:59 -0800 (PST)
To: Wei Yang <richardw.yang@linux.intel.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: imammedo@redhat.com, mjt@tls.msk.ru
References: <20190219013106.17538-1-richardw.yang@linux.intel.com>
	<20190219013106.17538-2-richardw.yang@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <e59b0920-4698-a0d1-7990-77d9e2202f9b@redhat.com>
Date: Tue, 19 Feb 2019 18:34:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190219013106.17538-2-richardw.yang@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] CODING_STYLE: specify
 the indent rule for multiline code
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
X-List-Received-Date: Tue, 19 Feb 2019 17:35:04 -0000

Hi,

On 2/19/19 2:31 AM, Wei Yang wrote:
> We didn't specify the indent rule for multiline code here, which may
> misleading users. And in current code, the code use different rules.
> 
> Add this rule in CODING_STYLE to make sure this is clear to every one.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  CODING_STYLE | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/CODING_STYLE b/CODING_STYLE
> index ec075dedc4..73f66ca185 100644
> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -29,6 +29,32 @@ Spaces of course are superior to tabs because:
>  
>  Do not leave whitespace dangling off the ends of lines.
>  
> +1.1 Multiline Indent
> +
> +There are several places where indent is necessary:
> +
> + - struct definition
> + - if/else
> + - while/for
> + - function definition & call
> +
> +All the above cases apply the same rule: indent with four spaces.
> +
> +While the last three case may face another situation: code should spread into
> +several lines. In this case the rule is align the new line with first
> +parentheses.
> +
> +For example:
> +
> +    if (a == 1 &&
> +        b == 2)
> +
> +    while (a == 1 &&
> +           b == 2)
> +
> +    do_something(arg1, arg2
> +                 arg3)

Thanks for clearing this.

What is still unclear is what to do when a function name is over 60
characters (you follow a library/API and can not shorten it), for example:

static void ccid_card_vscard_handle_message(PassthruState *card,
    const VSCMsgHeader *scr_msg_header);

What is the project guideline in this case?
(Cc'ed Peter).

> +
>  2. Line width
>  
>  Lines should be 80 characters; try not to make them longer.
> 

