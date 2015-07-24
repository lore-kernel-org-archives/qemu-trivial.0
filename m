Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZIbYJ-0005tC-Re
	for mharc-qemu-trivial@gnu.org; Fri, 24 Jul 2015 07:54:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZIbYH-0005qX-6V
	for qemu-trivial@nongnu.org; Fri, 24 Jul 2015 07:54:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1ZIbYG-0006Zm-5h
	for qemu-trivial@nongnu.org; Fri, 24 Jul 2015 07:54:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55477)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1ZIbY7-0006BO-I5; Fri, 24 Jul 2015 07:53:59 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 03BD129330C;
	Fri, 24 Jul 2015 11:53:57 +0000 (UTC)
Received: from [10.36.6.222] (vpn1-6-222.ams2.redhat.com [10.36.6.222])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6OBrsJi009211
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 24 Jul 2015 07:53:56 -0400
Message-ID: <55B22752.5040306@redhat.com>
Date: Fri, 24 Jul 2015 13:53:54 +0200
From: Thomas Huth <thuth@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: Igor Mammedov <imammedo@redhat.com>
References: <1437573590-2801-1-git-send-email-thuth@redhat.com>
	<20150723140729.6da9c1f5@igors-macbook-pro.local>
In-Reply-To: <20150723140729.6da9c1f5@igors-macbook-pro.local>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Add another sanity check to
 smp_parse() function
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
X-List-Received-Date: Fri, 24 Jul 2015 11:54:10 -0000

On 23/07/15 14:07, Igor Mammedov wrote:
> On Wed, 22 Jul 2015 15:59:50 +0200
> Thomas Huth <thuth@redhat.com> wrote:
> 
>> The code in smp_parse already checks the topology information for
>> sockets * cores * threads < cpus and bails out with an error in
>> that case. However, it is still possible to supply a bad configuration
>> the other way round, e.g. with:
>>
>>  qemu-system-xxx -smp 4,sockets=1,cores=4,threads=2
>>
>> QEMU then still starts the guest, with topology configuration that
>> is rather incomprehensible and likely not what the user wanted.
>> So let's add another check to refuse such wrong configurations.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  vl.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/vl.c b/vl.c
>> index 5856396..c8d24b1 100644
>> --- a/vl.c
>> +++ b/vl.c
>> @@ -1224,7 +1224,13 @@ static void smp_parse(QemuOpts *opts)
>>              exit(1);
>>          }
>>  
>> -        max_cpus = qemu_opt_get_number(opts, "maxcpus", 0);
>> +        max_cpus = qemu_opt_get_number(opts, "maxcpus", cpus);
>> +        if (sockets * cores * threads > max_cpus) {
>> +            fprintf(stderr, "cpu topology: error: "
>> +                    "sockets (%u) * cores (%u) * threads (%u) >
>> maxcpus (%u)\n",
> just a nit, maybe s/maxcpus/[max]cpus/

I think it should be pretty obvious for the user that maxcpus = cpus
when the "maxcpus" option has not been specified but only the "cpus"
option. So I'd prefer to keep it the way without the square brackets,
it's IMHO easier to read.

 Thomas



