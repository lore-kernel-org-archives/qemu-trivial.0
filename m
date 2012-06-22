Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Si2yz-0001N5-2b
	for mharc-qemu-trivial@gnu.org; Fri, 22 Jun 2012 08:29:01 -0400
Received: from eggs.gnu.org ([208.118.235.92]:57601)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Si2yr-00011h-7U
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 08:28:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1Si2ym-0002W8-Gt
	for qemu-trivial@nongnu.org; Fri, 22 Jun 2012 08:28:52 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:39605)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1Si2yg-0002V5-IP; Fri, 22 Jun 2012 08:28:42 -0400
Received: by lbok6 with SMTP id k6so4086467lbo.4
	for <multiple recipients>; Fri, 22 Jun 2012 05:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=KUX6x+jMb74wYe38hmKb48No6r/tpvsYvsyPw45XJD8=;
	b=wzUSUGG23gsIeSeMH5a50nLBTCOE/L4xpgUMXBpMMgmDIElSsCrJlaiafTWtsCNXU7
	0rGEucSTh2zfI5hZ0MsUVjZuFRwcsI6MQuOF+L4bKBYLF/3QyZ3IjJ4yAmMSfPfXEVWx
	Mx1V0rUHxo1qnnQnCfEDhkWnxyjjMZNA7qTgazkc5k3a5pxh0ZzDHBfiak7gP9Fgni6o
	jQHJMVGyR3wEtpdznXLBlTSDumMAit09bs3wwOOppMG4CjeiHQPQbD2577ucCZu1AhqN
	tTn5Mrvd0oaqjW2st+ouA9Djg3/g+DQyrGqXD4cQeDzuZJu1sDXFoQAhoFKZeRuPwevm
	LXnA==
MIME-Version: 1.0
Received: by 10.112.29.166 with SMTP id l6mr1407529lbh.68.1340368119505; Fri,
	22 Jun 2012 05:28:39 -0700 (PDT)
Received: by 10.112.71.73 with HTTP; Fri, 22 Jun 2012 05:28:39 -0700 (PDT)
In-Reply-To: <CAEgOgz6PNWM9=zFMk9PjnrWy5YbZ84cxHV1=HuzAioGP8Oa62g@mail.gmail.com>
References: <1340254284-20415-1-git-send-email-peter.crosthwaite@petalogix.com>
	<20120622091555.GF27038@stefanha-thinkpad.localdomain>
	<CAEgOgz6PNWM9=zFMk9PjnrWy5YbZ84cxHV1=HuzAioGP8Oa62g@mail.gmail.com>
Date: Fri, 22 Jun 2012 13:28:39 +0100
Message-ID: <CAJSP0QW3MjKj73n7QCBKxqN3RHbymtWV5tSAnuuJ1Kd4Z7fxMw@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Crosthwaite <peter.crosthwaite@petalogix.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.217.173
Cc: qemu-trivial@nongnu.org, edgar.iglesias@gmail.com, qemu-devel@nongnu.org,
	john.williams@petalogix.com
Subject: Re: [Qemu-trivial] [PATCH v1] device_tree: load_device_tree():
 Allow NULL sizep
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
X-List-Received-Date: Fri, 22 Jun 2012 12:28:58 -0000

On Fri, Jun 22, 2012 at 11:24 AM, Peter Crosthwaite
<peter.crosthwaite@petalogix.com> wrote:
> On Fri, Jun 22, 2012 at 7:15 PM, Stefan Hajnoczi <stefanha@gmail.com> wro=
te:
>> On Thu, Jun 21, 2012 at 02:51:24PM +1000, Peter A. G. Crosthwaite wrote:
>>> The sizep arg is populated with the size of the loaded device tree. Sin=
ce this
>>> is one of those informational "please populate" type arguments it shoul=
d be
>>> optional. Guarded writes to *sizep against NULL accordingly.
>>>
>>> Signed-off-by: Peter A. G. Crosthwaite <peter.crosthwaite@petalogix.com=
>
>>> ---
>>> =A0device_tree.c | =A0 =A08 ++++++--
>>> =A01 files changed, 6 insertions(+), 2 deletions(-)
>>
>> Can someone who knows device trees review this?
>>
>> All current users need the size in order to copy the fdt into guest
>> memory. =A0Why should the size argument be optional?
>>
>
> Hi Stefan,
>
> Its required for an incomplete series i'm working on ATM. But it
> should be optional just from a general coding practice because its an
> informational "please populate on return argument". Forcing clients to
> declare dummy variables to hold return values they dont want is just
> bad programming practice. And assuming that clients are going to use
> the function to blob in memory, therefore they need to know the size
> in putting policy to an API that is more about mechanism. It would
> also be more consistent with the rest of the qemu_devtree_foo
> functions in that they all have length pointer functions (*len) that
> are optional.

Given the code that we have in tree today it doesn't look like a good
thing to do: all callers make use of the size and I wonder how you
will get by without the size.  It may be fine to make this change but
please get review from someone who understands device_tree.c (that's
not me, sorry).

> Regarding my large series, Im sending through general cleanup patches
> like this as I go, rather than confusing my series with stuff like
> this. The intention is to make life easier from a review point of view
> as I don't wan't to be in that [PATCH v20 50/50] place.

You're seeing the cons to sending out patches that lay the groundwork
without the actual "meat".  Reviewers have no context and may be
unhappy about making speculative changes.

If your patch isn't a clear win with today's qemu.git/master code, I
suggest keeping it in your main patch series.

Stefan

