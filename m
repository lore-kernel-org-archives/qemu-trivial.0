Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gw9MI-0002Tt-Bs
	for mharc-qemu-trivial@gnu.org; Tue, 19 Feb 2019 12:39:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42149)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gw9MG-0002SK-Ex
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 12:39:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gw9ME-0005N8-Fc
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 12:39:04 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:35554)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gw9MC-0005K2-CM
	for qemu-trivial@nongnu.org; Tue, 19 Feb 2019 12:39:02 -0500
Received: by mail-wr1-f66.google.com with SMTP id t18so22992211wrx.2
	for <qemu-trivial@nongnu.org>; Tue, 19 Feb 2019 09:38:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=McQkv9nZyDwQk4Upi2HTQe4MEe2QJoPn3ai+vhI+fko=;
	b=KoKfk1NjXUlovz13WgM++icJik90pW4FTHC2PiLhD83hkyy/XLodCRd46t/57JjQ2N
	88pMnwTg27ec+tNsIwbJmUog49ijrGawlX681wzMulBBWg0JzZJvh41D6H4F/Bvrw1RX
	9+CIrkIU8SqHeZktg8Sh0IB+bndz+st5VSQ0uj0rcAicMtba3N6CSA1z7GUea3bRcZ/p
	ey35zS1esmGB6bIP8cWg05tbr53YsMIsgIlaMf0u0Km2kz3Inn0DhfTvs5E4THjwVHN6
	7SXP/uy8UUpHmcTxcwEsU7Y9ogVe7o6qaPKMYdzxy6AWl9ZT4eyzID2VDZezeh69wwjb
	sV6w==
X-Gm-Message-State: AHQUAuZRnqMruTflL30ExzdzPb3Y+dzjICEbc/O4Baw8B4i/pA8R3eqL
	i9y81qIlY4byp4E+hfB1BRH0cg==
X-Google-Smtp-Source: AHgI3Ibo4sdzTav3JI194DerCHjU30zCiLQHdzr7pdsnXzM8MhQQj6+FCk9avC9HxB63ZuMZIRkrnA==
X-Received: by 2002:adf:b741:: with SMTP id n1mr20830366wre.287.1550597936300; 
	Tue, 19 Feb 2019 09:38:56 -0800 (PST)
Received: from [192.168.1.37] (109.red-83-53-160.dynamicip.rima-tde.net.
	[83.53.160.109]) by smtp.gmail.com with ESMTPSA id
	x3sm14083170wru.76.2019.02.19.09.38.55
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Feb 2019 09:38:55 -0800 (PST)
To: Wei Yang <richardw.yang@linux.intel.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: imammedo@redhat.com, mjt@tls.msk.ru
References: <20190219013106.17538-1-richardw.yang@linux.intel.com>
	<20190219013106.17538-3-richardw.yang@linux.intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <ba83c335-c0f1-5190-33a9-f2f7f44c55f0@redhat.com>
Date: Tue, 19 Feb 2019 18:38:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190219013106.17538-3-richardw.yang@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] CODING_STYLE: indent
 example code as all others
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
X-List-Received-Date: Tue, 19 Feb 2019 17:39:05 -0000

On 2/19/19 2:31 AM, Wei Yang wrote:
> All the example code are indented with four spaces except this one.
> 
> Fix this by adding four spaces here.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> ---
>  CODING_STYLE | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/CODING_STYLE b/CODING_STYLE
> index 73f66ca185..27581d80c1 100644
> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -134,10 +134,10 @@ block to a separate function altogether.
>  When comparing a variable for (in)equality with a constant, list the
>  constant on the right, as in:
>  
> -if (a == 1) {
> -    /* Reads like: "If a equals 1" */
> -    do_something();
> -}
> +    if (a == 1) {
> +        /* Reads like: "If a equals 1" */

I guess you found a bug in the documentation :)

Since 8c06fbdf36bf4d the style asked is:

    We now require Linux-kernel-style multiline comments:
        /*
         * line one
         * line two
         */

> +        do_something();
> +    }
>  
>  Rationale: Yoda conditions (as in 'if (1 == a)') are awkward to read.
>  Besides, good compilers already warn users when '==' is mis-typed as '=',
> 

