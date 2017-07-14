Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVw6F-0005Rk-5v
	for mharc-qemu-trivial@gnu.org; Fri, 14 Jul 2017 04:37:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46587)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVw6C-0005Pw-RW
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:37:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dVw69-000139-Nw
	for qemu-trivial@nongnu.org; Fri, 14 Jul 2017 04:37:20 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:34365)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dVw69-00012y-JH; Fri, 14 Jul 2017 04:37:17 -0400
Received: by mail-qk0-x242.google.com with SMTP id q66so11281305qki.1;
	Fri, 14 Jul 2017 01:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=8iHjcn/k4F6k1F3iXRyRI4Pkxtc5pCeROV+BNGd73R8=;
	b=EJHjwIPNcxYLMAlWb6wPomroaJaQT8CYyOOPJeUxFY+BfK36gyceHdRhomJ9Vdcl+z
	yKrG9xbpy6XGwGn8YBz6vDhmQhcBxn0gVQqGfwGc9mXGFF2g10IgxooGkZeriwmmk9oS
	0VGf4j5x+KmMT/hrkoWunkXMX7Ny22zuSLa2W0LlE8VikapLhmCcEDGei15sEOJfvaMz
	SzbM5qEkM4Pn4eXPoV6HI8+G/t6hAtOAGveQrcyRkl6DrvHUuhq44U1Fj1MYZJTZsEq0
	qbKGB6khqK66zpXsh8GFHSgXh2DfcIBn2j9KHJKdLaJ9H4Qy+hOsPvn3iLfItyCafPNE
	hIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8iHjcn/k4F6k1F3iXRyRI4Pkxtc5pCeROV+BNGd73R8=;
	b=hn/coOkz5PuWv34mbFLSYqsHBl+jStx7BtXi/jIU9bgYTaahMa9p/7Wr45dzMI6R7L
	WwpDUv39ys2BUHxv1lPlq3P1CTtgxdvz69a32KBRBvpQUaJHE4jeAxGwRTwSR2Fdb9j7
	Bx1lomCzblfVb6Jp+RRUCc9FKjZuiYuMCAcI53yVwiGR8B5/b4ZkNk7LwxAficsqcqa9
	oGzn5D2jhtswtArARmd4g3OM8Czbi6C0d4fI+3cGK/mfU1s+8rSOJint0a5+UkE4l7bX
	yE0Ub/dJOnPdqGEbXNaRx3mEqRbjatNWl+QMUsmu7hu295A2o0vnaWNYinTNFkrXZpq4
	wEKw==
X-Gm-Message-State: AIVw111SeAFxV4vB1ClxBkR91ldRPsRx8ROybF830h3Emhr427ioFGBf
	e+RT3sKOnSHkv1N6/og=
X-Received: by 10.55.60.13 with SMTP id j13mr10466339qka.71.1500021437056;
	Fri, 14 Jul 2017 01:37:17 -0700 (PDT)
Received: from bigtime.twiddle.net (rrcs-173-197-98-123.west.biz.rr.com.
	[173.197.98.123]) by smtp.googlemail.com with ESMTPSA id
	h17sm6359552qte.20.2017.07.14.01.37.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 14 Jul 2017 01:37:16 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-14-marcandre.lureau@redhat.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <3fbb21be-ec4c-3fd6-596e-0b80a479f8aa@twiddle.net>
Date: Thu, 13 Jul 2017 22:37:12 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170713163219.9024-14-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 13/29] vga: use
 DIV_ROUND_UP
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
X-List-Received-Date: Fri, 14 Jul 2017 08:37:21 -0000

On 07/13/2017 06:32 AM, Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau<marcandre.lureau@redhat.com>
> ---
>   hw/display/vga.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

