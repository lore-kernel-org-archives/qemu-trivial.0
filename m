Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1es7fu-0000Y9-MU
	for mharc-qemu-trivial@gnu.org; Sat, 03 Mar 2018 08:58:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1es7fs-0000Xi-6i
	for qemu-trivial@nongnu.org; Sat, 03 Mar 2018 08:58:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1es7fp-0001qQ-5v
	for qemu-trivial@nongnu.org; Sat, 03 Mar 2018 08:58:08 -0500
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:36564)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1es7fo-0001p8-Tv; Sat, 03 Mar 2018 08:58:05 -0500
Received: by mail-wm0-x230.google.com with SMTP id 188so7793768wme.1;
	Sat, 03 Mar 2018 05:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=5j2dkxPDZBPhJ3KpbsK24FDH4irLa7hGQxnBXmzqjpU=;
	b=JgP4Ymj1AOXIduVVjEvMQgA0IJ+osCQm1bLQfj6++SsKwbFDjlO3amRZdxgJ2msKJv
	U4NBR3esvXcX63Nf34sXywfs0+XWnPelE366VXSBphw7qxhRLjbX4Hvpw9WIKYE9fIDD
	AnkxVcqcKcwEUoJ7g7HSxY2pW8lZGavRIcK/riOQNhyZIav4KiF4WZt5tCSviQgAvCr6
	yBbA6RFegfIc0vt+iuQj5XuxdEubfRjrAv9LOgouRxUgzcWW62GXEz7lJZ3IidzRhz5A
	936uUJ2ri4/4EpXV5lLIF/nfnsTBqyQyo+dXhnbe4OzNXRy3GcNrwvtODOHR2iy9vOM2
	yRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5j2dkxPDZBPhJ3KpbsK24FDH4irLa7hGQxnBXmzqjpU=;
	b=cKLCsX0erJ76fo1TEuSxPgC7aV/SYj7B6iz1A9WlgcN6nKNMXOuaEmugRWou5YBSMX
	ZTbvHM8lu2IrNQx1KhmgAyIhq723Hp+Jmb1mlAl7Mqg/hBv961vei8SyZc9e+FxXiWe1
	H/nZ3/tQl5DafGCXWBfTrE66Dx2fQVGv/LMFjw0LIgHJjaUQirkeiHgiw4Gp2MqU4w3O
	6DhzIfIW8x4OrQ1jzo9HkCXjqKYKYE6fSFKx50Zltgb9aB7Tpc7lQQheQ5dbZygteedu
	BWY4v5fwi+vkPZN5YKhCWyNc2bJsXOCxYXQeCRVA2HQVm1H8/m9/epQKjGiSoyO59i0+
	Nz0A==
X-Gm-Message-State: AElRT7Hvr4g6R45KW7ASScsTDN2iBCV8sK/ltS+kidZ8rdoK3Ye8QzBU
	ept7+MTuXkVb2FIEXP5E3wkTLG3c
X-Google-Smtp-Source: AG47ELtGj+iapah+S31Kp5hbkRIgqTNoctcb2gR/tEjla1ouQukOwiMOpj+DY+NqWGw/mzVd8F/nHQ==
X-Received: by 10.28.130.9 with SMTP id e9mr3697894wmd.161.1520085483244;
	Sat, 03 Mar 2018 05:58:03 -0800 (PST)
Received: from cloudburst.twiddle.net ([37.205.61.206])
	by smtp.googlemail.com with ESMTPSA id
	m127sm2449563wmm.8.2018.03.03.05.58.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 Mar 2018 05:58:02 -0800 (PST)
Sender: Richard Henderson <rth7680@gmail.com>
To: Anatoly Trosinenko <anatoly.trosinenko@gmail.com>, qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org
References: <20180127134908.24095-1-anatoly.trosinenko@gmail.com>
	<20180127134908.24095-2-anatoly.trosinenko@gmail.com>
	<aab013fb-5ada-6ee5-d038-0277d8ef0b24@weilnetz.de>
	<CAE5jQCfxjM9ykBCes0oDhrc0B6g8AC5Se39sXBsbZo=-dKQpyg@mail.gmail.com>
	<CAE5jQCe8O3BT=6SDdm2p7J_wxgzZTcqhyS1mfnEr=4tci9fipg@mail.gmail.com>
From: Richard Henderson <rth@twiddle.net>
Message-ID: <efe4a642-a220-5a40-b1e0-769a4216389d@twiddle.net>
Date: Sat, 3 Mar 2018 05:57:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAE5jQCe8O3BT=6SDdm2p7J_wxgzZTcqhyS1mfnEr=4tci9fipg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::230
Subject: Re: [Qemu-trivial] [PATCH 1/1] tci: eliminate UB due to unaligned
 reads
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
X-List-Received-Date: Sat, 03 Mar 2018 13:58:09 -0000

On 03/03/2018 12:54 AM, Anatoly Trosinenko wrote:
> Ping.
> Patchwork link: http://patchwork.ozlabs.org/patch/866732/
> <http://patchwork.ozlabs.org/patch/866732/>
> Patchew link:
> http://patchew.org/QEMU/20180127134908.24095-1-anatoly.trosinenko@gmail.com/
> <http://patchew.org/QEMU/20180127134908.24095-1-anatoly.trosinenko@gmail.com/>
> 
> The code in tcg/tci.c reads some data from TCI bytecode through
> pointer dereferencing. As far as I know unaligned reads in such a way are
> undefined behavior and compiling with -fsanitize=undefined enumerated
> them as such at run-time.

This is exactly one of the reasons why I have urged for TCI to be abandoned.

While your patch works, it is *enormously* inefficient for hosts that require it.


r~

