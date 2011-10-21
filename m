Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RHB66-0000zg-Qw
	for mharc-qemu-trivial@gnu.org; Fri, 21 Oct 2011 05:09:02 -0400
Received: from eggs.gnu.org ([140.186.70.92]:45323)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.borzenkov@gmail.com>) id 1RHB5y-0000dQ-Hl
	for qemu-trivial@nongnu.org; Fri, 21 Oct 2011 05:08:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pavel.borzenkov@gmail.com>) id 1RHB5s-0005fh-UY
	for qemu-trivial@nongnu.org; Fri, 21 Oct 2011 05:08:54 -0400
Received: from mail-ey0-f173.google.com ([209.85.215.173]:64570)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.borzenkov@gmail.com>)
	id 1RHB5i-0005f8-Ht; Fri, 21 Oct 2011 05:08:38 -0400
Received: by eyh6 with SMTP id 6so4254269eyh.4
	for <multiple recipients>; Fri, 21 Oct 2011 02:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=EX9SKIAA5x5wii1kWX+3VayPoNCAspaaQ8u8m389pMY=;
	b=S0xiicyWvBtQnu4TzkL8m1Jg6CUkKLbeJ+8DBh5EQ8Gdhsfz/PiKH5vEEY3dXBsGzN
	kFs0xfQitzTZPRPvzHoD2BQJZ6+gya5MkxboJT3+tUcGwpg+DXZ7PavA6yLZ0M2fGfEJ
	ZMfyqaF3zYQG2ztGNCdrut9wpCxAon9H1bR5w=
MIME-Version: 1.0
Received: by 10.14.3.138 with SMTP id 10mr1772261eeh.218.1319188116691; Fri,
	21 Oct 2011 02:08:36 -0700 (PDT)
Received: by 10.14.101.135 with HTTP; Fri, 21 Oct 2011 02:08:36 -0700 (PDT)
In-Reply-To: <m3k47ypwyw.fsf@blackfin.pond.sub.org>
References: <1318958255-14008-1-git-send-email-pavel.borzenkov@gmail.com>
	<20111020172301.GA14359@stefanha-thinkpad.localdomain>
	<4EA112A4.5000106@redhat.com>
	<m3k47ypwyw.fsf@blackfin.pond.sub.org>
Date: Fri, 21 Oct 2011 13:08:36 +0400
Message-ID: <CAJC6wRuu+ABODsTwoW-9j7nqZu7p4EcHwnDVfkzz-EGuR9V1yQ@mail.gmail.com>
From: Pavel Borzenkov <pavel.borzenkov@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.215.173
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qed: don't pass NULL to
	memcpy
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
X-List-Received-Date: Fri, 21 Oct 2011 09:08:59 -0000

On Fri, Oct 21, 2011 at 12:31 PM, Markus Armbruster <armbru@redhat.com> wro=
te:
> Paolo Bonzini <pbonzini@redhat.com> writes:
>
>> On 10/20/2011 07:23 PM, Stefan Hajnoczi wrote:
>>> On Tue, Oct 18, 2011 at 09:17:35PM +0400, Pavel Borzenkov wrote:
>>>> Spotted by Clang Analyzer
>>>>
>>>> Signed-off-by: Pavel Borzenkov<pavel.borzenkov@gmail.com>
>>>> ---
>>>> =A0 block/qed.c | =A0 =A06 ++++--
>>>> =A0 1 files changed, 4 insertions(+), 2 deletions(-)
>>>
>>> Thanks, applied to the trivial patches tree:
>>> http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patch=
es
>>
>> I think there are other places in the tree where we assume that
>> "memcpy(dest, NULL, 0);" works.
>
> Looks like a fair assumption to me.
>

Such calls work, but this is UB. Calling string functions with NULL
pointers and zero length is a violation of the C99 standard:

7.21.1 String function conventions
Where an argument declared as size_t n specifies the length of the
array for a function, n can have the value zero on a call to that
function. Unless explicitly stated otherwise in the description of a
particular function in this subclause, pointer arguments on such a
call shall still have valid values, as described in 7.1.4.

--=20
Pavel

