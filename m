Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cIwD8-0006yn-2l
	for mharc-qemu-trivial@gnu.org; Mon, 19 Dec 2016 06:34:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45178)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haoqf@linux.vnet.ibm.com>) id 1cIq3e-0002iA-DN
	for qemu-trivial@nongnu.org; Mon, 19 Dec 2016 00:00:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <haoqf@linux.vnet.ibm.com>) id 1cIq3Z-0006GP-IT
	for qemu-trivial@nongnu.org; Mon, 19 Dec 2016 00:00:18 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:56273
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <haoqf@linux.vnet.ibm.com>)
	id 1cIq3Z-0006GE-CC
	for qemu-trivial@nongnu.org; Mon, 19 Dec 2016 00:00:13 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	uBJ4wxMk142291
	for <qemu-trivial@nongnu.org>; Mon, 19 Dec 2016 00:00:12 -0500
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
	by mx0b-001b2d01.pphosted.com with ESMTP id 27e81q1nsn-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Mon, 19 Dec 2016 00:00:12 -0500
Received: from localhost
	by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <haoqf@linux.vnet.ibm.com>;
	Sun, 18 Dec 2016 22:00:11 -0700
Received: from d03dlp02.boulder.ibm.com (9.17.202.178)
	by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Sun, 18 Dec 2016 22:00:09 -0700
Received: from b03cxnp08025.gho.boulder.ibm.com
	(b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 626963E40052;
	Sun, 18 Dec 2016 22:00:08 -0700 (MST)
Received: from b03ledav006.gho.boulder.ibm.com
	(b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id uBJ507Ab9568766; Sun, 18 Dec 2016 22:00:07 -0700
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 368FBC6051;
	Sun, 18 Dec 2016 22:00:07 -0700 (MST)
Received: from [9.119.156.34] (unknown [9.119.156.34])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP id 0551EC603C; 
	Sun, 18 Dec 2016 22:00:04 -0700 (MST)
To: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org
References: <20161216054723.96055-1-haoqf@linux.vnet.ibm.com>
	<20161216054723.96055-2-haoqf@linux.vnet.ibm.com>
	<b70a8f66-81e9-6e3b-0245-2eab3ec27d0f@redhat.com>
Cc: cornelia.huck@de.ibm.com, borntraeger@de.ibm.com,
	"Qemu-devel@nongnu.org" <Qemu-devel@nongnu.org>,
	qemu-trivial <qemu-trivial@nongnu.org>
From: Hao QingFeng <haoqf@linux.vnet.ibm.com>
Date: Mon, 19 Dec 2016 13:00:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <b70a8f66-81e9-6e3b-0245-2eab3ec27d0f@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16121905-0008-0000-0000-0000065DB909
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00006276; HX=3.00000240; KW=3.00000007;
	PH=3.00000004; SC=3.00000198; SDB=6.00795837; UDB=6.00386174;
	IPR=6.00573650; 
	BA=6.00004980; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009;
	ZB=6.00000000; 
	ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00013654;
	XFM=3.00000011; UTC=2016-12-19 05:00:10
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16121905-0009-0000-0000-00003DF90F5C
Message-Id: <b30264d5-9d80-dfdc-4178-47d5543c3592@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-12-19_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
	definitions=main-1612190077
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0b-001b2d01.pphosted.com id uBJ4wxMk142291
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
X-Mailman-Approved-At: Mon, 19 Dec 2016 06:34:29 -0500
Subject: Re: [Qemu-trivial] [Qemu-block] [PATCH v1 1/1] iotests: Fix a
 problem in common.filter
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
X-List-Received-Date: Mon, 19 Dec 2016 05:00:20 -0000



=E5=9C=A8 2016-12-16 22:34, Eric Blake =E5=86=99=E9=81=93:
> [adding qemu-devel, ALL patches should include the main list]
>
> On 12/15/2016 11:47 PM, QingFeng Hao wrote:
>> If TEST_DIR is set to /tmp, test case 144 will fail. The reason is tha=
t
>> TEST_DIR duplicates with 144's test image name tmp.qcow2.
> s/duplicates with/resembles/
yes
>
>> when 144 is testing $TEST_DIR/tmp.qcow2, it wants to replace
>> $TEST_DIR/tmp.qcow2 to TEST_DIR/tmp.qcow2, but actually it will fail
>> and get TEST_DIRTEST_DIR.qcow2 in this case.
>> The fix is just to modify the code to replace $TEST_DIR/ with TEST_DIR=
/.
>>
>> Signed-off-by: QingFeng Hao <haoqf@linux.vnet.ibm.com>
>> ---
>>   tests/qemu-iotests/common.filter | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/com=
mon.filter
>> index 240ed06..d29e965 100644
>> --- a/tests/qemu-iotests/common.filter
>> +++ b/tests/qemu-iotests/common.filter
>> @@ -35,7 +35,7 @@ _filter_generated_node_ids()
>>   # replace occurrences of the actual TEST_DIR value with TEST_DIR
>>   _filter_testdir()
>>   {
>> -    sed -e "s#$TEST_DIR#TEST_DIR#g"
>> +    sed -e "s#$TEST_DIR\/#TEST_DIR\/#g"
> Why do you need \/?  It should be sufficient to use / without escaping.
>
> But overall I agree with including the / in the pattern.  It's too late
> to include this in 2.8, but with the commit message grammar improved an=
d
> \ escape removed, I'm fine with:
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
Right! We can use / directly in this case. Thanks :-)
> I'm also adding qemu-trivial in cc, in case we want to take it through
> that tree instead of the usual qemu-iotests.
>

--=20
QingFeng Hao(Robin)


