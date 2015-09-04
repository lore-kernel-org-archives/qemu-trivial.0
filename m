Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZXyvk-0002Sa-MG
	for mharc-qemu-trivial@gnu.org; Fri, 04 Sep 2015 17:53:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59657)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZXyvg-0002ME-UM
	for qemu-trivial@nongnu.org; Fri, 04 Sep 2015 17:53:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZXyve-0003hT-Tf
	for qemu-trivial@nongnu.org; Fri, 04 Sep 2015 17:53:51 -0400
Received: from mail-wi0-x22c.google.com ([2a00:1450:400c:c05::22c]:36194)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ZXyvU-0003d6-ID; Fri, 04 Sep 2015 17:53:40 -0400
Received: by wibz8 with SMTP id z8so29933290wib.1;
	Fri, 04 Sep 2015 14:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=MeKxnMg0VG/uKHYCYllXG6o5ORe1A77Q8MmTlQgZ/To=;
	b=aCRdgxkKPa/Ey2ZnnyqFhAM/O7LlNFhhhZcV88UK+RVPqIHyL0im5zA+PNBBAPNrHQ
	wYNgIpxplJiNjZSBnmLl0V6PeoZ5a+zDblPjwkbRZmT3daKqhRzXhAA2OB3yZq/9ionz
	666rZwPcXiVlQvpspB5Cox5MUE/NwU0lR8JVDOLe2UiB1Zt1b4CA4AwMvtYJaBrZIfyB
	sOOSBhQN5s1+irjRyVWktpHRa/1JhC/qweSai9ccYVcYCrsGktKWLKXj9k6x+jj+aRB9
	/DAsB0b65zz2zHy7EY7PHoOV6jzoiVz9eI+kPVc6GVzzyA1BqyeEdKcGvn0m+vakxIg0
	9lPg==
MIME-Version: 1.0
X-Received: by 10.194.60.243 with SMTP id k19mr10729277wjr.8.1441403611830;
	Fri, 04 Sep 2015 14:53:31 -0700 (PDT)
Received: by 10.28.134.18 with HTTP; Fri, 4 Sep 2015 14:53:31 -0700 (PDT)
In-Reply-To: <CAJ+F1C+xQfojq58qzbZcmqe9sHQYDUjGrCCA3V5QN9AJvn5B5w@mail.gmail.com>
References: <1441400485-29167-1-git-send-email-marcandre.lureau@redhat.com>
	<CAPokK=rjOTto8oNJVQKLx4ib87nQbvawtez1PhgUDcprGk3d0g@mail.gmail.com>
	<CAJ+F1C+xQfojq58qzbZcmqe9sHQYDUjGrCCA3V5QN9AJvn5B5w@mail.gmail.com>
Date: Fri, 4 Sep 2015 14:53:31 -0700
Message-ID: <CAPokK=rVAcwz+2_LK4YKqxB_WeeYfmqw8RJvAS_ms=65KMGvVg@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22c
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
X-List-Received-Date: Fri, 04 Sep 2015 21:53:54 -0000

On Fri, Sep 4, 2015 at 2:42 PM, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
> Hi
>
> On Fri, Sep 4, 2015 at 11:25 PM, Peter Crosthwaite
> <crosthwaitepeter@gmail.com> wrote:
>> On Fri, Sep 4, 2015 at 2:01 PM,  <marcandre.lureau@redhat.com> wrote:
>>> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>>
>>> It looks like this documentation is obsolete: a child object may lookup
>>> its parent stored in the Object struct.
>>>
>>
>> Using a function wrapper or direct access to Object structure field?
>
> By direct access to the struct field.
>
>>
>> The latter would indicate they are workarounds. Which legit uses of
>> parent identification are you referring to?
>
> I am not saying this is legit or not to use this field, it's just
> wrong documentation to me: the relationship is bidirectionnal. That's
> one of the few differences with the link<> properties.
>

It is biderctional for the implementation but not for the QOM API. I
think the comment is correct as long as there is no exposed API to do
this.

Regards,
Peter

> regards
>
> --
> Marc-Andr=C3=A9 Lureau

