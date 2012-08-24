Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T4sVN-0007Jb-Po
	for mharc-qemu-trivial@gnu.org; Fri, 24 Aug 2012 07:56:49 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34471)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T4sVL-0007AL-2r
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 07:56:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T4sVK-0005r0-1U
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 07:56:46 -0400
Received: from mail-lpp01m010-f45.google.com ([209.85.215.45]:65144)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T4sVG-0005q4-9q; Fri, 24 Aug 2012 07:56:42 -0400
Received: by lagz14 with SMTP id z14so989080lag.4
	for <multiple recipients>; Fri, 24 Aug 2012 04:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=sWaPAKTw1k5UOkE81/mQBX1Z+NWH+HDa3VLMMqAkK4Q=;
	b=H2E+qIKsbhCIXwVad2yHY5ivsVwq9MpZ3meFOq7qRPKQT6VOctVQhmyW25FUVftdwo
	42WxT0cl2NX5CzqTzmMlNUuh413gXVNbPquAKHajEnDJCVjjPenkYaaNEpCwyIZAVskM
	yjvycIUhTbxOXsPbBxL9QnkKHCeDWj/aHLDGvr1f+ilAG4BbsP4SRPOXlO5ARIC+hNbj
	aNd57aCPcG2vWvWXp8SFUo6SuMgCv3CeWvAp67Rpq1msEtEBZrGRayyxY3JjUkKpjvXG
	a4hIn58H0WvHjTqS5myEP/VW3ReCOTsVGhdmJ7RjbFUIj1PhT097VuQUTEtjTDEw9o4T
	Yy+A==
MIME-Version: 1.0
Received: by 10.152.113.68 with SMTP id iw4mr5480833lab.50.1345809400906; Fri,
	24 Aug 2012 04:56:40 -0700 (PDT)
Received: by 10.112.99.129 with HTTP; Fri, 24 Aug 2012 04:56:40 -0700 (PDT)
In-Reply-To: <CAFEAcA8K=DxK6PbX+LzqN5+2qSxxs=7N+=7JiwwGX11FD3H9JA@mail.gmail.com>
References: <1345437900-8001-1-git-send-email-sw@weilnetz.de>
	<20120824105436.GC10867@stefanha-thinkpad.localdomain>
	<CAFEAcA8K=DxK6PbX+LzqN5+2qSxxs=7N+=7JiwwGX11FD3H9JA@mail.gmail.com>
Date: Fri, 24 Aug 2012 12:56:40 +0100
Message-ID: <CAJSP0QWSg9B2_H6QBtZHDsJQdeZL+oW=AK7aYZw_AzKnHZq9Vw@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.215.45
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, imammedo@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-common: Declare
	qemu_irq earlier
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
X-List-Received-Date: Fri, 24 Aug 2012 11:56:48 -0000

On Fri, Aug 24, 2012 at 12:06 PM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> On 24 August 2012 11:54, Stefan Hajnoczi <stefanha@gmail.com> wrote:
>> On Mon, Aug 20, 2012 at 06:45:00AM +0200, Stefan Weil wrote:
>>> This allows using qemu_irq in the target specific cpu.h.
>>>
>>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
>>> ---
>>>  qemu-common.h |    3 ++-
>>>  1 files changed, 2 insertions(+), 1 deletions(-)
>>
>> I'm not sure if there's a reason why qemu_irq was previously hidden from
>> cpu.h but the code change itself is fine and no one else has commented.
>>
>> Thanks, applied to the trivial patches tree:
>> https://github.com/stefanha/qemu/commits/trivial-patches
>
> Consensus seemed to be that it was better to move qemu_irq
> into hw/irq.h, as discussed in this mail thread:
> http://lists.gnu.org/archive/html/qemu-devel/2012-08/msg03463.html
> rather than just doing a move of the typedef within this header.

Fine by me.  I won't send a pull request with this patch yet.

Stefan Weil: Are you happy to use the hw/irq.h patch instead of this?

Stefan

