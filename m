Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d31Ra-0007EF-7l
	for mharc-qemu-trivial@gnu.org; Tue, 25 Apr 2017 10:27:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59681)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1d31RS-00079e-No
	for qemu-trivial@nongnu.org; Tue, 25 Apr 2017 10:27:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1d31RO-0002yz-MF
	for qemu-trivial@nongnu.org; Tue, 25 Apr 2017 10:27:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46890)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lvivier@redhat.com>)
	id 1d31RK-0002wJ-0N; Tue, 25 Apr 2017 10:27:38 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BAD0AC05AD72;
	Tue, 25 Apr 2017 14:27:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com BAD0AC05AD72
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=lvivier@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com BAD0AC05AD72
Received: from [10.36.118.57] (unknown [10.36.118.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 887C78248A;
	Tue, 25 Apr 2017 14:27:35 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>, Kamil Rytarowski <n54@gmx.com>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
References: <20170425131828.22480-1-n54@gmx.com>
	<CAFEAcA-PmbjRYb2EDDp60pKNnUQ8Rkdx79TTLgUMf_VRe2JT+w@mail.gmail.com>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <f2327f24-0503-4a45-e361-9f18ff00bc22@redhat.com>
Date: Tue, 25 Apr 2017 16:27:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-PmbjRYb2EDDp60pKNnUQ8Rkdx79TTLgUMf_VRe2JT+w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 25 Apr 2017 14:27:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] scripts/qemu-binfmt-conf.sh: Fix shell
 portability issue
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Apr 2017 14:27:52 -0000

On 25/04/2017 15:33, Peter Maydell wrote:
> On 25 April 2017 at 14:18, Kamil Rytarowski <n54@gmx.com> wrote:
>> Appease pkgsrc and use portable shell variable comparison.
>> This switches "==" to "=". It should not be a functional change.
>>
>> Signed-off-by: Kamil Rytarowski <n54@gmx.com>
>> ---
> 
> Thanks for this patch; it's an easy bug to let slip in
> if your /bin/sh happens to be bash.
> 
> PS: you forgot to cc qemu-devel@ on this patch.
> 
>>  scripts/qemu-binfmt-conf.sh | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/scripts/qemu-binfmt-conf.sh b/scripts/qemu-binfmt-conf.sh
>> index 0f1aa63872..8afc3eb5bb 100755
>> --- a/scripts/qemu-binfmt-conf.sh
>> +++ b/scripts/qemu-binfmt-conf.sh
>> @@ -284,12 +284,12 @@ while true ; do
>>          shift
>>          # check given cpu is in the supported CPU list
>>          for cpu in ${qemu_target_list} ; do
>> -            if [ "$cpu" == "$1" ] ; then
>> +            if [ "$cpu" = "$1" ] ; then
>>                  break
>>              fi
>>          done
>>
>> -        if [ "$cpu" == "$1" ] ; then
>> +        if [ "$cpu" = "$1" ] ; then
>>              qemu_target_list="$1"
>>          else
>>              echo "ERROR: unknown CPU \"$1\"" 1>&2
>> --
>> 2.12.2
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Laurent Vivier <lvivier@redhat.com>



