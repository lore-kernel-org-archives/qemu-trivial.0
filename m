Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dYao3-0003Fq-1I
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jul 2017 12:29:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39767)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dYao1-0003FJ-RK
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 12:29:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dYao1-0002Ta-6M
	for qemu-trivial@nongnu.org; Fri, 21 Jul 2017 12:29:33 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:35983)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dYanw-0002PQ-SY; Fri, 21 Jul 2017 12:29:28 -0400
Received: by mail-qt0-x244.google.com with SMTP id l55so6752813qtl.3;
	Fri, 21 Jul 2017 09:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=bFNdbKOMq4n+lC71r87Zn1JaMpkVHx0Z9B7XK0uAkko=;
	b=Sy8kmS0BbKbfQapLsQ/IHCHTxSTF2k19MAXw3+Qpa3SRJDRfhA9sB0XEjiItesVSxu
	qgdhIGdGargF3+DgHEOWuI3i1IVPRc84vyVzxGM5b5j99nBavcNePkeRw/yZ2Rt08g6z
	jTQWO2r7E5aA8f4bGn8SMRUg44DmsoclrX0sHtD1r/s85LZZsTRQyRd8BkSpzGY0V5ix
	JAC8exZdmU1c/P1xGfBQwY3ObqztJnhsEezHC6P791naLF4W3UDHvi+GmPVQnB09ssV3
	Tqcvv0fxCgxKDECz7J9BcUYGM6/fm5LE9qrQUMKIeHNln44+VxTN9vsBR+ER+GGZZ+R1
	hP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=bFNdbKOMq4n+lC71r87Zn1JaMpkVHx0Z9B7XK0uAkko=;
	b=aL0MCdsMvr91d3wguDV3yVqjpTIFnLvXhmRVKSjrswPAz1vaVvwxOlmkqyNEzZq6yW
	KFy4HhTftpcVz/VPVCjhaaPuCNHgMcJRFumfuA/jWRsGkdT1gbgKBoCdV3sjOqptT9as
	oyXqiROkKGvvZpZlHfF2kXJb3A6tSz/7MrI0bXGFm4LshGywv+oJTVkymoBGaWF1x4Cp
	2zxZQbr2hkWtjzQTAaPsCN/QV3hfzToLgJdK1SpUJ+CdIfL3qvZZ+qFRO14BlZM0lJ2d
	rTJPDMuKrkKX18m5W0oldvSyLChnJNMu/nhqas3FwRxIlGlpD2DqHnjvQW8HcXIqYYzW
	cOMw==
X-Gm-Message-State: AIVw113UonCzyprUmgC9IGXpcXtJBy1l/8uDbq529OuItJjqbEkur10D
	8tIGjI3h3fKrXeXXVLk=
X-Received: by 10.200.44.215 with SMTP id 23mr10673428qtx.167.1500654568049;
	Fri, 21 Jul 2017 09:29:28 -0700 (PDT)
Received: from [192.168.1.240] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id q68sm3527310qkf.1.2017.07.21.09.29.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 21 Jul 2017 09:29:26 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Thomas Huth <thuth@redhat.com>, Michael Walle <michael@walle.cc>
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<philippe.mathieu.daude@gmail.com>, qemu-devel@nongnu.org
References: <20170718061005.29518-1-f4bug@amsat.org>
	<20170718061005.29518-17-f4bug@amsat.org>
	<501136f163a5ab92df3d839360483774@walle.cc>
	<f8dcb381-0935-bf7a-55a7-79d24f51e1dc@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <c5c611af-2285-f98b-6159-e866ebbe9b60@amsat.org>
Date: Fri, 21 Jul 2017 13:29:23 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <f8dcb381-0935-bf7a-55a7-79d24f51e1dc@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 16/29] lm32: use
 QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Fri, 21 Jul 2017 16:29:34 -0000

On 07/18/2017 11:37 AM, Thomas Huth wrote:
> On 18.07.2017 13:42, Michael Walle wrote:
>> Am 2017-07-18 08:09, schrieb Philippe Mathieu-Daudé:
>>> Applied using the Coccinelle semantic patch
>>> scripts/coccinelle/use_osdep.cocci
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> QEMU_IS_ALIGNED() sounds like it is used to check if a memory access is
>> aligned. Although it does the same, the line in question is used for
>> formatted output. I'm not sure if this macro should be used here.
> 
> +1
> 
> I think we should not replace every usage of % blindly. It does really
> look wrong in this case here.

Dropped, will wear my glasses next time ;)

