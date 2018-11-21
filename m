Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPQrK-0006RJ-4p
	for mharc-qemu-trivial@gnu.org; Wed, 21 Nov 2018 06:39:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57121)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gPQrH-0006Qq-Ck
	for qemu-trivial@nongnu.org; Wed, 21 Nov 2018 06:39:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gPQrB-0006oJ-Hz
	for qemu-trivial@nongnu.org; Wed, 21 Nov 2018 06:39:50 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36031)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gPQrB-0006n8-Bf
	for qemu-trivial@nongnu.org; Wed, 21 Nov 2018 06:39:45 -0500
Received: by mail-wm1-f67.google.com with SMTP id s11so5443124wmh.1
	for <qemu-trivial@nongnu.org>; Wed, 21 Nov 2018 03:39:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mxhylrjDmERLPgUQTvUUvtlYOMa5ftVJJSpXYpP+wMA=;
	b=QSGDBwbb8l/ckwp57POFEDeNR/IiUDhw/nQBoqUwRkcFFICEsBPU+aTeKAudywL0Df
	J2VKMlKlFp2GIsnJTEEzHZX0FmS+lumW3+HAm4Gohvu5CHjHWALlqkfhb8ErwXOuoPlk
	e56VKNeeCqjGPhmDYdhpRZk7MuGzq843bLHANjx1QfUa/Gan0ldtpsG6qhjY7m80p3wi
	KqDY0IIwXmJ+V7KK5jJJcTyQLsE4a4f7bBzanxgeJx6QdYqvy4oyHaK8dEDNHdQKBkTP
	QBDeineoaxnDlaO6lyZ/TzRCyvkpH2geWOLNwl1RPYZY0u1dlhn0m9EwD+tCi1YediYR
	MoxQ==
X-Gm-Message-State: AA+aEWZ7Mm7zf7Lpyxko4gYUaQsba7VyTmUKaoOM1n5UC5EVnepGatCo
	dFI+3t7NFO7tATvrW759lVL1mQ==
X-Google-Smtp-Source: AJdET5d+6yPU8yXz9SedWW+je/6FLw0FgToUwXqxReZC8ZJa1ui3nBWGc/WOndWG9+hF/yjd9ywR+w==
X-Received: by 2002:a1c:df05:: with SMTP id w5mr5486870wmg.37.1542800384299;
	Wed, 21 Nov 2018 03:39:44 -0800 (PST)
Received: from [192.168.1.36] (35.red-88-21-102.staticip.rima-tde.net.
	[88.21.102.35]) by smtp.gmail.com with ESMTPSA id
	a12sm13007832wrm.45.2018.11.21.03.39.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 03:39:42 -0800 (PST)
To: Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20181120203628.2367003-1-eblake@redhat.com>
	<cb5fbd50-0629-8afb-e1d4-cc3d1a94e057@redhat.com>
	<1671d82c-da21-de1e-58c4-dd22696f9a62@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8987fde5-a0f3-ea00-e19b-ab512a81ae39@redhat.com>
Date: Wed, 21 Nov 2018 12:39:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <1671d82c-da21-de1e-58c4-dd22696f9a62@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] misc: Avoid UTF-8 in error
 messages
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
X-List-Received-Date: Wed, 21 Nov 2018 11:39:52 -0000

On 20/11/18 23:01, Eric Blake wrote:
> [adding Markus in CC, since git didn't do it automatically from the 
> 'Reported-by']
> 
> On 11/20/18 3:28 PM, John Snow wrote:
>>
>>
>> On 11/20/18 3:36 PM, Eric Blake wrote:
>>> While most developers are now using UTF-8 environments, it's
>>> harder to guarantee that error messages will be output to
>>> a multibyte locale. Rather than risking error messages that
>>> get corrupted into mojibake when the user runs qemu in a
>>> non-multibyte locale, let's stick to straight ASCII error
>>> messages, rather than assuming that our use of UTF-8 in source
>>> code string constants will work unchanged in other locales.
>>>
>>> Reported-by: Markus Armbruster <armbru@redhat.com>
>>> Signed-off-by: Eric Blake <eblake@redhat.com>
>>> ---
>>>   hw/misc/tmp105.c | 2 +-
>>>   hw/misc/tmp421.c | 2 +-
>>>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
>>
>> Do we have any policy in place to prohibit this in the future?
>> (Presumably a policy that is automatic and won't interfere with QEMU
>> localization efforts which may rightly attempt to use UTF-8 for those
>> locales.)
> 
> Not that I know of.
> 
>>
>> Do you have a script or trick to find utf-8 containing strings in our
>> source?
> 
> Markus found these two, probably by reading over a list resulting from 
> his claim of finding 217 out of 6455 files (53 of them binary, which 
> don't count):
> https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg04017.html
> 
> My quick and dirty attempt, which does not quite reproduce his numbers:
> 
> $ LC_ALL=C git grep -l $'[\x80-\xff]' | wc
>      279     279    7490
> 
> Thus, by forcing a unibyte locale (where encoding errors are impossible) 
> with sane range expressions (POSIX says only the C locale is required to 
> interpret regex ranges according to byte value - all bets are off in 
> other locales) and using $'' to type non-UTF-8 bytes into my search, I 
> found 279 files with at least one byte outside of ASCII.  But the use of 
> -l has no easy way to filter which of those files are binary; while 
> dropping -l claims 2138 "lines" with non-ASCII, which gets tedious to 
> scroll through, especially considering there ARE binary files in the mix.
> 
> Narrowing the search to a more specific pattern:
> 
> $ LC_ALL=C git grep $'".*[\x80-\xff].*"' | grep -v 'Binary file' | wc
>      129     685    8808
> 
> is a bit more manageable, with MOST of the hits in pc-bios/qemu.rsrc 
> (false positive hits, due to interesting? comments), in po/ (which 
> doesn't count), or in scripts/ for python.  And the proof for THIS patch:
> 
> $ LC_ALL=C git grep -l $'".*[\x80-\xff].*"' origin -- '**/*.[ch]' | cat
> origin:hw/misc/tmp105.c
> origin:hw/misc/tmp421.c

Can we add the last 3 lines in the commit message?

> 
>>
>> Only curious, don't hold this patch up on my account. I'm not raising a
>> challenge.
> 
> Maybe checkpatch.pl could be taught to do a similar check?

It looks easier in shell than perl...

We could add a checkpatch.sh which finally call 'exec -l checkpatch.pl 
$@' or similar?

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


