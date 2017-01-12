Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cRdOp-00051Z-8c
	for mharc-qemu-trivial@gnu.org; Thu, 12 Jan 2017 06:18:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cRdOk-0004z2-II
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 06:18:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cRdOf-0003IN-Oh
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 06:18:26 -0500
Received: from mail-ua0-x22b.google.com ([2607:f8b0:400c:c08::22b]:34266)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cRdOf-0003I2-Ie
	for qemu-trivial@nongnu.org; Thu, 12 Jan 2017 06:18:21 -0500
Received: by mail-ua0-x22b.google.com with SMTP id 35so11771856uak.1
	for <qemu-trivial@nongnu.org>; Thu, 12 Jan 2017 03:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=WWqwYL+AftMrKdgFbnOJ5KqKd/zBfY8IKJ0l/3PkK6w=;
	b=Gl+cKATsfEEs44yBOdAyd0+4rjkRI6G4uOXUL9nMXaFF7OOLc6/2QwvrmqDLt4e0tH
	lE9k2rJLuXx9qyyyMHBoySP8PJ4h5fqxHnP5Iff+ZgLYyX3i6M9F6kRIkGwTgDyAfA55
	ylOqj2VwtEuYa7FSAuJa73En00VIzL0Vyuy98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=WWqwYL+AftMrKdgFbnOJ5KqKd/zBfY8IKJ0l/3PkK6w=;
	b=eQvPVyl8hfJIXPIczl67uuBiDYqT4v7jy/K9B3uU78a/jnYZty/mMjBAPfzzRFdIfq
	I9ulmPn1zZujTLuvCZIUtKPxcKxKXM7C6yBoMmkW2A5XYsDDFbMCYNGn/FcTFJBQELkR
	DwPxSTwKk7gdSs3yj+zr9zDeJunQzu/t1mLBixJ4i1y4Z71FYBAmR/VZOp7TkWFUECJ3
	+18EasqM+zjxkEZUIJh7qHH0iaA2Xciv4SaZuozWu0+IgylYRq/3RY8K/skeUWSIh8Zk
	TzWtaQkLKiq6hFNG8h3caHymFpjLfXGTF3l8CE2UxUcWSSZfCEE+SedZKdTE20r8NosX
	zrNw==
X-Gm-Message-State: AIkVDXJAknxBtcoNzH6o0ezSAZCpNe35minpZcdwAViZ3+n1JdW+mNMir08cDbqoZ0QxdJYOIzsjqTtdZe4NxUQg
X-Received: by 10.159.48.203 with SMTP id k11mr7223605uab.42.1484219900960;
	Thu, 12 Jan 2017 03:18:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Thu, 12 Jan 2017 03:18:00 -0800 (PST)
In-Reply-To: <cd10cc95-39dc-d960-ac06-f7c9f0946df3@msgid.tls.msk.ru>
References: <20161212173151.18092-1-marcandre.lureau@redhat.com>
	<20161212173151.18092-2-marcandre.lureau@redhat.com>
	<cd10cc95-39dc-d960-ac06-f7c9f0946df3@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jan 2017 11:18:00 +0000
Message-ID: <CAFEAcA_wEmy1ZBeBFf1QOeE7-k8_PWf3nNSdPOJVWUHwKMafSQ@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22b
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/3] object.h: improve
 OBJECT/OBJECT_CLASS doc
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
X-List-Received-Date: Thu, 12 Jan 2017 11:18:30 -0000

On 12 January 2017 at 10:46, Michael Tokarev <mjt@tls.msk.ru> wrote:
> 12.12.2016 20:31, Marc-Andr=C3=A9 Lureau wrote:
>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> ---
>>  include/qom/object.h | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/qom/object.h b/include/qom/object.h
>> index c5e6fc1f5d..c5456db05d 100644
>> --- a/include/qom/object.h
>> +++ b/include/qom/object.h
>> @@ -467,7 +467,7 @@ struct TypeInfo
>>   * OBJECT:
>>   * @obj: A derivative of #Object
>>   *
>> - * Converts an object to a #Object.  Since all objects are #Objects,
>> + * Converts an object to a #Object.  Since all objects are #Object,
>>   * this function will always succeed.
>
> I'm not sure this is a good change. Yes the type name is "Object"
> (singular), but we refer to multiple objectS (plural), so... :)
> If we had some coloring, we'd wrote it like, eg, #<b>Object</b>s,
> with "s" being outside of the type name.

Mmm, but doc-comment parsers won't be able to figure out that
#Objects should refer to the #Object type. You could rephrase
as "Since every object is an #Object" to get around that.

thanks
-- PMM

