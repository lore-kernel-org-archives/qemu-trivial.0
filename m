Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1da4kb-0002bP-Jz
	for mharc-qemu-trivial@gnu.org; Tue, 25 Jul 2017 14:40:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1da4kZ-0002Z4-C2
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 14:40:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1da4kW-0003So-8Z
	for qemu-trivial@nongnu.org; Tue, 25 Jul 2017 14:40:07 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:36874)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1da4kW-0003RJ-3w; Tue, 25 Jul 2017 14:40:04 -0400
Received: by mail-qk0-x244.google.com with SMTP id q130so13440550qka.4;
	Tue, 25 Jul 2017 11:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=iX2NKrsgBcMLqAuQMe1/c4bePTcIS8zwAN8SHuZeHU4=;
	b=qy4FZbKsJhxrejKfiKODgZisqqSQBttQUprmtz8R3WCN1Y6ICvu6O+iFUY+hpRfViS
	XIRuyquU4rTfSJxa2woKEl6jYy13t2FPtoA7mgS3Bd657G1rzaS8yViUh70r+MAEU1VM
	fYUnip62QPyeqYMNRKGvMC3enUnY/RCw7eS4grDExFyeTo+VlGxh1zR3kKSJa0gXk9vB
	MXBYU/D2NQOOf7ND111RjnWZZkmGZ7Tg38Nc4MfliTH+QBe+uDvxTZPoIGG4vqH5r9wu
	1HaQQ1xxJCpjmJ0uKQkaCrtQ9CIE9qz7zzMcvZ50jCLeihpQPw+OJaciZTE8JA4xD5jY
	9g7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=iX2NKrsgBcMLqAuQMe1/c4bePTcIS8zwAN8SHuZeHU4=;
	b=cS64gHtUgBMAyPWgJ8hf07aEKzJgBzXEzKE+9gKMsyesJoQtsMv21oXq9ZQWDklzZz
	ua/2y1T4GiFZQgS24mbctaLR/NZNU86d3v7UQlkq9GNjC0hKXORQxGoRK1ZZBvBc9TA7
	zr51EuEZEClkJzqRJ3xbsiLA5SeD8tGmyg9ddT7/sIt+dZpxB4S6fpPb8FI3HGsJRjPH
	RtrV/NJLSSCsNd9HRlk/EiYCbJXMaGAUmLcmS1xMvmDQgx2ftW1bY5EQD+WhpfXu1OgD
	oY8ib9rye/MeZnIbXYm+8fT/wGNkH02kSJtzGJB+eDb8Rwly3Wd8Mrc5XqQMzDe3ct3B
	i+nA==
X-Gm-Message-State: AIVw1119WTNAwwh4zatVp1jPfwz2wa60xeZYZacHSqfMumw0BR4LnwsL
	fWbtVGivV93/jA==
X-Received: by 10.55.165.82 with SMTP id o79mr27388380qke.348.1501008002019;
	Tue, 25 Jul 2017 11:40:02 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	i79sm10014613qke.3.2017.07.25.11.39.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Jul 2017 11:40:00 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi
	<stefanha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	=?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	Fam Zheng <famz@redhat.com>
References: <20170725061158.10745-1-f4bug@amsat.org>
	<865f533b-8fe7-dd3d-be79-c2852ef0508d@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <0f4e83c9-c0bf-d5a3-45f9-2a95839b0581@amsat.org>
Date: Tue, 25 Jul 2017 15:39:57 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <865f533b-8fe7-dd3d-be79-c2852ef0508d@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: Re: [Qemu-trivial] [PATCH] Makefile: add
 all-user/all-linux-user/all-softmmu meta-targets
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
X-List-Received-Date: Tue, 25 Jul 2017 18:40:08 -0000

On 07/25/2017 06:49 AM, Paolo Bonzini wrote:
> On 25/07/2017 08:11, Philippe Mathieu-Daudé wrote:
>> Useful to build a whole set at once.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   Makefile | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 5f18243d05..da899522e4 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -814,6 +814,11 @@ endif
>>   # Dependencies in Makefile.objs files come from our recursive subdir rules
>>   -include $(wildcard *.d tests/*.d)
>>   
>> +.PHONY: subdir-all-user subdir-all-linux-user subdir-all-softmmu
>> +subdir-all-user: $(patsubst %,subdir-%,$(filter %-user,$(TARGET_DIRS)))
>> +subdir-all-linux-user: $(patsubst %,subdir-%,$(filter %-linux-user,$(TARGET_DIRS)))
>> +subdir-all-softmmu: $(patsubst %,subdir-%,$(filter %-softmmu,$(TARGET_DIRS)))
> 
> I'm not sure why you need subdir-all-linux-user.  I think it's okay to

Indeed, subdir-all-user is enough.

> add these, but please add "romsubdir-all" too.  This way "all" can use
> "subdir-all-user subdir-all-softmmu romsubdir-all" and you can remove
> "recurse-all".

Ok.

> 
> Paolo
> 
>>   include $(SRC_PATH)/tests/docker/Makefile.include
>>   
>>   .PHONY: help
>> @@ -827,7 +832,7 @@ help:
>>   	@echo  ''
>>   	@$(if $(TARGET_DIRS), \
>>   		echo 'Architecture specific targets:'; \
>> -		$(foreach t, $(TARGET_DIRS), \
>> +		$(foreach t, $(TARGET_DIRS) all-user all-linux-user all-softmmu, \
>>   		printf "  %-30s - Build for %s\\n" $(patsubst %,subdir-%,$(t)) $(t);) \
>>   		echo '')
>>   	@echo  'Cleaning targets:'
>>
> 

