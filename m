Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fs5DN-0000Nw-Qn
	for mharc-qemu-trivial@gnu.org; Tue, 21 Aug 2018 07:52:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1fs5DM-0000Mk-AK
	for qemu-trivial@nongnu.org; Tue, 21 Aug 2018 07:52:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quintela@redhat.com>) id 1fs5DL-0008Dc-Ai
	for qemu-trivial@nongnu.org; Tue, 21 Aug 2018 07:52:48 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34818 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <quintela@redhat.com>)
	id 1fs5DF-00083N-KI; Tue, 21 Aug 2018 07:52:41 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8B5EF807689A;
	Tue, 21 Aug 2018 11:52:40 +0000 (UTC)
Received: from localhost (ovpn-116-35.ams2.redhat.com [10.36.116.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6EF512156889;
	Tue, 21 Aug 2018 11:52:37 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,  David Hildenbrand <david@redhat.com>,
	Eric Blake <eblake@redhat.com>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
	<f4bug@amsat.org>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Howard Spoelstra <hsp.cat7@gmail.com>,  qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
In-Reply-To: <d941c0c3-1ac6-442d-3b43-370ec1d9b00c@redhat.com> (Paolo
	Bonzini's message of "Tue, 21 Aug 2018 11:39:04 +0200")
References: <20180818025653.21192-1-f4bug@amsat.org>
	<66dfe354-9c2c-8642-a905-03155555fe99@redhat.com>
	<a812530c-ad1b-f5ff-6e15-82227cb76c79@redhat.com>
	<2fd04596-a8a0-889f-239d-92853c12c6aa@redhat.com>
	<2d91d7e2-938d-dbbe-5a11-edf48d4e0fc8@redhat.com>
	<eca82595-47c6-a195-8224-6a9f6619decd@redhat.com>
	<e7a5018b-a480-4a5d-d305-cd69a007a452@redhat.com>
	<d941c0c3-1ac6-442d-3b43-370ec1d9b00c@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Reply-To: quintela@redhat.com
Date: Tue, 21 Aug 2018 13:52:33 +0200
Message-ID: <8736v87x8e.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Tue, 21 Aug 2018 11:52:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Tue, 21 Aug 2018 11:52:40 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'quintela@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH] migration: Replace strncpy() by
 g_strlcpy()
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
X-List-Received-Date: Tue, 21 Aug 2018 11:52:49 -0000

Paolo Bonzini <pbonzini@redhat.com> wrote:
> On 21/08/2018 08:03, Thomas Huth wrote:
>>>> gcc is not necessarily wrong, as it CAN catch real erroneous uses of 
>>>> strncpy().  It's just that 99% of the time, strncpy() is the WRONG 
>>>> function to use, and so the remaining few cases where it actually does 
>>>> what you want are so rare that you have to consult the manual anyways. 
>>>> If nothing else, the gcc warning is making people avoid strncpy() even 
>>>> where it is safe (which is not a bad thing, in my opinion, because the 
>>>> contract of strncpy() is so counter-intuitive).
>>>>
>>> I am wondering if we should simply add a helper for these special cases
>>> that zeroes the buffer and uses g_strlcpy(), instead of
>>> ignoring/disabling the warning.
>> Yes, a helper function with a proper comment about its purpose is likely
>> the best way to go.
>
> But why use g_strlcpy in the function (which has an off-by-one effect)?
>
> Maybe it could be a qemu_strncpy that is the same as strncpy but returns
> -ERANGE if the source is longer than the buffer that is passed in (but
> not if it fits perfectly without a terminating NUL):
>
>     int qemu_strncpy(const char *d, const char *s, int dsize)
>     {
>         while (*s && dsize) {
>             *d++ = *s++;
>             dsize--;
>         }
>         /* It's okay if D is just past the end of the buffer,
>          * and S is sitting on the terminating NUL.
>          */
>         if (*s) {
>             return -ERANGE;
>         }
>         while (dsize) {
>             *d++ = 0;
              dsize--;  ?????
>         }
>         return 0;
>     }
>
> Then we have the problem of yet another incomplete transition, but at
> least we could convert those that GCC complains about.

I think this is the best approach.  At least we have a semantic that is
"clear", as trivial as:
- we copy a maximum of dsize chars
- source size has to be at maximum dsize
- we pad destination if size of source is smaller than dsize
- destination could be not zero terminated if source is exactly dsize
  length.

And people wonders why I consider C unsuited to handle strings.

Later, Juan.

PD.  I think that adding a strncpy that don't behave like strncpy is a
     bad idea.  What about strlncpy()?  I.e. does the work of both?  As
     I have no clue what the "l" on strlcpy stands for, we can choose
     any other letter.

