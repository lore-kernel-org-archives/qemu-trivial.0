Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZitS-0005Mf-MS
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 15:19:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34261)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZitQ-0005L8-DG
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 15:19:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZitP-0006W6-Ge
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 15:19:48 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:33458)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZitL-0006VK-65; Mon, 24 Jul 2017 15:19:43 -0400
Received: by mail-qt0-x241.google.com with SMTP id n42so3249995qtn.0;
	Mon, 24 Jul 2017 12:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=2cWauVrYEvGnTkGXcKTL+hVYgJaRNFjUltuWydjmq80=;
	b=SNvSYe5q0jYoAkqJ0ohDJzvkGjkpzs0MSWCMYjvZ0Ils6sWMI219JgRUogJoQ9DQ6d
	jt50XRXU7w8bkWO8NO3YPZlgib0e7HqvITsNEXA/LzVX3jz1YXlj6yJ37OsMyL6Z1Fef
	653/vpEzNC0m2s7I2OH8vMbdmhX2iqZ2dvMm/HhB6HMM7jV6nDjX4uaWW61BIw/2CfsM
	8RPZ39tyv1+2ifSWgGjRDm7+Tk45lfbPNVp37Ss/nUd04/0IIjq24XhruqO+YjgV5j/q
	sKq/QDnYA3OoUiSYVAyJiUsWWgIs+E467rgW5lmavyg3/9Ou7MtI2Vk1iBZDhbt/g4GO
	yWaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=2cWauVrYEvGnTkGXcKTL+hVYgJaRNFjUltuWydjmq80=;
	b=MRlTFuMRYT42O2mK2Ngl1bVSlour4jSXugiGKv2kGA8z0QzO0t+dSiUzDitmiOEqTz
	t/Q5HBeyhwwugOflkpdp4QoWzEOhPlybfQg1PfabfJaYd6gQo2NJsdCV7RPnAildpM0B
	KouGbL1BLKksj+raD2oMTpN9KyxJx0LJHjYMP+5o6sGKzcDqqkNiZsAgJL6vh9TpBhK6
	MxEnwPxgKQGg+fwieKI+oLHiH7hZ2iO8lRcaDf4wz9qXbN+0LcbL+0ZhduFIkhiQFhsQ
	7BW0VRGFoLIbmjpw+fjV36dtrHm1Byollflf/J3LWRipGIwlo68Z/qiGdccdqy2lT6Jp
	wzAA==
X-Gm-Message-State: AIVw111TUP6Ww15K17vNI9woRE4VIjGqf0FORxUN0ld9WSLdrgxScpaI
	zC4cBaMxqu6j/voZDgIrAg==
X-Received: by 10.200.8.106 with SMTP id x39mr23597513qth.309.1500923982402;
	Mon, 24 Jul 2017 12:19:42 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	m27sm8815933qki.64.2017.07.24.12.19.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 12:19:41 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Richard Henderson <rth@twiddle.net>, Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-24-f4bug@amsat.org>
	<4de3bb09-6894-ee92-eb49-0f64efe1bad8@vivier.eu>
	<0a7a2681-4702-5334-aaa8-e477aaa5c98a@twiddle.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6c893f10-2772-8a2e-b247-388222589c83@amsat.org>
Date: Mon, 24 Jul 2017 16:19:38 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <0a7a2681-4702-5334-aaa8-e477aaa5c98a@twiddle.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for 2.10 23/35]
 m68k/translate: fix incorrect copy/paste
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
X-List-Received-Date: Mon, 24 Jul 2017 19:19:49 -0000

On 07/24/2017 04:01 PM, Richard Henderson wrote:
> On 07/24/2017 11:54 AM, Laurent Vivier wrote:
>> Le 24/07/2017 à 20:27, Philippe Mathieu-Daudé a écrit :
>>> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
>>> index ada2a91b64..1a2f421aab 100644
>>> --- a/target/m68k/translate.c
>>> +++ b/target/m68k/translate.c
>>> @@ -1321,7 +1321,8 @@ static void gen_cc_cond(DisasCompare *c, 
>>> DisasContext *s, int cond)
>>>       case 5: /* CS (C) */
>>>           /* Some cases fold C into X.  */
>>>           if (op == CC_OP_ADDB || op == CC_OP_ADDW || op == 
>>> CC_OP_ADDL ||
>>> -            op == CC_OP_ADDB || op == CC_OP_ADDW || op == CC_OP_ADDL) {
>>> +            op == CC_OP_SUBB || op == CC_OP_SUBW || op == CC_OP_SUBL ||
>>> +            op == CC_OP_LOGIC) {
>>
>> According to commit (db3d7945) introducing the incorrect copy/paste, I
>> don't think we need the CC_OP_LOGIC here. Logic operations never
>> generates X flags (whereas they can generate Z and and N).
> 
> Indeed, look at the comment below.  LOGIC is supposed to fall through to 
> the code that produces TCG_COND_NEVER.

Indeed I also miss-copypasted :)

So the correct fix would be:?

          if (op == CC_OP_ADDB || op == CC_OP_ADDW || op == CC_OP_ADDL ||
-            op == CC_OP_ADDB || op == CC_OP_ADDW || op == CC_OP_ADDL) {
+            op == CC_OP_SUBB || op == CC_OP_SUBW || op == CC_OP_SUBL) {

