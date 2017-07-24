Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZkSI-0002z0-Gx
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 16:59:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57634)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dZkSH-0002yA-1z
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 16:59:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dZkSG-0001FK-3O
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 16:59:53 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:33461)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dZkSF-0001Dv-Sr; Mon, 24 Jul 2017 16:59:52 -0400
Received: by mail-wm0-x242.google.com with SMTP id q189so2872251wmd.0;
	Mon, 24 Jul 2017 13:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=mF9vRcJQaYmOfV6xz8/V1uSplA4ylcagY23YIrQsVj8=;
	b=mS4qSsiqoV9t7jaH2zFWuChyAXPQA+Kpw5kSCNgNP1yCQFPxxY0g8l+saoZ0r8LyBK
	SMCSdlSnAzib2PAE0ZCYqHaJh6PIZtBJ0WG2D2Vhtfy0wUwNzwhQyEymcP72AifudyPW
	y7tGI3RowOCb0daxB4f4FvqWJlTt/f+xfUp5NLbGJn/Uf/tgmt9IWd1rAblW03d+TCgl
	g0ywAVkOz1tQoI6sApJEVxLu5qoNb0+bWT+RFz9MdhNfffVL1QCjVE6YJ0vRo02ihh97
	9K6LAr34svzSHpjAw+iO5K5vZSKEDKYlUwAQt1aO9507lGQtWUCqy1o9ESmrCEvvNjwC
	lllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=mF9vRcJQaYmOfV6xz8/V1uSplA4ylcagY23YIrQsVj8=;
	b=TW+Lh7zR0wOCEE1nn+ALf5JDl22xqYj/UrN1TISuJthCMauTqqJ9mZ1OK3rtHs4Dcf
	Z4IsI8/qVu89O1IXejosemCJxSihJTMlqYjOzhezWMZo26MsAUqbr1tw8ZQ8XNANq8b6
	F+jvAadK8yjaN4F5gDwvr4hOYi1rejmWjUIy+8QuTayx5Ji6IXVtKN4aIY/z6rd/2jTH
	SMMvacVUgBIPALSJ49U8OqCGNsVBnkF0w8Cd1hMqr9Wsw9n+OYsNp9bphsCz1tftFvLJ
	gReJCPM9czLGtrUY1Byyj4NGjWCS4mavNuMkWZvKMde51W0yKcC+Ows1/I5OuUG7yTIX
	qUJg==
X-Gm-Message-State: AIVw113nyrpO4Of88mKrM6cwqroSnwL07bJ/oUyjYQvO1RSoIUSzX7Bx
	/ajy1RQIeXaDr/KZI2o8fHdXnw2vNw==
X-Received: by 10.28.69.197 with SMTP id l66mr5305719wmi.140.1500929988914;
	Mon, 24 Jul 2017 13:59:48 -0700 (PDT)
MIME-Version: 1.0
Sender: alistair23@gmail.com
Received: by 10.28.191.88 with HTTP; Mon, 24 Jul 2017 13:59:18 -0700 (PDT)
In-Reply-To: <12087bf6-7ff4-58f4-5a4a-1bdf1661abfb@redhat.com>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-3-f4bug@amsat.org>
	<12087bf6-7ff4-58f4-5a4a-1bdf1661abfb@redhat.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Mon, 24 Jul 2017 13:59:18 -0700
X-Google-Sender-Auth: n_biBdi1435g5vQMAeopsLXtCzE
Message-ID: <CAKmqyKNo18_JGveUWZMjspRyTPY-g2q3JcOP3tt7s8q15Wogrg@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for 2.10 02/35] loader:
 check get_image_size() return value
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
X-List-Received-Date: Mon, 24 Jul 2017 20:59:54 -0000

On Mon, Jul 24, 2017 at 11:38 AM, Eric Blake <eblake@redhat.com> wrote:
> On 07/24/2017 01:27 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>> since a negative value means it errored.
>>
>> hw/core/loader.c:149:9: warning: Loss of sign in implicit conversion
>>     if (size > max_sz) {
>>         ^~~~
>> hw/core/loader.c:171:9: warning: Loss of sign in implicit conversion
>>     if (size > memory_region_size(mr)) {
>>         ^~~~
>>
>> Reported-by: Clang Static Analyzer
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>>  hw/core/loader.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Reviewed-by: Eric Blake <eblake@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,
Alistair

>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
>

