Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dFk6o-00058h-Ol
	for mharc-qemu-trivial@gnu.org; Tue, 30 May 2017 12:35:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35825)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1dFk6m-00057v-Vu
	for qemu-trivial@nongnu.org; Tue, 30 May 2017 12:35:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1dFk6i-0001H5-26
	for qemu-trivial@nongnu.org; Tue, 30 May 2017 12:35:00 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:33873)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <borntraeger@de.ibm.com>)
	id 1dFk6h-0001GW-Oq
	for qemu-trivial@nongnu.org; Tue, 30 May 2017 12:34:55 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
	v4UGXfSC141808
	for <qemu-trivial@nongnu.org>; Tue, 30 May 2017 12:34:54 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2asc7j8dgq-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Tue, 30 May 2017 12:34:53 -0400
Received: from localhost
	by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <borntraeger@de.ibm.com>;
	Tue, 30 May 2017 12:34:52 -0400
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
	by e15.ny.us.ibm.com (146.89.104.202) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 30 May 2017 12:34:49 -0400
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
	[9.57.199.106])
	by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	v4UGYmZO27590796; Tue, 30 May 2017 16:34:48 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 459AD2803F;
	Tue, 30 May 2017 12:34:43 -0400 (EDT)
Received: from oc1450873852.ibm.com (unknown [9.145.164.210])
	by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP id 6BF7B2803A;
	Tue, 30 May 2017 12:34:42 -0400 (EDT)
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <149615665491.28067.17765793725374594694.stgit@bahia.lan>
Cc: Cornelia Huck <cornelia.huck@de.ibm.com>, qemu-trivial@nongnu.org,
	Fam Zheng <famz@redhat.com>, Alexander Graf <agraf@suse.de>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Date: Tue, 30 May 2017 18:34:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <149615665491.28067.17765793725374594694.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 17053016-0036-0000-0000-000002175FDE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007145; HX=3.00000241; KW=3.00000007;
	PH=3.00000004; SC=3.00000212; SDB=6.00867792; UDB=6.00431194;
	IPR=6.00647671; 
	BA=6.00005387; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009;
	ZB=6.00000000; 
	ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015647;
	XFM=3.00000015; UTC=2017-05-30 16:34:50
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17053016-0037-0000-0000-0000408751FB
Message-Id: <e8fdae1c-9d3c-1059-509a-6b85000e83a9@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-05-30_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
	definitions=main-1705300307
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.156.1
Subject: Re: [Qemu-trivial] [PATCH] pc-bios/s390-ccw: use STRIP variable in
 Makefile
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
X-List-Received-Date: Tue, 30 May 2017 16:35:02 -0000

On 05/30/2017 05:04 PM, Greg Kurz wrote:
> The docker-run-test-build@debian-s390x-cross target fails with:
> 
> strip --strip-unneeded s390-ccw.elf -o s390-ccw.img
> strip: Unable to recognise the format of the input file `s390-ccw.elf'
> 
> The configure script defines a STRIP makefile variable whose default
> value is ${cross_prefix}strip. Let's use it.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  pc-bios/s390-ccw/Makefile |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/pc-bios/s390-ccw/Makefile b/pc-bios/s390-ccw/Makefile
> index 79a46b67356f..7af57dad109c 100644
> --- a/pc-bios/s390-ccw/Makefile
> +++ b/pc-bios/s390-ccw/Makefile
> @@ -22,7 +22,7 @@ s390-ccw.elf: $(OBJECTS)
>  	$(call quiet-command,$(CC) $(LDFLAGS) -o $@ $(OBJECTS),"BUILD","$(TARGET_DIR)$@")
> 
>  s390-ccw.img: s390-ccw.elf
> -	$(call quiet-command,strip --strip-unneeded $< -o $@,"STRIP","$(TARGET_DIR)$@")
> +	$(call quiet-command,$(STRIP) --strip-unneeded $< -o $@,"STRIP","$(TARGET_DIR)$@")
> 
>  $(OBJECTS): Makefile
> 
> 

I was going to apply this, but it fails with --disable-strip like

    /bin/sh: --strip-unneeded: command not found
    Makefile:25: recipe for target 's390-ccw.img' failed
    make[1]: *** [s390-ccw.img] Error 127
    Makefile:354: recipe for target 'romsubdir-s390-ccw' failed
    make: *** [romsubdir-s390-ccw] Error 2

Not yet sure whats going on.


