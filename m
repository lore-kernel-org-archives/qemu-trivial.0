Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RHB3j-00088z-Mj
	for mharc-qemu-trivial@gnu.org; Fri, 21 Oct 2011 05:06:35 -0400
Received: from eggs.gnu.org ([140.186.70.92]:44858)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.borzenkov@gmail.com>) id 1RHB3h-00080f-34
	for qemu-trivial@nongnu.org; Fri, 21 Oct 2011 05:06:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pavel.borzenkov@gmail.com>) id 1RHB3g-0004yB-3F
	for qemu-trivial@nongnu.org; Fri, 21 Oct 2011 05:06:33 -0400
Received: from mail-ey0-f173.google.com ([209.85.215.173]:56157)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pavel.borzenkov@gmail.com>)
	id 1RHB3Y-0004xN-EA; Fri, 21 Oct 2011 05:06:24 -0400
Received: by eyh6 with SMTP id 6so4252069eyh.4
	for <multiple recipients>; Fri, 21 Oct 2011 02:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=HXj/USD+dxmxiL9JREyiYWXVaBfZJUA2zAkfImioL3U=;
	b=Q7n07daE0fCkELJuEXnI90Y74rr2DoroGi3YWmdAJu8jmPzz8vkOtmHcDimPKlT+u6
	NFyaMs+c6NHyi+zstm8XyLVWt0KBP/OE7cO2Oz+IzpiMaxiV9UBe4SOlhNsBRIS5NDXS
	LO6rI8TDnommFUUBgk0fIMlifDnAPDtUsY7wc=
MIME-Version: 1.0
Received: by 10.14.3.138 with SMTP id 10mr1771522eeh.218.1319187981351; Fri,
	21 Oct 2011 02:06:21 -0700 (PDT)
Received: by 10.14.101.135 with HTTP; Fri, 21 Oct 2011 02:06:21 -0700 (PDT)
In-Reply-To: <m3k47ypwyw.fsf@blackfin.pond.sub.org>
References: <1318958255-14008-1-git-send-email-pavel.borzenkov@gmail.com>
	<20111020172301.GA14359@stefanha-thinkpad.localdomain>
	<4EA112A4.5000106@redhat.com>
	<m3k47ypwyw.fsf@blackfin.pond.sub.org>
Date: Fri, 21 Oct 2011 13:06:21 +0400
Message-ID: <CAJC6wRszbkUhLJZBhpi3i+_jE9SYsC1VkpQL+92+R3y1L1Wmng@mail.gmail.com>
From: Pavel Borzenkov <pavel.borzenkov@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
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
X-List-Received-Date: Fri, 21 Oct 2011 09:06:34 -0000

On 10/21/2011 12:31 PM, Markus Armbruster wrote:
> Paolo Bonzini<pbonzini@redhat.com>  writes:
>
>> On 10/20/2011 07:23 PM, Stefan Hajnoczi wrote:
>>> On Tue, Oct 18, 2011 at 09:17:35PM +0400, Pavel Borzenkov wrote:
>>>> Spotted by Clang Analyzer
>>>>
>>>> Signed-off-by: Pavel Borzenkov<pavel.borzenkov@gmail.com>
>>>> ---
>>>>    block/qed.c |    6 ++++--
>>>>    1 files changed, 4 insertions(+), 2 deletions(-)
>>>
>>> Thanks, applied to the trivial patches tree:
>>> http://repo.or.cz/w/qemu/stefanha.git/shortlog/refs/heads/trivial-patches
>>
>> I think there are other places in the tree where we assume that
>> "memcpy(dest, NULL, 0);" works.
>
> Looks like a fair assumption to me.

Such calls work, but this is UB. Calling string functions with NULL
pointers and zero length is a violation of the C99 standard:

7.21.1 String function conventions
Where an argument declared as size_t n specifies the length of the
array for a function, n can have the value zero on a call to that
function. Unless explicitly stated otherwise in the description of a
particular function in this subclause, pointer arguments on such a
call shall still have valid values, as described in 7.1.4.

-- 
Pavel

