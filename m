Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RW98u-0007JR-6b
	for mharc-qemu-trivial@gnu.org; Thu, 01 Dec 2011 11:05:48 -0500
Received: from eggs.gnu.org ([140.186.70.92]:56637)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1RW98r-0007JG-NO
	for qemu-trivial@nongnu.org; Thu, 01 Dec 2011 11:05:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1RW98p-0007hH-P0
	for qemu-trivial@nongnu.org; Thu, 01 Dec 2011 11:05:45 -0500
Received: from e9.ny.us.ibm.com ([32.97.182.139]:49343)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1RW98p-0007gs-MG
	for qemu-trivial@nongnu.org; Thu, 01 Dec 2011 11:05:43 -0500
Received: from /spool/local
	by e9.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <mdroth@linux.vnet.ibm.com>;
	Thu, 1 Dec 2011 11:05:41 -0500
Received: from d01relay03.pok.ibm.com (9.56.227.235)
	by e9.ny.us.ibm.com (192.168.1.109) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 1 Dec 2011 11:05:39 -0500
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d01relay03.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	pB1G5bGp251244; Thu, 1 Dec 2011 11:05:37 -0500
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id pB1G5D5b021542; Thu, 1 Dec 2011 09:05:13 -0700
Received: from [9.53.41.253] (illuin.austin.ibm.com [9.53.41.253] (may be
	forged))
	by d03av04.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	pB1G5CtJ021421; Thu, 1 Dec 2011 09:05:12 -0700
Message-ID: <4ED7A5AE.4000602@linux.vnet.ibm.com>
Date: Thu, 01 Dec 2011 10:05:02 -0600
From: Michael Roth <mdroth@linux.vnet.ibm.com>
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
References: <4ED3F1C3.4060601@weilnetz.de>
	<1322606869-25865-1-git-send-email-mdroth@linux.vnet.ibm.com>
	<1322606869-25865-2-git-send-email-mdroth@linux.vnet.ibm.com>
	<CAJSP0QWaGrgZ5+xBckUwF+JRNmTY4rm4vnm9yo+0LZJtNWEx-g@mail.gmail.com>
	<alpine.DEB.2.00.1111301227570.31179@kaball-desktop>
	<4ED68B19.7050704@weilnetz.de>
	<alpine.DEB.2.00.1112011048150.31179@kaball-desktop>
In-Reply-To: <alpine.DEB.2.00.1112011048150.31179@kaball-desktop>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
x-cbid: 11120116-7182-0000-0000-000000521F4A
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 32.97.182.139
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
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
X-List-Received-Date: Thu, 01 Dec 2011 16:05:46 -0000

On 12/01/2011 09:19 AM, Stefano Stabellini wrote:
> On Wed, 30 Nov 2011, Stefan Weil wrote:
>> It's common to use either out-of-tree builds or in-tree builds,
>> but not to mix both variants with a common root directory.
>> I think QEMU should explicitly forbid that mixed scenario (like
>> other projects do).
>>
>> Even with your fix there can remain problems with generated
>> header files.
>
> Really? Can you provide more specific details?
>
>> The mixed scenario creates unnecessary complexity.
>> Without the mixed scenario, your patch is not needed.
>
> I agree that supporting the mixed scenario shouldn't be a priority.
> However without this last patch a "make clean" on the main tree is not
> enough to allow out of tree builds.
>
> Try the following scenario:
>
> - cd qemu; ./configure; make
>
> - make clean
>
> - cd ../temp; ./configure --source-path=../qemu; make
>
> this has to work, right? It does not without the patch to fix the
> generation of config-devices.mak.
>

To clarify, the first patch I sent fix a bug that's not currently 
triggered due to qapi-dir always ending up being "qapi-generated/", so 
the guardname generated works, albeit with some needlessly verbose names.

The second isn't intended to fix your issue with builds, but avoid 
potential problems that may arise if at some point $(BUILD_DIR) != 
$(CURDIR).

So they don't actually fix anything, just potential bugs that may arise 
in the future.

The issue with doing out of tree builds with a dirty source directory is 
really just an unsupported scenario. To really clean things up, you need 
to run `make distclean` using the same configuration you used to dirty 
the directory in the first place, otherwise even `make distclean` will 
leave cruft laying in target directories not present in your current config.

Alexandre Raymond sent a patch to make it so that `make distclean` 
always left the source directory pristine, but there was some contention 
on what exactly a `make distclean` entails and it wasn't applied:

http://lists.gnu.org/archive/html/qemu-trivial/2011-07/msg00037.html

That's really the only complete fix for these build issues. I'm starting 
to think it'd be worth it to add a `make clean_for_reals` target that 
does what Alexandre's patch does and tell people to run it after a pull 
or switching to out-of-tree builds.



