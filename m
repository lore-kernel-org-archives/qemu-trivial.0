Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QlNRR-00065t-T2
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jul 2011 11:51:37 -0400
Received: from eggs.gnu.org ([140.186.70.92]:38082)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QlNRP-0005vo-9k
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 11:51:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QlNRN-0008AA-Qf
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 11:51:35 -0400
Received: from mail-gy0-f173.google.com ([209.85.160.173]:49605)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>)
	id 1QlNRL-00089R-0h; Mon, 25 Jul 2011 11:51:31 -0400
Received: by gyg8 with SMTP id 8so592239gyg.4
	for <multiple recipients>; Mon, 25 Jul 2011 08:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=gjsl+G2L07XHDclCJsB7PXss5ayVuLbIfmu8j0rbEwM=;
	b=m5ecTRijfyTL2EFPQKfHSVrz1lVUur88C45LO3I75NElWJN5BWZpGgZoquNX5Lfhsn
	M0UbZHdk/o39zD8s0rRYqcLFklVHlVfgamr1piIQeZp3qyrEWt0tD1zaJiLpww8EWdcG
	bxiWzqd1mqvqFarE1iSvAV3XvmnGrhaJ4LTyg=
Received: by 10.68.16.165 with SMTP id h5mr7294322pbd.382.1311609089071; Mon,
	25 Jul 2011 08:51:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.42.232 with HTTP; Mon, 25 Jul 2011 08:51:09 -0700 (PDT)
In-Reply-To: <4E2D8672.4020905@linux.vnet.ibm.com>
References: <1311223307-29486-1-git-send-email-cerbere@gmail.com>
	<CAJSP0QWn_wU_3q8r=q4Fqey=jSgzi__V_iJ1EyY0OA6Nnu_-8Q@mail.gmail.com>
	<4E2D5EA0.5020104@linux.vnet.ibm.com>
	<CAJSP0QXUzpBLaYhvc3T-ArMaiZ7cxoo4ZsbDDrR8kjEq03P1cQ@mail.gmail.com>
	<4E2D7660.8080406@linux.vnet.ibm.com>
	<CAJSP0QWBzbX+zqK_adc-1rK5jqGQim1kqEDCik--Fy2TfJSLGg@mail.gmail.com>
	<4E2D8672.4020905@linux.vnet.ibm.com>
From: Alexandre Raymond <cerbere@gmail.com>
Date: Mon, 25 Jul 2011 11:51:09 -0400
Message-ID: <CAHWZs7XCusr9Gmcb78DJY4UCtk3FvQm0xZru0LGa65mSF0zRTQ@mail.gmail.com>
To: Michael Roth <mdroth@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.160.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
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
X-List-Received-Date: Mon, 25 Jul 2011 15:51:36 -0000

Hi guys,

Thank you for investigating this problem.

I finally found out why this problem occured in the first place. It is
a combination of the bug you just described and the fact that "make
distclean" only deletes the build directories of the targets specified
*in the last call to configure*.

e.g.: ./configure && make && ./configure --target-list=3Di386-softmmu &&
make distclean
will only delete the build directories related to that i386 target
(and not the others).

This is caused by the fact that "make distclean" cleans the targets
specified by $(TARGET_DIRS) in the configure script, which is in turn
affected by --target-list.

I guess it would need an "ALL_TARGET_DIRS" variable instead to do its
cleanup, or rm -rf *-user and *-softmmu (although this sounds less
safe).

Alexandre



On Mon, Jul 25, 2011 at 11:06 AM, Michael Roth
<mdroth@linux.vnet.ibm.com> wrote:
> On 07/25/2011 09:43 AM, Stefan Hajnoczi wrote:
>>
>> On Mon, Jul 25, 2011 at 2:57 PM, Michael Roth<mdroth@linux.vnet.ibm.com>
>> =C2=A0wrote:
>>>
>>> On 07/25/2011 07:43 AM, Stefan Hajnoczi wrote:
>>>>
>>>> On Mon, Jul 25, 2011 at 1:16 PM, Michael Roth<mdroth@linux.vnet.ibm.co=
m>
>>>> =C2=A0wrote:
>>>>>
>>>>> On 07/25/2011 05:15 AM, Stefan Hajnoczi wrote:
>>>>>>
>>>>>> On Thu, Jul 21, 2011 at 5:41 AM, Alexandre Raymond<cerbere@gmail.com=
>
>>>>>> =C2=A0wrote:
>>>>>>>
>>>>>>> This patch fixes a minor bugs which prevented QEMU from being built
>>>>>>> out of tree.
>>>>>>>
>>>>>>> Signed-off-by: Alexandre Raymond<cerbere@gmail.com>
>>>>>>> ---
>>>>>>> =C2=A0Makefile | =C2=A0 =C2=A02 +-
>>>>>>> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>>>>>>
>>>>>> I don't normally use --source-path but it still seems broken to me
>>>>>> after applying your patch?
>>>>>>
>>>>>> $ cd /tmp; mkdir out; cd out
>>>>>> $ ~/qemu/configure --source-path=3D$HOME/qemu
>>>>>> $ make
>>>>>> =C2=A0 GEN =C2=A0 config-all-devices.mak
>>>>>> cat: i386-softmmu/config-devices.mak: No such file or directory
>>>>>> cat: x86_64-softmmu/config-devices.mak: No such file or directory
>>>>>> cat: alpha-softmmu/config-devices.mak: No such file or directory
>>>>>>
>>>>>> Stefan
>>>>>>
>>>>>
>>>>> Works okay for me with and without the patch if I do a `make distclea=
n`
>>>>> in
>>>>> $HOME/qemu beforehand.
>>>>>
>>>>> Not sure what the trigger is for the breakage Alexandre is trying to
>>>>> address.
>>>>
>>>> You are right that make distclean in the source directory solves the
>>>> issue.
>>>>
>>>> Intuitively I expect ./configure to re-wire things, make distclean
>>>> should not be necessary.
>>>>
>>>> Alexandre: Can you describe the case where you hit a build issue in mo=
re
>>>> detail?
>>>>
>>>> Stefan
>>>
>>> The root problem seems to be that by including $(SRC_DIR) in VPATH (via
>>> $(call set-vpath, $(SRC_PATH):$(SRC_PATH)/hw)), $(SRC_DIR) ends up bein=
g
>>> searched for source files as well as target dependencies. So any crud
>>> left
>>> in there can still satisfy dependencies when building outside $SRC_PATH=
.
>>> I'm
>>> not sure there's a simple way around this except to prefix all source
>>> files
>>> with $(SRC_PATH) and remove $(SRC_PATH) from VPATH...I'm not even sure
>>> that
>>> would work though..
>>>
>>> Perhaps just a friendly error message if we detect the $(SRC_PATH)
>>> directory
>>> needs a distclean? Once you know that's the magic fix it's not terribly
>>> inconvenient....alternatively we could automatically do the distclean i=
n
>>> $SRC_PATH but that might be considered overstepping our bounds.
>>
>> Yes, ./configure could detect the case where --source-path=3D is used
>> but the source tree has build outputs.
>>
>>> Consequently, it seems like this patch would be a noop...default-config=
s
>>> should never exist in an external build directory, so
>>> $(SRC_PATH)/default-configs and default-configs end up being equivalent
>>> when
>>> make eventually find it in $(SRC_PATH).
>>
>> Thanks for finding out what is happening. =C2=A0My understanding is that
>> $(SRC_PATH) must be used when invoking external commands during the
>> build, since they don't perform vpath search. =C2=A0For make targets we
>> don't need to use $(SRC_PATH) since the vpath is in effect.
>
> Ah, yah my mistake, patch would still have some effect.
>
>>
>> Stefan
>
>

