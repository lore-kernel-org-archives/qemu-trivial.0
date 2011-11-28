Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RV81A-0005r6-P6
	for mharc-qemu-trivial@gnu.org; Mon, 28 Nov 2011 15:41:36 -0500
Received: from eggs.gnu.org ([140.186.70.92]:52378)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1RV815-0005b0-Sb
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2011 15:41:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1RV814-0003tl-Os
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2011 15:41:31 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:46644)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>)
	id 1RV811-0003tH-8j; Mon, 28 Nov 2011 15:41:27 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	5D5F17281C35; Mon, 28 Nov 2011 21:41:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id ZKUk+dXkMb8K; Mon, 28 Nov 2011 21:40:45 +0100 (CET)
Received: from flocke.weilnetz.de (p54ADA6BB.dip.t-dialin.net [84.173.166.187])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	9A4977281C2F; Mon, 28 Nov 2011 21:40:45 +0100 (CET)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <sw@weilnetz.de>)
	id 1RV80B-0006a9-4G; Mon, 28 Nov 2011 21:40:35 +0100
Message-ID: <4ED3F1C3.4060601@weilnetz.de>
Date: Mon, 28 Nov 2011 21:40:35 +0100
From: Stefan Weil <sw@weilnetz.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20111110 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
References: <alpine.DEB.2.00.1111221726190.31179@kaball-desktop>
	<4ED3D428.7030704@weilnetz.de>
In-Reply-To: <4ED3D428.7030704@weilnetz.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] fix out of tree build
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
X-List-Received-Date: Mon, 28 Nov 2011 20:41:33 -0000

Am 28.11.2011 19:34, schrieb Stefan Weil:
> Am 22.11.2011 18:27, schrieb Stefano Stabellini:
>>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
>>
>> diff --git a/Makefile b/Makefile
>> index 168093c..885065f 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -167,7 +167,7 @@ check-qjson: check-qjson.o $(qobject-obj-y)=20
>> $(tools-obj-y)
>> test-coroutine: test-coroutine.o qemu-timer-common.o async.o=20
>> $(coroutine-obj-y) $(tools-obj-y)
>>
>> $(qapi-obj-y): $(GENERATED_HEADERS)
>> -qapi-dir :=3D qapi-generated
>> +qapi-dir :=3D $(SRC_PATH)/qapi-generated
>> test-visitor.o test-qmp-commands.o qemu-ga$(EXESUF): QEMU_CFLAGS +=3D=20
>> -I $(qapi-dir)
>> qemu-ga$(EXESUF): LIBS =3D $(LIBS_QGA)
>
> This patch was committed to latest QEMU and breaks in-tree and=20
> out-of-tree builds.
> Without it, both kinds of builds work in my standard Debian=20
> configuration.
>
> Regards,
> Stefan Weil
>
>
> gcc output (extract):
>
> CC /home/stefan/src/qemu/qemu.org/patches/qapi-generated/qga-qapi-types=
.o
> /home/stefan/src/qemu/qemu.org/patches/qapi-generated/qga-qapi-types.c:=
 In=20
> function =91qapi_free_GuestAgentInfoList=92:
> /home/stefan/src/qemu/qemu.org/patches/qapi-generated/qga-qapi-types.c:=
39:=20
> warning: implicit declaration of function =91visit_type_GuestAgentInfoL=
ist=92
> /home/stefan/src/qemu/qemu.org/patches/qapi-generated/qga-qapi-types.c:=
39:=20
> warning: nested extern declaration of =91visit_type_GuestAgentInfoList=92
> /home/stefan/src/qemu/qemu.org/patches/qapi-generated/qga-qapi-types.c:=
 In=20
> function =91qapi_free_GuestAgentInfo=92:
> /home/stefan/src/qemu/qemu.org/patches/qapi-generated/qga-qapi-types.c:=
54:=20
> warning: implicit declaration of function =91visit_type_GuestAgentInfo=92
> /home/stefan/src/qemu/qemu.org/patches/qapi-generated/qga-qapi-types.c:=
54:=20
> warning: nested extern declaration of =91visit_type_GuestAgentInfo=92
> /home/stefan/src/qemu/qemu.org/patches/qapi-generated/qga-qapi-types.c:=
 In=20
> function =91qapi_free_GuestFileReadList=92:
> /home/stefan/src/qemu/qemu.org/patches/qapi-generated/qga-qapi-types.c:=
69:=20
> warning: implicit declaration of function =91visit_type_GuestFileReadLi=
st=92

The broken build can be reproduced with a source path containing at=20
least one dot.
Source paths without any dot will show no problems. My source path was=20
~/src/qemu/qemu.org/qemu.

File scripts/qapi.py fails to create unique guard names when given a=20
filename with 2 or more dots:

def guardname(filename):
     if filename.startswith('./'):
         filename =3D filename[2:]
     return filename.replace("/", "_").replace("-",=20
"_").split(".")[0].upper() + '_H'

The function always returns the same guard name (in my case=20
_HOME_STEFAN_SRC_QEMU_QEMU_H)
which won't work when used for more than one header file.

I expect that blanks in the source path will also give unexpected results=
.

Even when this function were fixed, I think that
qapi-dir :=3D $(BUILD_DIR)/qapi-generated
would be better.

Regards,
Stefan Weil


