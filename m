Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dBvA6-0003vg-6J
	for mharc-qemu-trivial@gnu.org; Fri, 19 May 2017 23:34:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57057)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dBvA4-0003vZ-BP
	for qemu-trivial@nongnu.org; Fri, 19 May 2017 23:34:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dBvA0-00039Y-Cy
	for qemu-trivial@nongnu.org; Fri, 19 May 2017 23:34:36 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:33594)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dBvA0-00039U-77; Fri, 19 May 2017 23:34:32 -0400
Received: by mail-oi0-x244.google.com with SMTP id h4so15177897oib.0;
	Fri, 19 May 2017 20:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=Eh5a9Uoo9XLvw6xh3h3UuLaHAmp/+24YWU3gTSNB4cY=;
	b=DNZboPTELVYkY6JJaV5ZA4IkwDXMcDoWBvU9Lbyadwd8VLkoxdZVs5g1UTquR4kp1q
	dnbI7IV87im876m7eSU2Jx+kdmIECkaYTvIkr5KphYG6TnjNsfhUOaOFog1WS4BrojuR
	zFOw6/wuZ9lkrh+LVEbDMNcA0+NHt6u+zo/R55YRxAXCYR+/1Hnv5ZfPJFDwr4M131tB
	9Mt5bwxYuF3gqYpd5OexJ8i8+TnN6lPNSWQQ4OoGPY4lldETT2o8ZMQBh4xD3o2r8284
	7AlwF8VJReDSJy4AD9ZhJAF1ZzDa9fQAcr3bB5XTxgsEh/VtMPjB9fbOlGWeFGtqA8L5
	a+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=Eh5a9Uoo9XLvw6xh3h3UuLaHAmp/+24YWU3gTSNB4cY=;
	b=sxNjDwtJ1NinnaEFR076Olx+MAVJsXp8iKRvROOWgGHvuoezp84jUloCg83BdjleIs
	ARjgxGKSfgE1M6sWJY1nltjjK/P3odRQP54y8uVAc69uUwzlIrWSnMVH1OzU3Va2Tncy
	yEWip+0lD6WUaKJWaKHBCWK9vn57hSZ+ecIxqsExLQOR3uaMGRyfdsALzmulrxIzfKem
	42rIAfcPin2pb28OTG/y71W4/1y/qKghVXwllUPK3oaL4JgPbKkxrA/yOHEFjCcbDcdQ
	UEo7dZ9QB1IWO+7m02uLgeSUhWl1+E0x+tCqzjTumRKbzmpuoaVjWJ6vxwg6t9pACbt/
	6gAQ==
X-Gm-Message-State: AODbwcCwA5ZC4SR10E6TBtYrIIbukTMBe5OWYXxNMUL64zNFUyupy52Z
	T+EGlM9leXBccw==
X-Received: by 10.202.226.85 with SMTP id z82mr6003649oig.183.1495251271507;
	Fri, 19 May 2017 20:34:31 -0700 (PDT)
Received: from [192.168.1.107]
	(162-231-236-127.lightspeed.miamfl.sbcglobal.net. [162.231.236.127])
	by smtp.gmail.com with ESMTPSA id z23sm353271otz.11.2017.05.19.20.34.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 19 May 2017 20:34:30 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
References: <20170516001150.11508-1-f4bug@amsat.org>
	<20170516001150.11508-2-f4bug@amsat.org>
	<79ae9877-afd9-50a7-c9f2-a12d294ff1ac@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cb9fcebd-b201-4598-fc2f-41c6533e8b60@amsat.org>
Date: Sat, 20 May 2017 00:34:29 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <79ae9877-afd9-50a7-c9f2-a12d294ff1ac@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-trivial] [PATCH] coccinelle: fix typo in comment
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
X-List-Received-Date: Sat, 20 May 2017 03:34:37 -0000

On 05/16/2017 11:35 AM, Eric Blake wrote:
> On 05/15/2017 07:11 PM, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  scripts/coccinelle/return_directly.cocci | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Did you intend for this to be threaded with your other 'oslib: strip
> trailing '\n'...' patch? If so, where's the 0/2 cover letter and proper
> subject lines?

Hi Eric, I think I did a mistake in my command, I intended to generate 
the patches in the same branch but wanted to send them as unrelated 
(without cover). I didn't noticed while sending until your remark, I'll 
double-check next time!

>
> At any rate,
> Reviewed-by: Eric Blake <eblake@redhat.com>

Thanks!

>
>>
>> diff --git a/scripts/coccinelle/return_directly.cocci b/scripts/coccinelle/return_directly.cocci
>> index 48680f2c2a..4cf50e75ea 100644
>> --- a/scripts/coccinelle/return_directly.cocci
>> +++ b/scripts/coccinelle/return_directly.cocci
>> @@ -1,4 +1,4 @@
>> -// replace 'R = X; return R;' with 'return R;'
>> +// replace 'R = X; return R;' with 'return X;'
>>  @@
>>  identifier VAR;
>>  expression E;
>>
>

