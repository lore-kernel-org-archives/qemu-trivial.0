Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SwYaM-00013C-Jx
	for mharc-qemu-trivial@gnu.org; Wed, 01 Aug 2012 09:03:34 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <avi@redhat.com>) id 1SwYaG-000130-B0
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 09:03:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <avi@redhat.com>) id 1SwYaA-0002Gp-HF
	for qemu-trivial@nongnu.org; Wed, 01 Aug 2012 09:03:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:4189)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <avi@redhat.com>)
	id 1SwYaA-0002Gi-8V; Wed, 01 Aug 2012 09:03:22 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q71D3K27028549
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Wed, 1 Aug 2012 09:03:20 -0400
Received: from balrog.usersys.tlv.redhat.com (dhcp-4-121.tlv.redhat.com
	[10.35.4.121])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q71D3H05005633; Wed, 1 Aug 2012 09:03:18 -0400
Message-ID: <50192915.8080203@redhat.com>
Date: Wed, 01 Aug 2012 16:03:17 +0300
From: Avi Kivity <avi@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Stefan Hajnoczi <stefanha@gmail.com>
References: <1343256304-32029-1-git-send-email-tylerwhall@gmail.com>
	<50192786.5080904@redhat.com>
	<CAJSP0QV_aZLQ37M0+d-8aVoru_w7kgLpg2Bi1qR-1b5VzUFLKg@mail.gmail.com>
In-Reply-To: <CAJSP0QV_aZLQ37M0+d-8aVoru_w7kgLpg2Bi1qR-1b5VzUFLKg@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Tyler Hall <tylerwhall@gmail.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] exec.c: Fix off-by-one
	error in register_subpage
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
X-List-Received-Date: Wed, 01 Aug 2012 13:03:34 -0000

On 08/01/2012 04:01 PM, Stefan Hajnoczi wrote:
> On Wed, Aug 1, 2012 at 1:56 PM, Avi Kivity <avi@redhat.com> wrote:
>> On 07/26/2012 01:45 AM, Tyler Hall wrote:
>>> subpage_register() expects "end" to be the last byte in the mapping.
>>> Registering a non-page-aligned memory region that extends up to or
>>> beyond a page boundary causes subpage_register() to silently fail
>>> through the (end >= PAGE_SIZE) check.
>>>
>>> This bug does not cause noticeable problems for mappings that do not
>>> extend to a page boundary, though they do register an extra byte.
>>
>> Reviewed-by: Avi Kivity <avi@redhat.com>
> 
> Thanks Avi.  Does this include Patch 2/2 too?

I reviewed that as well with similar results.


-- 
error compiling committee.c: too many arguments to function

