Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eYae0-00051y-LT
	for mharc-qemu-trivial@gnu.org; Mon, 08 Jan 2018 11:51:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYady-00051R-7s
	for qemu-trivial@nongnu.org; Mon, 08 Jan 2018 11:51:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYadx-0006iP-8s
	for qemu-trivial@nongnu.org; Mon, 08 Jan 2018 11:51:26 -0500
Received: from mail-ot0-x235.google.com ([2607:f8b0:4003:c0f::235]:43544)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eYadx-0006hl-2P
	for qemu-trivial@nongnu.org; Mon, 08 Jan 2018 11:51:25 -0500
Received: by mail-ot0-x235.google.com with SMTP id 3so1634021oty.10
	for <qemu-trivial@nongnu.org>; Mon, 08 Jan 2018 08:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oaIhDQr8axhAVWQLzCWMOr1n2YyveD04/wUlXFKcD4o=;
	b=NZ0vJqRO0zGO/0JReUCLV8uBZVUJeaKycYWURmJlQTlxgA5HNubRr+hoa7gCnpqiaE
	ojYl1Vwx1BOX7/uDbev7BiYlYhzuf73zsIO8pXXy59em91avfA6IjzDz9BXbFZ8XCpRl
	3HEMoElHNSdkzxvn7lUfgbdsUXXUVjIJvRv7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oaIhDQr8axhAVWQLzCWMOr1n2YyveD04/wUlXFKcD4o=;
	b=ujquUjYW7aBbp9+uqBlPOLAYWRNu9exExIrRzFeV6zouvr+/GJWgWXqUCDnDfqv2Js
	T38Wcal1H5+/uZGG42t6M9aagirRUytlZwhaSIbwZg6sfHf9/wtoofkAsRm4LQbh4RpN
	J0aWfjBISn4bZRU2G+u0kTk76X2D7mUmi1Bvz5SC9LP/h0BtQqCmeXpQRuz4kISNNw8g
	OkR6uKtwrOl9+kH+VcBBoGvFaERVMpT5cOlFQtWey74+epnBazfygZnIEq3NqsiDmXqR
	Q9rNekdYCT9fSAmEn265m6z9l2qEmae34I+1haJ72OTXgU+rbOmNIec+mN5w6EtOlZ8j
	tZ/g==
X-Gm-Message-State: AKwxytfFQrfBflfIZbbNlzYTJHUBSgh9b3FF6zu+rlqW7Mm6sFvtgVKi
	rPtYh6tAxgTTfVpqA34/MX0ptmZp/VASMWEbODNNXw==
X-Google-Smtp-Source: ACJfBoulg2s0pzt2skxBe+ckvEcYzlNx+unHBKHauvUNKBqtIHo+i7Za205Kca7O3j75NWXMT+s608YRLnWq3HOL+IQ=
X-Received: by 10.157.39.199 with SMTP id c65mr7481986otb.197.1515430284228;
	Mon, 08 Jan 2018 08:51:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Mon, 8 Jan 2018 08:51:03 -0800 (PST)
In-Reply-To: <8bc869d6-73cd-d085-99ca-aab8832ee1fc@msgid.tls.msk.ru>
References: <20171005143553.23784-1-malbarbo@gmail.com>
	<8bc869d6-73cd-d085-99ca-aab8832ee1fc@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jan 2018 16:51:03 +0000
Message-ID: <CAFEAcA9nLWP=hdOtYQSzBjgsmVbbqOyZDmVPArUky+7wV4N0gw@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Marco A L Barbosa <malbarbo@gmail.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::235
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: Add AT_SECURE
 auxval
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
X-List-Received-Date: Mon, 08 Jan 2018 16:51:27 -0000

On 16 October 2017 at 19:04, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 05.10.2017 17:35, Marco A L Barbosa wrote:
>> This is necessary to run android ndk applications. Without this patch, the
>> following error is generated:
>>
>> FATAL: kernel did not supply AT_SECURE
>>
>> Should AT_SECURE from host be considered or is the ids comparisons enough?

If we just pass through the host AT_SECURE value that would
mean we don't need to do the ID comparisons, right? (the host
kernel will have done them for us). I think that would be better.

We can do that with qemu_getauxval(AT_SECURE).

thanks
-- PMM

