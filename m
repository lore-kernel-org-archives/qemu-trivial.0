Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YVwx7-0002Tq-BD
	for mharc-qemu-trivial@gnu.org; Thu, 12 Mar 2015 02:50:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46761)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVwx4-0002RJ-PN
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 02:50:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YVwx3-0006Ac-Ud
	for qemu-trivial@nongnu.org; Thu, 12 Mar 2015 02:50:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56613)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YVwwy-0005zB-9G; Thu, 12 Mar 2015 02:50:32 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 9DCC441725;
	Thu, 12 Mar 2015 09:50:29 +0300 (MSK)
Message-ID: <55013735.2080305@msgid.tls.msk.ru>
Date: Thu, 12 Mar 2015 09:50:29 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
References: <1425503036-23707-1-git-send-email-mjt@msgid.tls.msk.ru>
	<87k2yorc9q.fsf@linux.vnet.ibm.com>
In-Reply-To: <87k2yorc9q.fsf@linux.vnet.ibm.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] 9pfs-local: simplify/optimize
	local_mapped_attr_path()
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
X-List-Received-Date: Thu, 12 Mar 2015 06:50:40 -0000

10.03.2015 20:30, Aneesh Kumar K.V wrote:
> Michael Tokarev <mjt@tls.msk.ru> writes:
> 
>> Omit one unnecessary memory allocation for components of the path
>> and create the resulting path directly given lengths of the components.
>>
>> This uses (char*) cast because basename() accepts a char* without const,
>> for unknown reason.  Maybe it is better to use strrchr(), but I'm not
>> sure for various forms of directory component delimiter.
> 
> basename(3) says:
> Both dirname() and basename() may modify the contents of path, so it may
> be desirable to pass a copy when calling one of these functions

The same manpage also says that there are 2 versions of basename(3),
one modifies its arg while another doesn't, and they return different
results in some corner cases.  Which one will be used depends on the
compiler flags.

So I think it really is better to open-code it here to have guaranteed
consistent results.  I'll send a v2.

[]
> I am not sure whether we really need all these cleanups without really
> fixing anyi specific issue.

This is not a cleanup, it is an optimization: it removes one completely
unnecessary memory allocation.  Not in a hottest path but I think it is
worth this small effor anyway.

Thanks,

/mjt

