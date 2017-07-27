Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daapV-0003Xw-Lh
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 00:55:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59602)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1daapT-0003Xc-Cf
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 00:55:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1daapQ-0005Z4-Q7
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 00:55:19 -0400
Received: from mail-qk0-x236.google.com ([2607:f8b0:400d:c09::236]:38541)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1daapQ-0005Xg-Js; Thu, 27 Jul 2017 00:55:16 -0400
Received: by mail-qk0-x236.google.com with SMTP id x191so30563220qka.5;
	Wed, 26 Jul 2017 21:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=vYuOgm0loPLwWuYV+GMgnMehQ4rYZ3pYJxQOtybE7ow=;
	b=pFEMFg/OIqc+KDxOaNY794Ru+9nKdzYxbU7WbNpSTdMvpuczH6YbT7/xS99thtP/HP
	SD0Fu6X9OFYmM2x/WyawlLCjg8WRDv5OWAVd5GqOGY8U+5S0fxsm8RpERD4Xvy7PMlt4
	dFc3APBJQYt2AtVnkc0G7pwZXaVHQE9/jWvQ35pqcWLuxVWPu56KVeIz9CvrbRANoP4j
	vUbCznJHXrII+LYKxFfkuLizybOx4e/rne6y+1wYIrZfoULdTNVk5H//6CybYN6HxhUC
	OgkG57hpQPO+HqLgcmH6dfBGSLPRP/h8LTcOvdMgn2Dqw0emlKZstlERGdmoCw+e0fxE
	vBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vYuOgm0loPLwWuYV+GMgnMehQ4rYZ3pYJxQOtybE7ow=;
	b=qqwO7BlkcIFyHbohPlwpAXva3TsnQuQs213fWMQukhzzixy94Xx3YEzcQnaZkiCLSe
	n4bdOwlPwSyQyLB4dI2I+8W3GOQ7C/p1F66WsH6Xr/Xi+hVd3G86V73XQToVJ0ZIqXmw
	mecRcmmPask8fZeDCgVQGjTXrolsfPRBlCQzRZqjnJOHd2Lv/Fchy6y+tggigm0pEVLh
	VCephHEpyLn5unLexHjoG2GLJtmEesCZaF5tB9k//dbXx1fH1jqBeG3Y10xEanFudnPp
	G4iEdj3i+4rWQ2M+HuRnY0qGDR6UQEc47czIh/EE4ej2/A0m7/GP+3yj1DTvTMEFT63n
	zjAg==
X-Gm-Message-State: AIVw1110iGCbKoDcc+DUZnM3eyt20gx66nfjuCopzIm8Qm3KRbvffmw3
	bfvAxzXeP+sQKw==
X-Received: by 10.55.169.134 with SMTP id s128mr4122919qke.69.1501131314307;
	Wed, 26 Jul 2017 21:55:14 -0700 (PDT)
Received: from bigtime.twiddle.net ([71.217.194.233])
	by smtp.googlemail.com with ESMTPSA id
	j39sm13469774qtj.19.2017.07.26.21.55.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 21:55:13 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>
References: <20170727024224.22900-1-f4bug@amsat.org>
	<20170727024224.22900-11-f4bug@amsat.org>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <1f4f328c-965e-1000-644b-68f799ceab41@twiddle.net>
Date: Wed, 26 Jul 2017 21:55:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170727024224.22900-11-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::236
Subject: Re: [Qemu-trivial] [PATCH for 2.10 v2 10/20] m68k/translate: fix
 incorrect copy/paste
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
X-List-Received-Date: Thu, 27 Jul 2017 04:55:20 -0000

On 07/26/2017 07:42 PM, Philippe Mathieu-Daudé wrote:
> db3d7945ae extended gen_cc_cond() for cond [6, 7, 9, 10] but misswrote [4, 5]
> 
> target/m68k/translate.c:1323:70: warning: identical expressions on both sides of logical operator
>          if (op == CC_OP_ADDB || op == CC_OP_ADDW || op == CC_OP_ADDL ||
>              op == CC_OP_ADDB || op == CC_OP_ADDW || op == CC_OP_ADDL) {
>              ~~~~~~~~~~~~~~~~    ~~~~~~~~~~~~~~~~    ~~~~~~~~~~~~~~~~ ^
> 
> Reported-by: Clang Static Analyzer
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Reviewed-by: Laurent Vivier<laurent@vivier.eu>
> ---
>   target/m68k/translate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <rth@twiddle.net>


r~

