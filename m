Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UmLAn-0003Hp-CS
	for mharc-qemu-trivial@gnu.org; Tue, 11 Jun 2013 05:47:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57961)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmLAk-0003DY-9R
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 05:47:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1UmLAc-0002nb-Hv
	for qemu-trivial@nongnu.org; Tue, 11 Jun 2013 05:47:26 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:34668)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1UmLAU-0002lb-3y; Tue, 11 Jun 2013 05:47:10 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 4F969411FC;
	Tue, 11 Jun 2013 13:47:07 +0400 (MSK)
Message-ID: <51B6F219.2070401@msgid.tls.msk.ru>
Date: Tue, 11 Jun 2013 13:47:05 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:17.0) Gecko/17.0 Icedove/17.0
MIME-Version: 1.0
To: "M. Mohan Kumar" <mohan@in.ibm.com>
References: <1370897240-23490-1-git-send-email-mjt@msgid.tls.msk.ru>
	<51B63DBE.2010903@msgid.tls.msk.ru> <87li6ht322.fsf@gmail.com>
In-Reply-To: <87li6ht322.fsf@gmail.com>
X-Enigmail-Version: 1.5.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH trivial] configure: explicitly disable
	virtfs if softmmu=no
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
X-List-Received-Date: Tue, 11 Jun 2013 09:47:28 -0000

11.06.2013 13:22, M. Mohan Kumar wrote:
> Michael Tokarev <mjt@tls.msk.ru> writes:
> 
>> 11.06.2013 00:47, Michael Tokarev wrote:
>>> Or else
>>>
>>>  ./configure --disable-system --enable-virtfs
>>>
>>> (which makes no sense by its own but does not error out)
>>> will fail to build, because it will define CONFIG_VIRTFS,
>>> and the makefile will try to build virtfs-proxy-helper
>>> manpage (but not the executable).
>>
>> The build fails in this case in a separate build tree, because
                                ^^^^^^^^^^^^^^^^^^^^^^^^^
>> the fsdev directory is not created and scripts/texi2pod.pl
>> will be called with output = fsdev/virtfs-proxy-helper.pod,
>> which can't be created because fsdev/ does not exist.
>>
> 
> Hi,
> 
> I tried ./configure --disable-system --enable-virtfs and make. But didnt
> face any build failure. Could you please share your build failure
> information? virtfs-proxy-helper.1 is created inside the fsdev folder.

Well, it shouldn't be created to start with ;)

But the key component to this is to build in a separate
subdir:

 mkdir build
 cd build
 ../configure --disable-system --enable-virtfs
 make

this will fail.

It succeeds when run in the source tree because there,
fsdev/ dir does exist.  But in a separate build dir,
when system targets aren't enabled, it isn't created.

Thanks,

/mjt

