Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RWBNd-0008Ul-2x
	for mharc-qemu-trivial@gnu.org; Thu, 01 Dec 2011 13:29:09 -0500
Received: from eggs.gnu.org ([140.186.70.92]:41921)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RWBNZ-0008U7-29
	for qemu-trivial@nongnu.org; Thu, 01 Dec 2011 13:29:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>) id 1RWBNX-0003qS-HJ
	for qemu-trivial@nongnu.org; Thu, 01 Dec 2011 13:29:05 -0500
Received: from mail-yx0-f173.google.com ([209.85.213.173]:40409)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <anthony@codemonkey.ws>)
	id 1RWBNX-0003qO-78; Thu, 01 Dec 2011 13:29:03 -0500
Received: by yenq3 with SMTP id q3so2626757yen.4
	for <multiple recipients>; Thu, 01 Dec 2011 10:29:02 -0800 (PST)
Received: by 10.101.197.3 with SMTP id z3mr1996496anp.136.1322764142538;
	Thu, 01 Dec 2011 10:29:02 -0800 (PST)
Received: from [9.53.41.192] ([32.97.110.59])
	by mx.google.com with ESMTPS id f17sm4723982ang.20.2011.12.01.10.29.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 10:29:01 -0800 (PST)
Message-ID: <4ED7C76A.6060407@codemonkey.ws>
Date: Thu, 01 Dec 2011 12:28:58 -0600
From: Anthony Liguori <anthony@codemonkey.ws>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.21) Gecko/20110831 Lightning/1.0b2 Thunderbird/3.1.13
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <4ED3F1C3.4060601@weilnetz.de>	<1322606869-25865-1-git-send-email-mdroth@linux.vnet.ibm.com>	<1322606869-25865-2-git-send-email-mdroth@linux.vnet.ibm.com>	<CAJSP0QWaGrgZ5+xBckUwF+JRNmTY4rm4vnm9yo+0LZJtNWEx-g@mail.gmail.com>	<alpine.DEB.2.00.1111301227570.31179@kaball-desktop>	<4ED68B19.7050704@weilnetz.de>	<alpine.DEB.2.00.1112011048150.31179@kaball-desktop>
	<4ED7C342.3060302@weilnetz.de>
In-Reply-To: <4ED7C342.3060302@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.213.173
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] Makefile: use full path
 for qapi-generated directory
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
X-List-Received-Date: Thu, 01 Dec 2011 18:29:06 -0000

On 12/01/2011 12:11 PM, Stefan Weil wrote:
> Am 01.12.2011 16:19, schrieb Stefano Stabellini:
>> On Wed, 30 Nov 2011, Stefan Weil wrote:
>>> It's common to use either out-of-tree builds or in-tree builds,
>>> but not to mix both variants with a common root directory.
>>> I think QEMU should explicitly forbid that mixed scenario (like
>>> other projects do).
>>>
>>> Even with your fix there can remain problems with generated
>>> header files.
>>
>> Really? Can you provide more specific details?
>
> Yes. Suppose different generated header files with the same name
> exist in the source directory tree and in the build directory tree.
>
> Then compiler options (the order of -I options) will determine
> which of two header files with same name will be used in out-of-tree
> builds. If the wrong one (that from the source directory tree) is used,
> the compiler might fail or produce wrong code (for example when
> macro values changed).
>>> The mixed scenario creates unnecessary complexity.
>>> Without the mixed scenario, your patch is not needed.
>>
>> I agree that supporting the mixed scenario shouldn't be a priority.
>> However without this last patch a "make clean" on the main tree is not
>> enough to allow out of tree builds.
>>
>> Try the following scenario:
>>
>> - cd qemu; ./configure; make
>>
>> - make clean
>>
>> - cd ../temp; ./configure --source-path=../qemu; make
>
> Which ./configure do you run in an empty temp directory?
> This example (like similar ones in your previous mail) won't work.

Yes, you must do external builds only from a clean source directory.  This is a 
perfectly normal requirement.  In fact, I can't think of a project that doesn't 
require this.

Regards,

Anthony Liguori

>
>>
>> this has to work, right? It does not without the patch to fix the
>> generation of config-devices.mak.
>
> No. You'll need a 'make distclean'. If that does what it should do,
> a following out-of-tree build will work.
>
> Regards,
> Stefan Weil
>
>


