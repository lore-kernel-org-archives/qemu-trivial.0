Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hNz2M-0004c0-FR
	for mharc-qemu-trivial@gnu.org; Tue, 07 May 2019 08:17:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hNz2H-0004aV-F4
	for qemu-trivial@nongnu.org; Tue, 07 May 2019 08:17:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hNz2G-0006kP-HB
	for qemu-trivial@nongnu.org; Tue, 07 May 2019 08:17:29 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35566)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hNz2G-0006jX-BC
	for qemu-trivial@nongnu.org; Tue, 07 May 2019 08:17:28 -0400
Received: by mail-wm1-f67.google.com with SMTP id y197so19715748wmd.0
	for <qemu-trivial@nongnu.org>; Tue, 07 May 2019 05:17:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=wtAOQ44i8ItsYRj++6bN+njSZRVY/UHVJci6HQ5foCc=;
	b=KnC+pUWiy5SGeeQPlSSF/AVJwa+ZDWJ5U6D4HLsnrmY1djtqLBmrkD/kGX0zYrYyNN
	6EEkfdYII2oPaL04Kx7/TvjH7PrT5p1oQZYPOZeCwNKTJgYGG0HR0+B/6joB+CNC8INn
	5rRlCvE3HE/CcR80CNR5YiZBaQl/Slt1kK0TYYn2x8LjLGbMZbrWW8A0VlwDGVF7osVh
	5jvaXHrv2SLZrEZY5WxhYA12oqbXJ2WvNjFthHvmNdCCV3qKtWO5jqUrNJwbf6/Gszy9
	1aIP8kOexeGGXA27YgP+23r6luHgF4vzwZs0rKvBUMhe2XFk6MKiq4WkwFhhSzSFu1dE
	3Tzw==
X-Gm-Message-State: APjAAAUj46Zrnps2W7fGJc36s2b2hUCGec6rob1/8Wj5GWheTiXxVnvC
	3t0TvJaiyPsfg230vOG5ygI+MDz6BLg=
X-Google-Smtp-Source: APXvYqz+vdPvB59R9GC7sb4BBdPMuV+KWke0p7xLgXPLfiBfZpwrOWuilvJ+lI9DxgHhNSusA0dX2A==
X-Received: by 2002:a1c:4087:: with SMTP id n129mr2171839wma.14.1557231446836; 
	Tue, 07 May 2019 05:17:26 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	a6sm12656798wrp.49.2019.05.07.05.17.25
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 May 2019 05:17:25 -0700 (PDT)
To: Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org,
	QEMU Trivial <qemu-trivial@nongnu.org>
References: <20190506141923.12183-1-philmd@redhat.com>
	<fcf6d003-36b2-9e8c-4708-58293a610a6e@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <acff1361-31c1-9379-21e4-3c9867360e79@redhat.com>
Date: Tue, 7 May 2019 14:17:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <fcf6d003-36b2-9e8c-4708-58293a610a6e@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 0/2] roms: Add 'clean'
 make rule and EDK2 documentation fix
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
X-List-Received-Date: Tue, 07 May 2019 12:17:30 -0000

On 5/7/19 12:56 PM, Laszlo Ersek wrote:
> On 05/06/19 16:19, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> Two trivial patches waiting Laszlo's series to land.
> 
> ... I think you can submit a pullreq with these two patches now --
> because I believe that you refer to
> 
>   [Qemu-devel] [PULL 00/12] bundle edk2 platform firmware with QEMU
> 
> above, and that's been merged for a while now.

Hmm I sent the previous series Cc'ing qemu-trivial@nongnu.org, but not
this one. That's odd (because I use git-publish which takes care of
keeping the same destinataries since the previous version), I probably
messed something.

I won't submit a PR that keeps Peter's test setup busy a while for 2
lines of documentation changes =)

Cc'ing qemu-trivial@nongnu.org again, hoping they can queue this, since
there is no rush.

Thanks!

Phil.

