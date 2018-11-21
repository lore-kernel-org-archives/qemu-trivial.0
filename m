Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPVEr-0003eW-2D
	for mharc-qemu-trivial@gnu.org; Wed, 21 Nov 2018 11:20:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41913)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gPVEk-0003Zn-Bx
	for qemu-trivial@nongnu.org; Wed, 21 Nov 2018 11:20:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gPVEj-0005Gv-FE
	for qemu-trivial@nongnu.org; Wed, 21 Nov 2018 11:20:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36988)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1gPVEe-00059u-U7; Wed, 21 Nov 2018 11:20:17 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1E2973167E4C;
	Wed, 21 Nov 2018 16:20:16 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-104.ams2.redhat.com
	[10.36.116.104])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 62C1A1054FCF;
	Wed, 21 Nov 2018 16:20:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id E964011385F2; Wed, 21 Nov 2018 17:20:03 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20181120203628.2367003-1-eblake@redhat.com>
	<cb5fbd50-0629-8afb-e1d4-cc3d1a94e057@redhat.com>
	<1671d82c-da21-de1e-58c4-dd22696f9a62@redhat.com>
	<8987fde5-a0f3-ea00-e19b-ab512a81ae39@redhat.com>
Date: Wed, 21 Nov 2018 17:20:03 +0100
In-Reply-To: <8987fde5-a0f3-ea00-e19b-ab512a81ae39@redhat.com> ("Philippe
	=?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed,
	21 Nov 2018 12:39:38 +0100")
Message-ID: <87efbe1jyk.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Wed, 21 Nov 2018 16:20:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] misc: Avoid UTF-8 in error
 messages
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
X-List-Received-Date: Wed, 21 Nov 2018 16:20:28 -0000

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 20/11/18 23:01, Eric Blake wrote:
>> [adding Markus in CC, since git didn't do it automatically from the
>> 'Reported-by']
>>
>> On 11/20/18 3:28 PM, John Snow wrote:
>>>
>>>
>>> On 11/20/18 3:36 PM, Eric Blake wrote:
>>>> While most developers are now using UTF-8 environments, it's
>>>> harder to guarantee that error messages will be output to
>>>> a multibyte locale. Rather than risking error messages that
>>>> get corrupted into mojibake when the user runs qemu in a
>>>> non-multibyte locale, let's stick to straight ASCII error
>>>> messages, rather than assuming that our use of UTF-8 in source
>>>> code string constants will work unchanged in other locales.
>>>>
>>>> Reported-by: Markus Armbruster <armbru@redhat.com>
>>>> Signed-off-by: Eric Blake <eblake@redhat.com>
>>>> ---
>>>> =C2=A0 hw/misc/tmp105.c | 2 +-
>>>> =C2=A0 hw/misc/tmp421.c | 2 +-
>>>> =C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)
>>
>>>
>>> Do we have any policy in place to prohibit this in the future?
>>> (Presumably a policy that is automatic and won't interfere with QEMU
>>> localization efforts which may rightly attempt to use UTF-8 for those
>>> locales.)
>>
>> Not that I know of.

We already outlaw newline and trailing punctuation, we could amend that
to outlaw non-ASCII.

$ git-grep 'no newline'
include/qapi/error.h: * The resulting message should be a single phrase, wi=
th no newline or
util/qemu-error.c: * a single phrase, with no newline or trailing punctuati=
on.
util/qemu-error.c: * a single phrase, with no newline or trailing punctuati=
on.
util/qemu-error.c: * a single phrase, with no newline or trailing punctuati=
on.
util/qemu-error.c: * a single phrase, with no newline or trailing punctuati=
on.
util/qemu-error.c: * a single phrase, with no newline or trailing punctuati=
on.
util/qemu-error.c: * single phrase, with no newline or trailing punctuation.
util/qemu-error.c: * single phrase, with no newline or trailing punctuation.

[...]
>> Maybe checkpatch.pl could be taught to do a similar check?
>
> It looks easier in shell than perl...
>
> We could add a checkpatch.sh which finally call 'exec -l checkpatch.pl
> $@' or similar?

Congratulations, you found yet another way to make our checkpatch
program less readable.

Back to serious.  checkpatch.pl already flags error messages containing
newlines (search for "should not contain newlines").  Extending that to
flag non-ASCII characters shouldn't be hard.

> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

