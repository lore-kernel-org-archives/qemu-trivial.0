Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QlKVj-0007lJ-M0
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jul 2011 08:43:51 -0400
Received: from eggs.gnu.org ([140.186.70.92]:40130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QlKVh-0007c7-4H
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 08:43:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QlKVf-0002GG-Vr
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 08:43:49 -0400
Received: from mail-yi0-f45.google.com ([209.85.218.45]:61615)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QlKVe-0002Fq-1G; Mon, 25 Jul 2011 08:43:46 -0400
Received: by yia25 with SMTP id 25so2611741yia.4
	for <multiple recipients>; Mon, 25 Jul 2011 05:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=6zHXrRPasUCxcsIS8z1n79Kuk1u5seud7RidAVgpqP8=;
	b=FvJZMFwpA15mFqTg+I8xrHdDVevStcCuYgOsfeQt9099/KiCn68Xge8NJxWHu4Odgf
	p9SAZGrGvq902cv6k8RaswDbPGGvbqV2ca0bXiMQlv4DdSMYb34n6Rn2WO+JUvy3+QY3
	yxrGbWvLFn2lREMKhI3XAnjcLNg01lu63BXfo=
MIME-Version: 1.0
Received: by 10.146.115.1 with SMTP id n1mr3962865yac.29.1311597825213; Mon,
	25 Jul 2011 05:43:45 -0700 (PDT)
Received: by 10.147.125.14 with HTTP; Mon, 25 Jul 2011 05:43:45 -0700 (PDT)
In-Reply-To: <4E2D5EA0.5020104@linux.vnet.ibm.com>
References: <1311223307-29486-1-git-send-email-cerbere@gmail.com>
	<CAJSP0QWn_wU_3q8r=q4Fqey=jSgzi__V_iJ1EyY0OA6Nnu_-8Q@mail.gmail.com>
	<4E2D5EA0.5020104@linux.vnet.ibm.com>
Date: Mon, 25 Jul 2011 13:43:45 +0100
Message-ID: <CAJSP0QXUzpBLaYhvc3T-ArMaiZ7cxoo4ZsbDDrR8kjEq03P1cQ@mail.gmail.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Michael Roth <mdroth@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.218.45
Cc: Alexandre Raymond <cerbere@gmail.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] Makefile: fix out-of-tree builds
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
X-List-Received-Date: Mon, 25 Jul 2011 12:43:49 -0000

On Mon, Jul 25, 2011 at 1:16 PM, Michael Roth <mdroth@linux.vnet.ibm.com> w=
rote:
> On 07/25/2011 05:15 AM, Stefan Hajnoczi wrote:
>>
>> On Thu, Jul 21, 2011 at 5:41 AM, Alexandre Raymond<cerbere@gmail.com>
>> =A0wrote:
>>>
>>> This patch fixes a minor bugs which prevented QEMU from being built
>>> out of tree.
>>>
>>> Signed-off-by: Alexandre Raymond<cerbere@gmail.com>
>>> ---
>>> =A0Makefile | =A0 =A02 +-
>>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> I don't normally use --source-path but it still seems broken to me
>> after applying your patch?
>>
>> $ cd /tmp; mkdir out; cd out
>> $ ~/qemu/configure --source-path=3D$HOME/qemu
>> $ make
>> =A0 GEN =A0 config-all-devices.mak
>> cat: i386-softmmu/config-devices.mak: No such file or directory
>> cat: x86_64-softmmu/config-devices.mak: No such file or directory
>> cat: alpha-softmmu/config-devices.mak: No such file or directory
>>
>> Stefan
>>
>
> Works okay for me with and without the patch if I do a `make distclean` i=
n
> $HOME/qemu beforehand.
>
> Not sure what the trigger is for the breakage Alexandre is trying to
> address.

You are right that make distclean in the source directory solves the issue.

Intuitively I expect ./configure to re-wire things, make distclean
should not be necessary.

Alexandre: Can you describe the case where you hit a build issue in more de=
tail?

Stefan

