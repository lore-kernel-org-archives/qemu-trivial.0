Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kHCC2-0005r4-Oe
	for mharc-qemu-trivial@gnu.org; Sat, 12 Sep 2020 16:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1kH9Pr-0001oa-6g
 for qemu-trivial@nongnu.org; Sat, 12 Sep 2020 13:34:23 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:9404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.vnet.ibm.com>)
 id 1kH9Pp-00087e-5T
 for qemu-trivial@nongnu.org; Sat, 12 Sep 2020 13:34:22 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08CHWIZ4007457; Sat, 12 Sep 2020 13:34:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=b5n3OZBKfqKEgrWsFot484adC3HiIulzhjTcwVQoQn0=;
 b=MsUKGsoWOoGY5f5mvHB2SDimhNN4+nSyU9BrGz+PZyR1cN2CB8lYy78OGrijelqJLBu2
 M8G6orxabTA7o+225bmcwQdKYR+3OAstPdFQd6OpiIsATVXXYpT24LOaMnqLOGB/x1jc
 meCpZeAkcWDYSumlzcDyC4sARpG3u2bmXlID3avEPgVdUfcM8bRoIFEsK12w9xSkGdpt
 z1F/XjTVQ/hJ4nPBlt9ThxY1YBJQWv4UJ/IQFfHgfwW9x1b8sxpf0B/n08XjLGplZXYG
 ZeyYC1R4TCOHwcLPNFyRItGhzmrpu2sCETpfflb3i2isTr7VUDeXZ+tXJprgOc8YMyaW OQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33h2hh0aac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Sep 2020 13:34:16 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08CHXC6F009443;
 Sat, 12 Sep 2020 13:34:16 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33h2hh0aa1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Sep 2020 13:34:16 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08CHWU6M030612;
 Sat, 12 Sep 2020 17:34:14 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 33gny7r9a8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Sep 2020 17:34:14 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 08CHYCFu63570318
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 12 Sep 2020 17:34:12 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7560C11C058;
 Sat, 12 Sep 2020 17:34:12 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83C8311C050;
 Sat, 12 Sep 2020 17:34:10 +0000 (GMT)
Received: from [9.65.222.171] (unknown [9.65.222.171])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat, 12 Sep 2020 17:34:10 +0000 (GMT)
Subject: Re: [PATCH v2 0/2] hw/timer/hpet: Trivial format string fix
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20200910135852.516809-1-philmd@redhat.com>
 <35c826f7-bfbf-9e74-ad86-ef2d3262828f@redhat.com>
From: Dov Murik <dovmurik@linux.vnet.ibm.com>
Message-ID: <2d4ff491-de20-944f-dabd-f35d6a81b53d@linux.vnet.ibm.com>
Date: Sat, 12 Sep 2020 20:34:08 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.1
MIME-Version: 1.0
In-Reply-To: <35c826f7-bfbf-9e74-ad86-ef2d3262828f@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-12_08:2020-09-10,
 2020-09-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1011 suspectscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 mlxscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009120162
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.vnet.ibm.com; helo=mx0b-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/12 13:34:18
X-ACL-Warn: Detected OS   = Linux 3.x [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.543,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 12 Sep 2020 16:32:16 -0400
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 12 Sep 2020 17:34:23 -0000



On 10/09/2020 17:08, Philippe Mathieu-Daudé wrote:
> On 9/10/20 3:58 PM, Philippe Mathieu-Daudé wrote:
>> Fix a format string and remove dead code.
>>
>> Since v1:
>> - Addressed Dov comments (fix format string + style):
>>    https://www.mail-archive.com/qemu-devel@nongnu.org/msg739239.html
> 
> Dov, since you sent the same patches/code and sign them with
> your S-o-b, I added them here too, is that OK with you?

Yes, thank you for that.

> 
>>
>> Philippe Mathieu-Daudé (2):
>>    hw/timer/hpet: Remove dead code
>>    hw/timer/hpet: Fix DPRINTF format string
>>
>>   hw/timer/hpet.c | 23 ++++++-----------------
>>   1 file changed, 6 insertions(+), 17 deletions(-)
>>


