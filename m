Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RKm8o-0006EG-On
	for mharc-qemu-trivial@gnu.org; Mon, 31 Oct 2011 03:18:42 -0400
Received: from eggs.gnu.org ([140.186.70.92]:54940)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.borzenkov@gmail.com>) id 1RKm8m-00066L-Kj
	for qemu-trivial@nongnu.org; Mon, 31 Oct 2011 03:18:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pavel.borzenkov@gmail.com>) id 1RKm8l-00026o-Kt
	for qemu-trivial@nongnu.org; Mon, 31 Oct 2011 03:18:40 -0400
Received: from mail-pz0-f43.google.com ([209.85.210.43]:62673)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.borzenkov@gmail.com>)
	id 1RKm8j-00026O-Di; Mon, 31 Oct 2011 03:18:37 -0400
Received: by pzk33 with SMTP id 33so16266679pzk.2
	for <multiple recipients>; Mon, 31 Oct 2011 00:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=YnWIZoJx4kXRsd7oHGlNl6mzmcy4uB1968pLHefJRmI=;
	b=ctGoS6HYKf60lDyQymXdgdBgTUXCpB8vR/jLmLJ3tWYf+K3+583njQ5gVOEoKghnc1
	SxMGCVRFNLpUFGMx0/h/Cr0pbsm2szN+xM7SIkE2aP9VwAazw4DH+S69lPBzTOKZRPaG
	GmFcS5u+LLQfheYVlBxbxR/UeSk9//7xYRw7s=
MIME-Version: 1.0
Received: by 10.68.6.229 with SMTP id e5mr21501323pba.21.1320045515832; Mon,
	31 Oct 2011 00:18:35 -0700 (PDT)
Received: by 10.142.193.15 with HTTP; Mon, 31 Oct 2011 00:18:35 -0700 (PDT)
In-Reply-To: <m3pqhdn09j.fsf@blackfin.pond.sub.org>
References: <1319838533-25405-1-git-send-email-pavel.borzenkov@gmail.com>
	<m3pqhdn09j.fsf@blackfin.pond.sub.org>
Date: Mon, 31 Oct 2011 11:18:35 +0400
Message-ID: <CAJC6wRvdb8YC0Cn6ZkNtTwyi94P560rY6b+4LRxV86qXnSkATw@mail.gmail.com>
From: Pavel Borzenkov <pavel.borzenkov@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.210.43
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] cmd: Fix potential NULL
	pointer dereference
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
X-List-Received-Date: Mon, 31 Oct 2011 07:18:41 -0000

On Mon, Oct 31, 2011 at 10:27 AM, Markus Armbruster <armbru@redhat.com> wro=
te:
> Pavel Borzenkov <pavel.borzenkov@gmail.com> writes:
>
>> Signed-off-by: Pavel Borzenkov <pavel.borzenkov@gmail.com>
>> ---
>> Note, that almost all code in the file violates CODING STYLE. The change=
d lines
>> are written wrt CODING STYLE (like commits 7d7d975c and c32d766a).
>>
>> ---
>>
>> =A0cmd.c | =A0 11 +++--------
>> =A01 files changed, 3 insertions(+), 8 deletions(-)
>>
>> diff --git a/cmd.c b/cmd.c
>> index f77897e..abcf206 100644
>> --- a/cmd.c
>> +++ b/cmd.c
>> @@ -49,7 +49,7 @@ void
>> =A0add_command(
>> =A0 =A0 =A0 const cmdinfo_t *ci)
>> =A0{
>> - =A0 =A0 cmdtab =3D realloc((void *)cmdtab, ++ncmds * sizeof(*cmdtab));
>> + =A0 =A0cmdtab =3D g_realloc((void *)cmdtab, ++ncmds * sizeof(*cmdtab))=
;
>> =A0 =A0 =A0 cmdtab[ncmds - 1] =3D *ci;
>> =A0 =A0 =A0 qsort(cmdtab, ncmds, sizeof(*cmdtab), compare);
>> =A0}
>
> Inconsistent indentation.
>
> Either stick to the original indentation, or reindent the whole
> function.

I'll send second version with coding style fixes made in a separate commit.

--=20
Pavel

>
> [More of the same...]
>

