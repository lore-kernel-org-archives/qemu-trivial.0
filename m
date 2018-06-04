Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fPush-0004TN-W0
	for mharc-qemu-trivial@gnu.org; Mon, 04 Jun 2018 15:11:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41634)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPusd-0004TB-Hc
	for qemu-trivial@nongnu.org; Mon, 04 Jun 2018 15:11:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPusX-0005PO-D6
	for qemu-trivial@nongnu.org; Mon, 04 Jun 2018 15:10:59 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:33965)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPusX-0005Ov-8C; Mon, 04 Jun 2018 15:10:53 -0400
Received: by mail-qt0-x243.google.com with SMTP id d3-v6so7364709qto.1;
	Mon, 04 Jun 2018 12:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=0cpGLect97ZmHrEkblRCBbyQAhoWSLpw7xv89NhdbF0=;
	b=k3qqXZvMY2VCmq7QGImxdQykjI8hAAPc2G6JGBa9tQRmN7nUfMzqeLgTbIOlNqnEF5
	LssB4ZUaI0N+kjqiqot2CWmZQ9QjbS0djSTg9VSHRSxrg2y5TBzaCSMp5EchHDdhbZqh
	ObSRr/k8AEszFVC4AiKt0tBnmF9S3LwpuceVQVWiHxNTAHQksXkcPEqHvdRivWEHNC8Q
	564Fzd7mxcreiXR/7nKxuImPYMVHK53qUJZuSjLKVl0MBe5YO0/xSgXsAEQCMIytInm+
	4qrdtyigz3m87zKfGYA4aBjC+OFyHsyA2SZ/dSSor49D4VNNZihPCCKQLUgBJpOTHW0x
	H/LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=0cpGLect97ZmHrEkblRCBbyQAhoWSLpw7xv89NhdbF0=;
	b=BKqDc5Qr88INhvQ9O/pssGnVDGzDUyH0FT3cBP8U9c/fFOytt/N8OdjLHOI/XG5ZN5
	OP/noICxE9ALRvIEVLXriIR5P5TVfFGux07MZ6sggPS6mSiII7BiO6rJNPR/QIzPEHb1
	w6+Q34CcJGVxB+64MKcCEsLIhiZHN7yhZSrzbwIe1wskX7s1CNFp6OyOWcobpl4ws7bq
	8Y9x2x4ImxdB6RHRzYKDIZU22F9TWg7uuJLTBl7mhh4xwG5fek7sp2k1FAn0PN+T8MxL
	SJLBOJQfcSBklHa5THW0gE1Lg9hLbArmac0obDj7EacHFKuwkHlZBD0EcScL/ZSloMK2
	VHOg==
X-Gm-Message-State: APt69E1tBg5+m0jpAnmDwP8lTMU2VAo5Bb14aJiiB+gQELsVvtjlRVE8
	kcbg5ndrpfHeEQd3XQeizZI=
X-Google-Smtp-Source: ADUXVKIQimvDvnHNLT68wyaif0eTH3wtPf88ufnQiFmJWve6eo0fZL5hiWd+bhO+dUor2KePHN+QeQ==
X-Received: by 2002:ac8:300e:: with SMTP id
	f14-v6mr20901675qte.89.1528139452664; 
	Mon, 04 Jun 2018 12:10:52 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	k30-v6sm6043338qtc.31.2018.06.04.12.10.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Jun 2018 12:10:52 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Richard Henderson <rth@twiddle.net>,
	patches@linaro.org
References: <20180604162140.20688-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <f191ff51-7bcb-dc30-e225-8ac83a4fbadd@amsat.org>
Date: Mon, 4 Jun 2018 16:10:49 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180604162140.20688-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] CODING_STYLE: Define our
 preferred form for multiline comments
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
X-List-Received-Date: Mon, 04 Jun 2018 19:11:03 -0000

On 06/04/2018 01:21 PM, Peter Maydell wrote:
> The codebase has a bit of a mix of
>  /* multiline comments
>   * like this
>   */
> and
>  /* multiline comments like this
>     in the GNU Coding Standards style */
> 
> State a preference for the former.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I admit that to some extent I'm imposing my aesthetic
> preferences here; pretty sure we have a lot more style
> 1 comments than style 2, though.

The later is easier to indent with unintelligent editors.

Any one is fine as long as it has a guideline in coding style.

> ---
>  CODING_STYLE | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/CODING_STYLE b/CODING_STYLE
> index 12ba58ee293..fb1d1f1cd62 100644
> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -124,6 +124,19 @@ We use traditional C-style /* */ comments and avoid // comments.
>  Rationale: The // form is valid in C99, so this is purely a matter of
>  consistency of style. The checkpatch script will warn you about this.
>  
> +Multiline comments blocks should have a row of stars on the left
> +and the terminating */ on its own line:
> +    /* like
> +     * this
> +     */
> +Putting the initial /* on its own line is accepted, but not required.
> +(Some of the existing comments in the codebase use the GNU Coding
> +Standards form which does not have stars on the left; avoid this
> +when writing new comments.)
> +
> +Rationale: Consistency, and ease of visually picking out a multiline
> +comment from the surrounding code.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +
>  8. trace-events style
>  
>  8.1 0x prefix
> 

