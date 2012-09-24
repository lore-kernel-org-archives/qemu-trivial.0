Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TG86k-0007zU-Ou
	for mharc-qemu-trivial@gnu.org; Mon, 24 Sep 2012 08:49:54 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47454)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TG86d-0007dV-SN
	for qemu-trivial@nongnu.org; Mon, 24 Sep 2012 08:49:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1TG86X-0002oM-VK
	for qemu-trivial@nongnu.org; Mon, 24 Sep 2012 08:49:47 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:60372)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1TG86F-0002ks-O6; Mon, 24 Sep 2012 08:49:23 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	B4825728003A; Mon, 24 Sep 2012 14:49:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 6htUpNdS1Izd; Mon, 24 Sep 2012 14:49:21 +0200 (CEST)
Received: from flocke.weilnetz.de (p54AD9C56.dip.t-dialin.net [84.173.156.86])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	EE2C17280039; Mon, 24 Sep 2012 14:49:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1TG86C-0001dy-BU; Mon, 24 Sep 2012 14:49:20 +0200
Message-ID: <506056D0.5020502@weilnetz.de>
Date: Mon, 24 Sep 2012 14:49:20 +0200
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20120724 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Laurent Desnogues <laurent.desnogues@gmail.com>
References: <1347642150-4710-1-git-send-email-sw@weilnetz.de>	<505E2FB3.9020107@weilnetz.de>
	<CABoDooNWZXcrgu2OVtjfC-MkLYoWx=_-68iHzy4ufBK-VV_73A@mail.gmail.com>
In-Reply-To: <CABoDooNWZXcrgu2OVtjfC-MkLYoWx=_-68iHzy4ufBK-VV_73A@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Anthony Liguori <aliguori@us.ibm.com>, berrange@redhat.com,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] configure: Allow builds without any
	system or user emulation
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
X-List-Received-Date: Mon, 24 Sep 2012 12:49:53 -0000

Am 24.09.2012 12:57, schrieb Laurent Desnogues:
> On Sat, Sep 22, 2012 at 11:37 PM, Stefan Weil<sw@weilnetz.de>  wrote:
>> Am 14.09.2012 19:02, schrieb Stefan Weil:
>>
>>> The old code aborted configure when no emulation target was selected.
>>> Even after removing the 'exit 1', it tried to read from STDIN
>>> when QEMU was configured with
>>>
>>>       configure' '--disable-user' '--disable-system'
>>>
>>> This is fixed here.
>>>
>>> Signed-off-by: Stefan Weil<sw@weilnetz.de>
>>> ---
>>>
>>> This patch can be applied after 66d5499b3 was reverted.
>>>
>>> It also works on top of 66d5499b3. In this case only Makefile
>>> needs modifications, and the configure part of the patch must be removed.
>>>
>>> Regards
>>>
>>> Stefan Weil
>>>
>>>
>>>    Makefile  |    5 +++++
>>>    configure |    4 ----
>>>    2 files changed, 5 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/Makefile b/Makefile
>>> index 9523e05..d38ac0f 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -52,8 +52,13 @@ SUBDIR_MAKEFLAGS=$(if $(V),,--no-print-directory)
>>> BUILD_DIR=$(BUILD_DIR)
>>>    SUBDIR_DEVICES_MAK=$(patsubst %, %/config-devices.mak, $(TARGET_DIRS))
>>>    SUBDIR_DEVICES_MAK_DEP=$(patsubst %, %/config-devices.mak.d,
>>> $(TARGET_DIRS))
>>>
>>> +ifeq ($(SUBDIR_DEVICES_MAK),)
>>> +config-all-devices.mak:
>>> +       $(call quiet-command,echo '# no devices'>   $@,"  GEN   $@")
>>> +else
>>>    config-all-devices.mak: $(SUBDIR_DEVICES_MAK)
>>>          $(call quiet-command,cat $(SUBDIR_DEVICES_MAK) | grep =y | sort
>>> -u>   $@,"  GEN   $@")
>>> +endif
>>>
>>>    -include $(SUBDIR_DEVICES_MAK_DEP)
>>>
>>> diff --git a/configure b/configure
>>> index fc27bd9..a9305f3 100755
>>> --- a/configure
>>> +++ b/configure
>>> @@ -1331,10 +1331,6 @@ if test -z "$target_list" ; then
>>>    else
>>>        target_list=`echo "$target_list" | sed -e 's/,/ /g'`
>>>    fi
>>> -if test -z "$target_list" ; then
>>> -    echo "No targets enabled"
>>> -    exit 1
>>> -fi
>>>    # see if system emulation was really requested
>>>    case " $target_list " in
>>>      *"-softmmu "*) softmmu=yes
>>>
>>
>>
>>
>> Ping? 66d5499b3 was reverted, so my patch can be applied if nobody objects.
>
> Works fine here.
>
> I think Daniel's original proposal to use some keyword for target-list
> is more convenient than having to use both --disable-user and
> --disable-system, but that's no big deal :-)
>
>
> Laurent

Thanks for testing. Support for --target-list= (empty target list
instead of --disable-user --disable-system) also requires the same
modifications and can be implemented by an additional patch.

Stefan


