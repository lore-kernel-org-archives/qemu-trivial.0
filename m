Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RV6Ck-0007j8-MW
	for mharc-qemu-trivial@gnu.org; Mon, 28 Nov 2011 13:45:26 -0500
Received: from eggs.gnu.org ([140.186.70.92]:44783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RV6Ch-0007iZ-Nc
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2011 13:45:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RV6Cg-0000Zm-07
	for qemu-trivial@nongnu.org; Mon, 28 Nov 2011 13:45:23 -0500
Received: from mail-iy0-f173.google.com ([209.85.210.173]:60477)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1RV6Cf-0000Zc-TI; Mon, 28 Nov 2011 13:45:21 -0500
Received: by iakk32 with SMTP id k32so10573408iak.4
	for <multiple recipients>; Mon, 28 Nov 2011 10:45:21 -0800 (PST)
Received: by 10.42.41.143 with SMTP id p15mr25183520ice.9.1322505916174;
	Mon, 28 Nov 2011 10:45:16 -0800 (PST)
Received: from [192.168.0.103] (cpe-70-123-132-139.austin.res.rr.com.
	[70.123.132.139])
	by mx.google.com with ESMTPS id mb4sm84264863igc.1.2011.11.28.10.45.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 28 Nov 2011 10:45:15 -0800 (PST)
Message-ID: <4ED3D6B9.5060104@codemonkey.ws>
Date: Mon, 28 Nov 2011 12:45:13 -0600
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.21) Gecko/20110831 Lightning/1.0b2 Thunderbird/3.1.13
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <alpine.DEB.2.00.1111221726190.31179@kaball-desktop>
	<4ED3D428.7030704@weilnetz.de>
In-Reply-To: <4ED3D428.7030704@weilnetz.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	qemu-devel@nongnu.org,
	Stefano Stabellini <stefano.stabellini@eu.citrix.com>
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
X-List-Received-Date: Mon, 28 Nov 2011 18:45:24 -0000

On 11/28/2011 12:34 PM, Stefan Weil wrote:
> Am 22.11.2011 18:27, schrieb Stefano Stabellini:
>>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
>>
>> diff --git a/Makefile b/Makefile
>> index 168093c..885065f 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -167,7 +167,7 @@ check-qjson: check-qjson.o $(qobject-obj-y) $(tools-obj-y)
>> test-coroutine: test-coroutine.o qemu-timer-common.o async.o
>> $(coroutine-obj-y) $(tools-obj-y)
>>
>> $(qapi-obj-y): $(GENERATED_HEADERS)
>> -qapi-dir := qapi-generated
>> +qapi-dir := $(SRC_PATH)/qapi-generated
>> test-visitor.o test-qmp-commands.o qemu-ga$(EXESUF): QEMU_CFLAGS += -I
>> $(qapi-dir)
>> qemu-ga$(EXESUF): LIBS = $(LIBS_QGA)
>
> This patch was committed to latest QEMU and breaks in-tree and out-of-tree builds.
> Without it, both kinds of builds work in my standard Debian configuration.

The patch is obviously incorrect.  I'm going to revert it since the commit 
message has no explanation of why it's fixing anything.

Regards,

Anthony Liguori

>
> Regards,
> Stefan Weil
>
>
> gcc output (extract):
>
> CC /home/stefan/src/qemu/qemu.org/patches/qapi-generated/qga-qapi-types.o
> /home/stefan/src/qemu/qemu.org/patches/qapi-generated/qga-qapi-types.c: In
> function ‘qapi_free_GuestAgentInfoList’:
> /home/stefan/src/qemu/qemu.org/patches/qapi-generated/qga-qapi-types.c:39:
> warning: implicit declaration of function ‘visit_type_GuestAgentInfoList’
> /home/stefan/src/qemu/qemu.org/patches/qapi-generated/qga-qapi-types.c:39:
> warning: nested extern declaration of ‘visit_type_GuestAgentInfoList’
> /home/stefan/src/qemu/qemu.org/patches/qapi-generated/qga-qapi-types.c: In
> function ‘qapi_free_GuestAgentInfo’:
> /home/stefan/src/qemu/qemu.org/patches/qapi-generated/qga-qapi-types.c:54:
> warning: implicit declaration of function ‘visit_type_GuestAgentInfo’
> /home/stefan/src/qemu/qemu.org/patches/qapi-generated/qga-qapi-types.c:54:
> warning: nested extern declaration of ‘visit_type_GuestAgentInfo’
> /home/stefan/src/qemu/qemu.org/patches/qapi-generated/qga-qapi-types.c: In
> function ‘qapi_free_GuestFileReadList’:
> /home/stefan/src/qemu/qemu.org/patches/qapi-generated/qga-qapi-types.c:69:
> warning: implicit declaration of function ‘visit_type_GuestFileReadList’
>
>


