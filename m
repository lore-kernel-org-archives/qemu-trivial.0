Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e9Ee6-0003KO-4D
	for mharc-qemu-trivial@gnu.org; Mon, 30 Oct 2017 14:18:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42397)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e9Ee4-0003JH-Jr
	for qemu-trivial@nongnu.org; Mon, 30 Oct 2017 14:18:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e9Ee3-0002f6-Eg
	for qemu-trivial@nongnu.org; Mon, 30 Oct 2017 14:18:44 -0400
Received: from mail-io0-x22f.google.com ([2607:f8b0:4001:c06::22f]:51583)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e9Edx-0002bN-3C; Mon, 30 Oct 2017 14:18:37 -0400
Received: by mail-io0-x22f.google.com with SMTP id b186so29291714iof.8;
	Mon, 30 Oct 2017 11:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=cedD30GlY9OLE78sE0hMynskbVuYBI11bH/c1X4k7gM=;
	b=OYfeOfPnNHOqYxedSWUGVXX++3XA4VM2mnOrLmCuKL8/FE2qJvA2LwlgdNGJm2qDek
	K52J+oRsn+mFNjAmzYTDS2M5hnq4VQ9pDNjo5xYcBW6AeYTOpLGBhJ8jFfDIemfyRtcN
	67LHzcz9SiK9ghDLV83cU5OKzcmNmdRkHuGlhntVBAT8lx4/1WUdczRvj2zBcvkEQTG8
	iWUP6REeYnAjy9/A8TuZU0+ncf+2I9Cza/CzU3ioeZMMonlyNzafwJf+AnMjEnezwjmq
	xEjfqc/0fHguxF8Dw1Bbxk25dZi2H/RAXD60WE2oNMLa+q2IptFEmkWHD0U6FjqZ8hbu
	5ofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=cedD30GlY9OLE78sE0hMynskbVuYBI11bH/c1X4k7gM=;
	b=PdaEZdPD4ZdchXZOPzw7qpfyVzRc5o2RJyVeZGjqWq8sKKM1466+5Ul/70YjmiLop+
	Z7+HUsDigntiRvQNAzpvj9D5pCG0ctTIZFxnLWLDg9Cx/1NEcP/ayQxoyg6cevglRlUP
	Cfg+sa4fPJGKVy+TzavmtcQz/vHcYqY/MirppVagBLYMNluTf8P/z1kyrTR1incuhOjq
	L3TY8Audw/guZvj5KkrLbJ9zsBKG4ovSxKGAV90VaNw8bVK2E8C+HKLmC9c3ghTvFHsm
	xWTE6PYbo1WIOX7QxzD0papoSS0gR4L7pwDV+wnxyo7p8CaAcwN0mN/zzCPIZxz7IS3O
	RR3Q==
X-Gm-Message-State: AMCzsaWmZhLam0YUtv4pHROr+bwyb0OB8Ud2lGaTgXcJno9GvYkY1BaY
	frMzyJGejuluUAzOw6gDVhjKO+DN1FTW3yhdTXo=
X-Google-Smtp-Source: ABhQp+TK55s8W75d7gQfCG82Em+UjgsgP9LUHobfMwYzgDqJeccvHGXr3RZgzRXwgxCY5nvI2XPprnrRdKhJ7hXuKLE=
X-Received: by 10.36.54.210 with SMTP id l201mr7387675itl.0.1509387516470;
	Mon, 30 Oct 2017 11:18:36 -0700 (PDT)
MIME-Version: 1.0
Sender: philippe.mathieu.daude@gmail.com
Received: by 10.2.151.211 with HTTP; Mon, 30 Oct 2017 11:18:35 -0700 (PDT)
In-Reply-To: <20171030181459.1951-1-f4bug@amsat.org>
References: <20171030181459.1951-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 30 Oct 2017 15:18:35 -0300
X-Google-Sender-Auth: rcq6PeElcUg4ctCbrlxlnsR0s74
Message-ID: <CAAdtpL44=a-Ws5OQNQCwXN_TYgQFMxnitRrM2hjCCRSSZna7hw@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	Eduardo Habkost <ehabkost@redhat.com>, Peter Xu <peterx@redhat.com>, 
	Markus Armbruster <armbru@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>, 
	Anthony Perard <anthony.perard@citrix.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	"Emilio G . Cota" <cota@braap.org>, Eric Blake <eblake@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::22f
Subject: Re: [Qemu-trivial] [RFC PATCH] vl: only display available
 accelerators
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
X-List-Received-Date: Mon, 30 Oct 2017 18:18:45 -0000

Oops this isn't RFC anymore, this one is v1 ... sorry!

On Mon, Oct 30, 2017 at 3:14 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
[...]
> ---
> since RFC:
>   - use much cleaner object_class_get_list(TYPE_ACCEL, false)
>
>  vl.c | 39 ++++++++++++++++++++++++++++++++++-----
>  1 file changed, 34 insertions(+), 5 deletions(-)

