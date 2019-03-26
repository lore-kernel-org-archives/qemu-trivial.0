Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h8mq1-0005pv-BB
	for mharc-qemu-trivial@gnu.org; Tue, 26 Mar 2019 10:14:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52825)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.ibm.com>) id 1h8mcc-00038V-7H
	for qemu-trivial@nongnu.org; Tue, 26 Mar 2019 10:00:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.ibm.com>) id 1h8mY8-0005bp-Oj
	for qemu-trivial@nongnu.org; Tue, 26 Mar 2019 09:55:33 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41918)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanb@linux.ibm.com>)
	id 1h8mY8-0005b1-D7
	for qemu-trivial@nongnu.org; Tue, 26 Mar 2019 09:55:32 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x2QDsIEE145892
	for <qemu-trivial@nongnu.org>; Tue, 26 Mar 2019 09:55:30 -0400
Received: from e13.ny.us.ibm.com (e13.ny.us.ibm.com [129.33.205.203])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2rfm7gkva8-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Tue, 26 Mar 2019 09:55:30 -0400
Received: from localhost
	by e13.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanb@linux.ibm.com>;
	Tue, 26 Mar 2019 13:55:28 -0000
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
	by e13.ny.us.ibm.com (146.89.104.200) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Tue, 26 Mar 2019 13:55:25 -0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
	[9.57.199.107])
	by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	x2QDtOoV22675488
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 26 Mar 2019 13:55:25 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D64C412405A;
	Tue, 26 Mar 2019 13:55:24 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC998124053;
	Tue, 26 Mar 2019 13:55:24 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
	Tue, 26 Mar 2019 13:55:24 +0000 (GMT)
To: Thomas Huth <thuth@redhat.com>, Jafar Abdi <cafer.abdi@gmail.com>,
	qemu-devel@nongnu.org
Cc: stefanha@gmail.com, jusual@mail.ru, QEMU Trivial <qemu-trivial@nongnu.org>
References: <1553351197-14581-1-git-send-email-cafer.abdi@gmail.com>
	<1553351197-14581-5-git-send-email-cafer.abdi@gmail.com>
	<a467e1f5-b104-ae69-8ea0-10c05f1263cf@redhat.com>
From: Stefan Berger <stefanb@linux.ibm.com>
Date: Tue, 26 Mar 2019 09:55:24 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <a467e1f5-b104-ae69-8ea0-10c05f1263cf@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-MW
X-TM-AS-GCONF: 00
x-cbid: 19032613-0064-0000-0000-000003C03A96
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00010817; HX=3.00000242; KW=3.00000007;
	PH=3.00000004; SC=3.00000282; SDB=6.01179947; UDB=6.00617460;
	IPR=6.00960662; 
	MB=3.00026164; MTD=3.00000008; XFM=3.00000015; UTC=2019-03-26 13:55:27
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19032613-0065-0000-0000-00003CD79A09
Message-Id: <471c060c-2abc-50e9-1a51-871ab62185ea@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-03-26_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1903260098
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
X-Mailman-Approved-At: Tue, 26 Mar 2019 10:13:58 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH V2 4/4] hw/tpm: fix usage of
 bool in tpm-tis.c
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
X-List-Received-Date: Tue, 26 Mar 2019 14:00:11 -0000

On 3/24/19 3:41 PM, Thomas Huth wrote:
> On 23/03/2019 15.26, Jafar Abdi wrote:
>> Clean up wrong usage of FALSE and TRUE in places that use "bool" from stdbool.h.
>>
>> FALSE and TRUE (with capital letters) are the constants defined by glib for
>> being used with the "gboolean" type of glib. But some parts of the code also use
>> TRUE and FALSE for variables that are declared as "bool" (the type from <stdbool.h>).
>>
>> Signed-off-by: Jafar Abdi <cafer.abdi@gmail.com>
>> ---
>>   hw/tpm/tpm_tis.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/tpm/tpm_tis.c b/hw/tpm/tpm_tis.c
>> index fd183e8..c1eb094 100644
>> --- a/hw/tpm/tpm_tis.c
>> +++ b/hw/tpm/tpm_tis.c
>> @@ -611,7 +611,7 @@ static void tpm_tis_mmio_write(void *opaque, hwaddr addr,
>>               while ((TPM_TIS_IS_VALID_LOCTY(s->active_locty) &&
>>                       locty > s->active_locty) ||
>>                       !TPM_TIS_IS_VALID_LOCTY(s->active_locty)) {
>> -                bool higher_seize = FALSE;
>> +                bool higher_seize = false;
>>   
>>                   /* already a pending SEIZE ? */
>>                   if ((s->loc[locty].access & TPM_TIS_ACCESS_SEIZE)) {
>> @@ -621,7 +621,7 @@ static void tpm_tis_mmio_write(void *opaque, hwaddr addr,
>>                   /* check for ongoing seize by a higher locality */
>>                   for (l = locty + 1; l < TPM_TIS_NUM_LOCALITIES; l++) {
>>                       if ((s->loc[l].access & TPM_TIS_ACCESS_SEIZE)) {
>> -                        higher_seize = TRUE;
>> +                        higher_seize = true;
>>                           break;
>>                       }
>>                   }
>>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
>


