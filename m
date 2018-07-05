Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fb6xY-00043k-32
	for mharc-qemu-trivial@gnu.org; Thu, 05 Jul 2018 12:18:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59404)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fb6xQ-0003zj-KN
	for qemu-trivial@nongnu.org; Thu, 05 Jul 2018 12:18:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fb6xL-0003BM-M7
	for qemu-trivial@nongnu.org; Thu, 05 Jul 2018 12:18:12 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:35951)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fb6xA-00030X-14; Thu, 05 Jul 2018 12:17:56 -0400
Received: by mail-qt0-x242.google.com with SMTP id f1-v6so7566113qti.3;
	Thu, 05 Jul 2018 09:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=PjdAjblqkRiMeCoB9Rh7z3skW0ewjm67v3Ih8+cZmuQ=;
	b=s+9vmdLw/oi0Z7qTWkDd4XzKg8D5wtsce5uVxXy58bW37dUHG5O6RaDpjhQKharKsR
	JwmndNpE7S1vm/ZDLewwOSob9SD5yhLZYU3fkN6gRjhCXJRWU4Mtqr+x9LAQLO+Y5rFu
	Y2GYM1D4mmc/lGr6WYNtKBavrR0WuVzEuxJxir3Yv4LyIvl/q/yShk9RR4SyZYBJgo+4
	LWtRPCM/AX7J/3cpzFGKLZGTK5vuucHfrPokgaywNqkFztoyjynOra9OdOgMftnYXaJ4
	ryrbNuuuZxtx3IcCoUy7MYBRWh0fOfMF+76lNxgHTWp3tB2NF2ySFSz22iF9/PjQia7x
	48Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=PjdAjblqkRiMeCoB9Rh7z3skW0ewjm67v3Ih8+cZmuQ=;
	b=C84+V5BQTIv7A35AXnrD4puNpCDWuyqo/oav86vBpParwD9nb9RVbNnv84P5EoTgN8
	jjN4YKOawvTNyI6Md5cd0Xo5VeJRIwKd6IF4e6KMALTbWRxCjamm8cDr/wcLCPf5fugu
	JijcdN5lBB6pA67rXFIIwRxHaB3+OQ8yRtv7TszqnGzVT/Sd5SA3Pr+1AlKFjUOnIPdb
	wq4rhd7A8ilt3cAzOcjj4OmLhmLcLLWWA8mEIn32+Lny4yEsTtNgEfI62v6haFBGirEv
	WcV5SJ33m88gnNPbkJS1vuHQOjh9VMIVSfdt8TLtE5y56E5TrKvC+FIXS8/OJqrQjBN2
	f+dQ==
X-Gm-Message-State: APt69E1LtfykHuqE3WskFofbAWPm/MtxuhKQ3hg1Y8axRAxq7KaG/jnX
	/eeFMp1BoNZAW70VE5Lq8If7nr7D
X-Google-Smtp-Source: AAOMgpecBQ2f4qM6W6kXSUe12RcpDzSvFBpUZigeVNp6kifpBNRNooZXXUx1zpJTVU2T9ca0TSaGGQ==
X-Received: by 2002:ac8:2c72:: with SMTP id
	e47-v6mr6127123qta.60.1530807475401; 
	Thu, 05 Jul 2018 09:17:55 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	b3-v6sm1027975qtg.20.2018.07.05.09.17.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Jul 2018 09:17:54 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Eric Blake <eblake@redhat.com>, qemu-trivial@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin"
	<mst@redhat.com>, qemu-devel@nongnu.org
References: <20180705155811.20366-1-f4bug@amsat.org>
	<20180705155811.20366-5-f4bug@amsat.org>
	<af8abd7f-d72d-0445-298c-4ff91fccdb5e@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <f83286cc-e70e-596d-58ce-4b3f4e715d8e@amsat.org>
Date: Thu, 5 Jul 2018 13:17:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <af8abd7f-d72d-0445-298c-4ff91fccdb5e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 4/7]
 tests/bios-tables-test: Remove an useless cast
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
X-List-Received-Date: Thu, 05 Jul 2018 16:18:18 -0000

On 07/05/2018 01:13 PM, Eric Blake wrote:
> On 07/05/2018 10:58 AM, Philippe Mathieu-Daudé wrote:
>> Patch created mechanically by rerunning:
> 
> In the subject: s/an useless/a useless/
> 
> (English is weird; we use "a" when the 'u' is pronounced hard as in
> "unicorn", and "an" when the 'u' is soft as in "umbrella")

TIL, thanks for catching/correcting this Eric :)

>>
>>    $  spatch --sp-file scripts/coccinelle/typecast.cocci \
>>              --macro-file scripts/cocci-macro-file.h \
>>              --dir . --in-place
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Reviewed-by: Markus Armbruster <armbru@redhat.com>
>> Acked-by: Michael S. Tsirkin <mst@redhat.com>
>> ---

