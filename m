Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eydkC-0004uU-Dy
	for mharc-qemu-trivial@gnu.org; Wed, 21 Mar 2018 09:25:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <danielhb@linux.vnet.ibm.com>) id 1eydk9-0004rs-AB
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2018 09:25:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <danielhb@linux.vnet.ibm.com>) id 1eydk5-0006hd-Sh
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2018 09:25:29 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53740)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <danielhb@linux.vnet.ibm.com>)
	id 1eydk5-0006gm-EL
	for qemu-trivial@nongnu.org; Wed, 21 Mar 2018 09:25:25 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id
	w2LDOZN1141491
	for <qemu-trivial@nongnu.org>; Wed, 21 Mar 2018 09:25:24 -0400
Received: from e37.co.us.ibm.com (e37.co.us.ibm.com [32.97.110.158])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2gun827w3d-1
	(version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Wed, 21 Mar 2018 09:25:23 -0400
Received: from localhost
	by e37.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <danielhb@linux.vnet.ibm.com>;
	Wed, 21 Mar 2018 07:25:22 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
	by e37.co.us.ibm.com (192.168.1.137) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 21 Mar 2018 07:25:19 -0600
Received: from b03ledav004.gho.boulder.ibm.com
	(b03ledav004.gho.boulder.ibm.com [9.17.130.235])
	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id w2LDPJOS10027464; Wed, 21 Mar 2018 06:25:19 -0700
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 54B6B78041;
	Wed, 21 Mar 2018 07:25:19 -0600 (MDT)
Received: from [9.85.189.206] (unknown [9.85.189.206])
	by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP id 9C1447803F; 
	Wed, 21 Mar 2018 07:25:17 -0600 (MDT)
To: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Jose Ricardo Ziviani <joserz@linux.vnet.ibm.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Yasmin Beatriz <yasmins@linux.vnet.ibm.com>
References: <20180321120853.14293-1-lvivier@redhat.com>
	<5193a40a-33fb-5b55-5fea-608a5573980e@linux.vnet.ibm.com>
	<7e3215e0-aa21-e2ae-7d07-c07ef66360fe@redhat.com>
From: Daniel Henrique Barboza <danielhb@linux.vnet.ibm.com>
Date: Wed, 21 Mar 2018 10:25:16 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <7e3215e0-aa21-e2ae-7d07-c07ef66360fe@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 18032113-0024-0000-0000-0000181BD916
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008716; HX=3.00000241; KW=3.00000007;
	PH=3.00000004; SC=3.00000254; SDB=6.01006284; UDB=6.00512365;
	IPR=6.00785567; 
	MB=3.00020163; MTD=3.00000008; XFM=3.00000015; UTC=2018-03-21 13:25:21
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18032113-0025-0000-0000-00004F309CD4
Message-Id: <08e6029e-98e7-290f-6443-5ad3caca15c0@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2018-03-21_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1709140000
	definitions=main-1803210161
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] dump: display cause of
 write failure
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
X-List-Received-Date: Wed, 21 Mar 2018 13:25:30 -0000



On 03/21/2018 10:22 AM, Laurent Vivier wrote:
> On 21/03/2018 14:16, Daniel Henrique Barboza wrote:
>> Laurent,
>>
>> There is already a v3 version of Yasmin's patch that was approved and
>> it is supposedly waiting to be merged:
>>
>> http://lists.gnu.org/archive/html/qemu-devel/2018-02/msg03035.html
> Ok, sorry, I've missed it because the subject line changed between v2
> and v3.

True. I've changed the subject because the patch was doing a little more
than what was being said in the subject. Mea culpa.


Daniel

>
> Thanks,
> Laurent
>


