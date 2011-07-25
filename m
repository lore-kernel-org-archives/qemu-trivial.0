Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QlMO0-0007Ak-4e
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jul 2011 10:44:00 -0400
Received: from eggs.gnu.org ([140.186.70.92]:53317)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QlMNx-000710-LQ
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 10:43:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1QlMNw-0004GL-Cq
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 10:43:57 -0400
Received: from mail-yi0-f45.google.com ([209.85.218.45]:64854)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1QlMNt-0004BB-Pa; Mon, 25 Jul 2011 10:43:53 -0400
Received: by mail-yi0-f45.google.com with SMTP id 25so2703143yia.4
	for <multiple recipients>; Mon, 25 Jul 2011 07:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=oKxfGbYjkuTdGq8qrv4XRluP7vkUH0rbKi5G5RMjqRM=;
	b=NQO9DWpP1/5NYZAz5vVWJ6p8Yd2tvdJazXDuvXLx1lGuY9bV5DNM1YdQodiZfRkv+Y
	b1He+qQ0rZ9yt/aV5YUJag9d/L3mCOl57Gn17mSQpkDOXg90wH17h7whttoz4Nz+5OPH
	/tXSl6RCnMeyMk0Xl8GFbMWD+7wMCy3ZsdSpE=
MIME-Version: 1.0
Received: by 10.236.154.7 with SMTP id g7mr5699140yhk.70.1311605033100; Mon,
	25 Jul 2011 07:43:53 -0700 (PDT)
Received: by 10.147.125.14 with HTTP; Mon, 25 Jul 2011 07:43:53 -0700 (PDT)
In-Reply-To: <4E2D7660.8080406@linux.vnet.ibm.com>
References: <1311223307-29486-1-git-send-email-cerbere@gmail.com>
	<CAJSP0QWn_wU_3q8r=q4Fqey=jSgzi__V_iJ1EyY0OA6Nnu_-8Q@mail.gmail.com>
	<4E2D5EA0.5020104@linux.vnet.ibm.com>
	<CAJSP0QXUzpBLaYhvc3T-ArMaiZ7cxoo4ZsbDDrR8kjEq03P1cQ@mail.gmail.com>
	<4E2D7660.8080406@linux.vnet.ibm.com>
Date: Mon, 25 Jul 2011 15:43:53 +0100
Message-ID: <CAJSP0QWBzbX+zqK_adc-1rK5jqGQim1kqEDCik--Fy2TfJSLGg@mail.gmail.com>
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
X-List-Received-Date: Mon, 25 Jul 2011 14:43:59 -0000

On Mon, Jul 25, 2011 at 2:57 PM, Michael Roth <mdroth@linux.vnet.ibm.com> w=
rote:
> On 07/25/2011 07:43 AM, Stefan Hajnoczi wrote:
>>
>> On Mon, Jul 25, 2011 at 1:16 PM, Michael Roth<mdroth@linux.vnet.ibm.com>
>> =A0wrote:
>>>
>>> On 07/25/2011 05:15 AM, Stefan Hajnoczi wrote:
>>>>
>>>> On Thu, Jul 21, 2011 at 5:41 AM, Alexandre Raymond<cerbere@gmail.com>
>>>> =A0wrote:
>>>>>
>>>>> This patch fixes a minor bugs which prevented QEMU from being built
>>>>> out of tree.
>>>>>
>>>>> Signed-off-by: Alexandre Raymond<cerbere@gmail.com>
>>>>> ---
>>>>> =A0Makefile | =A0 =A02 +-
>>>>> =A01 files changed, 1 insertions(+), 1 deletions(-)
>>>>
>>>> I don't normally use --source-path but it still seems broken to me
>>>> after applying your patch?
>>>>
>>>> $ cd /tmp; mkdir out; cd out
>>>> $ ~/qemu/configure --source-path=3D$HOME/qemu
>>>> $ make
>>>> =A0 GEN =A0 config-all-devices.mak
>>>> cat: i386-softmmu/config-devices.mak: No such file or directory
>>>> cat: x86_64-softmmu/config-devices.mak: No such file or directory
>>>> cat: alpha-softmmu/config-devices.mak: No such file or directory
>>>>
>>>> Stefan
>>>>
>>>
>>> Works okay for me with and without the patch if I do a `make distclean`
>>> in
>>> $HOME/qemu beforehand.
>>>
>>> Not sure what the trigger is for the breakage Alexandre is trying to
>>> address.
>>
>> You are right that make distclean in the source directory solves the
>> issue.
>>
>> Intuitively I expect ./configure to re-wire things, make distclean
>> should not be necessary.
>>
>> Alexandre: Can you describe the case where you hit a build issue in more
>> detail?
>>
>> Stefan
>
> The root problem seems to be that by including $(SRC_DIR) in VPATH (via
> $(call set-vpath, $(SRC_PATH):$(SRC_PATH)/hw)), $(SRC_DIR) ends up being
> searched for source files as well as target dependencies. So any crud lef=
t
> in there can still satisfy dependencies when building outside $SRC_PATH. =
I'm
> not sure there's a simple way around this except to prefix all source fil=
es
> with $(SRC_PATH) and remove $(SRC_PATH) from VPATH...I'm not even sure th=
at
> would work though..
>
> Perhaps just a friendly error message if we detect the $(SRC_PATH) direct=
ory
> needs a distclean? Once you know that's the magic fix it's not terribly
> inconvenient....alternatively we could automatically do the distclean in
> $SRC_PATH but that might be considered overstepping our bounds.

Yes, ./configure could detect the case where --source-path=3D is used
but the source tree has build outputs.

> Consequently, it seems like this patch would be a noop...default-configs
> should never exist in an external build directory, so
> $(SRC_PATH)/default-configs and default-configs end up being equivalent w=
hen
> make eventually find it in $(SRC_PATH).

Thanks for finding out what is happening.  My understanding is that
$(SRC_PATH) must be used when invoking external commands during the
build, since they don't perform vpath search.  For make targets we
don't need to use $(SRC_PATH) since the vpath is in effect.

Stefan

