Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNfTa-0007xG-TO
	for mharc-qemu-trivial@gnu.org; Tue, 29 May 2018 10:19:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNfTY-0007wa-4o
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 10:19:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNfTU-0006cn-5z
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 10:19:48 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:38580)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNfTU-0006ci-0q; Tue, 29 May 2018 10:19:44 -0400
Received: by mail-qt0-x241.google.com with SMTP id x34-v6so5504267qtk.5;
	Tue, 29 May 2018 07:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Q2YVnGfsCaCbXPTnxjFw/7yle0eUpirZX5j9Phw6afc=;
	b=BiC+OFCQCSVqT5drxazdZ3Z7Rs2bb/JTlaAyH4P+rvwNziQupYqyEhhx2w0UD7n+fM
	Ek61yYEINikG7jeQzBRN6ZcY4kEQHq8A0mhlxf6ywymFQI14/dzzfr0iQa8hDfKpakos
	buR+aTEk8Q51y7kBRQyWD2CYTOOhK39owRR9S3rbCYiYPm55HAJsUQnHLsYHpm0wIZrm
	OJog7wsGfLCjU7GEPk11taELzg3UgLEEnt65fTQcIjYAAJDWqPzgAkheVjcEGrHu113m
	vTazaat4WmXQT6EYbguPndxFcCzRSjvpPXPniy0Slnm919nubD0ahLmpe4EpX7A068dp
	yaDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Q2YVnGfsCaCbXPTnxjFw/7yle0eUpirZX5j9Phw6afc=;
	b=gfZD9jR7ExjSIPptqpvl7sQhyKbsTpXgVnqMgCdqxmanf/oBfAG1ySlZ5Nxm8fxkbC
	+4eGaflQSRAYEKslfr53/qs9Cb3MQkEijdkWO4GmeZ3CgWZ8Odyi5ZvqVz2b0xNsKVPI
	aBLl5gA31bjZqJwqkxAjFGApHd9hPy5fiV2jELxICDxVnVx4kvPnGnf5zynpsQ41QDux
	mJygMAOBntB5aOCpPxvHnUnsRmnfMAPeGiNAHKTPmXBid+JEMBJDOvhz/6lB6YJq2GkH
	kR51BH19zGB3mgMc05+bRDPEraTyg+BMLXVAfTnB2wLEcO13WKLBL7U1IzGQbf+3R5Q+
	LIxA==
X-Gm-Message-State: ALKqPwc2oCweCrf0DRdOTkftMBAb3ulC4ZAA8uiI7RpRjKWrJ2uYfl03
	R3JY23VYW+leSmpEQKTEhCj4ZixHeKQ=
X-Google-Smtp-Source: ADUXVKI1ytp1tz8zflF+6zhN5HKODs8ZlH7eqppmy7u4sRwV8u1QITgZ7eYK4cqBTw4c8foM6K8iLA==
X-Received: by 2002:aed:29c2:: with SMTP id
	o60-v6mr16567048qtd.2.1527603583297; 
	Tue, 29 May 2018 07:19:43 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	h48-v6sm26478696qta.43.2018.05.29.07.19.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 May 2018 07:19:42 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-32-f4bug@amsat.org>
	<950e1d4b-3a65-6cf5-88a7-13a986f69e0f@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <d5692df7-1647-81cb-9034-98e8a0e31f4c@amsat.org>
Date: Tue, 29 May 2018 11:19:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <950e1d4b-3a65-6cf5-88a7-13a986f69e0f@vivier.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-trivial] [PATCH for 2.10 31/35] syscall: replace strcpy()
 by g_strlcpy()
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
X-List-Received-Date: Tue, 29 May 2018 14:19:49 -0000

Hi Laurent,

On 07/24/2017 04:28 PM, Laurent Vivier wrote:
> Le 24/07/2017 à 20:27, Philippe Mathieu-Daudé a écrit :
>> linux-user/syscall.c:9860:17: warning: Call to function 'strcpy' is insecure as it does not provide bounding of the memory buffer. Replace unbounded copy functions with analogous functions that support length arguments such as 'strlcpy'. CWE-119
>>                 strcpy (buf->machine, cpu_to_uname_machine(cpu_env));
>>                 ^~~~~~
>>
>> Reported-by: Clang Static Analyzer
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  linux-user/syscall.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
>> index 963b9c8f4b..847f729834 100644
>> --- a/linux-user/syscall.c
>> +++ b/linux-user/syscall.c
>> @@ -9853,7 +9853,8 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
>>              if (!is_error(ret)) {
>>                  /* Overwrite the native machine name with whatever is being
>>                     emulated. */
>> -                strcpy (buf->machine, cpu_to_uname_machine(cpu_env));
>> +                g_strlcpy(buf->machine, cpu_to_uname_machine(cpu_env),
>> +                          sizeof(buf->machine));
>>                  /* Allow the user to override the reported release.  */
>>                  if (qemu_uname_release && *qemu_uname_release) {
>>                      g_strlcpy(buf->release, qemu_uname_release,
>>
> 
> We should not have a problem here as cpu_to_uname_machine() is "const
> char *" and the string is defined inside QEMU (so it should fit into
> machine[]).
> 
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Do you mind queuing this patch in your linux-user tree?

Thanks,

Phil.

