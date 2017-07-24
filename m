Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZic5-0003UC-AV
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 15:01:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56738)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dZic3-0003SH-1P
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 15:01:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dZibz-0006eS-51
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 15:01:51 -0400
Received: from mail-qt0-x232.google.com ([2607:f8b0:400d:c0d::232]:37487)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dZibz-0006eM-0m; Mon, 24 Jul 2017 15:01:47 -0400
Received: by mail-qt0-x232.google.com with SMTP id r14so42076859qte.4;
	Mon, 24 Jul 2017 12:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=wvWWcxuwMlrwsjKiK/CxM3pTH7bE+2O84E2E2V22wAI=;
	b=PkDR0/jwHkmP9Nzrcnu/gbjigxzEnyx5jVQ7DEZa/13KE9iIs8JQ704PpZv7TCYJSL
	zFkR0Kq5ZtcAyCKlG/XK/LtfElxZYM2b4u03Y4VTAExUk1Iil6bdStYod+xLjfNByyjQ
	M5W860ls4zTGv97ys6aA4eRPJVKuLWFQhFqBL98EfFsicKCqQQZCo9H4B4Y2Y4g1tUHY
	8FcdMMD5gFJJZ5iMRqiUFSTIBUHNLJHAKdWQqoVIrz6C5SiBAYqPHsKfA/8WBOUzm9yx
	CbJkM9TgwmqA/PtDfYs2aflrffZcDAu6kIyJWvZTHpxL0OXkvMANrt6pKMcG3hR5r0nM
	xFJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=wvWWcxuwMlrwsjKiK/CxM3pTH7bE+2O84E2E2V22wAI=;
	b=pZmIytc58+00h6ttO3GiYnXtHxl9OmkMieIBGse3C1F39/uK/I0MORsXnFF3XhylMY
	b0ev1W3eYdrXpzLwgkmgCSMIbdDH0XJISzBMegCN2DbOe8doRB4vNLMuiDO04jAPZIVT
	rTd6EvpPn/CyGxl60/AMQyIYA/mb7WI2Xt5atVCuBCtoR8t+hyTtN0YAnGsJiBql8nLe
	dPsA/AFo++j564DBm7S0UpAnxnxonyHjsPRP4+/4LYkpW9EjSFU4MUC7xu5TrBCUJxjc
	UXlWrNn8IZP6jpwpfSMMvSVBwJB3e3qmPYIIyZlvt6TT6SF8zYIvtvir09KZ2tY3Yx0o
	W/AA==
X-Gm-Message-State: AIVw1118i7be+QqBxFqjzS4A6RDdI/0c+k/HsAQIM79+iC23GZkMVn1f
	FKrjLqLDriSvX2BM8ag=
X-Received: by 10.237.36.111 with SMTP id s44mr23801947qtc.317.1500922906056; 
	Mon, 24 Jul 2017 12:01:46 -0700 (PDT)
Received: from bigtime.twiddle.net ([71.217.194.233])
	by smtp.googlemail.com with ESMTPSA id
	q4sm1245992qti.13.2017.07.24.12.01.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 12:01:44 -0700 (PDT)
Sender: Richard Henderson <rth7680@gmail.com>
To: Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-24-f4bug@amsat.org>
	<4de3bb09-6894-ee92-eb49-0f64efe1bad8@vivier.eu>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <0a7a2681-4702-5334-aaa8-e477aaa5c98a@twiddle.net>
Date: Mon, 24 Jul 2017 12:01:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <4de3bb09-6894-ee92-eb49-0f64efe1bad8@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::232
Subject: Re: [Qemu-trivial] [PATCH for 2.10 23/35] m68k/translate: fix
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
X-List-Received-Date: Mon, 24 Jul 2017 19:01:52 -0000

On 07/24/2017 11:54 AM, Laurent Vivier wrote:
> Le 24/07/2017 à 20:27, Philippe Mathieu-Daudé a écrit :
>> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
>> index ada2a91b64..1a2f421aab 100644
>> --- a/target/m68k/translate.c
>> +++ b/target/m68k/translate.c
>> @@ -1321,7 +1321,8 @@ static void gen_cc_cond(DisasCompare *c, DisasContext *s, int cond)
>>       case 5: /* CS (C) */
>>           /* Some cases fold C into X.  */
>>           if (op == CC_OP_ADDB || op == CC_OP_ADDW || op == CC_OP_ADDL ||
>> -            op == CC_OP_ADDB || op == CC_OP_ADDW || op == CC_OP_ADDL) {
>> +            op == CC_OP_SUBB || op == CC_OP_SUBW || op == CC_OP_SUBL ||
>> +            op == CC_OP_LOGIC) {
> 
> According to commit (db3d7945) introducing the incorrect copy/paste, I
> don't think we need the CC_OP_LOGIC here. Logic operations never
> generates X flags (whereas they can generate Z and and N).

Indeed, look at the comment below.  LOGIC is supposed to fall through to the 
code that produces TCG_COND_NEVER.


r~

