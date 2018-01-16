Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ebKlj-0003Kp-4E
	for mharc-qemu-trivial@gnu.org; Tue, 16 Jan 2018 01:30:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43424)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1ebKlf-0003Go-Ak
	for qemu-trivial@nongnu.org; Tue, 16 Jan 2018 01:30:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jasowang@redhat.com>) id 1ebKla-00024X-Qu
	for qemu-trivial@nongnu.org; Tue, 16 Jan 2018 01:30:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34050)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1ebKla-00024C-LD
	for qemu-trivial@nongnu.org; Tue, 16 Jan 2018 01:30:38 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9EFF761476;
	Tue, 16 Jan 2018 06:30:37 +0000 (UTC)
Received: from [10.72.12.132] (ovpn-12-132.pek2.redhat.com [10.72.12.132])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 106A05C20E;
	Tue, 16 Jan 2018 06:30:35 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Dmitry Fleytman <dmitry.fleytman@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org
References: <20171218151510.2901-1-dmitry.fleytman@gmail.com>
	<104f4f90-6735-1dd6-de0f-2396de18089c@amsat.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <54341cc1-4c49-2523-b34d-88fd0e523189@redhat.com>
Date: Tue, 16 Jan 2018 14:30:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <104f4f90-6735-1dd6-de0f-2396de18089c@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Tue, 16 Jan 2018 06:30:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: Update e-mail address
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
X-List-Received-Date: Tue, 16 Jan 2018 06:30:45 -0000



On 2018=E5=B9=B401=E6=9C=8809=E6=97=A5 04:58, Philippe Mathieu-Daud=C3=A9=
 wrote:
> Also Cc'ing Jason (Network devices) & Paolo (Misc) in case they are
> preparing some PR.
>
> On 12/18/2017 12:15 PM, Dmitry Fleytman wrote:
>> Updating MAINTAINERS with my current e-mail address.
>>
>> Signed-off-by: Dmitry Fleytman <dmitry.fleytman@gmail.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Applied.

Thanks

>
>> ---
>>   MAINTAINERS | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 45e2e2009b..d51273e656 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1145,7 +1145,7 @@ F: hw/scsi/mfi.h
>>   F: tests/megasas-test.c
>>  =20
>>   Network packet abstractions
>> -M: Dmitry Fleytman <dmitry@daynix.com>
>> +M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
>>   S: Maintained
>>   F: include/net/eth.h
>>   F: net/eth.c
>> @@ -1153,7 +1153,7 @@ F: hw/net/net_rx_pkt*
>>   F: hw/net/net_tx_pkt*
>>  =20
>>   Vmware
>> -M: Dmitry Fleytman <dmitry@daynix.com>
>> +M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
>>   S: Maintained
>>   F: hw/net/vmxnet*
>>   F: hw/scsi/vmw_pvscsi*
>> @@ -1174,12 +1174,12 @@ F: hw/mem/nvdimm.c
>>   F: include/hw/mem/nvdimm.h
>>  =20
>>   e1000x
>> -M: Dmitry Fleytman <dmitry@daynix.com>
>> +M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
>>   S: Maintained
>>   F: hw/net/e1000x*
>>  =20
>>   e1000e
>> -M: Dmitry Fleytman <dmitry@daynix.com>
>> +M: Dmitry Fleytman <dmitry.fleytman@gmail.com>
>>   S: Maintained
>>   F: hw/net/e1000e*
>>  =20
>>


