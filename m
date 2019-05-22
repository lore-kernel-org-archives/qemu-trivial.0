Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hTTMC-0007gp-9V
	for mharc-qemu-trivial@gnu.org; Wed, 22 May 2019 11:40:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48094)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <antonio.ospite@collabora.com>) id 1hTTM7-0007Zk-Qx
	for qemu-trivial@nongnu.org; Wed, 22 May 2019 11:40:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <antonio.ospite@collabora.com>) id 1hTT8U-0005FS-OT
	for qemu-trivial@nongnu.org; Wed, 22 May 2019 11:26:35 -0400
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3]:52076)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <antonio.ospite@collabora.com>)
	id 1hTT8T-00053T-4M; Wed, 22 May 2019 11:26:33 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: ao2)
	with ESMTPSA id B581628A123
To: Laurent Vivier <laurent@vivier.eu>,
	Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Antonio Ospite <ao2@ao2.it>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <20190503082728.16485-1-ao2@ao2.it>
	<20190503082728.16485-3-ao2@ao2.it>
	<541bfc5c-0e45-58e6-f0b1-81e9b0c8881d@redhat.com>
	<CAFEAcA8An-KWOc3gOz2=45eCHCmUJEJw_bTrrCW6bYO23H8TPw@mail.gmail.com>
	<a5f95284-2883-e6c0-54ad-d0ff018f68d7@vivier.eu>
	<9349da74-b4a1-932d-227a-a63df1bb63a5@collabora.com>
	<87d49db7-68c7-7c2e-7464-47e335013e58@vivier.eu>
From: Antonio Ospite <antonio.ospite@collabora.com>
Message-ID: <ef62c3b1-c01d-8480-20c0-36dd38bb6c8c@collabora.com>
Date: Wed, 22 May 2019 17:26:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87d49db7-68c7-7c2e-7464-47e335013e58@vivier.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1098:0:82:1000:25:2eeb:e3e3
Subject: Re: [Qemu-trivial] [PATCH v2 2/2] configure: disallow spaces and
 colons in source path and build path
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
X-List-Received-Date: Wed, 22 May 2019 15:40:41 -0000

On 22/05/19 17:21, Laurent Vivier wrote:
> On 22/05/2019 17:01, Antonio Ospite wrote:
>> On 22/05/19 15:57, Laurent Vivier wrote:
>>> On 09/05/2019 16:42, Peter Maydell wrote:
>>>> On Mon, 6 May 2019 at 18:27, Eric Blake <eblake@redhat.com> wrote:
>>>>>
>>>>> On 5/3/19 3:27 AM, Antonio Ospite wrote:
>>>>>> From: Antonio Ospite <antonio.ospite@collabora.com>
>>>>>>
>>>>>> The configure script breaks when the qemu source directory is in a=
=20
>>>>>> path
>>>>>> containing white spaces, in particular the list of targets is not
>>>>>> correctly generated when calling "./configure --help" because of=20
>>>>>> how the
>>>>>> default_target_list variable is built.
>>>>>>
>>>>>> In addition to that, *building* qemu from a directory with spaces=20
>>>>>> breaks
>>>>>> some assumptions in the Makefiles, even if the original source=20
>>>>>> path does
>>>>>> not contain spaces like in the case of an out-of-tree build, or wh=
en
>>>>>> symlinks are involved.
>>>>>>
>>>>>> To avoid these issues, refuse to run the configure script and the
>>>>>> Makefile if there are spaces or colons in the source path or the=20
>>>>>> build
>>>>>> path, taking as inspiration what the kbuild system in linux does.
>>>>>>
>>>>>> Buglink: https://bugs.launchpad.net/qemu/+bug/1817345
>>>>>>
>>>>>> Signed-off-by: Antonio Ospite <antonio.ospite@collabora.com>
>>>>>> ---
>>>>>> =C2=A0 Makefile=C2=A0 | 4 ++++
>>>>>> =C2=A0 configure | 6 ++++++
>>>>>> =C2=A0 2 files changed, 10 insertions(+)
>>>>>>
>>>>>
>>>>>> +++ b/Makefile
>>>>>> @@ -1,5 +1,9 @@
>>>>>> =C2=A0 # Makefile for QEMU.
>>>>>>
>>>>>> +ifneq ($(words $(subst :, ,$(CURDIR))), 1)
>>>>>> +=C2=A0 $(error main directory cannot contain spaces nor colons)
>>>>>> +endif
>>>>>> +
>>>>>> =C2=A0 # Always point to the root of the build tree (needs GNU mak=
e).
>>>>>> =C2=A0 BUILD_DIR=3D$(CURDIR)
>>>>>>
>>>>>> diff --git a/configure b/configure
>>>>>> index 9832cbca5c..f7ad4381bd 100755
>>>>>> --- a/configure
>>>>>> +++ b/configure
>>>>>> @@ -279,6 +279,12 @@ ld_has() {
>>>>>> =C2=A0 # make source path absolute
>>>>>> =C2=A0 source_path=3D$(cd "$(dirname -- "$0")"; pwd)
>>>>>>
>>>>>> +if printf "%s\n" "$source_path" | grep -q "[[:space:]:]" ||
>>>>>> +=C2=A0 printf "%s\n" "$PWD" | grep -q "[[:space:]:]";
>>>>>
>>>>> For less typing and fewer processes, you could shorten this to:
>>>>>
>>>>> if printf %s\\n "$source_path" "$PWD" | grep -q "[[:space:]:]";
>>>>>
>>>>> but that's trivial enough for a maintainer to fold in if desired.
>>>>>
>>>>> Reviewed-by: Eric Blake <eblake@redhat.com>
>>>>
>>>> What tree is this going to go in via? I suggest the
>>>> -trivial tree.
>>>
>>>
>>> Applied (unchanged) to my trivial-patches branch.
>>>
>>
>> Thank you Laurent.
>>
>> I'll think about sending a followup patch with the changes proposed by=
=20
>> Eric and I'll CC you if I do.
>=20
> If you want to send a v3 of this patch to update it, I can wait.

That works too, I was waiting for the maintainers to decide what to do.

I'll try to send a v3 before Monday then.

Thanks,
    Antonio

