Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dfYYs-0005UD-K1
	for mharc-qemu-trivial@gnu.org; Wed, 09 Aug 2017 17:30:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43760)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dfYYp-0005SV-L5
	for qemu-trivial@nongnu.org; Wed, 09 Aug 2017 17:30:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dfYYo-0007bh-55
	for qemu-trivial@nongnu.org; Wed, 09 Aug 2017 17:30:39 -0400
Received: from mail-pg0-x235.google.com ([2607:f8b0:400e:c05::235]:33637)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dfYYi-0007WK-LK; Wed, 09 Aug 2017 17:30:32 -0400
Received: by mail-pg0-x235.google.com with SMTP id u5so32977594pgn.0;
	Wed, 09 Aug 2017 14:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=9gpqE2DLG6x+da+set47IVMFuK3/iKqxYCyCxOJmBx4=;
	b=c4Mtd0VCMPOVkITHgzVOmbq+OHFtuy3S64aVz43603/sZJLu++HBhaPZDpGXnJZrBq
	e7f43rdbXOm5N8YW/s/sj4MvdYPz3QRxc/Y7S3D16Cv1PM2++0IgYJboXMOIG676gxkN
	ormDGRRzn5Fmg+H0+zKuJ4gkM557Nf7s8D47NSRpGrH9jM12WHhdRVSL8wFmb9wAQvMs
	jn++NTjU4ls9oiPWzKbftniNZjM9/vkPzF24dJgjeTLagw4LwzdANB4u9CiGIPBZY6Mt
	tMBufci+uk+a2axL9Oms8KDWZQ+sPmZxKa28txRISowQtcDGpnDCJGqSVqVqcI+Z2bWS
	JtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9gpqE2DLG6x+da+set47IVMFuK3/iKqxYCyCxOJmBx4=;
	b=dLkHzZySsxqD97YtNUK6XL4o1+LBHVBq9mG1KHN8MIYWWkEu4/dxoQFtjSY8EiP1Df
	MOSE1fyIQ2HBJdBWMVOSuYt6UopSFiyD3yZay31wVxJ4UxasJ2j7wwIkzM9HiFMp0qRL
	MtpJoWk1fs1J5Mc8dOjAh2LxsWFhtx3LHPnzJKB0NWa3KlmjP8dpe8XwTdcidCbcvIVU
	U74QZv9AsSXZ4NfJzN4cNpVB3ul1fOrXwZPdCooIMn839A87Ds0cL//A7bRThAkbqGaJ
	cQ9WdKNasqp2GG6HgZt37RGgDNt8huBUF02daugAyLq9wXAXIs7LN3iY8IzWK2tvydQA
	iLPA==
X-Gm-Message-State: AHYfb5iTDD70XAkAka72Xw2t0kaSAbhgrKQhi65CtXCBfWs8j3rhaThZ
	iZJUvjghm5z0eQ==
X-Received: by 10.98.72.90 with SMTP id v87mr9851189pfa.337.1502314231587;
	Wed, 09 Aug 2017 14:30:31 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h29sm8821564pfd.145.2017.08.09.14.30.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Aug 2017 14:30:30 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>,
	Fam Zheng <famz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>
Cc: Richard Henderson <rth@twiddle.net>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-19-f4bug@amsat.org> <87mv7aumav.fsf@linaro.org>
	<8e2e3aa5-4459-76ba-3309-af6b30220346@amsat.org>
	<87fud0vmak.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3e66742f-04c5-51b7-de3a-f692c0637bc5@amsat.org>
Date: Wed, 9 Aug 2017 18:30:25 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <87fud0vmak.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::235
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 18/47] MAINTAINERS: add
 missing TCG entry
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
X-List-Received-Date: Wed, 09 Aug 2017 21:30:41 -0000

[I added mails of other person who reply to this series, this mail is 
not directly addressed to Alex]

On 08/09/2017 11:38 AM, Alex Bennée wrote:
> Philippe Mathieu-Daudé <f4bug@amsat.org> writes:
[...]
>> Do you think there should be another entry in "Block QAPI, monitor,
>> command line"?
>> or this file (and related include) rather deserves an own section
>> (possibly tagged Odd Fixes) to unburden Richard?
> 
> Well the default for un-matched files is qemu-devel right? It would be
> nice for it to be properly maintained but that requires someone to
> step-up to the plate.

I wonder if I'm understanding correctly what the MAINTAINERS file is for 
and how to use it.

 From an submitter view I feel a bit confused. I thought 
./get_maintainer.pl would give me the list of person to email the 
changes I did on some file from the repository. This script seems 
correctly named, I'm looking for some ./get_reviewers.pl instead, to 
know who I'v to keep updated, apart from the ./get_maintainer.pl.

currently we have:
"M: Mail patches to: FullName <address@domain>"
Does this imply FullName is a maintainer?
If so is it ok I do this change:

-    M: Mail patches to: FullName <address@domain>
+    M: Maintainer: FullName <address@domain>
+       These maintainers must be mailed on patches.
      R: Designated reviewer: FullName <address@domain>
         These reviewers should be CCed on patches.


actual default for un-matched: "recent contributors" + qemu-devel@

   $ ./scripts/get_maintainer.pl -f disas.c
   get_maintainer.pl: No maintainers found, printing recent contributors.
   get_maintainer.pl: Do not blindly cc: them on patches!  Use common sense.
   Peter Maydell <peter.maydell@linaro.org> (commit_signer:2/3=67%)
   Richard Henderson <rth@twiddle.net> (commit_signer:1/3=33%)
   Thomas Huth <thuth@redhat.com> (commit_signer:1/3=33%)
   Michael Tokarev <mjt@tls.msk.ru> (commit_signer:1/3=33%)
   Julian Brown <julian@codesourcery.com> (commit_signer:1/3=33%)
   qemu-devel@nongnu.org (open list:All patches CC here)

I find the un-matched "recent contributors" list often confuse, due to 
files being moved, header updated, checkpatch indented.
Most of the time you get the list of queue maintainers since they accept 
patches and sign-of the pull request.

Having to use 'git log --follow' and 'git blame' to figure out is not 
bad, to be aware of who modified this file before you, but there are 
some files I already hit 3 times in different series, and wondered about 
how avoid those manual steps.

Anyway I now understand these recent contributors are not maintainers 
but no-designated reviewers, unwilling to be maintainers (else they'd 
have added a section/entry by themselves).

I also understand why Fam said it sounds weird to add an new section as 
"Orphan".

For the linux-headers case, if people want to be notified of changes the 
easiest seems to modify the update-linux-headers.sh script.

I'll review the whole series thinking differently and resend when 2.11 
opens.

Regards,

Phil.

