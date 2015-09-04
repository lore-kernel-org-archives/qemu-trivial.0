Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZXylc-0007nJ-Bf
	for mharc-qemu-trivial@gnu.org; Fri, 04 Sep 2015 17:43:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57723)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1ZXylZ-0007cd-U4
	for qemu-trivial@nongnu.org; Fri, 04 Sep 2015 17:43:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1ZXylP-0007y4-6Y
	for qemu-trivial@nongnu.org; Fri, 04 Sep 2015 17:43:15 -0400
Received: from mail-ob0-x235.google.com ([2607:f8b0:4003:c01::235]:34856)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>)
	id 1ZXylD-0007vB-CM; Fri, 04 Sep 2015 17:43:03 -0400
Received: by obuk4 with SMTP id k4so27063719obu.2;
	Fri, 04 Sep 2015 14:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=d7yuktcxhkI8rTpOiQJscBwRLnxytf+btxVkiVy1Ngw=;
	b=hG4kCxoRUk3AsI6B5qzI3kNgPgk7Csf0wITEP5gCQK2oe+xrb14ZGssy+jyIX4fB8O
	Hwg7P4K9DjgZxzyigm+uZ9ZoplQhzPEnwlubibxN7TM15gZER0YHeQuziwhCHtVEWrmK
	Z+dbx3LfZG2kGy5nWWjkCy+LP6qTAD3eF/xx3M/5PTxUkiIZBlXc6YSDOGxvQPThsb41
	wdFZghlHs85p3aDK1bbPLCG1s++UYpSeqJbrhBEnxB5TT4vP0AyEgjXqidAhPTT5bpr9
	OgSPW6RnapJ1rCTWL8OmJqes58dnz2eQiOPE4WDFIl+oHfv2R5KOIx5FI5a25dcsWv9h
	KUSg==
MIME-Version: 1.0
X-Received: by 10.60.96.194 with SMTP id du2mr5497146oeb.2.1441402974713; Fri,
	04 Sep 2015 14:42:54 -0700 (PDT)
Received: by 10.76.180.9 with HTTP; Fri, 4 Sep 2015 14:42:54 -0700 (PDT)
In-Reply-To: <CAPokK=rjOTto8oNJVQKLx4ib87nQbvawtez1PhgUDcprGk3d0g@mail.gmail.com>
References: <1441400485-29167-1-git-send-email-marcandre.lureau@redhat.com>
	<CAPokK=rjOTto8oNJVQKLx4ib87nQbvawtez1PhgUDcprGk3d0g@mail.gmail.com>
Date: Fri, 4 Sep 2015 23:42:54 +0200
Message-ID: <CAJ+F1C+xQfojq58qzbZcmqe9sHQYDUjGrCCA3V5QN9AJvn5B5w@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c01::235
Cc: qemu-trivial@nongnu.org,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qom/object.h: remove some
	child/parent doc
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 04 Sep 2015 21:43:27 -0000

Hi

On Fri, Sep 4, 2015 at 11:25 PM, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> On Fri, Sep 4, 2015 at 2:01 PM,  <marcandre.lureau@redhat.com> wrote:
>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>
>> It looks like this documentation is obsolete: a child object may lookup
>> its parent stored in the Object struct.
>>
>
> Using a function wrapper or direct access to Object structure field?

By direct access to the struct field.

>
> The latter would indicate they are workarounds. Which legit uses of
> parent identification are you referring to?

I am not saying this is legit or not to use this field, it's just
wrong documentation to me: the relationship is bidirectionnal. That's
one of the few differences with the link<> properties.

regards

--=20
Marc-Andr=C3=A9 Lureau

