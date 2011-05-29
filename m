Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QQiCp-0001Rh-9I
	for mharc-qemu-trivial@gnu.org; Sun, 29 May 2011 11:47:07 -0400
Received: from eggs.gnu.org ([140.186.70.92]:53746)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QQiCn-0001MI-1o
	for qemu-trivial@nongnu.org; Sun, 29 May 2011 11:47:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QQiCl-00019j-UF
	for qemu-trivial@nongnu.org; Sun, 29 May 2011 11:47:05 -0400
Received: from mail-pv0-f173.google.com ([74.125.83.173]:38055)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>)
	id 1QQiCj-00019P-Dr; Sun, 29 May 2011 11:47:01 -0400
Received: by pvg3 with SMTP id 3so1438288pvg.4
	for <multiple recipients>; Sun, 29 May 2011 08:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=HjDJNeJC3+ApvOGIBY9xp97cR5tf6fxjfsAWfdG60c8=;
	b=MxaQd+sr2kh0aL3bj5YizpGye6asIrlJghcT8DtRZGHfPtay2deVoJG1zsokB5L/98
	Gacl6GR3wewS4qaxkWOFvaMgyTh36BogKiyVKTEAm6AoX2L3Va4nKyV4G7jHSjOHB0La
	NQjSaDoRjsMM2pQ1S3fQMIrbUP0oGvfSJh12c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=S1ZONYVlkS4xuTrbqEp6ebDTc/iEDnO3DkWIxWGDWEMGjR1C1OYk/Kzw6zYXhPpYgR
	6BkQ1NZAIRlF+/nyakJQkMAZkRIDA1x+lgOuh4O9IO3bsTKRrsSiDbB+niQRxbeeYuLW
	2D/WvHxbPEPpKPSKcpsznrpc/YsJWZcfqV+jE=
Received: by 10.68.9.132 with SMTP id z4mr1593383pba.282.1306684018299; Sun,
	29 May 2011 08:46:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.55.37 with HTTP; Sun, 29 May 2011 08:46:38 -0700 (PDT)
In-Reply-To: <E3869720-39F6-4B6C-AD9A-E566DEE2005E@web.de>
References: <1306516951-31105-1-git-send-email-cerbere@gmail.com>
	<1306516951-31105-2-git-send-email-cerbere@gmail.com>
	<E3869720-39F6-4B6C-AD9A-E566DEE2005E@web.de>
From: Alexandre Raymond <cerbere@gmail.com>
Date: Sun, 29 May 2011 11:46:38 -0400
Message-ID: <BANLkTikpOwSnNS7Y4B8+ZAO=dT-JimQTAw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <andreas.faerber@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 74.125.83.173
Cc: qemu-trivial@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/6] Fix incorrect check for
	fdatasync() in configure
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
X-List-Received-Date: Sun, 29 May 2011 15:47:06 -0000

Hi Andreas,

According to this excerpt from The Open Group Base Specifications
Issue 6 (http://pubs.opengroup.org/onlinepubs/009695399/basedefs/unistd.h.h=
tml),
'>0' indeed means that the functionality is implemented and can be
used.
----8<----
The following symbolic constants, if defined in <unistd.h>, shall have
a value of -1, 0, or greater, unless otherwise specified below. If
these are undefined, the fpathconf(), pathconf(), or sysconf()
functions can be used to determine whether the option is provided for
a particular invocation of the application.

If a symbolic constant is defined with the value -1, the option is not
supported. Headers, data types, and function interfaces required only
for the option need not be supplied. An application that attempts to
use anything associated only with the option is considered to be
requiring an extension.

If a symbolic constant is defined with a value greater than zero, the
option shall always be supported when the application is executed. All
headers, data types, and functions shall be present and shall operate
as specified.

If a symbolic constant is defined with the value zero, all headers,
data types, and functions shall be present. The application can check
at runtime to see whether the option is supported by calling
fpathconf(), pathconf(), or sysconf() with the indicated name
parameter.
----8<----

Alexandre

On Sun, May 29, 2011 at 10:50 AM, Andreas F=C3=A4rber <andreas.faerber@web.=
de> wrote:
> Am 27.05.2011 um 19:22 schrieb Alexandre Raymond:
>
>> For some reason, darwin provides a symbol for fdatasync(), but
>> doesn't officially support it.
>>
>> The manpage for fdatasync on Linux states the following:
>>
>> "On POSIX =C2=A0systems =C2=A0on =C2=A0which fdatasync() is available,
>> _POSIX_SYNCHRONIZED_IO is defined in <unistd.h> to a value greater than
>> 0."
>
> The Open Group Base Specification Issue 7 says this on fdatasync():
>
> "The functionality shall be equivalent to fsync() with the symbol
> _POSIX_SYNCHRONIZED_IO defined, with the exception that all I/O operation=
s
> shall be completed as defined for synchronized I/O data integrity
> completion."
>
> On unistd.h it goes on to say:
>
> "_POSIX_SYNCHRONIZED_IO
> [SIO]
> The implementation supports the Synchronized Input and Output option. If
> this symbol is defined in <unistd.h>, it shall be defined to be -1, 0, or
> 200809L."
>
> The change history has nothing on that define and its value -1, so I'm no=
t
> convinced that this really is The Right Way to check.
>
>> In fact, unistd.h defines this value to "-1", at least on OSX 10.6.7.
>>
>> Add this check to the configure file.
>>
>> Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
>
> Andreas
>
>> ---
>> configure | =C2=A0 =C2=A08 +++++++-
>> 1 files changed, 7 insertions(+), 1 deletions(-)
>>
>> diff --git a/configure b/configure
>> index a318d37..b21ef75 100755
>> --- a/configure
>> +++ b/configure
>> @@ -2477,7 +2477,13 @@ fi
>> fdatasync=3Dno
>> cat > $TMPC << EOF
>> #include <unistd.h>
>> -int main(void) { return fdatasync(0); }
>> +int main(void) {
>> +#if defined(_POSIX_SYNCHRONIZED_IO) && _POSIX_SYNCHRONIZED_IO > 0
>> +return fdatasync(0);
>> +#else
>> +#abort Not supported
>> +#endif
>> +}
>> EOF
>> if compile_prog "" "" ; then
>> =C2=A0 =C2=A0fdatasync=3Dyes
>> --
>> 1.7.5
>
>

