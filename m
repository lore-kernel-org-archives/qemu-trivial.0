Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YG3wl-0004Hy-5m
	for mharc-qemu-trivial@gnu.org; Tue, 27 Jan 2015 06:04:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36314)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YG3wc-00043g-9D
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 06:04:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YG3wa-0000Rx-Rd
	for qemu-trivial@nongnu.org; Tue, 27 Jan 2015 06:04:30 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:33387)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YG3wU-0000DF-3L; Tue, 27 Jan 2015 06:04:22 -0500
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id A230C42F26;
	Tue, 27 Jan 2015 14:04:13 +0300 (MSK)
Message-ID: <54C770AD.6000607@msgid.tls.msk.ru>
Date: Tue, 27 Jan 2015 14:04:13 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.3.0
MIME-Version: 1.0
To: Chen Gang S <gang.chen@sunrus.com.cn>, riku.voipio@iki.fi
References: <54C21BE5.9080100@sunrus.com.cn>
In-Reply-To: <54C21BE5.9080100@sunrus.com.cn>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH v2] linux-user/syscall.c: Free the vec[i]
 in failure processing code block
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
X-List-Received-Date: Tue, 27 Jan 2015 11:04:37 -0000

23.01.2015 13:01, Chen Gang S wrote:
> When failure occurs during allocating vec[i], also need free all
> allocated vec[i] in failure processing code block before return.
>=20
> In unlock_user(), it will check vec[i].iov_base whether is NULL, so nee=
d
> not check it again outside.
>=20
> If error is EFAULT when "i =3D=3D 0", vec[i].iov_base is NULL, then can=
 just
> skip it, so can still use "while (--i >=3D 0)" for the free looping.

Oh well.  I think you need to improve your English just a little bit... ;=
)

First of all, the talk here is about locking and unlocking, not about
allocating and freeing.  So not "free", but "unlock", or else it
becomes a bit confusing, since you're adding unlock calls, not free.

Now, the language part.  Please let me show your typical examples.
There are several typical kinds of these:

  When failure occurs during allocating vec[i], also need free all
  allocated vec[i] in failure processing code block before return.

"need _to_ free", it is always "need TO do something", since the
verb after need is always infinitive.  There are several words
like this -- need to, have to, want to, -- when used in a similar
construct.  Ofcourse I don't talk about other usage -- like "I
need coffee".  Another alternative is to use word "should" --
"we should free ...".

"allocating vec[i]" -- "of" is missing, "allocating OF vec[i]".
Alternative -- "vec[i] allocating", or better yet, "vec[i]
allocation".  This is like making a noun from a verb -- "to
allocate" is a verb (infinitive), "allocating" is the same
verb in present continous tense, and "allocation" is a process,
like a noun.  It is during this process we hit the error.

In this part of sentence, you don't have a subject.  English statements
almost always have a subject.  In other words, _whp_ need to free?
Here, it is possible to use the word "we", like "we need to free..".
For a subject-less construct, it is possible to use construct "there
is" -- in this case it will be "there's a need to free..", but it
has more words, and the word "we" is short and adequate, since we
are the programmers who wrote this code.

So a bit better (from English perspective anyway) version of this
your statement is:

  When failure occurs during vec[i] allocation, we need to free
  all allocated vec[i] in failure processing code block before return.

(I omitted "also", but that wasn't really necessary.  I _think_
it referred to the unlocking/freeing of vec itself -- in other
words, we should not only free vec, but ALSO every individual
vec[i].)

It is still quite a bit "raw", and unusual usage of English,
but it is more english-like.

From technical standpoint, I think, it is sufficient to say
something like "in failure path we forgot to unlock starting
vec[i] elements which we successfully locked" -- this should
be a (more or less) good English, short, and correct technically.


  In unlock_user(), it will check vec[i].iov_base whether is NULL, so nee=
d
  not check it again outside.

"In unlock_user(), it will.." -- "it" here is not like in "it rains",
which is more or less subject-less statement.  Here you can use "it"
when you "named" or mentioned it previously.  For example, "the table
was square, it had long curly legs" -- here, "it" refers to "table".
So the more english-correct usage is either "unlock_user() will..." --
making "unlock_user()" a subject -- not very common for a function;
or - a bit more clumsy - "Code in unlock_user(), it will.." -- making
"Code" a subject.  Or combining the two, "Code in unlock_user() will.." -
this is the most correct but a bit too long.  Note that if you omit
the first "In", last "outside" becomes stray.

Now, "will check THAT <.> is NULL", or "will check IF <.> is NULL",
or "will check whether <.> is NULL", or other variants.  Note the
placement of words.  Alternative is "will check <.> FOR NULLiness"
(I'm not really sure it is the correct form).  I think it should be
clear what's the difference between two word placements.

"so need not check" -- the same 2 probs as before.  No subject, and
a verb after "need" should be in infinitive form.  Correct version is
"so there's no need to check", or, making "check" a subject (noun
from verb), "so [this] check is not needed".

But this whole sentense is a bit stray by itself.  When reading it
I thought that it is the current code in lock_iovec() which does
something unnecessary (checking whether iov_base is NULL).  But it
turned out that this way you describe why you didn't add such a
check in NEW code this patch is adding.  This is a bit more difficult
to describe and to suggest a better version, because there's no
obvious grammar rule to follow.  Maybe it is just better to put
this statement into code comment, not into a commit message, or
add a line in the commit message telling that the below is about
how we do what needs to be done.

So anyway, my suggested wording is something like:

 Since unlock_user() checks whether iov_base is NULL, there's no
 need to do it before calling that function.



  If error is EFAULT when "i =3D=3D 0", vec[i].iov_base is NULL, then can=
 just
  skip it, so can still use "while (--i >=3D 0)" for the free looping.

"then can skip" -- again, no subject.  "Then we can skip it", "Then it
is okay to skip it" and so on.  "So can still use" - the same.

This is a good candidate for code comment actually, not for a commit
message.  Again, I thought it was about existing code, but in fact
it describes the code you're adding, "proving" your code.

Maybe something like this:

 In a corner case, if error occurs on first iteration (i =3D=3D 0),
 vec[i].iov_base will be NULL and there's no need to unlock it,
 so it is still okay to use (--i >=3D 0) condition in the loop.

But actually, both these statements aren't really necessary,
I think.


And one more thing: The subject line.  You jumped from a filename
(quite large!) right to a local variable.  So one may think that
this whole file contains just one small function with a variable
which needs to be freed... ;)   I'd use something like this:

 linux-user/syscall.c: unlock vec[i] in failure processing code in lock_i=
ovec()

or

 linux-user/syscall.c: lock_iovec: unlock vec[i] in failure processing co=
de

that's if you really want to go to this level of details up to
variable name which is being unlocked/freed -- this way you
cover a gap between high-level (file) and too low-level (variable
name) which you're jumping over.  Alternatively, less details
is possible too, like:

 linux-user/syscall.c: lock_iovec: fix error path resource leak


Please don't get me wrong -- I'm not saying "you're bad" or
anything like that, I'm trying to help -- or else I'd not write
so much text (it takes some time too ;).  I didn't want to
offend you in any way.  And more: I'm not a native English
speaker myself, my English is _far_ from perfect, I make
many mistakes too.. So maybe I don't even have a right to
correct someone else's mistakes... ;)

Anyway.  I applied the patch, keeping your semantical wording
but fixing the obvious grammar problems.  Thank you for the
work!

/mjt

> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> ---
>  linux-user/syscall.c | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 290fdea..a66c2ae 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -1873,6 +1873,11 @@ static struct iovec *lock_iovec(int type, abi_ul=
ong target_addr,
>      return vec;
> =20
>   fail:
> +    while (--i >=3D 0) {
> +        if (tswapal(target_vec[i].iov_len) > 0) {
> +            unlock_user(vec[i].iov_base, tswapal(target_vec[i].iov_bas=
e), 0);
> +        }
> +    }
>      unlock_user(target_vec, target_addr, 0);
>   fail2:
>      free(vec);
>=20


