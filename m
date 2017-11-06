Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eBlZr-000187-Qx
	for mharc-qemu-trivial@gnu.org; Mon, 06 Nov 2017 12:52:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1eBlZp-00016z-TS
	for qemu-trivial@nongnu.org; Mon, 06 Nov 2017 12:52:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanb@linux.vnet.ibm.com>) id 1eBlZl-0005fu-OI
	for qemu-trivial@nongnu.org; Mon, 06 Nov 2017 12:52:49 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59966
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanb@linux.vnet.ibm.com>)
	id 1eBlZl-0005er-I5
	for qemu-trivial@nongnu.org; Mon, 06 Nov 2017 12:52:45 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id
	vA6Hjsfp095069
	for <qemu-trivial@nongnu.org>; Mon, 6 Nov 2017 12:52:45 -0500
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2e2v809015-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Mon, 06 Nov 2017 12:52:44 -0500
Received: from localhost
	by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <stefanb@linux.vnet.ibm.com>;
	Mon, 6 Nov 2017 10:52:41 -0700
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
	by e31.co.us.ibm.com (192.168.1.131) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 6 Nov 2017 10:52:36 -0700
Received: from b03ledav005.gho.boulder.ibm.com
	(b03ledav005.gho.boulder.ibm.com [9.17.130.236])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id vA6HqaEe52691186; Mon, 6 Nov 2017 10:52:36 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 83283BE039;
	Mon,  6 Nov 2017 10:52:36 -0700 (MST)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP id 0784ABE038; 
	Mon,  6 Nov 2017 10:52:35 -0700 (MST)
To: Michael Tokarev <mjt@tls.msk.ru>, "Richard W.M. Jones"
	<rjones@redhat.com>, qemu-devel@nongnu.org
References: <20171019075031.25507-1-rjones@redhat.com>
	<5888e39b-8f55-2d6b-afbe-da4727f23c2d@msgid.tls.msk.ru>
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, amarnath.valluri@intel.com, 
	marcandre.lureau@gmail.com
From: Stefan Berger <stefanb@linux.vnet.ibm.com>
Date: Mon, 6 Nov 2017 12:52:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <5888e39b-8f55-2d6b-afbe-da4727f23c2d@msgid.tls.msk.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17110617-8235-0000-0000-00000C859AAA
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00008021; HX=3.00000241; KW=3.00000007;
	PH=3.00000004; SC=3.00000239; SDB=6.00942041; UDB=6.00475163;
	IPR=6.00722329; 
	BA=6.00005674; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009;
	ZB=6.00000000; 
	ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00017882;
	XFM=3.00000015; UTC=2017-11-06 17:52:39
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17110617-8236-0000-0000-00003E5611C2
Message-Id: <90c15906-724b-fd8a-89eb-e012ea910623@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-11-06_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=48 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1011 lowpriorityscore=0 impostorscore=0 adultscore=0
	classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1707230000
	definitions=main-1711060242
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
Subject: Re: [Qemu-trivial] [PATCH] tpm: Don't call tpm_cleanup unless
 CONFIG_TPM.
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
X-List-Received-Date: Mon, 06 Nov 2017 17:52:51 -0000

On 11/06/2017 12:49 PM, Michael Tokarev wrote:
> 19.10.2017 10:50, Richard W.M. Jones wrote:
>> When compiling with --disable-tpm:
>>
>>    ../vl.o: In function `main':
>>    /home/rjones/d/qemu/vl.c:4908: undefined reference to `tpm_cleanup'
>>
>> This appears to have been introduced in commit c37cacabf228
>> ("tpm: Move tpm_cleanup() to right place").
>>
>> index 0723835bbf..dbfd06d4bc 100644
>> --- a/vl.c
>> +++ b/vl.c
>> @@ -4905,7 +4905,9 @@ int main(int argc, char **argv, char **envp)
>>       res_free();
>>   
>>       /* vhost-user must be cleaned up before chardevs.  */
>> +#ifdef CONFIG_TPM
>>       tpm_cleanup();
>> +#endif
> Maybe we can define it to an empty macro (or inline function) in
> the header file instead?

It's solved with a stub in stubs/tpm.c.

   Stefan


>
> /mjt
>


