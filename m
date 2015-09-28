Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZggSs-0002Ea-Du
	for mharc-qemu-trivial@gnu.org; Mon, 28 Sep 2015 18:00:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZgW6V-0005Bz-Fm
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 06:56:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1ZgW6U-0007C9-LO
	for qemu-trivial@nongnu.org; Mon, 28 Sep 2015 06:56:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53976)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1ZgW6O-000797-Ne; Mon, 28 Sep 2015 06:56:12 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id EAC85C0B1B43;
	Mon, 28 Sep 2015 10:56:11 +0000 (UTC)
Received: from [10.36.112.57] (ovpn-112-57.ams2.redhat.com [10.36.112.57])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8SAu31K024937
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 28 Sep 2015 06:56:06 -0400
To: Eric Blake <eblake@redhat.com>, Shraddha Barke <shraddha.6596@gmail.com>, 
	kvm@vger.kernel.org, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
References: <1443170278-9318-1-git-send-email-shraddha.6596@gmail.com>
	<1443170278-9318-3-git-send-email-shraddha.6596@gmail.com>
	<5606C4A1.60509@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56091CC4.4020108@redhat.com>
Date: Mon, 28 Sep 2015 12:56:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <5606C4A1.60509@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/3] Target-ppc: Remove
	unnecessary variable
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
X-List-Received-Date: Mon, 28 Sep 2015 10:56:20 -0000



On 26/09/2015 18:15, Eric Blake wrote:
> On 09/25/2015 02:37 AM, Shraddha Barke wrote:
>> Compress lines and remove the variable.
>>
> 
>> +++ b/target-ppc/kvm.c
>> @@ -1782,8 +1782,7 @@ uint32_t kvmppc_get_tbfreq(void)
>>  
>>      ns++;
>>  
>> -    retval = atoi(ns);
>> -    return retval;
>> +    return atoi(ns);
> 
> atoi() is lousy; it cannot properly detect user input errors.  This
> should probably be converted to use the appropriate qemu_strtol variant
> instead.

But it's more or less okay here, it's parsing /proc/cpuinfo.

Paolo

