Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RWC4f-0005FZ-L6
	for mharc-qemu-trivial@gnu.org; Thu, 01 Dec 2011 14:13:37 -0500
Received: from eggs.gnu.org ([140.186.70.92]:36388)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1RWC4d-0005F0-Mc
	for qemu-trivial@nongnu.org; Thu, 01 Dec 2011 14:13:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1RWC4b-00068r-8M
	for qemu-trivial@nongnu.org; Thu, 01 Dec 2011 14:13:35 -0500
Received: from e38.co.us.ibm.com ([32.97.110.159]:47866)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdroth@linux.vnet.ibm.com>) id 1RWC4b-00066o-13
	for qemu-trivial@nongnu.org; Thu, 01 Dec 2011 14:13:33 -0500
Received: from /spool/local
	by e38.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <mdroth@linux.vnet.ibm.com>;
	Thu, 1 Dec 2011 12:13:29 -0700
Received: from d03relay05.boulder.ibm.com (9.17.195.107)
	by e38.co.us.ibm.com (192.168.1.138) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 1 Dec 2011 12:13:16 -0700
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay05.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	pB1JD2nM097406; Thu, 1 Dec 2011 12:13:04 -0700
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id pB1JCvj9030033; Thu, 1 Dec 2011 12:12:58 -0700
Received: from [9.53.41.253] (illuin.austin.ibm.com [9.53.41.253] (may be
	forged))
	by d03av02.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	pB1JCuYl029779; Thu, 1 Dec 2011 12:12:56 -0700
Message-ID: <4ED7D1B8.1060604@linux.vnet.ibm.com>
Date: Thu, 01 Dec 2011 13:12:56 -0600
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
	<4ED7C342.3060302@weilnetz.de> <4ED7C76A.6060407@codemonkey.ws>
	<alpine.DEB.2.00.1112011838320.31179@kaball-desktop>
In-Reply-To: <alpine.DEB.2.00.1112011838320.31179@kaball-desktop>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
x-cbid: 11120119-5518-0000-0000-000000BE6180
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 32.97.110.159
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Anthony Liguori <anthony@codemonkey.ws>
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
X-List-Received-Date: Thu, 01 Dec 2011 19:13:36 -0000

On 12/01/2011 12:42 PM, Stefano Stabellini wrote:
> On Thu, 1 Dec 2011, Anthony Liguori wrote:
>> On 12/01/2011 12:11 PM, Stefan Weil wrote:
>>> Am 01.12.2011 16:19, schrieb Stefano Stabellini:
>>>> On Wed, 30 Nov 2011, Stefan Weil wrote:
>>>>> It's common to use either out-of-tree builds or in-tree builds,
>>>>> but not to mix both variants with a common root directory.
>>>>> I think QEMU should explicitly forbid that mixed scenario (like
>>>>> other projects do).
>>>>>
>>>>> Even with your fix there can remain problems with generated
>>>>> header files.
>>>>
>>>> Really? Can you provide more specific details?
>>>
>>> Yes. Suppose different generated header files with the same name
>>> exist in the source directory tree and in the build directory tree.
>>>
>>> Then compiler options (the order of -I options) will determine
>>> which of two header files with same name will be used in out-of-tree
>>> builds. If the wrong one (that from the source directory tree) is used,
>>> the compiler might fail or produce wrong code (for example when
>>> macro values changed).
>>>>> The mixed scenario creates unnecessary complexity.
>>>>> Without the mixed scenario, your patch is not needed.
>>>>
>>>> I agree that supporting the mixed scenario shouldn't be a priority.
>>>> However without this last patch a "make clean" on the main tree is not
>>>> enough to allow out of tree builds.
>>>>
>>>> Try the following scenario:
>>>>
>>>> - cd qemu; ./configure; make
>>>>
>>>> - make clean
>>>>
>>>> - cd ../temp; ./configure --source-path=../qemu; make
>>>
>>> Which ./configure do you run in an empty temp directory?
>>> This example (like similar ones in your previous mail) won't work.
>>
>> Yes, you must do external builds only from a clean source directory.  This is a
>> perfectly normal requirement.  In fact, I can't think of a project that doesn't
>> require this.
>
> Fair enough.
>
> In that case, like Michael Roth wrote, the patch "Makefile: use full
> path for qapi-generated directory" doesn't actually fix anything, so
> probably we don't need it either, but I'll leave it up to you.
>

Yup, it's just to address some potential issues/suggestions Stefan Weil 
pointed out. I think patch 1 should be applied though.


